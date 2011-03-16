unit Measure;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ieeedel, StdCtrls, Buttons;

type
  THall = class(TForm)
    ExitBtn: TButton;
    InitBtn: TButton;
    EditCurr: TEdit;
    LabelCurr: TLabel;
    LabelT: TLabel;
    EditT: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    LabelB: TLabel;
    EditB: TEdit;
    EditRa: TEdit;
    LabelRa: TLabel;
    EditRb: TEdit;
    LabelRb: TLabel;
    EditRs: TEdit;
    LabelRs: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditVa: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    EditVb: TEdit;
    LabeVa: TLabel;
    Label7: TLabel;
    EditUB: TEdit;
    LabUB: TLabel;
    ResBtn: TSpeedButton;
    HallBtn: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    HallSaveBtn: TButton;
    ResSaveBtn: TButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure InitBtnClick(Sender: TObject);
    procedure ResBtnClick(Sender: TObject);
    procedure HallBtnClick(Sender: TObject);
    procedure ResSaveBtnClick(Sender: TObject);
    procedure HallSaveBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Hall: THall;

procedure InitGPIB;
procedure OpenChannel(chan:string);
procedure CloseChannel(chan:string);
procedure SetDCVoltage(chan, rang, res:byte);
function ReadValue(chan:byte):double;
procedure SetCurrent(curr:string);
procedure ApplyCurrent(st:boolean);
function SolveRs(Ra,Rb:double; var status:integer):double;

implementation
{$R *.DFM}

uses UnitPom;

var status:integer;

procedure THall.ExitBtnClick(Sender: TObject);
begin
 Close;
end;

procedure THall.InitBtnClick(Sender: TObject);
begin
 CloseChannel('101:104');
 KPausa(300);
 SetDCVoltage(101,2,2); KPausa(300);
 SetDCVoltage(102,2,2); KPausa(300);
 SetDCVoltage(103,2,2); KPausa(300);
 SetDCVoltage(104,2,2);
end;

procedure InitGPIB;
begin
 initialize(21,0);
end;

procedure CloseChannel(chan:string);
var s:string;
begin
 s:='ROUT:CLOSe (@' + chan + ')';
 send(9,s,status);
 if not(status=0) then ShowMessage('Transfer Failed on Send');
end;

procedure OpenChannel(chan:string);
var s:string;
begin
 s:='ROUT:OPEN (@' + chan + ')';
 send(9,s,status);
 if not(status=0) then ShowMessage('Transfer Failed on Send');
end;

procedure SetDCVoltage(chan, rang, res:byte);
var s,qs:string;
begin
 case rang of
 1: qs:=' 0.1';
 2: qs:=' 1';
 3: qs:=' 10';
 else qs:=' AUTO';
 end;
 s:='SENS:VOLT:DC:RANG'+qs+', (@'+IntToStr(chan)+')';
 send(9,s,status);
 if not(status=0) then ShowMessage('Transfer Failed on Send');
 KPausa(200);
 case res of
 1: qs:=' 1';
 2: qs:=' 10';
 3: qs:=' 100';
 else qs:=' 0.02';
 end;
 s:='SENS:VOLT:DC:NPLC'+qs+', (@'+IntToStr(chan)+')';
 send(9,s,status);
 if not(status=0) then ShowMessage('Transfer Failed on Send');
end;

function ReadValue(chan:byte):double;
var s:string;
    pomr:double;
    l:word;
begin
  pomr:=0.0;
  s:='ROUT:SCAN (@'+IntToStr(chan)+')';
  send(9,s,status);
  if not(status=0) then ShowMessage('Transfer Failed on Send');
  KPausa(200);
  send(9,'READ?',status);
  if not(status=0) then ShowMessage('Transfer Failed on Send');
  enter(s,80,l,9,status);
  if status=0 then begin
  val(s,pomr,status);
  end else ShowMessage('Transfer Failed on Read');
  ReadValue:=pomr;
end;

procedure SetCurrent(curr:string);
var s:string;
begin
 s:='CURR '+curr;
 send(12,s,status);
 if not(status=0) then ShowMessage('Transfer Failed on Send');
end;

procedure ApplyCurrent(st:boolean);
var s:string;
begin
 if st then s:='OUTP ON' else s:='OUTP OFF';
 send(12,s,status);
 if not(status=0) then ShowMessage('Transfer Failed on Send');
end;

function SolveRs(Ra,Rb:double; var status:integer):double;
var Rs,eps,f,df,dR:double;
    i:integer;
    test:boolean;
begin
 eps:=0.0001; status:=0;
 i:=0; Rs:=(Ra+Rb)/2;
 repeat
  inc(i);
  f:=exp(-Pi*Ra/Rs) + exp(-Pi*Rb/Rs)-1;
  df:=Pi/sqr(Rs)*(Ra*exp(-Pi*Ra/Rs)+Rb*exp(-Pi*Rb/Rs));
  if abs(df)<1e-30 then df:=1;
  dR:=-f/df;
  Rs:=Rs+dR;
  test:= (abs(dR)<eps) or (i>500);
 until test;
 if (abs(dR)>eps) then begin Rs:=-1.0; status:=1; end;
 SolveRs:=Rs;
end;

procedure THall.ResBtnClick(Sender: TObject);
var s:string;
    kod:integer;
    cur,volp,voln,Ra,Rb,Rs,pomr,t:double;
begin
 ResBtn.Enabled:=false; HallBtn.Enabled:=false;
 OpenChannel('209,210');
 s:=EditCurr.Text; val(s,cur,kod);
 if not(kod=0) then begin
  ShowMessage('Failed to Convert'+#13+'Current to Number');
  exit;
 end;
 s:=EditT.Text; val(s,t,kod);
 if not(kod=0) then begin
  ShowMessage('Failed to Convert'+#13+'Thickness to Number');
  exit;
 end;
 t:=t/10;
 cur:=cur/1000; str(cur:5:3,s);
 { --- Measure R_a --- }
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
 Ra:=(volp-voln)/2/cur*t; str(Ra:7:5,s);
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
 Rb:=(volp-voln)/2/cur*t; str(Rb:7:5,s);
 EditRb.Text:=s;
 { --- Calculate R_s --- }
 Rs:=SolveRs(Ra,Rb,kod);   //(Ra+Rb)/2; kod:=0;
 if not(kod=0) then ShowMessage('Failed on Calculating Rs');
 str(Rs:7:5,s);
 EditRs.Text:=s;
 { --- Measure Field --- }
 CloseChannel('209,210');
 SetCurrent('0.001'); KPausa(300);
 ApplyCurrent(true);
 KPausa(500);
 pomr:=ReadValue(114)*1000;
 pomr:=-30.588+sqrt(934.773+0.392163*pomr);
 ApplyCurrent(false);
 str(pomr:4:2,s);
 EditB.Text:=s;
 ResBtn.Enabled:=true; HallBtn.Enabled:=true;
end;

procedure THall.HallBtnClick(Sender: TObject);
var s:string;
    kod:integer;
    cur,volp,voln,Ra,Rb,Rs,pomr,t:double;
begin
 ResBtn.Enabled:=false; HallBtn.Enabled:=false;
 OpenChannel('209,210');
 s:=EditCurr.Text; val(s,cur,kod);
 if not(kod=0) then begin
  ShowMessage('Failed to Convert'+#13+'Current to Number');
  exit;
 end;
 s:=EditT.Text; val(s,t,kod);
 if not(kod=0) then begin
  ShowMessage('Failed to Convert'+#13+'Thickness to Number');
  exit;
 end;
 t:=t/10;
 cur:=cur/1000; str(cur:6:4,s);
 { --- Measure R_b --- }
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
 Rb:=(volp-voln)/2/cur*t;
 s:=Format('%6.3e',[Rb]);
 Delete(s,Length(s)-2,2);
 EditVb.Text:=s;
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
 Ra:=(volp-voln)/2/cur*t;
 s:=Format('%6.3e',[Ra]);
 Delete(s,Length(s)-2,2);
 EditVa.Text:=s;
 { --- Measure Field --- }
 CloseChannel('209,210');
 SetCurrent('0.001'); KPausa(300);
 ApplyCurrent(true);
 KPausa(500);
 pomr:=ReadValue(114)*1000;
 pomr:=-30.588+sqrt(934.773+0.392163*pomr);
 ApplyCurrent(false);
 str(pomr:4:2,s);
 EditB.Text:=s;
 { --- Calculate V/B/I --- }
 Rs:=Ra/pomr*10000;
 s:=Format('%6.3e',[Rs]);
 Delete(s,Length(s)-2,2);
 EditUB.Text:=s;
 ResBtn.Enabled:=true; HallBtn.Enabled:=true;
end;

procedure THall.ResSaveBtnClick(Sender: TObject);
var f:textfile;
    s,pomstr:string;
begin
 AssignFile(f,'Res.dat');
 if FileExists('Res.dat') then Append(f) else Rewrite(f);
 s:=EditB.Text; if s='' then s:='#.###';
 s:=s+' ';
 pomstr:=EditCurr.Text; if pomstr='' then pomstr:='#.####';
 s:=s+pomstr+' ';
 pomstr:=EditT.Text; if pomstr='' then pomstr:='#.####';
 s:=s+pomstr+' ';
 pomstr:=EditRa.Text; if pomstr='' then pomstr:='#.####';
 s:=s+pomstr+' ';
 pomstr:=EditRb.Text; if pomstr='' then pomstr:='#.####';
 s:=s+pomstr+' ';
 pomstr:=EditRs.Text; if pomstr='' then pomstr:='#.####';
 s:=s+pomstr;
 Writeln(f,s);
 CloseFile(f);
end;

procedure THall.HallSaveBtnClick(Sender: TObject);
var f:textfile;
    s,pomstr:string;
    pomr,Rb:double;
    kod:integer;
    test:boolean;
begin
 AssignFile(f,'Hall.dat');
 if FileExists('Hall.dat') then Append(f) else Rewrite(f);
 s:=EditB.Text; if s='' then s:='#.###';
 val(s,pomr,kod);
 test:=kod=0;
 s:=s+' ';
 pomstr:=EditCurr.Text; if pomstr='' then pomstr:='#.####';
 s:=s+pomstr+' ';
 pomstr:=EditT.Text; if pomstr='' then pomstr:='#.####';
 s:=s+pomstr+' ';
 pomstr:=EditVa.Text; if pomstr='' then pomstr:='#.####';
 s:=s+pomstr+' ';
 pomstr:=EditVb.Text; if pomstr='' then pomstr:='#.####';
 s:=s+pomstr+' ';
 val(pomstr,Rb,kod);
 test:=test and (kod=0);
 pomstr:=EditUB.Text; if pomstr='' then pomstr:='#.####';
 s:=s+pomstr+' ';
 if test then begin
  Rb:=Rb/pomr*10000;
  pomstr:=Format('%6.3e',[Rb]);
  Delete(pomstr,Length(pomstr)-2,2);
 end else pomstr:='#.####';
 s:=s+pomstr;
 Writeln(f,s);
 CloseFile(f);
end;

end.
