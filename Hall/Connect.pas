unit Connect;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CommDrv, ExtCtrls, StdCtrls, ComCtrls, UnitPom, Europar;
type
  TConnectDlg = class(TForm)
    Panel1: TPanel;
    ConnectBtn: TButton;
    DisconnectBtn: TButton;
    QuitBtn: TButton;
    ComPortRG: TRadioGroup;
    BaudRateRG: TRadioGroup;
    DataBitsRG: TRadioGroup;
    ParityRG: TRadioGroup;
    HandshakingRG: TRadioGroup;
    CommPortDriver: TCommPortDriver;

    Procedure ConnectStatus;
    procedure QuitBtnClick(Sender: TObject);
    procedure ConnectBtnClick(Sender: TObject);
    procedure DisconnectBtnClick(Sender: TObject);

    procedure ComPortRGClick(Sender: TObject);
    procedure BaudRateRGClick(Sender: TObject);
    procedure DataBitsRGClick(Sender: TObject);
    procedure ParityRGClick(Sender: TObject);
    procedure HandshakingRGClick(Sender: TObject);
    procedure CommPortDriverReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);

    procedure InicConnect(Sender:TObject);

  private
    procedure ApplyCommSettings;
    { Private declarations }
  public
    { Public declarations }
  end;

const
  iComNumber:array[TComPortNumber] of integer = (1,2,3,4);
  iDataBits:array[TComPortDataBits] of integer = (5,6,7,8);
  iBaudRate:array [TComPortBaudRate] of integer =
                                ( 110, 300, 600, 1200, 2400, 4800, 9600,
                                  14400, 19200, 38400, 56000, 57600, 115200 );
  sParity:array[TComPortParity] of char = ('N','O','E','M','S');
  ndacx=100;
var
  ConnectDlg: TConnectDlg;
  IniPort:integer;
  kClose:integer;

implementation
uses EComUnit;
{$R *.DFM}

procedure TConnectDlg.InicConnect(Sender:TObject);
begin
  ComPortRG.ItemIndex:=0;
  DataBitsRG.ItemIndex:=2;
  ParityRG.ItemIndex:=2;
  ConnectBtnClick(Sender);
  ConnectStatus;
end;

procedure TConnectDlg.QuitBtnClick(Sender: TObject);
begin
  Close;
end;

Procedure TConnectDlg.ConnectStatus;
var q3,qp:string; k1,k2,k4:integer;
begin
  with CommPortDriver do begin
    k1:=iComNumber[ComPort];
    k2:=iBaudRate[ComPortSpeed];
    q3:=sParity[ComPortParity];
    k4:=iDataBits[ComPortDataBits];
  end;
  qp:=Format('Connected at COMM%d, %d, %s, %d',[k1,k2,q3,k4]);
  ShowMessage(qp);
  IniPort:=k1;
end;

procedure TConnectDlg.ConnectBtnClick(Sender: TObject);
begin
  // Apply settings
  ApplyCommSettings;
  // Connect
  if CommPortDriver.Connect then
  begin
    ConnectBtn.Enabled := false;
    DisconnectBtn.Enabled := true;
    ConnectStatus;
  end
  else // Error !
  ShowMessage('Error: could not connect');
end;

procedure TConnectDlg.DisconnectBtnClick(Sender: TObject);
begin
  CommPortDriver.Disconnect;
  DisconnectBtn.Enabled := false;
  ConnectBtn.Enabled := true;
  ShowMessage('Disconnected');
end;

procedure TConnectDlg.BaudRateRGClick(Sender: TObject);
begin
  CommPortDriver.ComPortSpeed := TComPortBaudRate(BaudRateRG.ItemIndex);
end;

procedure TConnectDlg.DataBitsRGClick(Sender: TObject);
begin
  CommPortDriver.ComPortDataBits := TComPortDataBits(DataBitsRG.ItemIndex);
end;

procedure TConnectDlg.ParityRGClick(Sender: TObject);
begin
  CommPortDriver.ComPortParity := TComPortParity(ParityRG.ItemIndex);
end;

procedure TConnectDlg.HandshakingRGClick(Sender: TObject);
begin
  case HandshakingRG.ItemIndex of
    0: // none
      begin
        CommPortDriver.ComPortHwHandshaking := hhNone;
        CommPortDriver.ComPortSwHandshaking := shNone;
      end;
    1: // RTS/CTS
      begin
        CommPortDriver.ComPortHwHandshaking := hhRTSCTS;
        CommPortDriver.ComPortSwHandshaking := shNone;
      end;
    2: // XON/XOFF
      begin
        CommPortDriver.ComPortHwHandshaking := hhNone;
        CommPortDriver.ComPortSwHandshaking := shXONXOFF;
      end;
    3: // RTS/CTS + XON/XOFF
      begin
        CommPortDriver.ComPortHwHandshaking := hhRTSCTS;
        CommPortDriver.ComPortSwHandshaking := shXONXOFF;
      end;
  end;
end;

procedure TConnectDlg.ComPortRGClick(Sender: TObject);
begin
  // Apply com settings
  //ApplyCommSettings;
end;

procedure TConnectDlg.ApplyCommSettings;
var wasConnected: boolean;
begin
  wasConnected := CommPortDriver.Connected;
  // This change needs CommPortDriver not connected
  if wasConnected then
    DisconnectBtnClick( nil );

  CommPortDriver.ComPort := TComPortNumber(ord(ComPortRG.ItemIndex));
  BaudRateRGClick( nil );
  DataBitsRGClick( nil );
  ParityRGClick( nil );
  HandshakingRGClick( nil );

  // Reconnect
  if wasConnected then
    ConnectBtnClick( nil );
end;

procedure TConnectDlg.CommPortDriverReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var
  p: pchar; s,pomstr: string;                                       (* Orig *)
  idac,ndac,cislo:integer; ch:char;
  dacbstr:array [1..ndacx] of byte;
  pomr:double;
begin
//  qp:='';
  ndac:=0;
  for idac:=1 to ndacx do dacbstr[idac]:=0;
  s:=''; p := DataPtr;                                       (* Orig *)
  while DataSize > 0 do begin                                (* Orig *)
    s := s + p^; dec( DataSize ); inc( p );                  (* Orig *)
    inc(ndac);
    ch:=s[ndac]; dacbstr[ndac]:=ord(ch);
//    qp:=qp+IntToStr(dacbstr[ndac])+' ';
  end;                                                       (* Orig *)
  sph:=dacbstr[4]; spl:=dacbstr[5]; cislo:=spl+256*sph;
  {EuroComCti(Sender,cislo,s);
  EComDlg.LbReceived(s);}
  EComDlg.PosliQueue;
  pomr:=cislo/10; str(pomr:5:1,pomstr);
  EComDlg.Edit1.Text:=pomstr;
  if kClose>0 then Close;
end;

end.
