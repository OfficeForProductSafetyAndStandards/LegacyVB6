unit EuroPar;
(* MODBUS kody pro komunikaci s Eurothermy serie 2200, 2400 *)
(* Algoritmus sestaveni Read a Write stringu                *)
interface
uses
  SysUtils;
const
  ETP_Process_Variable=1;
  ETP_Working_Setpoint=5;
  ETP_Output_Power=3;
  ETP_Error=39;
  ETP_Proportional_band=6;
  ETP_Integral_Time=8;
  ETP_Derivative_Time=9;
  ETP_High_Cutback=18;
  ETP_Low_Cutback=17;
  ETP_High_Power_Limit=30;
  ETP_Low_Power_Limit=31;
  ETP_Setpoint_Maximum=12;
  ETP_Setpoint_Minimum=11;
  ETP_Setpoint_1_High_Limit=111;
  ETP_Setpoint_1_Low_Limit=112;
  ETP_Setpoint_Rate_Limit=35;
  ETP_Target_Setpoint=2;
  ETP_Sensor_Break_Power=34;
  ETP_Software_Version=107;
  ETP_Instrument_Identity=122;   ETP_ID=ETP_Instrument_Identity;
  ETP_MinSP=ETP_Setpoint_1_Low_Limit;
  ETP_MaxSP=ETP_Setpoint_1_High_Limit;
  ETP_Autotune=270;

(* Instrument_Identity *)
  nETP_ID=2;
  aETP_ID:array[0..nETP_ID] of integer=(0,8800,9280);
  sETP_ID:array[0..nETP_ID] of string=('Unknown','2216e','2404');
  kETP_ID:integer=0;

const
  ndacx=100;
var
  spl,sph:byte;   {sp:SmallInt absolute spl;}
  crch,crcl:byte; crc:word    absolute crch;

  Teplota,Vykon,WorkSP,TargetSP:double;
  RampRate:integer;
  MinSP,MaxSP:double;

Function SestavEuroComString
  (t:integer; parw:word; cislo:integer; var qp:string):string;
Function EuroString_Read(parw:word; var qp:string):string;
Function EuroString_Write(parw:word; cislo:integer; var qp:string):string;

implementation
{uses Main,Connect,UnitPom;}

Procedure WordToBytes(si:word; var b0,b1:byte);
begin
  b1:=Hi(si); b0:=Lo(si);
//  b1:=si div 256; b0:=si-b1*256;
end;

(* ***** Sestav Euro String ********************************************** *)

(*         read      write                      *)
(* t:      3         6                          *)
(* par:    cislo parametru                      *)
(* cislo:  ---       zapsana hodnota parametru  *)
(* qp:     Textova podoba sestaveneho stringu pro vypis na obrazovku *)
Function SestavEuroComString
  (t:integer; parw:word; cislo:integer; var qp:string):string;
var
  i,j,n,n1crc,n2crc:integer; dacstr:string; parb0,parb1,bCarry:byte;
  dacbstr:array [1..ndacx] of byte;
begin
  {sp:=cislo;}
  sph:=Hi(cislo); spl:=Lo(cislo);
  for i:=1 to ndacx do dacbstr[i]:=0;  n:=0;

  inc(n); dacbstr[n]:=1; n1crc:=n;       (* adresa eurothermu *)
  inc(n); dacbstr[n]:=t;                 (* read/write *)
  WordToBytes(parw,parb0,parb1);
  inc(n); dacbstr[n]:=parb1;             (* cislo parametru - high byte *)
  inc(n); dacbstr[n]:=parb0;             (* cislo parametru - low byte *)

  if t=3 then begin                      (* Read *)
    inc(n); dacbstr[n]:=0;
    inc(n); dacbstr[n]:=1;
  end;
  if t=6 then begin                      (* Write *)
    inc(n); dacbstr[n]:=sph;
    inc(n); dacbstr[n]:=spl;
  end;

  crc:=65535;                             (* CRC *)
  n2crc:=n;
  for i:=n1crc to n2crc do begin
   crch:=crch XOR dacbstr[i];
    for j:=1 to 8 do begin
    bCarry:=crc mod 2; crc:=crc shr 1;
    if bCarry=1 then crc:=crc XOR 40961;
   end;
  end;
  inc(n); dacbstr[n]:=crch;            (* CRC - high *)
  inc(n); dacbstr[n]:=crcl;            (* CRC - low  *)

  dacstr:=''; for i:=1 to n do dacstr:=dacstr+chr(dacbstr[i]);
  qp:='';     for i:=1 to n do qp:=qp+IntToStr(dacbstr[i])+' ';
  SestavEuroComString:=dacstr;
end;

Function EuroString_Read(parw:word; var qp:string):string;
begin
  EuroString_Read:=SestavEuroComString(3,parw,0,qp);
end;

Function EuroString_Write(parw:word; cislo:integer; var qp:string):string;
begin
  EuroString_Write:=SestavEuroComString(6,parw,cislo,qp);
end;

end.
