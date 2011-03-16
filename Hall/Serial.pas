unit Serial;

interface
uses CommDrv;

type
  CommPortDriver=TCommPortDriver;

var COM1_enabled,COM2_enabled,COM3_enabled,COM4_enabled:boolean;
    CommPort1,CommPort2:CommPortDriver;
    
function ComInit(ComNumber:TComPortNumber;BaudRate:TComPortBaudRate;Bits:TComPortDataBits;
  Parity:TComPortParity;shs:TComPortSwHandshaking;hhs:TComPortHwHandshaking):boolean;
procedure ComClose(ComNumber:TComPortNumber);
function ComSend(ComNumber:TComPortNumber;retez:string):boolean;


implementation
{--------------------------------------------------} 

function ComInit(ComNumber:TComPortNumber;BaudRate:TComPortBaudRate;Bits:TComPortDataBits;
  Parity:TComPortParity;shs:TComPortSwHandshaking;hhs:TComPortHwHandshaking):boolean;
 var test:boolean; 
 
 begin
  test:=false;
  case ComNumber of
   pnCOM1,pnCOM3:
    if not(CommPort1.Connected) then begin
     CommPort1.ComPort:=ComNumber;
     CommPort1.ComPortSpeed := BaudRate;
     CommPort1.ComPortDataBits:=Bits;
     CommPort1.ComPortParity:=Parity;
     CommPort1.ComPortHwHandshaking:=hhs;
     CommPort1.ComPortSwHandshaking:=shs;
     test:=CommPort1.Connect;
     if test then if ComNumber=pnCOM1 then COM1_enabled:=true else COM3_enabled:=true;
    end;
   pnCOM2,pnCOM4:
    if not(CommPort2.Connected) then begin
     CommPort2.ComPort:=ComNumber;
     CommPort2.ComPortSpeed := BaudRate;
     CommPort2.ComPortDataBits:=Bits;
     CommPort2.ComPortParity:=Parity;
     CommPort2.ComPortHwHandshaking:=hhs;
     CommPort2.ComPortSwHandshaking:=shs;
     test:=CommPort2.Connect;
     if test then if ComNumber=pnCOM2 then COM2_enabled:=true else COM4_enabled:=true;
    end;
  end;
  ComInit:=test
 end;
{--------------------------------------------------}

procedure ComClose(ComNumber:TComPortNumber);

 begin
  case ComNumber of
   pnCOM1,pnCOM3:
    if CommPort1.Connected then begin
     CommPort1.Disconnect;
     if ComNumber=pnCOM1 then COM1_enabled:=false else COM3_enabled:=false;
    end;
   pnCOM2,pnCOM4:
    if CommPort2.Connected then begin
     CommPort2.Disconnect;
     if ComNumber=pnCOM2 then COM2_enabled:=false else COM4_enabled:=false;
    end;
  end;
 end;
{--------------------------------------------------}

function ComSend(ComNumber:TComPortNumber;retez:string):boolean;
 
 begin
  case ComNumber of
   pnCOM1,pnCOM3:
    if ((CommPort1.Connected) and (CommPort1.ComPort=ComNumber)) then
         Result:=CommPort1.SendData(pchar(retez),length(retez));
   pnCOM2,pnCOM4:
    if ((CommPort2.Connected) and (CommPort2.ComPort=ComNumber)) then 
         Result:=CommPort2.SendData(pchar(retez),length(retez));
  end;
 end;
{--------------------------------------------------} 


end.






