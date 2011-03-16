Unit HP3457;

interface

uses  num2str,ieeedel;

const HP3457a=22;

var HP3457_Stat:integer;
    l:word;

function  HP3457_Read:real;
procedure HP3457_Send(Command:string);
procedure HP3457_Init;
procedure dTUpp(var dTx,sDx:real);
procedure dTLow(var dTx,sDx:real);
function  dTU:real;
function  dTL:real;

implementation
{--------------------------------------------------}
function HP3457_Read:real;
var retez:string;
    kod:integer;
    pomr:real;
begin
 Enter(retez,80,l,HP3457a,HP3457_Stat);
 val(retez,pomr,kod); {:=str2real(retez);}
 if kod=0 then HP3457_Read:=pomr else HP3457_Read:=0.0;
end;
{--------------------------------------------------}
procedure HP3457_Send;

begin
 Send(HP3457a,Command,HP3457_Stat);
 delay(100);
end;
{--------------------------------------------------}
procedure HP3457_Init;

begin
 HP3457_Send('RESET');
 HP3457_Send('DISP MSG "TPCM"');
 {HP3457_Send('NPLC 10;TRIG AUTO;TARM HOLD;F11');}
 HP3457_Send('NPLC 10;TRIG AUTO;F11');
 delay(200);
 HP3457_Send('NRDGS 10');
end;
{--------------------------------------------------}
procedure dTUpp;

 begin
  HP3457_Send('TERM 1'); delay (2000);
  HP3457_Send('MATH STAT');
  HP3457_Send('TARM SGL'); delay (6000);
  HP3457_Send('RMATH 4');
  dTx:=HP3457_Read;
  HP3457_Send('RMATH 12');
  sDx:=HP3457_Read;
 end;
{--------------------------------------------------}
procedure dTLow;

 begin
  HP3457_Send('TERM 2'); delay (2000);
  HP3457_Send('MATH STAT');
  HP3457_Send('TARM SGL'); delay (6000);
  HP3457_Send('RMATH 4');
  dTx:=HP3457_Read;
  HP3457_Send('RMATH 12');
  sDx:=HP3457_Read;
 end;
{--------------------------------------------------}
function dTU:real;

 begin
  {HP3457_Send('TARM SGL'); delay(200);}
  dTU:=HP3457_Read;
 end;
{--------------------------------------------------}
function dTL:real;

 begin
  HP3457_Send('TERM 2'); delay (500);
  {HP3457_Send('TARM SGL'); delay(200);}
  dTL:=HP3457_Read;
  HP3457_Send('TERM 1');
 end;
{--------------------------------------------------}

end.
