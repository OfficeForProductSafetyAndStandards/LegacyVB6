VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmLaserReadings 
   BackColor       =   &H00C0FFC0&
   Caption         =   "Laser Readings - Class A"
   ClientHeight    =   9075
   ClientLeft      =   5505
   ClientTop       =   3990
   ClientWidth     =   13230
   LinkTopic       =   "Form2"
   ScaleHeight     =   9075
   ScaleWidth      =   13230
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   19
      Left            =   3960
      TabIndex        =   33
      Top             =   6840
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   18
      Left            =   10320
      TabIndex        =   32
      Top             =   6840
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   17
      Left            =   10320
      TabIndex        =   31
      Top             =   6480
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   16
      Left            =   10320
      TabIndex        =   30
      Top             =   6120
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   15
      Left            =   10320
      TabIndex        =   29
      Top             =   5760
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   14
      Left            =   10320
      TabIndex        =   28
      Top             =   5400
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   13
      Left            =   10320
      TabIndex        =   27
      Top             =   5040
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   12
      Left            =   8280
      TabIndex        =   26
      Top             =   6480
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   11
      Left            =   8280
      TabIndex        =   25
      Top             =   6840
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   10
      Left            =   8280
      TabIndex        =   24
      Top             =   6120
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   9
      Left            =   8280
      TabIndex        =   23
      Top             =   5760
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   8
      Left            =   8280
      TabIndex        =   22
      Top             =   5400
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   7
      Left            =   6120
      TabIndex        =   21
      Top             =   6840
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   6
      Left            =   8280
      TabIndex        =   20
      Top             =   5040
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   5
      Left            =   6120
      TabIndex        =   19
      Top             =   6480
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   4
      Left            =   6120
      TabIndex        =   18
      Top             =   6120
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   3
      Left            =   6120
      TabIndex        =   17
      Top             =   5760
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.CommandButton cmdLaserReadings 
      BackColor       =   &H00FFFF80&
      Caption         =   "Take Laser Readings"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   2280
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   3600
      Width           =   6855
   End
   Begin VB.CommandButton cmdResetLaser 
      BackColor       =   &H00FFFF00&
      Caption         =   "Reset Laser"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   10200
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   3600
      Width           =   1455
   End
   Begin VB.Timer tmrLaserReadTrigger 
      Interval        =   1
      Left            =   11520
      Top             =   8520
   End
   Begin VB.Timer tmrLiveLaserReading 
      Interval        =   100
      Left            =   11040
      Top             =   8520
   End
   Begin VB.CommandButton cmdNo 
      BackColor       =   &H00FFFF80&
      Caption         =   "No"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6690
      MaskColor       =   &H00FFFF80&
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   8280
      Width           =   2055
   End
   Begin VB.CommandButton cmdYes 
      BackColor       =   &H00FFFF80&
      Caption         =   "Yes"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4410
      MaskColor       =   &H00FFFF80&
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   8280
      Width           =   2055
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   2
      Left            =   6120
      TabIndex        =   2
      Top             =   5400
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   1
      Left            =   6120
      TabIndex        =   1
      Top             =   5040
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Index           =   0
      Left            =   3960
      TabIndex        =   0
      Top             =   5040
      Visible         =   0   'False
      Width           =   1695
   End
   Begin MSComctlLib.ProgressBar pbBeamStrength 
      Height          =   4815
      Left            =   120
      TabIndex        =   15
      Top             =   3600
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   8493
      _Version        =   393216
      Appearance      =   1
      Orientation     =   1
      Scrolling       =   1
   End
   Begin VB.Label Label7 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Beam strength"
      Height          =   375
      Left            =   120
      TabIndex        =   16
      Top             =   8520
      Width           =   1095
   End
   Begin VB.Label lblUnits 
      AutoSize        =   -1  'True
      BackColor       =   &H00C0FFC0&
      Caption         =   "mm"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1605
      Left            =   10440
      TabIndex        =   14
      Top             =   1680
      Width           =   2475
   End
   Begin VB.Label Label6 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Click on Take Laser Readings button to take set of readings"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   1215
      Left            =   3240
      TabIndex        =   13
      Top             =   240
      Width           =   6855
   End
   Begin VB.Label lblDispLaser 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackColor       =   &H00C0FFC0&
      Caption         =   "Label6"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1605
      Left            =   5880
      TabIndex        =   12
      Top             =   1680
      Width           =   4305
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Are the results OK?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   855
      Left            =   2250
      TabIndex        =   9
      Top             =   8160
      Width           =   1575
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Zero Reading"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1320
      TabIndex        =   6
      Top             =   6840
      Width           =   2055
   End
   Begin VB.Label Label4 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Graduation reading"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3960
      TabIndex        =   5
      Top             =   6240
      Width           =   1815
   End
   Begin VB.Label Label3 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Graduation reading"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3960
      TabIndex        =   4
      Top             =   5760
      Width           =   1695
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Zero Reading"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1320
      TabIndex        =   3
      Top             =   4920
      Width           =   2295
   End
End
Attribute VB_Name = "frmLaserReadings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Dim iPts As Integer 'counter for the number of readings taken
Dim iTNPts As Integer 'Total number of required points
Public laser As Integer
Public counter As Integer
Dim DepartmentNo As String



Private Sub CmdYes_Click()
    Load frmManualEdaleEntry
    frmManualEdaleEntry.Show
    Unload Me
    'load Manual Edale form and unload current form
    iPts = 0 'Reset the counter
End Sub
Private Sub CmdNo_Click()
Dim x As Integer
    For x = 0 To iTNPts 'Agilent sbb 8/3/2010  , was 3
        txtLaserReading(x).Text = 0 'when 'no' button clicked,
        'clears text boxes by placing a zero in them
        xlsheetResultsMeasurement.Cells(x + 2, Rownumber) = ""
        'This clears the results in excel as row index, column index
    Next x
    'Agilent, Stop hiding them
'txtLaserReading(0).Visible = False
'txtLaserReading(1).Visible = False
'txtLaserReading(2).Visible = False
'txtLaserReading(3).Visible = False
iPts = 0
'makes the text boxes invisible until the take laser readings button has been pressed_
'this is to make people press this button otherwise program can crash
End Sub

Private Sub cmdLaserReadings_Click()
'   Button on screen has been pressed, take the laser reading
Dim ResponseString As String
Dim Response As String
Dim DepartmentNo As String
Dim dbReading As Double
On Error GoTo ErrorTrap

'If iPts > iTNPts Then GoTo ExitSub
If iPts > iTNPts Then iPts = 19
'If Not txtLaserReading(0).Visible Then Call ShowReadingBox 'Agilent removed SBB 8/3/2010
dbReading = TakeLaserReadings
Call DispLaserReading(txtLaserReading(iPts), dbReading)
Beep
Call PutReadingInExcel(dbReading, iPts, LaserTestSetNo)
'places result from text box into row 3, column 2 on xl sheet
Refresh
iPts = iPts + 1
Beep
ExitSub:
Exit Sub
ErrorTrap:
ResponseString = "The error was " & Err.Description & vbCrLf & "The error number was " & Err.Number
Response = MsgBox(ResponseString, vbOKOnly)
On Error GoTo 0
End
End Sub




Private Sub cmdResetLaser_Click()
'   Reset the laser
E1735A_ResetDevice

End Sub

Private Sub Form_Load()
Call SetDefaults

End Sub

Private Sub tmrLaserReadTrigger_Timer()
'   Checks to see if the remote has been pressed
'   If it has, take the laser reading
Dim dbReading As Double
Debug.Print E1735A_ReadSampleCount()
    If E1735A_ReadSampleCount() > 0 Then
        'If iPts <= iTNPts Then
        If iPts > iTNPts Then iPts = 19
           'If Not txtLaserReading(0).Visible Then Call ShowReadingBox  'Agilent Removed SBB 8/3/2010
            Call ReadAllSamples(dbReading)
            Call DispLaserReading(txtLaserReading(iPts), dbReading)
            Call PutReadingInExcel(dbReading, iPts, LaserTestSetNo)
            iPts = iPts + 1
        'End If
    End If
End Sub

Public Sub ReadAllSamples(dbReading As Double)
 Dim Buffer() As TLaserSample
  Dim Size, Got, i, j, Interval As Long

  Size = 1024
  
  ReDim Buffer(1 To Size) As TLaserSample
 
  
    Got = E1735A_ReadAllSamples(Buffer(1), Size)
    
    
    j = Got / 20
    
    If j >= 1 Then
       Interval = j
    Else
       Interval = 1
    End If
    
    i = 0
    
    For i = 1 To Got Step Interval
         dbReading = Buffer(i).LaserPos

    Next i
End Sub

Public Sub SetDefaults()
Dim trg As Integer
trg = 6 'remote and software
Call E1735A_SetSampleTriggers(trg)

iTNPts = NoOfPoints 'Total number of calibration points, Agilent SBB 8/3/2010
pbBeamStrength.Max = 100
pbBeamStrength.Min = 0
SetProgressBackColour pbBeamStrength.hwnd, vbRed
SetProgressBarColour pbBeamStrength.hwnd, vbGreen
ShowReadingBox
End Sub


Private Sub tmrLiveLaserReading_Timer()
'   Continuosly reads the laser and displays the reading
lblDispLaser.Caption = Format(E1735A_ReadSample(), "+# ##0.000 000;-# ##0.000 000")
pbBeamStrength.Value = E1735A_ReadBeamStrength * 100
End Sub


Public Sub ShowReadingBox()
'   Make the text boxes for the laser reading visible
Dim iPt As Integer
For iPt = 0 To iTNPts
    txtLaserReading(iPt).Visible = True
Next iPt
'   Make the last Zero visible
    txtLaserReading(19).Visible = True

End Sub

Public Sub PutReadingInExcel(dbReading As Double, iRow As Integer, iCol As Integer)
xlsheetResultsMeasurement.Cells(iRow + 3, iCol) = dbReading
End Sub

Public Sub DispLaserReading(TxtBox As TextBox, dbRdg As Double)

'   Formats and displays the text txtDisp into the text box txtBox
TxtBox.Text = Format(dbRdg, "+0 000.000 000;-0 000.000 000")
End Sub

