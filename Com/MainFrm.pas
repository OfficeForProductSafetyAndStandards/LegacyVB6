{
  TCommPortDriver demo
  v1.00 15/FEB/1997 First implementation
  v1.01 19/APR/1997 Some bug fixes (in the demo)
}

unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,

  CommDrv, ExtCtrls, StdCtrls, ComCtrls;

type
  TMainForm = class(TForm)
    CommPortDriver: TCommPortDriver;
    Panel1: TPanel;
    StatusBar: TStatusBar;
    TxMemo: TMemo;
    ConnectBtn: TButton;
    DisconnectBtn: TButton;
    QuitBtn: TButton;
    ComPortRG: TRadioGroup;
    BaudRateRG: TRadioGroup;
    DataBitsRG: TRadioGroup;
    ParityRG: TRadioGroup;
    HandshakingRG: TRadioGroup;
    RxMemo: TMemo;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure QuitBtnClick(Sender: TObject);
    procedure TxMemoKeyPress(Sender: TObject; var Key: Char);
    procedure CommPortDriverReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Integer);
    procedure ConnectBtnClick(Sender: TObject);
    procedure DisconnectBtnClick(Sender: TObject);
    procedure BaudRateRGClick(Sender: TObject);
    procedure DataBitsRGClick(Sender: TObject);
    procedure ParityRGClick(Sender: TObject);
    procedure HandshakingRGClick(Sender: TObject);
    procedure ComPortRGClick(Sender: TObject);
  private
    procedure ApplyCommSettings;
  public
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.QuitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.TxMemoKeyPress(Sender: TObject; var Key: Char);
var s: string;
begin
  if CommPortDriver.Connected then
    // Commit data only when RETURN key is pressed
    case Key of
      #13: if TxMemo.Lines.Count>0 then
           begin
             s := TxMemo.Lines[TxMemo.Lines.Count-1];
             CommPortDriver.SendData( pchar(s), length(s) );
             CommPortDriver.SendData( @Key, 1 );
           end
           else CommPortDriver.SendData( @Key, 1 );

    end;
end;

procedure TMainForm.CommPortDriverReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Integer);
var p: pchar;
    s: string;
begin
  if RxMemo.Lines.Count <> 0 then
    s := RxMemo.Lines[RxMemo.Lines.Count-1]
  else
    s := '';

  p := DataPtr;
  while DataSize > 0 do
  begin
    case p^ of
      #10:; // LF
      #13:
        begin
          if RxMemo.Lines.Count <> 0 then
            RxMemo.Lines[RxMemo.Lines.Count-1] := s
          else
            RxMemo.Lines.Add( s );
          RxMemo.Lines.Add( '' );
          s := '';
        end;
      #8: // Backspace
        delete( s, length(s), 1 );
      else // Any other char
        s := s + p^;
    end;
    dec( DataSize );
    inc( p );
  end;
  if (s<>'') then
    if RxMemo.Lines.Count <> 0 then
      RxMemo.Lines[RxMemo.Lines.Count-1] := s
    else
      RxMemo.Lines.Add( s );
end;

procedure TMainForm.ConnectBtnClick(Sender: TObject);
begin
  // Apply settings
  ApplyCommSettings;
  // Connect
  if CommPortDriver.Connect then
  begin
    ConnectBtn.Enabled := false;
    DisconnectBtn.Enabled := true;
    TxMemo.SetFocus;
    StatusBar.SimpleText := 'Connected';
  end
  else // Error !
    StatusBar.SimpleText := 'Error: could not connect. Check COM port settings and try again.';
end;

procedure TMainForm.DisconnectBtnClick(Sender: TObject);
begin
  StatusBar.SimpleText := 'Disconnected';
  CommPortDriver.Disconnect;
  DisconnectBtn.Enabled := false;
  ConnectBtn.Enabled := true;
end;

procedure TMainForm.BaudRateRGClick(Sender: TObject);
begin
  CommPortDriver.ComPortSpeed := TComPortBaudRate(BaudRateRG.ItemIndex);
end;

procedure TMainForm.DataBitsRGClick(Sender: TObject);
begin
  CommPortDriver.ComPortDataBits := TComPortDataBits(DataBitsRG.ItemIndex);
end;

procedure TMainForm.ParityRGClick(Sender: TObject);
begin
  CommPortDriver.ComPortParity := TComPortParity(ParityRG.ItemIndex);
end;

procedure TMainForm.HandshakingRGClick(Sender: TObject);
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

procedure TMainForm.ComPortRGClick(Sender: TObject);
begin
  // Apply com settings
  //ApplyCommSettings;
end;

procedure TMainForm.ApplyCommSettings;
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

end.
