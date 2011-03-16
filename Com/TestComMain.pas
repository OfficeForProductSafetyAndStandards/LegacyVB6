unit TestComMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CommDrv;
type
  TForm1 = class(TForm)
    Button1: TButton;
    CommPort1: TCommPortDriver;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    procedure Connect(Sender: TObject);
    procedure ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure WriteData(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.DFM}

procedure TForm1.Connect(Sender: TObject);
var test:boolean;
begin
 if CommPort1.Connected then begin
  CommPort1.Disconnect;
  Button1.Caption:='Connect';
 end else begin
  CommPort1.ComPort:=pnCOM1;
  CommPort1.ComPortSpeed := br9600;
  CommPort1.ComPortDataBits:=db8BITS;
  CommPort1.ComPortParity:=ptNONE;
  CommPort1.ComPortHwHandshaking:=hhNONE;
  CommPort1.ComPortSwHandshaking:=shXONXOFF;
  test:=CommPort1.Connect;
  if test then Button1.Caption:='Disconnect';
 end;
end;

procedure TForm1.ReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Integer);
var p: pchar;
    s:string;
begin
  p := DataPtr;
  s:='';
  while DataSize > 0 do begin
    s := s + p^;
    dec( DataSize );
    inc( p );
  end;
 Edit2.Text:=s;
end;

procedure TForm1.WriteData(Sender: TObject);
var s:string;
begin
  if CommPort1.Connected then begin
   s := Edit1.Text + #13;
   CommPort1.SendData(pchar(s),length(s));
  end;
end;

end.
