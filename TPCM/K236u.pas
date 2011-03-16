unit K236U;

{ IL FAUT TOUJOURS COMMENCER UN PROGRAMME PAR LA PROCEDURE K236INIT }

INTERFACE

uses IEEEDEL,NUM2STR;

var  K236Etat,nb,nbg      : integer;
     K236Length,l         : word;
     resultat0,resultat1  :string;

const  x=30;

procedure K236SEND(commande:string);
function  K236RECEIVE(commande:string):string;
procedure K236STANDBY;
procedure K236OPERATE;
procedure K236COMPLIANCE(valeur:real);
procedure K236MODE(source,measure:integer);
procedure K236COURANTENSIONAPPL(valeur:real);
procedure K236TRIGGER;
procedure K236init;

IMPLEMENTATION
const  K236=16;


Procedure K236SEND(commande:string);
begin
     SEND(K236,commande,K236Etat);
     delay(100);
end;{K236SEND}


Function  K236RECEIVE(commande:string):string;
var res: string;
begin
     SEND(K236,commande,K236Etat);
     delay(500);
     ENTER(res,80,K236Length,K236,K236Etat);
     K236RECEIVE:=res;
     delay(100);
end;{K236RECEIVE}


Procedure K236STANDBY;
begin
     K236SEND('N0 X');
end;{K236STANDBY}


Procedure K236OPERATE;
begin
    K236SEND('N1 X');
end;{K236OPERATE}


Procedure K236COMPLIANCE(valeur:real);
begin
     K236SEND('L'+real2str(valeur,-1,5)+',0X');
end;{K236COMPLIANCE}


Procedure K236MODE(source,measure:integer);
begin
     K236SEND('F'+Int2Str(source)+','+Int2Str(measure)+'X');
end;{K236MODE}

Procedure K236COURANTENSIONAPPL(valeur:real);
var retez:string;
begin
     str(valeur:14:12,retez);
     retez:='B'+retez+',0,0X';
     K236SEND(retez);
     K236OPERATE;
     {delay(1000);}
end;{K236COURANTENSIONAPPLI}


Procedure K236TRIGGER;
begin
     K236SEND('T0,0,0,0 X');
end;{K236TRIGGER}

Procedure K236init;
var i:integer;
begin
    for i:=1 to 2 do
    begin
        K236STANDBY;
        K236COMPLIANCE(30.0);
        K236MODE(1,0);
        K236TRIGGER;
    end;
end;

end.






