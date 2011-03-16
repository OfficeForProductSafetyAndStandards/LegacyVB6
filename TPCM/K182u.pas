unit K182U;

INTERFACE

uses ieeedel,NUM2STR;

var  K182Etat        : integer;
     K182Length      : word;

procedure K182SEND(commande:string);
function  K182RECEIVE(commande:string):string;
procedure K182FilterfastOn;
procedure K182Execute;
procedure K182Filtermedium;
procedure K182AnalogFilterOff;
procedure K182PERIOD100MS;
procedure K182PERIOD20MS;
procedure K182Range(n : integer);
procedure K182trig(n : integer);
procedure K182NoPrefix;
procedure K182Source;
procedure K182Buffer;
procedure K182Volts;
function  K182Read :real;
procedure K182ZeroOffset;
procedure K182EOI;
procedure K182Init;
procedure K182ReadBuff;
procedure K182BufferLength(n:integer);
procedure K182TriggerInt(n:integer);
{function  K182BufferAverage : Real;}
function  K182BufferStatus : string;
{function  K182BufferStdDev : real;}


IMPLEMENTATION
const  K182=07;


procedure K182SEND(commande:string);
begin
     SEND(K182,commande,K182Etat);
     delay(100);
end;{K182SEND}



function  K182RECEIVE(commande:string):string;
var res: string;
begin
{     SEND(K182,commande,K182Etat);
     delay(1000);}
     ENTER(res,100,K182Length,K182,K182Etat);
     K182RECEIVE:=res;
     delay(100);
end;{K182RECEIVE}



procedure K182FilterfastOn;
begin
    K182SEND('P1 X');
end; { K182FilterOn }


procedure K182Execute;
begin
    K182SEND('X');
end; { K182Execute}

procedure K182Filtermedium;
begin
    K182SEND('O1 X');
end; { K182Filtermedium }


procedure K182AnalogFilterOff;
begin
    K182SEND('O0 X');
end; { K182AnalogFilterOff }

procedure K182PERIOD100MS;
begin
    K182SEND('S2 X');
end; { K182PERIOD100MS}


procedure K182PERIOD20MS;
begin
    K182SEND('S0 X');
end; { K182Period20ms }


procedure K182Range(n : integer);
begin
    K182SEND('R'+Int2Str(n)+' X');
end; { K182Range }


procedure K182trig(n : integer);
begin
    K182SEND('T'+Int2Str(n)+' X');
end; { K182TRIG }

procedure K182NoPrefix;
begin
    K182SEND('G0 X ');
end; { K182NoPrefix }

procedure K182Source;
begin
    K182SEND('F0 X');
end; { K182SOURCE }

procedure K182Buffer;
begin
    K182SEND('I0 X');
end; { K182Buffer }


procedure K182Volts;
begin
    K182SEND('F0 X');
end; { K182Volts }

function K182Read :real;
var buf : string;
    test: real;
begin
repeat
  buf:=K182RECEIVE('');
  delay(500);
  buf:=copy(buf,1,20);
until buf[1]<>'' ;
K182Read :=Str2Real(buf);
end; { K182Read }


procedure K182ZeroOffset;
begin
    K182SEND('Z2,0 X');
end; { K182ZeroOffset}


procedure K182EOI;
begin
    K182SEND('K0 X');
end; { K182EOI}

Procedure K182Init;
begin
     K182filterFaston;
     K182Noprefix;
     K182range(0);
     K182Filtermedium;
     K182SEND('Z0 0 X');
     K182SEND('F0X ');
end;{K182Init}

procedure K182ReadBuff;
begin
    K182SEND('F1 X');
end; { K182ReadBuff}

procedure K182BufferLength(n:integer);
begin
    { buffer lineaire de longueur n}
    K182SEND('I1,'+int2str(n)+' X');
end; { K182BufferLength }

procedure K182TriggerInt(n:integer);
begin
    K182SEND('Q'+Int2Str(n)+' X');
end; { K182TriggerInt}


{function K182BufferAverage : Real;
var buf : string;
    test: real;
begin
repeat
    buf:=K182RECEIVE('U4 X');
    buf:=copy(buf,4,20);
    if buf[1]='+' then delete(buf,1,1);
    test:=Str2Real(buf);
until  NumConv=true;
    K182BufferAverage:=test;
end;} { K182BufferAverage }



Function K182BufferStatus : string;
begin
  K182BufferStatus:=K182RECEIVE('M4 X');
end; { K182BufferStatus }


{Function K182BufferStdDev : real;
var buf:string;
    test:real;
begin
repeat
    delay(100);
    buf:=K182RECEIVE('U5 X');
    buf:=copy(buf,4,20);
    if buf[1]='+' then delete(buf,1,1);
    test:=Str2Real(buf);
until  NumConv=true;
    K182BufferStdDev:=test;
end;} { K182BufferStdDev }

END.


