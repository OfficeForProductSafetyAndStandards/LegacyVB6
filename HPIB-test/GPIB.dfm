object Communicate: TCommunicate
  Left = 193
  Top = 145
  Width = 664
  Height = 314
  Caption = 'Communicate'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GPIB_Init: TButton
    Left = 24
    Top = 16
    Width = 105
    Height = 25
    Caption = 'GPIB init'
    TabOrder = 0
    OnClick = GPIB_InitClick
  end
  object Panel1: TPanel
    Left = 24
    Top = 56
    Width = 297
    Height = 193
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 72
      Height = 13
      Caption = 'Agilent 34970A'
    end
    object Label5: TLabel
      Left = 16
      Top = 88
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
    object AGSent: TEdit
      Left = 72
      Top = 40
      Width = 177
      Height = 21
      TabOrder = 0
    end
    object AGRec: TEdit
      Left = 72
      Top = 88
      Width = 177
      Height = 21
      TabOrder = 1
    end
    object AGSentBut: TButton
      Left = 8
      Top = 40
      Width = 57
      Height = 20
      Caption = 'Sent'
      TabOrder = 2
      OnClick = AGSentButClick
    end
    object CheckBox1: TCheckBox
      Left = 264
      Top = 40
      Width = 17
      Height = 17
      Caption = 'AGChBx'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 336
    Top = 56
    Width = 297
    Height = 193
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 67
      Height = 13
      Caption = 'Keithley  6220'
    end
    object Label3: TLabel
      Left = 16
      Top = 88
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
    object KTSent: TEdit
      Left = 72
      Top = 40
      Width = 177
      Height = 21
      TabOrder = 0
    end
    object KTRec: TEdit
      Left = 72
      Top = 88
      Width = 177
      Height = 21
      TabOrder = 1
    end
    object KTSentBut: TButton
      Left = 8
      Top = 40
      Width = 57
      Height = 20
      Caption = 'Sent'
      TabOrder = 2
      OnClick = KTSentButClick
    end
    object CheckBox2: TCheckBox
      Left = 264
      Top = 40
      Width = 17
      Height = 17
      Caption = 'KTChBx'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
end
