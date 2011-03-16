object MeasForm: TMeasForm
  Left = 99
  Top = 163
  Width = 656
  Height = 406
  ActiveControl = GroupBox1
  Caption = 'TPCM-Measurement'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = InitInstr
  PixelsPerInch = 120
  TextHeight = 16
  object StartBut: TSpeedButton
    Left = 20
    Top = 10
    Width = 60
    Height = 40
    Hint = 'Start Measurement'
    AllowAllUp = True
    GroupIndex = 1
    Glyph.Data = {
      76020000424D7602000000000000760000002800000040000000100000000100
      0400000000000002000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333FF333333333333333333333333333333300003300333333448333333333
      333388FFF3333333333333333333333333333300003300333333844483333333
      333338883FF33333333333333333333333333300003300333333344444833333
      3333383F883FF333333333333333333333333300003300333333334444448333
      33333383F3883FF3333333333333333333333300003300333333338444444483
      33333338F333883FF33333333333333333333300003300333333333444444444
      833333383F3333883FF333333333333333333300003300333333333344444444
      44833FFF8FFFFFFF88FF33333333333333333300003300333333999999999999
      99998888888888883388333333333333333333000033003333333333CCCCCCCC
      CC3333338333333F883333333333333333333300003300333333333CCCCCCCCC
      33333338F3333F88333333333333333333333300003300333333333CCCCCCC33
      33333338333F883333333333333333333333330000330033333333CCCCCC3333
      333333833F8833333333333333333333333333000033003333333CCCCC333333
      333338FF883333333333333333333333333333000033003333333CCC33333333
      3333388833333333333333333333333333333300003300333333CC3333333333
      3333883333333333333333333333333333333300003300333333}
    NumGlyphs = 4
    ParentShowHint = False
    ShowHint = True
    OnClick = StartButClick
  end
  object StopBut: TSpeedButton
    Left = 89
    Top = 10
    Width = 60
    Height = 40
    Hint = 'Stop Measurement'
    Enabled = False
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333300000000000000380000000000000033000000000000003300000000000
      0003300000000000000330000000000000033000000000000003300000000000
      0003300000000000000330000000000000033000000000000003300000000000
      0003300000000000000330000000000000033333333333333333}
    OnClick = StopButClick
  end
  object GroupBox1: TGroupBox
    Left = 20
    Top = 59
    Width = 414
    Height = 188
    Caption = 'Program  Status'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 39
      Width = 12
      Height = 20
      Caption = 'T'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 89
      Width = 14
      Height = 20
      Caption = 'B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 236
      Top = 39
      Width = 42
      Height = 20
      Caption = 'Time'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 266
      Top = 94
      Width = 54
      Height = 16
      Caption = 'Segment'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 207
      Top = 39
      Width = 13
      Height = 20
      Caption = 'K'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 207
      Top = 89
      Width = 12
      Height = 20
      Caption = 'T'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label42: TLabel
      Left = 276
      Top = 158
      Width = 38
      Height = 16
      Caption = 'T step'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label43: TLabel
      Left = 335
      Top = 158
      Width = 38
      Height = 16
      Caption = 'B step'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SetpDisp: TEdit
      Left = 118
      Top = 30
      Width = 80
      Height = 28
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object FieldDisp: TEdit
      Left = 118
      Top = 79
      Width = 80
      Height = 28
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object TimeDisp: TEdit
      Left = 286
      Top = 30
      Width = 99
      Height = 28
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
      Text = '00:00:00'
    end
    object TSegDisp: TEdit
      Left = 266
      Top = 128
      Width = 60
      Height = 24
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object BSegDisp: TEdit
      Left = 325
      Top = 128
      Width = 60
      Height = 24
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object StatDisp: TEdit
      Left = 10
      Top = 128
      Width = 237
      Height = 24
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = 'Idle'
    end
    object SegEdit: TEdit
      Left = 325
      Top = 89
      Width = 60
      Height = 24
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object TEdit: TEdit
      Left = 30
      Top = 30
      Width = 80
      Height = 28
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object HEdit: TEdit
      Left = 30
      Top = 79
      Width = 80
      Height = 28
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
  end
  object GroupBox2: TGroupBox
    Left = 20
    Top = 256
    Width = 414
    Height = 188
    Caption = 'Measured Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 1
    object Label6: TLabel
      Left = 17
      Top = 89
      Width = 12
      Height = 21
      Caption = 'D'
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Symbol'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 17
      Top = 128
      Width = 12
      Height = 21
      Caption = 'D'
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Symbol'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 30
      Top = 89
      Width = 44
      Height = 20
      Caption = 'T[up]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 30
      Top = 128
      Width = 39
      Height = 20
      Caption = 'T[lo]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 20
      Top = 39
      Width = 64
      Height = 20
      Caption = 'Current'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 226
      Top = 39
      Width = 64
      Height = 20
      Caption = 'Voltage'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 246
      Top = 89
      Width = 44
      Height = 20
      Caption = 'T[up]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 234
      Top = 89
      Width = 12
      Height = 21
      Caption = 'D'
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Symbol'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 236
      Top = 138
      Width = 19
      Height = 21
      Caption = '(D'
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Symbol'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 219
      Top = 79
      Width = 14
      Height = 27
      Caption = 's'
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Symbol'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 256
      Top = 138
      Width = 19
      Height = 20
      Caption = 'T)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 177
      Top = 39
      Width = 28
      Height = 20
      Caption = 'mA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 177
      Top = 89
      Width = 13
      Height = 20
      Caption = 'K'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label29: TLabel
      Left = 177
      Top = 138
      Width = 13
      Height = 20
      Caption = 'K'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label30: TLabel
      Left = 384
      Top = 138
      Width = 13
      Height = 20
      Caption = 'K'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label31: TLabel
      Left = 384
      Top = 89
      Width = 13
      Height = 20
      Caption = 'K'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label32: TLabel
      Left = 394
      Top = 39
      Width = 13
      Height = 20
      Caption = 'V'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label33: TLabel
      Left = 382
      Top = 39
      Width = 11
      Height = 21
      Caption = 'm'
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Symbol'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 224
      Top = 138
      Width = 12
      Height = 21
      Caption = 'D'
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Symbol'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dTuDisp: TEdit
      Left = 89
      Top = 79
      Width = 80
      Height = 28
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dTlDisp: TEdit
      Left = 89
      Top = 128
      Width = 80
      Height = 28
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object CurrDisp: TEdit
      Left = 89
      Top = 30
      Width = 80
      Height = 28
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object VoltDisp: TEdit
      Left = 295
      Top = 30
      Width = 80
      Height = 28
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object sdTuDisp: TEdit
      Left = 295
      Top = 79
      Width = 80
      Height = 28
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object sdTlDisp: TEdit
      Left = 295
      Top = 128
      Width = 80
      Height = 28
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object GroupBox3: TGroupBox
    Left = 443
    Top = 256
    Width = 336
    Height = 188
    Caption = 'Recent results'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 2
    object Label12: TLabel
      Left = 47
      Top = 98
      Width = 24
      Height = 21
      Caption = 'a ['
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Symbol'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 204
      Top = 98
      Width = 11
      Height = 21
      Caption = 'l'
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Symbol'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 78
      Top = 98
      Width = 37
      Height = 20
      Caption = 'V/K]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 66
      Top = 98
      Width = 11
      Height = 21
      Caption = 'm'
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Symbol'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 17
      Top = 39
      Width = 12
      Height = 20
      Caption = 'T'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 145
      Top = 39
      Width = 13
      Height = 20
      Caption = 'K'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 215
      Top = 98
      Width = 77
      Height = 20
      Caption = '[W/(Km)]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label34: TLabel
      Left = 305
      Top = 39
      Width = 12
      Height = 20
      Caption = 'T'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label35: TLabel
      Left = 175
      Top = 39
      Width = 14
      Height = 20
      Caption = 'B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SeebDisp: TEdit
      Left = 39
      Top = 128
      Width = 100
      Height = 28
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object CondDisp: TEdit
      Left = 197
      Top = 128
      Width = 100
      Height = 28
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object TempDisp: TEdit
      Left = 39
      Top = 30
      Width = 100
      Height = 28
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object B_Disp: TEdit
      Left = 197
      Top = 30
      Width = 100
      Height = 28
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object GroupBox4: TGroupBox
    Left = 443
    Top = 59
    Width = 336
    Height = 188
    Caption = 'Sample parameters'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 3
    object Label36: TLabel
      Left = 266
      Top = 89
      Width = 31
      Height = 20
      Caption = 'mm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label37: TLabel
      Left = 20
      Top = 89
      Width = 74
      Height = 20
      Caption = 'a x b x c '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label38: TLabel
      Left = 252
      Top = 133
      Width = 13
      Height = 23
      Caption = 'r'
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Symbol'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label39: TLabel
      Left = 20
      Top = 133
      Width = 12
      Height = 20
      Caption = 'L'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 82
      Top = 133
      Width = 31
      Height = 20
      Caption = 'mm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label40: TLabel
      Left = 135
      Top = 133
      Width = 16
      Height = 20
      Caption = 'm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label41: TLabel
      Left = 224
      Top = 133
      Width = 11
      Height = 20
      Caption = 'g'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CommLine: TEdit
      Left = 20
      Top = 30
      Width = 296
      Height = 24
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object aEdit: TEdit
      Left = 118
      Top = 79
      Width = 41
      Height = 24
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object bEdit: TEdit
      Left = 167
      Top = 79
      Width = 41
      Height = 24
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object cEdit: TEdit
      Left = 217
      Top = 79
      Width = 40
      Height = 24
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object LEdit: TEdit
      Left = 37
      Top = 128
      Width = 41
      Height = 24
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object roEdit: TEdit
      Left = 266
      Top = 128
      Width = 50
      Height = 24
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object mEdit: TEdit
      Left = 158
      Top = 128
      Width = 60
      Height = 24
      BiDiMode = bdLeftToRight
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = T1Timer
    Top = 352
  end
end
