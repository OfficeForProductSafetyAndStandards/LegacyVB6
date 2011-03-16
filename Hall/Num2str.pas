Unit Num2Str;

interface

uses Sysutils;

function str2int (source: string) : integer;
function str2real (source: string) : real;
function int2str (source: integer) : string;
function real2str (source: real; width,dec : integer) : string;
procedure Delay(tmili:integer);

implementation

var
  stat, i : integer;
{--------------------------------------------------}
function str2int;
var
  res : integer;
begin
  stat := 15;
  repeat
    i := 0;
    val(copy(source,1,stat),res,i);
    stat := i-1;
  until i=0;
  str2int := res;
end;
{--------------------------------------------------}
function str2real;
var
  res : real;
  point  : integer;
begin
  stat :=15;
  point:=0;
  repeat
    inc(point);
    i := 0;
    val(copy(source,1,stat),res,i);
    stat := i-1;
    {if point>22 then statusline('BUFFER ENCOMBRE');}
  until (i=0) or (point>40);
  str2real := res;
end;
{--------------------------------------------------}
function int2str;
var
  res : string;
begin
  str(source,res);
  int2str := res;
end;
{--------------------------------------------------}
function real2str;
var
  res : string;
begin
  if width=0 then str(source,res)
             else if dec<0 then str(source:width,result)
                           else str(source:width:dec,result);
  real2str := res;
end;
{--------------------------------------------------}
procedure Delay;
var tini,t:Comp;
    pomr:TDatetime;
    pomx:TTimeStamp;
begin
 pomr:=Time;
 pomx:=DateTimeToTimeStamp(pomr);
 tini:=TimeStampToMSecs(pomx);
 repeat
  pomr:=Time;
  pomx:=DateTimeToTimeStamp(pomr);
  t:=TimeStampToMSecs(pomx);
 until t>(tini+tmili);
end;
{--------------------------------------------------}
end.
