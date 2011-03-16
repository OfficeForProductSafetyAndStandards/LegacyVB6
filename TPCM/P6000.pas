Unit P6000;

interface
USES  ieeedel, num2str;
const
      np6000            = 15;

procedure temp(temperature,vitesse:real);
procedure champ(champmag,vitesse:real);
procedure sas(index:integer);
procedure mesure6000(var temperature,champmag:real);
procedure waittemp(temperature,precis:real);
procedure waitchamp(champmag:real;index:integer);
procedure bridge6000(voie,pause:integer; var courant,resistance:real);

implementation

CONST
      MAXLEN           = 80;

procedure bridge6000(voie,pause:integer; var courant,resistance:real);
var status:integer;
    len:word;
    rept,rep,data:string;
begin
if courant>0 then begin
send(np6000,'BRIDGE '+int2str(voie)+' '+real2str(courant,-1,3)+' 1000.0 0 2 ',status);
delay(1000*pause);
end;
if voie=1 then data:='48';
if voie=2 then data:='192';
if voie=3 then data:='768';
send(np6000,'GETDAT? '+data+' ',status);
ENTER(rep,maxlen,len,np6000,status);
rep:=copy(rep,pos(',',rep)+1,len-pos(',',rep)-1);
rep:=copy(rep,pos(',',rep)+1,len-pos(',',rep)-1);
rept:=copy(rep,1,pos(',',rep)-1);
resistance:=Str2Real(rept);
rep:=copy(rep,pos(',',rep)+1,len-pos(',',rep)-2);
courant:=Str2Real(rep);
end;

procedure waittemp(temperature,precis:real);
var temperatureval,champmag:real;
begin
repeat begin
mesure6000(temperatureval,champmag);
delay(1000);
end
until abs((temperatureval-temperature))<precis;
end;

procedure waitchamp(champmag:real;index:integer);
var temperatureval,champmagval:real;
begin
if index=0 then begin
repeat mesure6000(temperatureval,champmagval) until
abs((champmagval-champmag))<50;
delay(1000);
end else begin
repeat mesure6000(temperatureval,champmagval) until
(champmagval-champmag)*index>0;
end;
end;

procedure temp(temperature,vitesse:real);
var status:integer;
    pomstr,retez:string;

begin
str(TEMPERATURE:4:2,pomstr);
retez:='TEMP '+pomstr+' ';
str(vitesse:4:2,pomstr);
retez:=retez+pomstr+' ';
send(np6000,retez,status);
{delay(1000);}
end;

procedure champ(champmag,vitesse:real);
var status:integer;
    pomstr,retez:string;
begin
str(champmag:4:0,pomstr);
retez:='FIELD '+pomstr+' ';
str(vitesse:4:0,pomstr);
retez:=retez+pomstr+' ';
send(np6000,retez,status);
{delay(1000);}
end;

procedure sas(index:integer);
var status:integer;
begin
if index=0 then send(np6000,'CHAMBER 1 ',status);
if index=1 then send(np6000,'CHAMBER 4 ',status);
end;

procedure mesure6000(var temperature,champmag:real);
var status:integer;
    rept,rep:string;
    len:word;
begin
send(np6000,'GETDAT? 6 ',status);
ENTER(rep,maxlen,len,np6000,status);
rep:=copy(rep,pos(',',rep)+1,len-pos(',',rep)-1);
rep:=copy(rep,pos(',',rep)+1,len-pos(',',rep)-1);
rept:=copy(rep,1,pos(',',rep)-1);
temperature:=Str2Real(rept);
rep:=copy(rep,pos(',',rep)+1,len-pos(',',rep)-2);
champmag:=Str2Real(rep);
end;

END.
