unit EComUnit;
interface
uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
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
type
  tDac=record
    str:string[ndacx];
    par:integer;
  end;
type
  TEComDlg = class(TForm)
    CancelBtn: TButton;
    ListBoxSent: TListBox;
    CheckBoxSent: TCheckBox;
    ListBoxReceived: TListBox;
    CheckBoxReceived: TCheckBox;
    LabelNq: TLabel;
    LabelWait: TLabel;
    OKBtn: TButton;
    btnClear: TButton;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    EditP: TEdit;
    EditV: TEdit;
    LabelRead: TLabel;
    ButtonRead: TButton;
    ButtonWrite: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ListBoxQueue: TListBox;
    Label3: TLabel;
    ButtonClearQueue: TButton;
    ButtonSave: TButton;
    Labeltqds: TLabel;
    LabelEuroComCti: TLabel;
    LabelEuroComCtiPred: TLabel;
    CheckBox1: TCheckBox;
    Button1: TButton;
    procedure PosliEurothermString(dac:tDac);
    procedure PosliQueue;
    procedure VynulujQueue;
    procedure VyradQueue;
    procedure ZaradQueue(dac:tDac);
    procedure NastavWaitRespond(bl:boolean);
    Function  VlastniOdeslani(dac:tDac):boolean;
    procedure LbReceived(s:string);
    procedure LbSent(s:string);
    procedure CancelBtnClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure ButtonReadClick(Sender: TObject);
    procedure ButtonWriteClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ButtonClearQueueClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

const
  blEComDlgWrite:boolean=false;
var
  DacQueue:array[1..nqx] of tDac; nq:integer;
  EComDac:tDac;
  blWaitrespond,blJeden:boolean;
  Ted:TDateTime;
  TimeEuroComCti,TimeEuroComZarad:TDateTime;                 (* ?TimeOut *)
var
  EComDlg: TEComDlg;

procedure EComPosliRead(bparw:word; ctipar:integer);
procedure EComPosliWrite(bparw:word; ival:integer);

implementation
{$R *.DFM}
uses EuroPar, Connect, UnitPom; {,ETini , EuroUnit,  Main;}

(* **** ListBoxy ******************************************** *)

Procedure ZmenNq(k:integer);
begin
  if (k<0) OR (k>nqx) then exit;
  nq:=k; EComDlg.LabelNq.Caption:=IntToStr(nq);
{
  with MainForm.LabelNqMain do begin
    Caption:=IntToStr(nq);
    if nq>0 then Color:=clRed else Color:=clGreen;
  end;

  with KETcomForm.btnNqMain do begin
    Caption:=IntToStr(nq);
    if nq>0 then Enabled:=true else Enabled:=false;
  end;}
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

Procedure TEComDlg.LbSent(s:string);
begin
  if not CheckBoxSent.Checked then exit;
  lb1(ListBoxSent,s);
end;

Procedure TEComDlg.LbReceived(s:string);
begin
  if not CheckBoxReceived.Checked then exit;
  lb1(ListBoxReceived,s);
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
    LbSent(dac.str);
  end
end;

Procedure TEComDlg.NastavWaitRespond(bl:boolean);
begin
  blWaitRespond:=bl;
  if blWaitRespond then LabelWait.Caption:='Wait'
                   else LabelWait.Caption:='Ready';
  bl:=not bl;
  ButtonWrite.Enabled:=bl AND blEComDlgWrite;
  ButtonRead.Enabled:=bl;
 { with KETcomForm do begin
    GroupBox2.Enabled:=bl;
    GroupBox1.Enabled:=bl;
    Timer1Enab(bl AND blTimer1);
  end;}
end;

Procedure TEComDlg.ZaradQueue(dac:tDac);
var qp,qts:string; j:integer;
  tqds:double; qtsCti,qtsCtiPred:string;                         (* ?TimeOut *)
begin
  ZmenNq(nq+1);
  DacQueue[nq]:=dac;

  qts:=FormatDateTime('dd.mm.yyyy hh:nn:ss.zzz',Now);
  qp:=''; for j:=1 to length(dac.str) do qp:=qp+IntToStr(ord(dac.str[j]))+' ';
  ListBoxQueue.Items.Add(qts+' '+qp);

  if nq=1 then TimeEuroComCti:=Now;                     (* ?TimeOut_S *)
  TimeEuroComZarad:=Now;
  tqds:=(TimeEuroComZarad-TimeEuroComCti)*SecsPerDay;
  Labeltqds.Caption:=Format('%5.3f',[tqds]);
  qtsCti:=FormatDateTime('dd.mm.yyyy hh:nn:ss.zzz',TimeEuroComZarad);
  LabelEuroComCti.Caption:=qtsCti;
  qtsCtiPred:=FormatDateTime('dd.mm.yyyy hh:nn:ss.zzz',TimeEuroComCti);
  LabelEuroComCtiPred.Caption:=qtsCtiPred;
  if nq>1 then begin
    if tqds>TimeEuroComCtiXsec then begin
      qp:=Format('! Eurotherm connection TimeOut %ds exceeded, queue reset',
                    [TimeEuroComCtiXsec]);
    {  KETcomForm.ZapisLog(0,qp);}
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
  with ListBoxQueue do if (Items.Count>0) then Items.Delete(0);
end;

Procedure TEComDlg.VynulujQueue;
begin
  NastavWaitRespond(false);
  ZmenNq(0);
  ListBoxQueue.Clear;
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
//  EComPosliRead(bpar);
end;

procedure TEComDlg.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TEComDlg.btnClearClick(Sender: TObject);
begin
  ListBoxSent.Clear;
  ListBoxReceived.Clear;
end;

(* **** ButtonRead/Write ********************************* *)

procedure TEComDlg.ComboBox1Change(Sender: TObject);
var qvalue,qname:string; k:integer;
begin
  with ComboBox1 do begin
    k:=ItemIndex;
    qname:=Items.Names[k];
    qvalue:=Items.Values[qname];
  end;
  EditP.Text:=qvalue;
end;

procedure TEComDlg.ButtonWriteClick(Sender: TObject);
var qp:string; i,par,cislo:integer;
begin
  if not ConnectDlg.CommPortDriver.Connected then exit;
  qp:=EditP.Text; val(qp,par,i); if (par<1) OR (par>parwx) then exit;
  qp:=EditV.Text; val(qp,cislo,i);
  EComPosliWrite(par,cislo);
  EComPosliRead(par,iCtiNic);
end;

procedure TEComDlg.ButtonReadClick(Sender: TObject);
var qp:string; i,par:integer;
begin
  if not ConnectDlg.CommPortDriver.Connected then exit;
  qp:=EditP.Text; val(qp,par,i); if (par<1) OR (par>parwx) then exit;
  EComPosliRead(par,iCtiNic);
end;

procedure TEComDlg.ButtonClearQueueClick(Sender: TObject);
begin
  VynulujQueue;
end;

(* **** Save ListBoxy ******************************************** *)

Procedure SaveListReceivedBox;
const fnamer='KETcomR.txt';
var i:integer; haf:textfile; fname,qp:string;
begin
  fname:=fnamer;
  AssignFile(haf,fname); rewrite(haf);
  with EComDlg.ListBoxReceived do begin
    for i:=0 to Items.Count-1 do begin
      qp:=Items[i];
      writeln(haf,qp);
    end;
  end;
  CloseFile(haf);
end;

Procedure SaveListSentBox;
const fnames='KETcomS.txt';
var i:integer; haf:textfile; fname,qp:string;
begin
  fname:=fnames;
  AssignFile(haf,fname); rewrite(haf);
  with EComDlg.ListBoxSent do begin
    for i:=0 to Items.Count-1 do begin
      qp:=Items[i];
      writeln(haf,qp);
    end;
  end;
  CloseFile(haf);
end;

procedure TEComDlg.ButtonSaveClick(Sender: TObject);
begin
  SaveListSentBox;
  SaveListReceivedBox;
end;

procedure TEComDlg.CheckBox1Click(Sender: TObject);
begin
  blEComDlgWrite:=CheckBox1.Checked;
  ButtonWrite.Enabled:=blEComDlgWrite;
end;

procedure TEComDlg.Button1Click(Sender: TObject);
var bl:boolean;
begin
  ConnectDlg.ShowModal;
  bl:=ConnectDlg.DisconnectBtn.Enabled;
  ButtonWrite.Enabled:=bl;
  ButtonRead.Enabled:=bl;
end;

end.
