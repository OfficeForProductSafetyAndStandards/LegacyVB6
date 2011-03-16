program PPMS;

{$M 16384,0,400000}

uses crt,dos,krozs,ieeepas,K182u,K236u,P6000,HP3457,Temper;

const cesta='c:\windows\command.com';

type Point_Seg=^prog;
     prog=record
           T_init,T_term,T_step,
           MField_I,MField_F,MField_S:double;
           hyst:boolean;
           Next_Seg:Point_Seg;
          end;
     poly=array[1..6] of real;

var p_seg,f_seg,l_seg:Point_Seg;
    ch1,ch2:char;
    T_Setp,Current,Field,pomr,dT0_U,dT0_L,dT1_U,dT1_L,sD_U,sD_L,dT0,
    dV0,dV1,dT,Pow,Res,Sbk0,Sbk1,Scor,Tcd0,Tcd1,
    Sur,Lng,Iinit,ro,a,b,c,Field_I,Field_F,Field_S:real;
    filename,comment,retez:string;
    Test_Setprg,hy:boolean;
    i,j,n_step,h_step:integer;
    hi,mi,si,di:word;
    rp,tp,sp,cp:poly;
    df1,df2:text;
{--------------------------------------------------------------}
procedure mainscreen;

 begin
  textbackground(black);
  clrscr;
  cursoron(false);
  textcolor(magenta); napis(37,2,'P P M S');
  okno(3,black,1,3,80,23);
  textbox(black,magenta,2,1,79,21,'');
  textbox(black,magenta,4,3,18,6,'Setpoint[K]');
  textbox(black,magenta,20,3,34,6,' Field [T] ');
  textbox(black,magenta,36,3,50,6,'Current[mA]');
  textbox(black,magenta,52,1,79,21,'');
  carah(2,7,51,4);
  textbox(black,magenta,4,9,18,12,' dTu [K] ');
  textbox(black,magenta,20,9,34,12,' dTl [K] ');
  textbox(black,magenta,36,9,50,12,' dV [uV] ');
  textbox(black,magenta,4,15,18,17,' Time ');
  textbox(black,magenta,20,15,50,17,' Status ');
  carah(2,18,51,4); carah(2,13,51,4);
  okno(lightgray,black,5,22,17,22);
  napis(2,1,'Set program');
  textcolor(red); napis(2,1,'S');
  okno(lightgray,black,21,22,33,22);
  napis(2,1,'Run program');
  textcolor(red); napis(2,1,'R');
  okno(lightgray,black,37,22,49,22);
  napis(2,1,'   Exit');
  textcolor(red); napis(2,1,'   E');
 end;
{--------------------------------------------------------------}
procedure Display_Field(t:double);
 var retez:string;

 begin
  okno(3,black,22,7,32,7);
  str(t:3:1,retez);
  if t<0 then retez:='';
  napis(5,1,retez);
 end;
{--------------------------------------------------------------}
procedure Display_Curr(t:double);
 var retez:string;

 begin
  okno(3,black,38,7,48,7);
  str(t:5:3,retez);
  napis(4,1,retez);
 end;
{--------------------------------------------------------------}
procedure Display_Setp(t:double);
 var retez:string;

 begin
  okno(3,black,6,7,16,7);
  str(t:5:1,retez);
  if t<0 then retez:='';
  napis(4,1,retez);
 end;
{--------------------------------------------------------------}
procedure Display_dT1(t:double);
 var retez:string;

 begin
  okno(3,black,6,13,16,13);
  if abs(t)<1e4 then str(t:6:3,retez) else retez:='';
  napis(3,1,retez);
 end;
{--------------------------------------------------------------}
procedure Display_dT2(t:double);
 var retez:string;

 begin
  okno(3,black,22,13,32,13);
  if abs(t)<1e4 then str(t:6:3,retez) else retez:='';
  napis(3,1,retez);
 end;
{--------------------------------------------------------------}
procedure Display_dV(t:double);
 var retez:string;

 begin
  okno(3,black,38,13,48,13);
  if abs(t)<1e4 then str(t:6:3,retez) else retez:='';
  napis(3,1,retez);
 end;
{--------------------------------------------------------------}
procedure Display_Time;
 var retez:string;

 begin
  okno(3,black,5,18,17,18);
  retez:=Elapsed(hi,mi,si,di);
  napis(2,1,retez);
 end;
{--------------------------------------------------------------}
procedure Display_Status(retez:string);

 begin
  okno(3,black,21,18,49,18);
  napis(1,1,retez);
 end;
{--------------------------------------------------------------}
procedure Open_File(filename:string);

 begin
  assign(df1,filename+'.raw');
  assign(df2,filename+'.dat');
  rewrite(df1);
  writeln(df1,comment);
  writeln(df1,'T[K],B[T],dV[uV],dTU[uV],dTUerr,dTL[uV],dTLerr,Curr[mA],Time');
  close(df1);
  rewrite(df2);
  writeln(df2,comment);
  writeln(df2,'T[K],B[T],S[uV/K],Scorr[uV/K],TCond[mW/K],TCond[W/m/K]');
  close(df2);
 end;
{--------------------------------------------------------------}
procedure Copy_Floppy;
var retez:string;
    i:integer;
 begin
  retez:=filename+'.dat';
  retez:='/c copy '+retez+' a:';
  Display_Status('');
  swapvectors;
  Exec(cesta,retez);
  swapvectors;
  retez:=filename+'.raw';
  retez:='/c copy '+retez+' a:';
  Display_Status('');
  swapvectors;
  Exec(cesta,retez);
  swapvectors;
  {mainscreen;}
 end;
{--------------------------------------------------------------}
procedure Write_Record1(T,H,dV,T1,dT1,T2,dT2,C:real);
 var retez,pomstr:string;
     i:integer;

 begin
  append(df1);
  str(T:5:1,pomstr);retez:=pomstr+'  ';
  str(H:3:1,pomstr);retez:=retez+pomstr+'  ';
  str((dV*1e6):6:3,pomstr);retez:=retez+pomstr+'  ';
  str((T1*1e6):7:3,pomstr);retez:=retez+pomstr+'  ';
  str((dT1*1e6):5:3,pomstr);retez:=retez+pomstr+'  ';
  str((T2*1e6):7:3,pomstr);retez:=retez+pomstr+'  ';
  str((dT2*1e6):5:3,pomstr);retez:=retez+pomstr+'  ';
  str((C*1e3):5:2,pomstr);retez:=retez+pomstr+'  ';
  pomstr:=Elapsed(hi,mi,si,di); retez:=retez+pomstr;
  writeln(df1,retez);
  close(df1);
 end;
{--------------------------------------------------------------}
procedure Write_Results(T,F,S0,S1,T0,T1,dT:real);
 var pomstr,retez:string;

 begin
  okno(3,black,54,4,77,21);
  str(T:5:1,pomstr); retez:='T = '+pomstr+' K  B = ';
  str(F:3:1,pomstr); retez:=retez+pomstr+' T';
  napis(2,1,retez);
  str(S0:6:3,pomstr); retez:='S(raw)= '+pomstr+' uV/K';
  napis(2,7,retez);
  str(S1:6:3,pomstr); retez:='S(cor)= '+pomstr+' uV/K';
  napis(2,3,retez);
  str(T0:6:3,pomstr); retez:='W(raw)= '+pomstr+' mW/K';
  napis(2,8,retez);
  str(T1:6:3,pomstr); retez:='w(cor)= '+pomstr+' W/(K.m)';
  napis(2,4,retez);
  str(dT:5:2,pomstr); retez:='dTu1-dTu0= '+pomstr+' K';
  napis(2,10,retez);
 end;
{--------------------------------------------------------------}
procedure Write_Record2(T,H,s1,s2,c1,c2:real);
 var retez,pomstr:string;
     i:integer;

 begin
  append(df2);
  str(T:5:1,pomstr);retez:=pomstr+'  ';
  str(H:3:1,pomstr);retez:=retez+pomstr+'  ';
  str(s1:7:3,pomstr);retez:=retez+pomstr+'  ';
  str(s2:7:3,pomstr);retez:=retez+pomstr+'  ';
  str(c1:5:3,pomstr);retez:=retez+pomstr+'  ';
  str(c2:5:3,pomstr);retez:=retez+pomstr;
  writeln(df2,retez);
  close(df2);
 end;
{--------------------------------------------------------------}
procedure Read_Program;
 var pomstr:string;

 begin
  assign(df1,'program.dat');
  reset(df1);
  new(l_seg);
  f_seg:=l_seg;
  readln(df1,comment);
  comment:=comment+'  '+datestr(false)+', '+Elapsed(0,0,0,0);
  readln(df1,filename);
  read(df1,Lng,a,b,c,ro); if not eoln(df1)then readln(df1,pomstr);
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
  close(df1);
  assign(df1,'param.dat');
  reset(df1);
  readln(df1,pomstr);
  readln(df1,tp[1],tp[2],tp[3],tp[4],tp[5],tp[6]);
  readln(df1,rp[1],rp[2],rp[3],rp[4],rp[5],rp[6]);
  readln(df1,sp[1],sp[2],sp[3],sp[4],sp[5],sp[6]);
  readln(df1,cp[1],cp[2],cp[3],cp[4],cp[5],cp[6]);
  close(df1);
 end;
{--------------------------------------------------------------}
procedure Run_Program;

 var step:double;
     test:boolean;

 begin
  Read_Program;
  Open_File(filename);

 {Prepare Instruments}
  initialize(21,0);
  HP3457_Init;
  {enter(retez,80,hi,HP3457A,j);
  dTUpp(dT0_U,sD_U);
  dTLow(dT0_L,sD_L);}

  K182Init;
  delay(400);
 {End of Block "Prepare Instruments"}

  p_seg:=f_seg;
  gettime(hi,mi,si,di);
  {--------------Main Program Loop---------------}
  repeat
   Display_Time;

   {Prepare Segment}
   T_Setp:=p_seg^.T_init;
   if p_seg^.T_Init>p_seg^.T_Term then step:=-p_seg^.T_Step
                                  else step:=p_seg^.T_Step;
   Display_Status('Setting Init T');
   Temp(T_Setp,10);
   Display_Setp(T_Setp);
   WaitTemp(T_Setp,1.0);
   Res:=rp[1]*exp(-T_Setp/rp[2])+rp[3]*exp(-T_Setp/rp[4])+rp[5];
   dT0:=0.5+0.006*T_Setp; Tcd0:=sqr(Iinit*1e-3)*Res/dT0;
   T_Setp:=T_Setp-step;

   {Set Magnetic Field}
   Field:=p_seg^.MField_I;
   Display_Status('Setting field');
   Champ(Field*10000.0,250);
   Display_Field(Field); Display_Time;
   WaitChamp(Field*10000.0,0);
   Display_Time;

   {---------Segment Loop from T_init To T_term---------}
   repeat
    T_Setp:=T_Setp+step;
    pomr:=tp[6];
    for i:=5 downto 1 do pomr:=pomr*T_Setp+tp[i];
    Res:=rp[1]*exp(-T_Setp/rp[2])+rp[3]*exp(-T_Setp/rp[4])+rp[5];

    {Set Temperature and Wait until it is stable}
    Display_Status('Setting T');
    Temp(T_Setp,1);
    Display_Setp(T_Setp);  Display_Time;
    WaitTemp(T_Setp,0.02);
    Display_Time;

    {dT Stabilization}
    Display_Status('Stabilization 1');
    okno(3,black,54,10,77,21);
    Stabilize1;
    Display_Time;

    with p_seg^ do begin
     hy:=hyst; Field:=MField_I; Field_I:=MField_I;
     Field_F:=MField_F; Field_S:=MField_S; h_step:=1;
    end;

    {Field Loop from MField_I to MField_F}
    repeat

     {Set Zero Current}
     Current:=0.0;
     K236COURANTENSIONAPPL(Current);
     Display_Curr(Current);
     delay(2000); Display_Time;

     {dT Stabilization}
     Display_Status('Stabilization 2');
     Display_dT1(1e5); Display_dT2(1e5); Display_dV(1e5);
     okno(3,black,54,10,77,22);
     Stabilize2;
     Display_Time;

     {Measure dT_Upp, dT_Low and dV}
     Display_Status('Measuring at 0 mA');
     dTUpp(dT0_U,sD_U);
     dTLow(dT0_L,sD_L);
     dV0:=K182Read;
     Write_Record1(T_Setp,Field,dV0,dT0_U,sD_U,dT0_L,sD_L,Current);
     dT0_U:=dT0_U*1e6/pomr; Display_dT1(dT0_U);
     dT0_L:=dT0_L*1e6/pomr; Display_dT2(dT0_L);
     Display_dV(dV0*1e6);
     Display_Time;

     {Set Heating Current [mA]}
     dT0:=0.5+0.006*T_Setp;
     Current:=sqrt(Tcd0*dT0/Res);
     K236COURANTENSIONAPPL(Current);
     Display_Curr(Current*1e3);
     delay(2000);
     Display_Time;

     {dT Stabilization}
     Display_Status('Stabilization 2');
     Display_dT1(1e5); Display_dT2(1e5); Display_dV(1e5);
     okno(3,black,54,10,77,22);
     Stabilize2;
     Display_Time;

     {Measure dT_Upp, dT_Low and dV}
     Display_Status('Measuring at heating');
     dTUpp(dT1_U,sD_U);
     dTLow(dT1_L,sD_L);
     dV1:=K182Read;
     Write_Record1(T_Setp,Field,dV1,dT1_U,sD_U,dT1_L,sD_L,Current);
     dT1_U:=dT1_U*1e6/pomr; Display_dT1(dT1_U);
     dT1_L:=dT1_L*1e6/pomr; Display_dT2(dT1_L);
     Display_dV(dV1*1e6);
     Display_Time;

     {Set Zero Current}
     K236COURANTENSIONAPPL(0.0);
     Display_Curr(0.0);
     delay(2000);
     Display_Time;

     {Calculate properties}
     Display_Status('Calculate properties');
     Pow:=sqr(Current)*Res;  {Power [W]}
     dT:=(dT1_U-dT1_L)-(dT0_U-dT0_L);
     Sbk0:=(dV0-dV1)*1e6/dT;;
     Tcd0:=Pow/dT;
     Scor:=sp[6];
     for i:=5 downto 1 do Scor:=Scor*T_Setp+sp[i];
     Sbk1:=Sbk0+Scor;
     Tcd1:=Tcd0*Lng/a/b*1e3;
     dT0:=dT1_U-dT0_U;
     Write_Record2(T_Setp,Field,Sbk0,Sbk1,Tcd0*1000,Tcd1);
     Write_Results(T_Setp,Field,Sbk0,Sbk1,Tcd0*1000,Tcd1,dT0);

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
      Display_Status('Setting field');
      Champ(Field*10000.0,250);
      Display_Field(Field); Display_Time;
      WaitChamp(Field*10000.0,0);
      Display_Time;
     end;

    until test;
    {------------------End of Field Loop----------------}

    Field:=p_seg^.MField_I;
    Display_Status('Setting field');
    Champ(Field*10000.0,250);
    Display_Field(Field); Display_Time;
    WaitChamp(Field*10000.0,0);
    Display_Time;
    if p_seg^.T_Init>p_seg^.T_Term then test:=(T_Setp<p_seg^.T_Term)
                                   else test:=(T_Setp>p_seg^.T_Term);
    test:=test or (abs(T_Setp-p_seg^.T_Term)<0.05);
   until test;
   {------------------End of Segment Loop----------------}
   p_seg:=p_seg^.Next_Seg;
   Display_Time;
  until p_seg=l_seg;
  {-----------End of Main Program Loop-----------}

  {Set T=300 K, Heating Current=0, Field=0}
  K236COURANTENSIONAPPL(0.0);
  Display_Curr(0.0);
  delay(2000);
  Display_Setp(300.0);
  Display_Status('Setting T');
  Temp(300,10); WaitTemp(300,1);
  Champ(0,100);
  Display_Field(0.0);

  {--------Release Program from Memory----------}
  p_seg:=f_seg;
  repeat
   f_seg:=p_seg^.Next_Seg;
   dispose(p_seg);
   p_seg:=f_seg;
  until p_seg=l_seg;

  {Terminal Window}
  okno(green,black,30,9,50,15);
  textbox(black,black,2,1,20,7,'');
  napis(5,3,'Time ');
  Showtime(10,3);
  napis(4,4,'The measurement');
  napis(4,5,' has finished.');
  getkey(ch1,ch2);
  mainscreen;
  ch1:=#0;
 end;
{--------------------------------------------------------------}
procedure Set_Program;

 begin
  Test_Setprg:=true;
 end;
{--------------------------------------------------------------}
begin
 mainscreen;
 Test_Setprg:=false;
 {filename:='xxx';
  copy_floppy;}
 repeat
  getkey(ch1,ch2);
  case ch1 of
   'r','R': begin
             {if not Test_Setprg then begin
              okno(4,black,25,9,55,14);
              textbox(black,black,2,1,30,6,'');
              napis(4,3,'Attention! No program');
              napis(4,4,'   has been input    ');
              getkey(ch1,ch2);
              mainscreen;
              ch1:=#0;
             end;}
             Run_program;
            end;
   's','S':Set_program;
  end;
 until ((ch1 in ['E','e']) or (ch1=#27));
 textbackground(black); textcolor(lightgray);
 clrscr; cursoron(true);
end.