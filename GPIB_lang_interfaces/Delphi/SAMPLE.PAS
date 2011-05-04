(* Copyright Quality Instrumentation Solutions, Inc. and its licensors, (c) 2007
 * All rights reserved. 
 *)

unit Sample;

interface

uses
  Windows, SysUtils, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, GPIB;

type
  TForm1 = class(TForm)
    StartButton: TButton;
    RangeButtons: TRadioGroup;
    Meter: TLabel;
    Label2: TLabel;
    DeviceName: TEdit;
    Label4: TLabel;
    ErrBox: TListBox;
    Timer1: TTimer;
    QuitButton: TButton;
    StopButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
    procedure QuitButtonClick(Sender: TObject);
    procedure RangeButtonsClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure StopButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
        procedure OpenDevice;
        procedure WriteCommand (CommandStr:string);
        procedure ReadIDString ;
        procedure ReadValue (var ReadStr:string);
        procedure PrntErrs (ErrMsg:string);
  end;

const
    MaxLen = 80;                 { Size of IBRD/IBWRT strings  }
    BOARD_NUM = 0;               { Board to which the device has been connected}
    DEV_PAD = 1;                 { Pad for device }
    DEV_SAD = 0;                 { Sad for device }
    RESET_CMD = '*RST';          { Meter's "Reset" command }
    ID_CMD = '*IDN?';            { Meter's "Identify Myself" command }
    RANGE_CMD = 'VAC';           { Meter's "Select Volts AC" command }
    MEASURE_CMD = 'VAL?';        { Meter's "Take Mesaurement and Return it" }

var
  Form1: TForm1;
  DevHandle:Integer;
  GPIBCallInProgress:Boolean;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);

begin
   GPIBCallInProgress := FALSE;
   DevHandle := 0;
end;



{************************************************************************}
{                                                                        }
{  Name:         OpenDevice                                              }
{  Returns:      Handle of opened GPIB device                            }
{  Description:  Opens the GPIB device at PAD 1 and resets it            }
{                                                                        }
{************************************************************************}

procedure TForm1.OpenDevice;
var
  DevPad:Integer;

begin
   DevPad := StrtoInt(DeviceName.Text);

   DevHandle := ibdev (BOARD_NUM,DevPad,DEV_SAD,12,1,0); { Open the device }
   if ((DevHandle < 0) and (ibsta and ERR <> 0)) then
      begin
      ErrBox.Items.add ('IBDEV Couldn''t open a handle to the device ');
      ErrBox.Items.add ('   Please verify the board number and Pad for the device ');
      ErrBox.Items.add ('');
      end
   else
       begin
       ibtmo (DevHandle,T3s);         { Set timeout to 3 seconds }
       WriteCommand (RESET_CMD);      { Reset the meter }
       end;
end;



{************************************************************************}
{                                                                        }
{  Name:         WriteCommand                                            }
{  Arguments:    DevHandle - handle of opened GPIB device                }
{                CommandStr - command string to write to device          }
{  Description:  Writes a string to a GPIB device and checks for errors  }
{                                                                        }
{************************************************************************}

procedure TForm1.WriteCommand (CommandStr:string);

var
  StrLen:integer;
  CommandP:PChar;

begin

   CommandP := StrAlloc (length (CommandStr) + 1);
   StrPCopy (CommandP, CommandStr);

 StrLen := length (CommandStr);              { Copy from string to buffer }
 ibwrt (DevHandle, CommandP, StrLen);          { Write to GPIB }
   if (ibcnt<>StrLen) or (ibsta and ERR <> 0) then  { Check for errors }
      PrntErrs ('IBWRT failed while writing ' +CommandStr);
end;





{************************************************************************}
{                                                                        }
{  Name:         ReadValue                                               }
{  Arguments:    DevHandle - handle of opened GPIB device                }
{                buffer - buffer to read data into                       }
{                bufsize - size of buffer                                }
{  Description:  Reads from a GPIB device                                }
{                                                                        }
{************************************************************************}


procedure TForm1.ReadValue (var ReadStr:string);

const
     READ_BUF_SIZE = 200;
var
  ReadBuf: array[0..READ_BUF_SIZE] of Char;

begin
   if (DevHandle = 0) then
      Meter.Caption := '---'
   else
       begin;
       ibrd (DevHandle, ReadBuf, READ_BUF_SIZE);     { Read from GPIB }
       if (ibcnt = 0) or (ibsta and ERR <> 0) then { Check for errors }
          begin;
          Meter.Caption := '---';
          PrntErrs ('IBRD failed');
          timer1.Enabled := False;
          end
       else
           ReadBuf[ibcnt] := #0;
           ReadStr := StrPas (ReadBuf);
       end;
end;



{************************************************************************}
{                                                                        }
{  Name:         ReadIDString                                            }
{  Arguments:    DevHandle - handle of opened GPIB device                }
{  Description:  This procedure asks the voltmeter for it's ID string.   }
{                It reads the string that is returned and prints it.     }
{                                                                        }
{************************************************************************}

procedure TForm1.ReadIDString;

var
   IDString:string;

begin
   WriteCommand (ID_CMD);
   ReadValue (IDString);
   ErrBox.Items.Add ('Device Identification = ' +IDString);
end;


{************************************************************************}
{                                                                        }
{  Name:         PrintErrors                                             }
{  Description:  This procedure prints an error message followed by the  }
{                values of the global staus variables - IBSTA, IBERR,    }
{                and IBCNT.  For IBSTA it prints the name of every bit   }
{                that is set.  For IBERR it prints the mnemonic for the  }
{                error code.                                             }
{                                                                        }
{************************************************************************}

procedure TForm1.PrntErrs (ErrMsg:string);

var
   ErrStr: String;
   CntStr: String;

begin
   ErrBox.Items.Add (ErrMsg);

   ErrStr := '   IBSTA=';              { Print IBSTA value }

   if ibsta and ERR  <> 0 then ErrStr := ErrStr + ' ERR';
   if ibsta and TIMO <> 0 then ErrStr := ErrStr + ' TMO';
   if ibsta and EEND <> 0 then ErrStr := ErrStr + ' END';
   if ibsta and SRQI <> 0 then ErrStr := ErrStr + ' SRQI';
   if ibsta and RQS  <> 0 then ErrStr := ErrStr + ' RQS';;
   if ibsta and CMPL <> 0 then ErrStr := ErrStr + ' CMPL';
   if ibsta and LOK  <> 0 then ErrStr := ErrStr + ' LOK';
   if ibsta and REM  <> 0 then ErrStr := ErrStr + ' REM';
   if ibsta and CIC  <> 0 then ErrStr := ErrStr + ' CIC';
   if ibsta and ATN  <> 0 then ErrStr := ErrStr + ' ATN';
   if ibsta and TACS <> 0 then ErrStr := ErrStr + ' TACS';
   if ibsta and LACS <> 0 then ErrStr := ErrStr + ' LACS';
   if ibsta and DTAS <> 0 then ErrStr := ErrStr + ' DTAS';
   if ibsta and DCAS <> 0 then ErrStr := ErrStr + ' DCAS';
   ErrBox.Items.add (ErrStr);

   ErrStr := '   IBERR=';
   if iberr = EDVR then ErrStr := ErrStr + ' EDVR <DOS Error>';
   if iberr = ECIC then ErrStr := ErrStr + ' ECIC <Not CIC>';
   if iberr = ENOL then ErrStr := ErrStr + ' ENOL <No Listener>';
   if iberr = EADR then ErrStr := ErrStr + ' EADR <Address Error>';
   if iberr = EARG then ErrStr := ErrStr + ' EARG <Invalid Arguments>';
   if iberr = ESAC then ErrStr := ErrStr + ' ESAC <Not System Controller>';
   if iberr = EABO then ErrStr := ErrStr + ' EABO <Operation aborted>';
   if iberr = ENEB then ErrStr := ErrStr + ' ENEB <No GPIB board>';
   if iberr = EOIP then ErrStr := ErrStr + ' EOIP <Async I/I in progress>';
   if iberr = ECAP then ErrStr := ErrStr + ' ECAP <No Capability>';
   if iberr = EFSO then ErrStr := ErrStr + ' EFSO <File Error>';
   if iberr = EBUS then ErrStr := ErrStr + ' EBUS <Command error>';
   if iberr = ESTB then ErrStr := ErrStr + ' ESTB <Status byte lost>';
   if iberr = ESRQ then ErrStr := ErrStr + ' ESRQ <SRQ Stuck On>';
   if iberr = ETAB then ErrStr := ErrStr + ' ETAB <Table Overflow>';
   ErrBox.Items.add (ErrStr);

   Str (ibcntl, CntStr);
   ErrStr := '   IBCNTL=' + CntStr;
   ErrBox.Items.add (ErrStr);
end;

procedure TForm1.StartButtonClick(Sender: TObject);
begin
   StartButton.visible := FALSE;
   StopButton.Visible := TRUE;
   OpenDevice;                         { Open the GPIB device }
   timer1.Enabled := True;
end;

procedure TForm1.QuitButtonClick(Sender: TObject);
begin
   timer1.Enabled := False;
   Close;
end;

procedure TForm1.RangeButtonsClick(Sender: TObject);

var
   CmdStr: string;

begin
    if DevHandle = 0 Then
       OpenDevice;

    case RangeButtons.ItemIndex of
        0:     CmdStr := 'VDC';
        1:     CmdStr := 'VAC';
        2:     CmdStr := 'ADC';
        3:     CmdStr := 'AAC';
        4:     CmdStr := 'OHMS';
        5:     CmdStr := 'FREQ';
    end;

    if GPIBCallInProgress = FALSE then
       begin;
       GPIBCallInProgress := TRUE;
       WriteCommand (CmdStr);
       GPIBCallInProgress := FALSE;
       end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
   ReadStr:string;
begin
    if GPIBCallInProgress = FALSE then
       begin;
       GPIBCallInProgress := TRUE;
       WriteCommand (MEASURE_CMD);
       ReadValue (ReadStr);
       Meter.Caption := ReadStr;
       GPIBCallInProgress := FALSE;
       end;
    end;

procedure TForm1.StopButtonClick(Sender: TObject);
begin
 timer1.Enabled := False;
 ErrBox.Clear;
 If GPIBCallInProgress = FALSE Then
    begin;
    GPIBCallInProgress := TRUE;
    ibclr(DevHandle);
    ibloc(DevHandle);
    GPIBCallInProgress := FALSE;

    StartButton.visible := TRUE;
    StopButton.Visible := FALSE;

    Meter.Caption := ''
    end;

end;

end.
