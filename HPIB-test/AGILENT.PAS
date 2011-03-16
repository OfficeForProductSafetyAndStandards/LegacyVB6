Unit Agilent;
(* Pristroje: Voltmeter Agilent - HPIB 709 *)
Interface
uses
  crt,dos,KRozsT,KFunkce,
  Termajz,SebDesk,SebVar,MeasIEEE,IEEEPas;
const
  nagil=4;                           (* VT1 VT2 VT3 VT4 *)
  ChanTAgil:array[1..nagil] of integer=(101,102,103,104);
  ChanVAgil:array[1..nagil] of integer=(111,112,113,114);
const
  adrvm=709;
  ChanDelt=113;                     (* napeti pro odpor *)
var
  TimeMeasMultimeter:double;

Procedure InitVoltmeter;
Procedure DoneVoltmeter;
Procedure MeasMultTep(var Temp,Time:double; kanal:integer; var eror:integer);
Procedure MeasMultMicroVolt(var uv,Time:double; kanal:integer; var eror:integer);
Procedure MeasVoltAuto(var Volt,Time:double; kanal:integer; var eror:integer);

Implementation

Procedure NastavKanal(kanal:integer);
var qk,q0,q1,q2:string;
begin
  str(kanal,qk); qk:=' (@'+qk+')';
  q0:='ROUT:SCAN'+qk;
  q1:='ROUT:MON'+qk;
  q2:='ROUT:MON:STAT ON';
{$IFNDEF DOMA}
  output(adrvm,q0);
  output(adrvm,q1);
  output(adrvm,q2);
{$ENDIF}
  TDelay(200);
end;

Procedure MeasMultimeter(qmer:string; var Volt,Time:double;
                         kanal:integer; var eror:integer);
const nc=nMeasMult;
var v,u:double; i,j,nv:integer; q1:string;
begin
  eror:=1; Volt:=ErrVolt;

  NastavKanal(kanal);
{$IFNDEF DOMA}
  TimeMeasMultimeter:=DElapsedExt(kdtMer);
  v:=0; nv:=0; str(nc,q1);
  output(adrvm,'TRIG:COUN '+q1);
  output(adrvm,'READ?'); i:=Enters(adrvm,q1);
  output(adrvm,'CALC:AVER:AVER?');
  if Enterd(adrvm,u)=0 then begin nv:=nc; v:=u end;
  TimeMeasMultimeter:=DElapsedExt(kdtMer)-TimeMeasMultimeter;

{$ELSE}
  nv:=nc; v:=random(500)/100;
{$ENDIF}
  Time:=DElapsedExt(kdtMer);

  if (nv<>0) and (abs(v)<1e10) then begin Volt:=v; eror:=0 end;
end;

Procedure MeasVoltAuto(var Volt,Time:double; kanal:integer; var eror:integer);
begin
  MeasMultimeter('',volt,Time,kanal,eror);
end;

Procedure MeasMultTep(var Temp,Time:double; kanal:integer; var eror:integer);
begin
  MeasMultimeter('',Temp,Time,kanal,eror);
end;

Procedure MeasMultMicroVolt(var uv,Time:double; kanal:integer; var eror:integer);
begin
  MeasMultimeter('',uv,Time,kanal,eror);
{$IFNDEF DOMA}
  uv:=uv*1e6;
{$ENDIF}
end;

(* ********** ********** INIT & RESET ********** ********** *)

Procedure InitVoltmeter;
const nconfa=5;
var
  chanlistT,chanlistV,q1,q2,q3:string; i,status:integer;
  qo:array[1..nconfa] of string;
begin
  write('- Voltmeter 709: ');
  for i:=1 to nconfa do qo[i]:='';
  for i:=1 to nagil do begin
   str(chanTAgil[i],q1);
   if i=1 then chanlistT:=' (@'+q1 else chanlistT:=chanlistT+','+q1;
  end;
  chanlistT:=chanlistT+')';
  for i:=1 to nagil do begin
   str(chanVAgil[i],q1);
   if i=1 then chanlistV:=' (@'+q1 else chanlistV:=chanlistV+','+q1;
  end;
  chanlistV:=chanlistV+')';

  qo[1]:='CONF:TEMP TC,'+chTermajz[iTermajz]+',1,MAX,'+chanlistT;
  qo[2]:='SENS:TEMP:NPLC 2,'+chanlistT;
  qo[3]:='UNIT:TEMP K,'+chanlistT;

  qo[4]:='CONF:VOLT:DC AUTO,MAX,'+chanlistV;
  qo[5]:='SENS:VOLT:NPLC 2,'+chanlistV;
{  qo[6]:='INP:IMP:AUTO ON,'+chanlistV;   ???}
{$IFNDEF DOMA}
  output(adrvm,'*RST');
  for i:=1 to nconfa do output(adrvm,qo[i]);
  output(adrvm,'*IDN?'); status:=enters(adrvm,q1); writeln(q1);
{$ENDIF}
end;

Procedure DoneVoltmeter;
begin
{$IFNDEF DOMA}
{  output(adrvm,'*RST'); }
{$ENDIF}
end;

begin
 TimeMeasMultimeter:=0;
 ieeecrlf:=#13;
end.
