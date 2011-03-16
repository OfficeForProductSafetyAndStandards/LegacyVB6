object Form1: TForm1
  Left = 230
  Top = 127
  Width = 319
  Height = 196
  Caption = 'Serial'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 112
    Width = 51
    Height = 16
    Caption = 'Receive'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 104
    Top = 16
    Width = 97
    Height = 33
    Caption = 'Connect'
    TabOrder = 0
    OnClick = Connect
  end
  object Edit1: TEdit
    Left = 64
    Top = 64
    Width = 193
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 64
    Top = 104
    Width = 193
    Height = 21
    TabOrder = 2
  end
  object Button2: TButton
    Left = 8
    Top = 64
    Width = 49
    Height = 33
    Caption = 'Write'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = WriteData
  end
  object CommPort1: TCommPortDriver
    ComPortPollingDelay = 0
    OnReceiveData = ReceiveData
  end
end
