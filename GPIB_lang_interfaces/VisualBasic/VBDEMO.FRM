VERSION 5.00
Begin VB.Form frmDataDisplay
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   Caption         =   "GPIB Demo"
   ClientHeight    =   5520
   ClientLeft      =   450
   ClientTop       =   2850
   ClientWidth     =   4530
   BeginProperty Font
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   LinkMode        =   1  'Source
   LinkTopic       =   "Form2"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5520
   ScaleWidth      =   4530
   Begin VB.Timer tmrGPIBControl
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   3960
      Top             =   4920
   End
   Begin VB.CommandButton cmdQuit
      Appearance      =   0  'Flat
      Caption         =   "Quit"
      Height          =   485
      Left            =   1800
      TabIndex        =   10
      Top             =   4920
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.CommandButton cmdStart
      Appearance      =   0  'Flat
      Caption         =   "Start"
      Height          =   485
      Left            =   1800
      TabIndex        =   11
      Top             =   4920
      Width           =   855
   End
   Begin VB.OptionButton optRange
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Freq"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   5
      Left            =   2880
      TabIndex        =   5
      Top             =   3600
      Width           =   1260
   End
   Begin VB.OptionButton optRange
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Current AC"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   3
      Left            =   1560
      TabIndex        =   3
      Top             =   3600
      Width           =   1260
   End
   Begin VB.OptionButton optRange
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Volts AC"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   1
      Left            =   240
      TabIndex        =   1
      Top             =   3600
      Width           =   1260
   End
   Begin VB.OptionButton optRange
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Ohms"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   4
      Left            =   2880
      TabIndex        =   4
      Top             =   3360
      Width           =   1260
   End
   Begin VB.OptionButton optRange
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Current DC"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   2
      Left            =   1560
      TabIndex        =   2
      Top             =   3360
      Width           =   1260
   End
   Begin VB.OptionButton optRange
      Appearance      =   0  'Flat
      BackColor       =   &H00808080&
      Caption         =   "Volts DC"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   0
      Left            =   240
      TabIndex        =   0
      Top             =   3360
      Value           =   -1  'True
      Width           =   1260
   End
   Begin VB.TextBox txtDevName
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   2520
      TabIndex        =   6
      Text            =   "1"
      Top             =   1320
      Width           =   660
   End
   Begin VB.Label lblErrBox
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H000000FF&
      Height          =   885
      Left            =   120
      TabIndex        =   12
      Top             =   3960
      Width           =   4335
   End
   Begin VB.Label lblCurData
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font
         Name            =   "Arial"
         Size            =   30
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C000&
      Height          =   735
      Left            =   480
      TabIndex        =   8
      Top             =   2160
      Width           =   3495
   End
   Begin VB.Label lblDevName
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Device PAD:"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   480
      TabIndex        =   7
      Top             =   1320
      Width           =   1815
   End
   Begin VB.Label lblTitle
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "GPIB Demonstration for Fluke 45 Multimeter"
      BeginProperty Font
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   615
      Left            =   720
      TabIndex        =   9
      Top             =   120
      Width           =   3015
   End
End
Attribute VB_Name = "frmDataDisplay"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'==========================================================================

' File:        WINVBDEMO.FRM

' Description: Sets the range and reads data from a Fluke 45 multimeter
'
'==========================================================================

' Fluke 45 command strings
Const RESETCMD = "*RST"
Const IDCMD = "*IDN?"
Const RANGECMD = "VDC"
Const MEASURECMD = "VAL?"

Const BUFSIZE = 256           ' Size of IBRD buffer
Const NULLCHAR = 2            ' Character to fill IBRD buffer with


'***************************************************************************
'
' Name:        Global Variables Definition
'
'***************************************************************************

' Status bits (in ibsta%) and their names
   Dim StatBits(14):
   Dim StatBitStrs$(14)

' Error bits (in iberr%) and their names
   Dim ErrCodes(22):
   Dim ErrCodeStrs$(22)

' GPIB Read buffer
   Dim buffer$(BUFSIZE)

' Handle for open GPIB device
   Dim Device%

Private Sub cmdQuit_Click()

   tmrGPIBControl.Enabled = False
   If GPIBCallInProgress = 0 Then
       GPIBCallInProgress = 1
       ibsta% = ilclr(Device%)
       ibsta% = illoc(Device%)
       GPIBCallInProgress = 0
   End If
   End
End Sub

Private Sub cmdStart_Click()
   cmdStart.Visible = 0
   cmdQuit.Visible = -1
   Device = OpenDevice%()      ' Open the device
   tmrGPIBControl.Enabled = True
End Sub

Private Sub Form_Load()
' Semaphore to prevent multiple simultaneous calls into
' the GPIB library
    GPIBCallInProgress = 0

' Initialize status bit array
   StatBits(0) = DCAS:      StatBitStrs$(0) = "DCAS"
   StatBits(1) = DTAS:      StatBitStrs$(1) = "DTAS"
   StatBits(2) = LACS:      StatBitStrs$(2) = "LACS"
   StatBits(3) = TACS:      StatBitStrs$(3) = "TACS"
   StatBits(4) = AATN:      StatBitStrs$(4) = "AATN"
   StatBits(5) = CIC:       StatBitStrs$(5) = "CIC"
   StatBits(6) = RREM:      StatBitStrs$(6) = "RREM"
   StatBits(7) = LOK:       StatBitStrs$(7) = "LOK"
   StatBits(8) = CMPL:      StatBitStrs$(8) = "CMPL"
   StatBits(9) = RQS:       StatBitStrs$(9) = "RQS"
   StatBits(10) = SRQI:     StatBitStrs$(10) = "SRQI"
   StatBits(11) = EEND:     StatBitStrs$(11) = "EEND"
   StatBits(12) = TIMO:     StatBitStrs$(12) = "TIMO"
   StatBits(13) = EERR:     StatBitStrs$(13) = "EERR"
   StatBits(14) = 0:        StatBitStrs$(14) = ""

   ' Initialize error code array
   ErrCodes(0) = EDVR:   ErrCodeStrs$(0) = "EDVR"
   ErrCodes(1) = ECIC:   ErrCodeStrs$(1) = "ECIC"
   ErrCodes(2) = ENOL:   ErrCodeStrs$(2) = "ENOL"
   ErrCodes(3) = EADR:   ErrCodeStrs$(3) = "EADR"
   ErrCodes(4) = EARG:   ErrCodeStrs$(4) = "EARG"
   ErrCodes(5) = ESAC:   ErrCodeStrs$(5) = "ESAC"
   ErrCodes(6) = EABO:   ErrCodeStrs$(6) = "EABO"
   ErrCodes(7) = ENEB:   ErrCodeStrs$(7) = "ENEB"
   ErrCodes(8) = EDMA:   ErrCodeStrs$(8) = "EDMA"
   ErrCodes(9) = EOIP:   ErrCodeStrs$(9) = "EOIP"
   ErrCodes(10) = ECAP:  ErrCodeStrs$(10) = "ECAP"
   ErrCodes(11) = EFSO:  ErrCodeStrs$(11) = "EFSO"
   ErrCodes(12) = EBUS:  ErrCodeStrs$(12) = "EBUS"
   ErrCodes(13) = ESTB:  ErrCodeStrs$(13) = "ESTB"
   ErrCodes(14) = ESRQ:  ErrCodeStrs$(14) = "ESRQ"
   ErrCodes(15) = ETAB:  ErrCodeStrs$(15) = "ETAB"
   ErrCodes(16) = ELCK:  ErrCodeStrs$(16) = "ELCK"
   ErrCodes(17) = EARM:  ErrCodeStrs$(17) = "EARM"
   ErrCodes(18) = EHDL:  ErrCodeStrs$(18) = "EHDL"
   ErrCodes(19) = EWIP:  ErrCodeStrs$(19) = "EWIP"
   ErrCodes(20) = ERST:  ErrCodeStrs$(20) = "ERST"
   ErrCodes(21) = EPWR:  ErrCodeStrs$(21) = "EPWR"
   ErrCodes(22) = 0:     ErrCodeStrs$(22) = ""
End Sub

Private Sub Form_Unload(Cancel As Integer)
    ibsta% = ilstop%(Device%)
End Sub

Private Function OpenDevice%()

   boardnum$ = 0
   pad$ = txtDevName.Text
   sad$ = 0
   Device = ildev%(boardnum$, pad$, sad$, 12, 1, 0) ' Open the device
   If Device < 0 Then
      If iberr% = EDVR Then
          ErrorStr$ = "Couldn't open a Handle to the Device. Verify the Board Index and Address of the Device."
      ElseIf iberr = ECFG Then
          ErrorStr$ = "Board type is configured incorrectly"
      Else
          ErrorStr$ = "Error #" + Str$(iberr%) + "occurred"
      End If
      lblErrBox.Caption = ErrorStr$
      lblErrBox.BorderStyle = 1
      Device = 0
   Else
      ibsta% = iltmo%(Device, T10s)      ' Set the timeout
      Call WriteCommand(RESETCMD)      ' Send reset command      Call WriteCommand(RESETCMD)       ' Send reset command
      Call WriteCommand(RANGECMD)      ' Select Volts AC range
   End If
   OpenDevice% = Device
End Function



Private Sub optRange_Click(Index As Integer)

  If Device = 0 Then
    Device = OpenDevice%()
  End If

  Select Case Index
     Case 0
       CmdStr$ = "VDC"
     Case 1
       CmdStr$ = "VAC"
     Case 2
       CmdStr$ = "ADC"
     Case 3
       CmdStr$ = "AAC"
     Case 4
       CmdStr$ = "OHMS"
     Case 5
       CmdStr$ = "FREQ"
   End Select

   For i = 0 To 5
     If i = Index Then
        optRange(i).BackColor = &H808080
     Else
        optRange(i).value = 0
        optRange(i).BackColor = &HC0C0C0
     End If
   Next

   If GPIBCallInProgress = 0 Then
       GPIBCallInProgress = 1
       WriteCommand (CmdStr$)
       GPIBCallInProgress = 0
   End If
End Sub

Private Sub PrintErrors(ErrStr$)
   Beep         ' Beep the speaker
   e$ = "*** ERROR " + ErrStr$
   e$ = e$ + "  " + " ibsta% = " + Hex$(ibsta%) + " ("
   i = 0
   Do While StatBitStrs$(i) <> ""        ' Print names for status bits
      If ibsta% And StatBits(i) Then
         e$ = e$ + StatBitStrs$(i) + " "
      End If
      i = i + 1
   Loop
   e$ = e$ + ") " + Chr$(13)

   e$ = e$ + "iberr% =" + Str$(iberr%) + " ("
   i = 1
   Do While ErrCodeStrs$(i) <> ""
      If iberr% = ErrCodes(i) Then
         e$ = e$ + ErrCodeStrs$(i) + ") "
      End If
      i = i + 1
   Loop
   e$ = e$ + Chr$(13)

   e$ = e$ + " ibcnt% =" + Str$(ibcnt%)
   lblErrBox.Caption = e$
   lblErrBox.BorderStyle = 1

End Sub

'***************************************************************************
'
' Name:        ReadValue%
' Arguments:   rdbuf$ - String buffer for return value
'              bufsize - size of buffer
' Returns:     TRUE (-1) for success, FALSE (0) if it fails
'              Fills up buffer$
'
' Description: Fills the string with spaces, Reads a string from the
'              GPIB device and checks for errors.
'
'***************************************************************************
'
Private Function ReadValue%(rdbuf$, BUFSIZE&)

    If (Device = 0) Then
        rdbuf$ = "---"
    Else
        rdbuf$ = String$(BUFSIZE, NULLCHAR)  ' Clear string
        ibsta% = ilrd%(Device, rdbuf$, BUFSIZE&)               ' Read from GPIB
        If (ibsta% And EERR) Then                ' Check for erros
            PrintErrors ("IBRD failed")
            Device = 0
            rdbuf$ = "---"
            ReadValue% = 0
            tmrGPIBControl.Enabled = False
        Else
            i = 1
            Do While Mid$(rdbuf$, i, 1) <> Chr$(NULLCHAR)
                i = i + 1
            Loop
            rdbuf$ = Left$(rdbuf$, i - 2)
            lblErrBox.Caption = ""
            lblErrBox.BorderStyle = 0
            ReadValue% = -1
        End If
    End If

End Function

Private Sub tmrGPIBControl_Timer()
    If GPIBCallInProgress = 0 Then
        GPIBCallInProgress = 1
        For i = 0 To 5
            If optRange(i).value = False Then
                optRange(i).Enabled = False
            End If
        Next
        WriteCommand (MEASURECMD)
        If (ibsta% And EERR) Then
            GPIBCallInProgress = 0
            Exit Sub
        End If

        ReadStat% = ReadValue%(rdbuf$, BUFSIZE)     ' Read from GPIB
        If (ibsta% And EERR) Then
            GPIBCallInProgress = 0
            Exit Sub
        End If

        lblCurData.Caption = rdbuf$                 ' print the value
        GPIBCallInProgress = 0
        For i = 0 To 5
            If optRange(i).value = False Then
                optRange(i).Enabled = True
            End If
        Next
    End If
End Sub

'***************************************************************************
'
' Name:        WriteCommand
' Arguments:   cmd$ - String containing command
'
' Description: Writes the command to the GPIB device and then checks for
'              errors.
'
'***************************************************************************
'
Private Sub WriteCommand(Cmd$)

    If (Device <> 0) Then
        ibsta% = ilwrt(Device, Cmd$, Len(Cmd$))
        If (ibsta% And EERR) Then
            ErrStr$ = "IBWRT failed while writing " + Cmd$
            PrintErrors (ErrStr$)
            tmrGPIBControl.Enabled = False
            Device = 0
            Exit Sub
        End If

        ibsta% = ilwait(Device, CMPL)
        If (ibsta% And EERR) Then
            ErrStr$ = "IBWAIT failed while writing " + Cmd$
            PrintErrors (ErrStr$)
            Device = 0
            Exit Sub
        Else
            lblErrBox.Caption = ""
            lblErrBox.BorderStyle = 0
        End If
    End If

End Sub

