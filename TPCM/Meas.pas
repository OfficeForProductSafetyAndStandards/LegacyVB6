unit Meas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, hp3457, k182u, k236u, p6000,
  num2str, ieeedel, ExtCtrls, Buttons;

type
  TMeasForm = class(TForm)
    GroupBox1: TGroupBox;
    SetpDisp: TEdit;
    FieldDisp: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    TimeDisp: TEdit;
    Label3: TLabel;
    TSegDisp: TEdit;
    Label4: TLabel;
    BSegDisp: TEdit;
    GroupBox2: TGroupBox;
    dTuDisp: TEdit;
    Label6: TLabel;
    dTlDisp: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    CurrDisp: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    VoltDisp: TEdit;
    GroupBox3: TGroupBox;
    SeebDisp: TEdit;
    CondDisp: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    TempDisp: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    sdTuDisp: TEdit;
    sdTlDisp: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    StatDisp: TEdit;
    GroupBox4: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    B_Disp: TEdit;
    Label34: TLabel;
    Label35: TLabel;
    CommLine: TEdit;
    aEdit: TEdit;
    bEdit: TEdit;
    cEdit: TEdit;
    Label36: TLabel;
    LEdit: TEdit;
    Label37: TLabel;
    Label38: TLabel;
    roEdit: TEdit;
    Label39: TLabel;
    SegEdit: TEdit;
    Label5: TLabel;
    mEdit: TEdit;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Timer1: TTimer;
    TEdit: TEdit;
    HEdit: TEdit;
    StartBut: TSpeedButton;
    StopBut: TSpeedButton;
    Label23: TLabel;
    procedure T1Timer(Sender: TObject);
    procedure InitInstr(Sender: TObject);
    procedure StartButClick(Sender: TObject);
    procedure StopButClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Point_Seg=^prog;
  prog=record
        T_init,T_term,T_step,
        MField_I,MField_F,MField_S:double;
        hyst:boolean;
        Next_Seg:Point_Seg;
       end;
  poly=array[1..6] of real;

var
  MeasForm: TMeasForm;
  p_seg,f_seg,l_seg:Point_Seg;
  T_Setp,Current,Field,pomr,dT0_U,dT0_L,dT1_U,dT1_L,sD_U,sD_L,dT0,
  dV0,dV1,dT,Pow,Res,Sbk0,Sbk1,Scor,Tcd0,Tcd1,hmot,SD,dTUmean,dTlmean,
  Sur,Lng,Iinit,ro,a,b,c,Field_I,Field_F,Field_S,T,F,V,dT_U,dT_L:real;
  filename,comment,retez:string;
  Test_Setprg,hy,test,tchange,twait,stab1,stab2,new_seg,fwait,end_prog,
  twait_in,dTmeas,dTstable,heat_on,first_start:boolean;
  i,j,n_step,h_step,seqno,TsegNo,BSegNo,sti1,sti2:integer;
  step:double;
  h,m,s,d,cas,casi:dword;
  casp1,casp2:TDatetime;
  rp,tp,sp,cp,dtp:poly;
  df1,df2:text;

procedure Read_Program;

implementation
{$R *.DFM}
{--------------------------------------------------------------}
Procedure TIMEINIT; stdcall; external 'port.dll';
Function TIMEREAD: DWORD; stdcall; external 'port.dll';
{--------------------------------------------------------------}
Function ela(i:word):string;
var b:string;
begin
 str(i,b); if length(b)=1 then b:='0'+b;
 ela:=b
end;
{--------------------------------------------------------------}
function chrono:string;
var retez,pomstr:string;
begin
  cas:=TIMEREAD;
  cas:=cas+casi;
  h:=cas div 3600000;
  cas:=cas-h*3600000; m:=cas div 60000;
  cas:=cas-m*60000; s:=cas div 1000;
  pomstr:=ela(h);
  pomstr:=pomstr+':'+ela(m);
  retez:=pomstr+':'+ela(s);
 chrono:=retez;
end; 
{--------------------------------------------------------------}
procedure Display_Sequence;
 var retez:string;
 begin
  retez:=IntToStr(seqno)+' [';
  retez:=retez+IntToStr(n_step)+']';
  MeasForm.SegEdit.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_Sample;
 var retez:string;
 begin
  MeasForm.CommLine.Text:=Comment;
  str(a:3:1,retez); MeasForm.aEdit.Text:=retez;
  str(b:3:1,retez); MeasForm.bEdit.Text:=retez;
  str(c:3:1,retez); MeasForm.cEdit.Text:=retez;
  str(Lng:3:1,retez); MeasForm.LEdit.Text:=retez;
  str(ro:4:2,retez); MeasForm.roEdit.Text:=retez;
  str(hmot:6:4,retez); MeasForm.mEdit.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_TSeg;
 var retez:string;
     pomi:integer;
     pomr:double;
 begin
  retez:=IntToStr(TSegNo)+' [';
  pomr:=abs(p_seg^.T_Init-p_seg^.T_Term);
  if pomr<1e-3 then pomr:=0.0;
  if abs(p_seg^.T_Step)>1e-3 then
    pomr:=pomr/abs(p_seg^.T_Step);
  pomi:=round(pomr+1);
  retez:=retez+IntToStr(pomi)+']';
  MeasForm.TSegDisp.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_BSeg;
 var retez:string;
     pomi:integer;
     pomr:double;
 begin
  retez:=IntToStr(BSegNo)+' [';
  pomr:=abs(p_seg^.MField_F-p_seg^.MField_I);
  if pomr<1e-3 then pomr:=0.0;
  if abs(p_seg^.MField_S)>1e-3 then
   pomr:=pomr/abs(p_seg^.MField_S);
  if p_seg^.hyst then pomr:=pomr*4;
  pomi:=round(pomr+1);
  retez:=retez+IntToStr(pomi)+']';
  MeasForm.BSegDisp.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_Field(t:double);
 var retez:string;
 begin
  str(t:5:3,retez);
  MeasForm.FieldDisp.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_B(t:double);
 var retez:string;
 begin
  str(t:5:3,retez);
  MeasForm.B_Disp.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_H(t:double);
 var retez:string;
 begin
  str(t:5:3,retez);
  {if t<0 then retez:='';}
  MeasForm.HEdit.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_Curr(t:double);
 var retez:string;
 begin
  str(t:5:3,retez);
  MeasForm.CurrDisp.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_Setp(t:double);
 var retez:string;
 begin
  str(t:5:1,retez);
  if t<0 then retez:='';
  MeasForm.SetpDisp.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_dT1(t:double);
 var retez:string;
 begin
  if abs(t)<1e4 then str(t:6:3,retez) else retez:='';
  MeasForm.dTuDisp.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_sdT1(t:double);
 var retez:string;

 begin
  if abs(t)<1e3 then str(t:6:4,retez) else retez:='';
  MeasForm.sdTuDisp.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_dT2(t:double);
 var retez:string;

 begin
  if abs(t)<1e4 then str(t:6:3,retez) else retez:='';
  MeasForm.dTlDisp.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_sdT2(t:double);
 var retez:string;

 begin
  if abs(t)<1e3 then str(t:6:4,retez) else retez:='';
  MeasForm.sdTlDisp.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_dV(t:double);
 var retez:string;

 begin
  if abs(t)<1e4 then str(t:6:3,retez) else retez:='';
  MeasForm.VoltDisp.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_Time;
 var retez:string;
 begin
  retez:=chrono;
  {cas:=Time;
   cas:=cas-casi;
   retez:=TimeToStr(cas);}
  MeasForm.TimeDisp.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_Status(retez:string);

 begin
  MeasForm.StatDisp.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_Temp(t:double);
 var retez:string;
 begin
  str(t:5:1,retez);
  if t<0 then retez:='';
  MeasForm.TempDisp.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_T(t:double);
 var retez:string;
 begin
  str(t:5:1,retez);
  if t<0 then retez:='';
  MeasForm.TEdit.Text:=retez;
 end;
{--------------------------------------------------------------}
procedure Display_Seeb(t:double);
 var retez:string;
 begin
  str(t:6:3,retez);
  MeasForm.SeebDisp.Text:=retez;
 end;
{--------------------------------------------------}
procedure Display_Cond(t:double);
 var retez:string;
 begin
  str(t:6:3,retez);
  MeasForm.CondDisp.Text:=retez;
 end;
{--------------------------------------------------}
procedure Read_Program;
 var pomstr:string;
     i:integer;
 begin
  assignfile(df1,'c:\TPCM\program.dat');
  reset(df1);
  new(l_seg);
  f_seg:=l_seg;
  readln(df1,comment);
  {cas:=Time;
   retez:=DateTimeToStr(cas);
   comment:=comment+'   '+retez;}
  readln(df1,filename);
  read(df1,Lng,a,b,c,ro,hmot); if not eoln(df1)then readln(df1,pomstr);
  Sur:=2*(a+b)*c+2*a*b;
  read(df1,Iinit); if not eoln(df1)then readln(df1,pomstr);
  read(df1,n_step); if not eoln(df1)then readln(df1,pomstr);
  for i:=1 to n_step do begin
   read(df1,l_seg^.T_Init,l_seg^.T_Term,l_seg^.T_Step);
   if not eoln(df1)then readln(df1,pomstr);
   read(df1,l_seg^.MField_I,l_seg^.MField_F,l_seg^.MField_S,j);
   if j=0 then l_seg^.hyst:=false else l_seg^.hyst:=true;
   if not eoln(df1) then readln(df1,pomstr);
   p_seg:=l_seg; new(l_seg);
   p_seg^.Next_Seg:=l_seg;
  end;
  closefile(df1);
  assignfile(df1,'c:\TPCM\param.dat');
  reset(df1);
  readln(df1,pomstr);
  readln(df1,tp[1],tp[2],tp[3],tp[4],tp[5],tp[6]);
  readln(df1,rp[1],rp[2],rp[3],rp[4],rp[5],rp[6]);
  readln(df1,sp[1],sp[2],sp[3],sp[4],sp[5],sp[6]);
  readln(df1,cp[1],cp[2],cp[3],cp[4],cp[5],cp[6]);
  closefile(df1);
 end;
{--------------------------------------------------------------}
procedure Open_File(filename:string);

 begin
  assignfile(df1,filename+'.raw');
  assignfile(df2,filename+'.dat');
  rewrite(df1);
  writeln(df1,comment);
  writeln(df1,'T[K],B[T],dV[uV],dTU[K],dTUerr,dTL[K],dTLerr,Curr[mA],Time');
  closefile(df1);
  rewrite(df2);
  writeln(df2,comment);
  writeln(df2,'T[K],B[T],S[uV/K],Scorr[uV/K],TCond[mW/K],TCond[W/m/K]');
  closefile(df2);
 end;
{--------------------------------------------------------------}
procedure Write_Record1(T,H,dV,T1,dT1,T2,dT2,C:real);
 var retez,pomstr:string;

 begin
  append(df1);
  str(T:5:1,pomstr);retez:=pomstr+'  ';
  str(H:3:1,pomstr);retez:=retez+pomstr+'  ';
  str((dV*1e6):6:3,pomstr);retez:=retez+pomstr+'  ';
  str(T1:5:3,pomstr);retez:=retez+pomstr+'  ';
  str(dT1:5:3,pomstr);retez:=retez+pomstr+'  ';
  str(T2:5:3,pomstr);retez:=retez+pomstr+'  ';
  str(dT2:5:3,pomstr);retez:=retez+pomstr+'  ';
  str((C*1e3):5:2,pomstr);retez:=retez+pomstr+'  ';
  pomstr:=chrono;
  {cas:=Time; cas:=cas-casi;
   pomstr:=TimeToStr(cas);}
  retez:=retez+pomstr;
  writeln(df1,retez);
  closefile(df1);
 end;
{--------------------------------------------------------------}
procedure Write_Record2(T,H,s1,s2,c1,c2:real);
 var retez,pomstr:string;

 begin
  append(df2);
  str(T:5:1,pomstr);retez:=pomstr+'  ';
  str(H:3:1,pomstr);retez:=retez+pomstr+'  ';
  str(s1:7:3,pomstr);retez:=retez+pomstr+'  ';
  str(s2:7:3,pomstr);retez:=retez+pomstr+'  ';
  str(c1:5:3,pomstr);retez:=retez+pomstr+'  ';
  str(c2:5:3,pomstr);retez:=retez+pomstr;
  writeln(df2,retez);
  closefile(df2);
 end;
{--------------------------------------------------------------}
procedure Prep_Seg;
 begin
   inc(seqno); Display_Sequence;
   T_Setp:=p_seg^.T_init;
   if p_seg^.T_Init>p_seg^.T_Term then step:=-p_seg^.T_Step
                                  else step:=p_seg^.T_Step;
   Display_Status('Setting Init-T');
   Res:=rp[1]*exp(-T_Setp/rp[2])+rp[3]*exp(-T_Setp/rp[4])+rp[5];
   dT0:=0.5+0.006*T_Setp; Tcd0:=sqr(Iinit*1e-3)*Res/dT0;
   T_Setp:=T_Setp-step;
   Temp(T_Setp,10);
   Display_Setp(T_Setp);
   TSegNo:=0;
 end;
{--------------------------------------------------------------}
procedure Set_Field;
 begin
   Display_Status('Setting field');
   Champ(Field*10000.0,250);
   Display_Field(Field);
end;
{--------------------------------------------------------------}
procedure Set_Curr(Setp:real);
 begin
  if Setp<0 then Current:=0.0 else begin
   dT0:=0.5+0.006*Setp;
   Current:=sqrt(Tcd0*dT0/Res);
  end;
  if Current>2.0e-3 then Current:=2.0e-3;
  K236COURANTENSIONAPPL(Current);
  Display_Curr(Current*1e3);
 end;
{--------------------------------------------------}
procedure End_Program;
 begin
  {--------Release Program from Memory----------}
  p_seg:=f_seg;
  repeat
   f_seg:=p_seg^.Next_Seg;
   dispose(p_seg);
   p_seg:=f_seg;
  until p_seg=l_seg;
  dispose(p_seg);
  {Set T=300 K, Heating Current=0}
  Display_dT1(1e5); Display_dT2(1e5);
  Display_sdT1(1e5); Display_sdT2(1e5);
  Display_Setp(300.0);
  Display_Status('Measurement finished-Setting T');
  Set_Curr(-1);
  Temp(300,10);
  T_Setp:=300;
  twait:=true; new_seg:=false; fwait:=false;
 end;
{--------------------------------------------------}
procedure Calc_Prop;
 var i:integer;
 begin
   Display_Status('Calculate properties');
   Pow:=sqr(Current)*Res;  {Power [W]}
   dT:=(dT1_U-dT1_L)-(dT0_U-dT0_L);
   Sbk0:=(dV0-dV1)*1e6/dT;;
   Tcd0:=Pow/dT;
   Scor:=sp[6];
   for i:=5 downto 1 do Scor:=Scor*T_Setp+sp[i];
   Sbk1:=Sbk0+Scor;
   Tcd1:=Tcd0*Lng/a/b*1e3*2/(3*ro-1);
   dT0:=dT1_U-dT0_U;
   Write_Record2(T_Setp,Field,Sbk0,Sbk1,Tcd0*1000,Tcd1);
   Display_Temp(T_Setp); Display_B(Field);
   Display_Seeb(Sbk1); Display_Cond(Tcd1);
 end;
{--------------------------------------------------}
procedure TMeasForm.T1Timer(Sender: TObject);
var i:integer;

    retez:string;

begin
 mesure6000(T,F);
 V:=K182Read;
 Display_T(T); Display_H(F/1e4);
 Display_dV(V*1e6);

if StartBut.Down then begin
 Display_Time;

 pomr:=tp[6];
 for i:=5 downto 1 do pomr:=pomr*T+tp[i];
 if dTmeas then begin
  dT_U:=dTU*1e6/pomr; Display_dT1(dT_U);
  dT_L:=dTL*1e6/pomr; Display_dT2(dT_L);
  Display_sdT2(dT_U-dT_L);
 end;

 if new_seg and not fwait then begin
  new_seg:=false;
  Prep_Seg; twait_in:=true;
 end;

 if twait_in then begin
  if abs(T-T_Setp)<0.5 then begin
   twait_in:=false;
   Field:=p_seg^.MField_I;
   Set_Field; fwait:=true; tchange:=true;
  end;
 end;

 if tchange and not fwait then begin
  T_Setp:=T_Setp+step;
  inc(TSegNo); Display_TSeg;
  Res:=rp[1]*exp(-T_Setp/rp[2])+rp[3]*exp(-T_Setp/rp[4])+rp[5];
  Display_Status('Setting T');
  Temp(T_Setp,1);
  Display_Setp(T_Setp);
  tchange:=false; twait:=true;
 end;

 if twait then begin
  if abs(T-T_Setp)<0.02 then begin
   twait:=false; stab1:=true; dTstable:=false;
   dTmeas:=true;
  end;
 end;

 if not twait and end_prog then begin
  Champ(0,100); stab1:=false;
  Display_Field(0.0);
  Display_Status('Program terminated');
  With MeasForm do begin
   StartBut.Enabled:=true;
   StartBut.Down:=false; first_start:=true;
   StartBut.Hint:='Start Measurement';
   StopBut.Enabled:=false;
  end;
 end;

 if stab1 and dTStable then begin
  stab1:=false;
  with p_seg^ do begin
   hy:=hyst; Field:=MField_I; Field_I:=MField_I;
   Field_F:=MField_F; Field_S:=MField_S; h_step:=1;
  end;
  BSegNo:=1; Display_BSeg;
  Set_Field; fwait:=true;
  Set_Curr(-1);
  stab2:=true; dTstable:=false; sti1:=1; sti2:=0;
  Display_Status('Stability test 2, loop 1');
 end;

 if stab2 and dTStable and not heat_on then begin
  dTstable:=false; sti1:=1; sti2:=0;
  Display_Status('Measuring at 0 mA');
  dT0_U:=dTUmean; dT0_L:=dTLmean;
  dV0:=V;
  Write_Record1(T_Setp,Field,dV0,dT0_U,sD_U,dT0_L,0.0,Current);
  Set_Curr(T_Setp); heat_on:=true;
  Display_Status('Stability test 2, loop 1');
 end;

 if stab2 and dTStable and heat_on then begin
  dTstable:=false; stab2:=false; sti1:=0; sti2:=0; heat_on:=false;
  Display_Status('Measuring at heating');
  dT1_U:=dTUmean; dT1_L:=dTLmean;
  dV1:=V;
  Write_Record1(T_Setp,Field,dV1,dT1_U,SD,dT1_L,0.0,Current);
  Calc_Prop;
  Set_Curr(-1);
  test:=(abs(Field_S)<0.05) or (abs(Field_F-Field_I)<0.05);
  test:=test or (abs(Field-Field_F)<0.05);
  if Field_I<Field_F then test:=test or (Field>Field_F)
                     else test:=test or (Field<Field_F);
  if test and hy and (h_step<3) then begin
   case h_step of
    1: begin Field_I:=Field_F; Field_F:=-Field_F; end;
    2: begin Field_I:=Field_F; Field_F:=p_seg^.MField_I; end;
   end;
   inc(h_step); test:=false;
  end;
  if not test then begin
   if Field_I<Field_F then Field:=Field+Field_S
                      else Field:=Field-Field_S;
   if Field>9.0 then Field:=9.0;
   if Field<-9.0 then Field:=-9.0;
   Set_Field; inc(BSegNo); Display_BSeg; stab2:=true;
  end else begin
   Field:=p_seg^.MField_I;
   Set_Field;
   if p_seg^.T_Init>p_seg^.T_Term then test:=(T_Setp<p_seg^.T_Term)
                                  else test:=(T_Setp>p_seg^.T_Term);
   test:=test or (abs(T_Setp-p_seg^.T_Term)<0.05);
   if test then begin
    new_seg:=true; p_seg:=p_seg^.Next_Seg;
    if p_seg=l_seg then begin
     end_prog:=true; End_program;
    end;
   end else begin
    tchange:=true;
    Display_dT1(1e5); Display_dT2(1e5);
   end;
   BSegDisp.Text:='';
   dTmeas:=false;
  end;
  fwait:=true;
  Display_sdT1(1e5); Display_sdT2(1e5);
 end;

 if stab1 then begin
  inc(sti2);
  if sti2<6 then begin
   dTUmean:=dTUmean+dT_U;
   dtp[sti2]:=dT_U;
   dTLmean:=dTLmean+dT_L;
  end else begin
   sti2:=0; inc(sti1);
   retez:='Stability test 1, loop '+IntToStr(sti1);
   Display_Status(retez);
   dTUmean:=dTUmean/5; Display_dT1(dTUmean);
   dTLmean:=dTLmean/5; Display_dT2(dTLmean);
   Display_sdT2(dTUmean-dTLmean);
   SD:=0;
   for i:=1 to 5 do SD:=SD+sqr(dTUmean-dtp[i]);
   SD:=sqrt(SD/5); Display_sdT1(SD);
   dTstable:=(abs(dTUmean-dTLmean)<0.2)and(SD<5e-3)or(sti1>30);
   if not dTstable then begin
    dTUmean:=0; dTLmean:=0; end;
  end;
 end;

 if stab2 and not fwait then begin
  inc(sti2);
  if sti2<6 then begin
   dTUmean:=dTUmean+dT_U;
   dTLmean:=dTLmean+dT_L;
   dtp[sti2]:=dT_U;
  end else begin
   sti2:=0; inc(sti1);
   retez:='Stability test 2, loop '+IntToStr(sti1);
   Display_Status(retez);
   dTUmean:=dTUmean/5; Display_dT1(dTUmean);
   dTLmean:=dTLmean/5; Display_dT2(dTLmean);
   Display_sdT2(dTUmean-dTLmean);
   SD:=0;
   for i:=1 to 5 do SD:=SD+sqr(dTUmean-dtp[i]);
   SD:=sqrt(SD/5); Display_sdT1(SD);
   dTstable:=(SD<5e-3)or(sti1>40);
   if not dTstable then begin
    dTUmean:=0; dTLmean:=0; end;
  end;
 end;

 if fwait then begin
  if abs(F-Field*10000)<50 then begin
   fwait:=false;
  end;
 end;
end;

end;
{--------------------------------------------------}
procedure TMeasForm.InitInstr(Sender: TObject);
begin

 {Prepare Instruments}
 initialize(21,0);
 HP3457_Init;
 K182Init;
 p_seg:=f_seg; seqno:=0;
 new_seg:=false; first_start:=true;
 fwait:=false; twait:=false; tchange:=false; dTstable:=false;
 dTmeas:=false; stab1:=false; stab2:=false; heat_on:=false;
 end_prog:=false; twait_in:=false;
 sti1:=0; sti2:=0;
 Timer1.Enabled:=true;
end;
{--------------------------------------------------}
procedure TMeasForm.StartButClick(Sender: TObject);
begin
 if StartBut.Down then begin
  Startbut.Hint:='Pause';
  Stopbut.Enabled:=true; StopBut.ShowHint:=true;
  if first_start then begin
   new_seg:=true;
   Read_Program;
   Display_Sample;
   Open_File(filename);
   first_start:=false;
   p_seg:=f_seg;
   Display_Status('Measurement started');
   Set_Curr(-1);
   casi:=0; TIMEINIT;
   {casi:=Time;}
  end else begin
   TIMEINIT;
   {casp2:=Time;
    casi:=casi+casp2-casp1;}
   Display_Status(retez);
  end;
 end else begin
  cas:=TIMEREAD;
  casi:=casi+cas;
  {casp1:=Time;}
  StartBut.Hint:='Continue';
  Stopbut.Enabled:=false; StopBut.ShowHint:=false;
  retez:=StatDisp.Text;
  Display_Status('Measurement paused');
 end;
end;
{--------------------------------------------------}
procedure TMeasForm.StopButClick(Sender: TObject);
begin
 if MessageDlg('Stop measurement?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
   StartBut.Enabled:=false;
   Stopbut.Enabled:=false; first_start:=true;
   End_Program; end_prog:=true;
  end;
end;
{--------------------------------------------------}
procedure TMeasForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if not end_prog then begin
  Action := caNone;
  StopButClick(Sender);
 end else begin
  if MessageDlg('Leave current session?',mtConfirmation,
    [mbYes, mbNo],0) = mrYes then begin
   StartBut.Enabled:=true;
   StartBut.Down:=false;
   StartBut.Hint:='Start Measurement';
   StopBut.Enabled:=false;
   Timer1.Enabled:=false;
   TSegDisp.Text:=''; BSegDisp.Text:='';
   SegEdit.Text:=''; Display_Status('Idle');
   Display_Temp(-1); B_Disp.Text:=('');
   SeebDisp.Text:=(''); CondDisp.Text:=('');
   FieldDisp.Text:=''; Display_Setp(-1);
   TimeDisp.Text:='00:00:00';
   Action := caHide;
  end else Action := caNone;
 end;
end;
{--------------------------------------------------}
end.
