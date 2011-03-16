unit EComUnit;
interface
uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, Dialogs,
  Buttons, ExtCtrls, CommDrv;
const
  ndacx=100;
  nqx=100;
  LbCountLim=100;
  parwx=65535;
  PosliDelay:word=400;      // ms        (* 200ms - obcas nestiha *)
  TimeEuroComCtiXsec=60;    // s         (* TimeOut *)
  iCtiNic=1;   iCtiTeplotu=2; iCtiWSetPoint=3;
  iCtiPower=4; iCtiTSP=5;     iCtiRate=6;
  iCtiPID_P=7; iCtiPID_I=8;   iCtiPID_D=9;     iCtiPID_OPL=10;
  blEComDlgWrite:boolean=false;
  power: Array[1..20] of double = (10.0,20.0,30.0,40.0,45.0,35.0,25.0,15.0,5.0,
                      0.0,10.0,20.0,30.0,40.0,45.0,35.0,25.0,15.0,5.0,0.0);

type
  tDac=record
    str:string[ndacx];
    par:integer;
  end;
type
  TEComDlg = class(TForm)
    CancelBtn: TButton;
    OKBtn: TButton;
    Button1: TButton;
    Label3: TLabel;
    Edit1: TEdit;
    PowerBtn: TButton;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    PolarBtn: TButton;
    Label5: TLabel;
    Edit2: TEdit;
    FieldBtn: TButton;
    RadioButton3: TRadioButton;
    Button2: TButton;
    Button3: TButton;
    procedure PosliEurothermString(dac:tDac);
    procedure PosliQueue;
    procedure VynulujQueue;
    procedure VyradQueue;
    procedure ZaradQueue(dac:tDac);
    procedure NastavWaitRespond(bl:boolean);
    Function  VlastniOdeslani(dac:tDac):boolean;
    procedure CancelBtnClick(Sender: TObject);
    procedure ButtonClearQueueClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PowerBtnClick(Sender: TObject);
    procedure PolarBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FieldBtnClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  DacQueue:array[1..nqx] of tDac; nq:integer;
  EComDac:tDac;
  blWaitrespond,blJeden:boolean;
  Ted:TDateTime;
  TimeEuroComCti,TimeEuroComZarad:TDateTime;                 (* ?TimeOut *)
  EComDlg: TEComDlg;
  Aktiv:boolean;

procedure EComPosliRead(bparw:word; ctipar:integer);
procedure EComPosliWrite(bparw:word; ival:integer);
procedure PortOut(Port:Word; Data:Byte); stdcall; external 'io.dll';
function  PortIn (Port:Word):Byte;       stdcall; external 'io.dll';

implementation
{$R *.DFM}
uses EuroPar, Connect, UnitPom, Measure; {,ETini , EuroUnit,  Main;}

(* **** ListBoxy ******************************************** *)

Procedure ZmenNq(k:integer);
begin
  if (k<0) OR (k>nqx) then exit;
  nq:=k;
end;

Procedure lb1(lb:TListBox; s:string);
var qp,qts:string; j:integer;
begin
  with lb do begin
    qts:=FormatDateTime('dd.mm.yyyy hh:nn:ss.zzz',Ted);
    qp:=''; for j:=1 to length(s) do qp:=qp+IntToStr(ord(s[j]))+' ';
    Items.Insert(0,qts+' '+qp);
    if Items.Count>LbCountLim then Items.Delete(Items.Count-1);
  end;
end;

(* **** Posli String ***************************************** *)

Function TEComDlg.VlastniOdeslani(dac:tDac):boolean;
begin
  VlastniOdeslani:=false;
  if ConnectDlg.CommPortDriver.Connected then begin
    ConnectDlg.CommPortDriver.SendString(dac.str);
    VlastniOdeslani:=true;
    EComDac:=dac;
    Ted:=Now;
  end
end;

Procedure TEComDlg.NastavWaitRespond(bl:boolean);
begin
  blWaitRespond:=bl;
  //bl:=not bl;
end;

Procedure TEComDlg.ZaradQueue(dac:tDac);
var qp:string; //j:integer;
  tqds:double; //qtsCti,qtsCtiPred:string;                         (* ?TimeOut *)
begin
  ZmenNq(nq+1);
  DacQueue[nq]:=dac;
  if nq=1 then TimeEuroComCti:=Now;                     (* ?TimeOut_S *)
  TimeEuroComZarad:=Now;
  tqds:=(TimeEuroComZarad-TimeEuroComCti)*SecsPerDay;
  if nq>1 then begin
    if tqds>TimeEuroComCtiXsec then begin
      qp:=Format('! Eurotherm connection TimeOut %ds exceeded, queue reset',
                    [TimeEuroComCtiXsec]);
      ShowMessage(qp);
      VynulujQueue;
    end;
  end;                                                         (* ?TimeOut_E *)
end;

Procedure TEComDlg.VyradQueue;
var i:integer;
begin
  if nq=0 then exit;
  for i:=2 to nq do DacQueue[i-1]:=DacQueue[i];
  ZmenNq(nq-1);
end;

Procedure TEComDlg.VynulujQueue;
begin
  NastavWaitRespond(false);
  ZmenNq(0);
end;

Procedure TEComDlg.PosliQueue;
begin
  if nq=0 then begin
    NastavWaitRespond(false);
    exit;
  end;
  KPausa(PosliDelay);
  if VlastniOdeslani(DacQueue[1]) then begin
    NastavWaitRespond(true);
    VyradQueue;
  end;
end;

procedure TEComDlg.PosliEurothermString(dac:tDac);
begin
  if blWaitRespond then ZaradQueue(dac);
  if not blWaitRespond then begin
    if VlastniOdeslani(dac) then NastavWaitRespond(true);
  end;
end;

procedure EComPosliRead(bparw:word; ctipar:integer);
var dac:tDac; qp:string;
begin
  dac.str:=EuroString_Read(bparw,qp);
  dac.par:=ctipar;
  EComDlg.PosliEurothermString(dac);
end;

procedure EComPosliWrite(bparw:word; ival:integer);
var dac:tDac; qp:string;
begin
  dac.str:=EuroString_Write(bparw,ival,qp);
  dac.par:=0;
  EComDlg.PosliEurothermString(dac);
end;

procedure TEComDlg.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TEComDlg.ButtonClearQueueClick(Sender: TObject);
begin
  VynulujQueue;
end;

procedure TEComDlg.Button1Click(Sender: TObject);
//var bl:boolean;
begin
  ConnectDlg.ShowModal;
  //bl:=ConnectDlg.DisconnectBtn.Enabled;
end;

procedure TEComDlg.PowerBtnClick(Sender: TObject);
var qp:string; i,par,cislo:integer; pomr:double;
begin
 par:=3;
 if not RadioButton3.Checked then begin
  if not ConnectDlg.CommPortDriver.Connected then exit;
  qp:=Edit1.Text; val(qp,pomr,i); cislo:=round(pomr*10);
  EComPosliWrite(par,cislo);
  EComPosliRead(par,iCtiNic);
 end else ShowMessage('Polarity not set');
end;

procedure TEComDlg.PolarBtnClick(Sender: TObject);
var q:byte;
    test:boolean;
    retez:string;
begin
 q:=PortIn($379) and 127;
 test:=true; // not(q=0);
 if RadioButton1.Checked then begin
  PortOut($378,0);  // vynulovat
  PortOut($378,2);  // zapnout 1.polaritu
 end;
 if RadioButton2.Checked then begin
  PortOut($378,0);  // vynulovat
  PortOut($378,1);  // zapnout 2.polaritu
 end;
 if RadioButton3.Checked then begin
  PortOut($378,0);  // vynulovat
 end;
 if not test then begin
  RadioButton3.Checked:=True;
  str(q,retez);
  retez:='No Action'+#13+'Voltage on Magnet Coil'+#13+'q = '+retez;
  ShowMessage(retez);
 end;
end;

procedure TEComDlg.FormActivate(Sender: TObject);
begin
 if not aktiv then begin
  ConnectDlg.ConnectBtnClick(nil);
  PortOut($378,0);
  PortOut($379,0);
  ShowMessage('Swith on GPIB Instruments');
  InitGPIB;
  KPausa(300);
  CloseChannel('114,209,210');
  KPausa(300);
  SetDCVoltage(114,1,2);
  KPausa(300);
  CloseChannel('101:104');
  KPausa(300);
  SetDCVoltage(101,2,2); KPausa(300);
  SetDCVoltage(102,2,2); KPausa(300);
  SetDCVoltage(103,2,2); KPausa(300);
  SetDCVoltage(104,2,2); KPausa(300);
  SetCurrent('0.001');
  aktiv:=true;
 end;
end;

procedure TEComDlg.Button2Click(Sender: TObject);
begin
 Hall.Show;
end;

procedure TEComDlg.FieldBtnClick(Sender: TObject);
var pomr:double;
    s:string;
begin
 ApplyCurrent(true);
 KPausa(500);
 pomr:=ReadValue(114)*1000;
 pomr:=-30.588+sqrt(934.773+0.392163*pomr);
 ApplyCurrent(false);
 str(pomr:4:2,s);
 Edit2.Text:=s;
end;

procedure TEComDlg.Button3Click(Sender: TObject);
var s,pomstr,retez:string;
    kod,par,cislo,m,i:integer;
    cur,volp,voln,Rs,Rar,Rbr,pomr,t,sumx,sumy,sumx2,sumxy,Rh,nh:double;
    Ra,Rb,B: Array[1..100] of double;
begin
 with Hall do begin
  Show;
  ResBtn.Enabled:=false; HallBtn.Enabled:=false; InitBtn.Enabled:=false;
  HallSaveBtn.Enabled:=false; ResSaveBtn.Enabled:=false;
  par:=3;
  InitBtnClick(nil);
  OpenChannel('209,210');
  s:=EditCurr.Text; val(s,cur,kod);
  if not(kod=0) then cur:=1.0;
  s:=EditT.Text; val(s,t,kod);
  if not(kod=0) then t:=0.01;
  t:=t/10;
  cur:=cur/1000;
  {Resistivity}
  { --- Measure R_a --- }
  str(cur:6:4,s);
  SetCurrent(s);
  CloseChannel('201,202'); KPausa(300);
  ApplyCurrent(True);
  KPausa(500);
  volp:=-ReadValue(101);
  ApplyCurrent(False);
  str(-cur:6:4,s);
  SetCurrent(s);  KPausa(300);
  ApplyCurrent(True);
  KPausa(500);
  voln:=-ReadValue(101);
  ApplyCurrent(False);
  OpenChannel('201');
  Rar:=(volp-voln)/2/cur*t; str(Rar:7:5,s);
  EditRa.Text:=s;
  { --- Measure R_b --- }
  str(cur:6:4,s);
  SetCurrent(s);
  CloseChannel('203,205'); KPausa(300);
  ApplyCurrent(True);
  KPausa(500);
  volp:=ReadValue(102);
  ApplyCurrent(False);
  str(-cur:6:4,s);
  SetCurrent(s);  KPausa(300);
  ApplyCurrent(True);
  KPausa(500);
  voln:=ReadValue(102);
  ApplyCurrent(False);
  OpenChannel('202,203,205');
  Rbr:=(volp-voln)/2/cur*t; str(Rbr:7:5,s);
  EditRb.Text:=s;
  { --- Calculate R_s --- }
  Rs:=SolveRs(Rar,Rbr,kod);   //(Ra+Rb)/2; kod:=0;
  if not(kod=0) then Rs:=(Rar+Rbr)/2;
  str(Rs:7:5,s);
  EditRs.Text:=s;
  ResSaveBtnClick(nil);
  {Hall}
  RadioButton3.Checked:=False; RadioButton1.Checked:=True;
  PortOut($378,0);  // vynulovat
  PortOut($378,2);  // zapnout 1.polaritu
  m:=20;
  for i:=1 to m do begin
  { --- Set Field --- }
   cislo:=round(power[i]*10);
   EComPosliWrite(par,cislo);
   EComPosliRead(par,iCtiNic);
   KPausa(300);
   if i=10 then begin
    RadioButton1.Checked:=False; RadioButton2.Checked:=True;
    PortOut($378,0);  // vynulovat
    PortOut($378,1);  // zapnout 2.polaritu
   end;
  { --- Measure R_b --- }
   str(cur:6:4,s);
   SetCurrent(s);
   CloseChannel('202,204'); KPausa(300);
   ApplyCurrent(True);
   KPausa(500);
   volp:=ReadValue(104);
   ApplyCurrent(False);
   str(-cur:6:4,s);
   SetCurrent(s);  KPausa(300);
   ApplyCurrent(True);
   KPausa(500);
   voln:=ReadValue(104);
   ApplyCurrent(False);
   OpenChannel('202,204');
   pomr:=(volp-voln)/2/cur*t;
   s:=Format('%6.3e',[pomr]);
   Delete(s,Length(s)-2,2);
   EditVb.Text:=s;
   Rb[i]:=pomr*10000;
  { --- Measure R_a --- }
   str(cur:6:4,s);
   SetCurrent(s);
   CloseChannel('201,203,206'); KPausa(300);
   ApplyCurrent(True);
   KPausa(500);
   volp:=ReadValue(103);
   ApplyCurrent(False);
   str(-cur:6:4,s);
   SetCurrent(s);  KPausa(300);
   ApplyCurrent(True);
   KPausa(500);
   voln:=ReadValue(103);
   ApplyCurrent(False);
   OpenChannel('201,203,206');
   pomr:=(volp-voln)/2/cur*t;
   s:=Format('%6.3e',[pomr]);
   Delete(s,Length(s)-2,2);
   EditVa.Text:=s;
   Ra[i]:=pomr*10000;
  { --- Measure Field --- }
   CloseChannel('209,210');
   SetCurrent('0.001'); KPausa(300);
   ApplyCurrent(true);
   KPausa(500);
   pomr:=ReadValue(114)*1000;
   pomr:=-30.588+sqrt(934.773+0.392163*pomr);
   ApplyCurrent(false);
   B[i]:=pomr;
   str(pomr:4:2,s);
   EditB.Text:=s;
   HallSaveBtnClick(nil);
   OpenChannel('209,210');
  end;
  PortOut($378,0);    // vynulovat
  CloseChannel('209,210');
  sumy:=0.0; sumx:=0.0; sumxy:=0.0; sumx2:=0.0;
  for i:=1 to m do begin
   sumy:=sumy+Ra[i]; sumxy:=sumxy+Ra[i]*B[i];
   sumx:=sumx+B[i]; sumx2:=sumx2+sqr(B[i]);
  end;
  Rh:=(m*sumxy-sumx*sumy)/(m*sumx2-sqr(sumx));
  sumy:=0.0; sumx:=0.0; sumxy:=0.0; sumx2:=0.0;
  for i:=1 to m do begin
   sumy:=sumy+Rb[i]; sumxy:=sumxy+Rb[i]*B[i];
   sumx:=sumx+B[i]; sumx2:=sumx2+sqr(B[i]);
  end;
  Rh:=Rh+(m*sumxy-sumx*sumy)/(m*sumx2-sqr(sumx)); Rh:=Rh/2;
  s:=Format('%6.3e',[Rh]);
  nh:=1/(Rh*1.60218e-19);
  pomstr:=Format('%6.3e',[nh]);
  retez:='Rh = ' + s + 'cm^3/C   Nh = ' + pomstr + ' cm^-3' + #13;
  str(Rh/Rs:6:4,pomstr);
  retez:='ro = ' + EditRs.Text + ' Ohm.cm   mu = ' + pomstr + ' cm^2/V/s';
  ShowMessage(retez);
  ResBtn.Enabled:=true; HallBtn.Enabled:=true; InitBtn.Enabled:=true;
  HallSaveBtn.Enabled:=true; ResSaveBtn.Enabled:=true;
  Close;
 end;
end;

end.
