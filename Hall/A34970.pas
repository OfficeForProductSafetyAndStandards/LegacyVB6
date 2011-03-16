Unit A34970;

interface

uses  num2str,ieeedel;

const A34970=9;

var A34970_Stat:integer;
    l:word;

function  A34970_Read:real;
procedure A34970_Send(Command:string);
procedure A34970_Init;

implementation
{--------------------------------------------------}
function A34970_Read:real;
var retez:string;
    kod:integer;
    pomr:real;
begin
 Enter(retez,80,l,A34970,A34970_Stat);
 val(retez,pomr,kod);
 if kod=0 then A34970_Read:=pomr else A34970_Read:=0.0;
end;
{--------------------------------------------------}
procedure A34970_Send;

begin
 Send(A34970,Command,A34970_Stat);
 delay(100);
end;
{--------------------------------------------------}
procedure A34970_Init;

begin
 A34970_Send('SYST:PRES');
 delay(200);
end;
{--------------------------------------------------}


end.
