VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmLaserReadingsB 
   BackColor       =   &H00C0FFC0&
   Caption         =   "Laser Readings - Class B"
   ClientHeight    =   8970
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   12840
   LinkTopic       =   "Form1"
   ScaleHeight     =   8970
   ScaleWidth      =   12840
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.ProgressBar pbBeamStrength 
      Height          =   4815
      Left            =   240
      TabIndex        =   14
      Top             =   3600
      Width           =   375
      _ExtentX        =   661
      _ExtentY        =   8493
      _Version        =   393216
      Appearance      =   1
      Orientation     =   1
      Scrolling       =   1
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
      Left            =   9960
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   3600
      Width           =   1455
   End
   Begin VB.Timer tmrLaserReadTrigger 
      Interval        =   1
      Left            =   8520
      Top             =   6480
   End
   Begin VB.Timer tmrLiveLaserReading 
      Interval        =   100
      Left            =   8520
      Top             =   5160
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
      Left            =   2040
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   3600
      Width           =   6855
   End
   Begin VB.CommandButton cmdNotOk 
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
      Left            =   6870
      MaskColor       =   &H8000000F&
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   7680
      Width           =   1575
   End
   Begin VB.CommandButton CmdOK 
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
      Left            =   4470
      MaskColor       =   &H00FFFF80&
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   7680
      Width           =   1575
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
      Height          =   420
      Index           =   0
      Left            =   5475
      TabIndex        =   2
      Top             =   4800
      Visible         =   0   'False
      Width           =   2535
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
      Height          =   420
      Index           =   1
      Left            =   5475
      TabIndex        =   1
      Top             =   5655
      Visible         =   0   'False
      Width           =   2535
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
      Height          =   420
      Index           =   2
      Left            =   5475
      TabIndex        =   0
      Top             =   6600
      Visible         =   0   'False
      Width           =   2535
   End
   Begin VB.Label Label6 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Beam strength"
      Height          =   375
      Left            =   120
      TabIndex        =   15
      Top             =   8520
      Width           =   1095
   End
   Begin VB.Label lblUnits 
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
      Left            =   10200
      TabIndex        =   13
      Top             =   1440
      Width           =   2355
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
      Left            =   5520
      TabIndex        =   12
      Top             =   1440
      Width           =   4305
   End
   Begin VB.Label Label5 
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
      Left            =   3120
      TabIndex        =   10
      Top             =   240
      Width           =   6855
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
      Height          =   1095
      Left            =   2235
      TabIndex        =   6
      Top             =   7800
      Width           =   1575
   End
   Begin VB.Label Label4 
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
      Left            =   2340
      TabIndex        =   5
      Top             =   6600
      Width           =   2415
   End
   Begin VB.Label Label3 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Graduation Reading"
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
      Left            =   2340
      TabIndex        =   4
      Top             =   5640
      Width           =   1935
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
      Left            =   2340
      TabIndex        =   3
      Top             =   4800
      Width           =   2415
   End
End
Attribute VB_Name = "frmLaserReadingsB"
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

Private Sub cmdNotOk_Click()
Dim x As Integer
    For x = 0 To 2
        txtLaserReading(x).Text = 0 'when 'no' button clicked,
        'clears text boxes by placing a zero in them
        xlsheetResultsMeasurement.Cells(x + 2, Rownumber) = ""
        'This clears the results in excel as row,column, run
    Next x
    txtLaserReading(0).Visible = False
    txtLaserReading(1).Visible = False
    txtLaserReading(2).Visible = False
    iPts = 0 're-start the counter
    'makes the text boxes invisible until the take laser readings button has been pressed_
    'this is to make people press this button otherwise program can crash

End Sub

Private Sub CmdOK_Click()
Dim NewFileName As String



xlbookResults.Save
PrintOutClassB
frmFinalSheet.Show
'shows final sheet
Unload Me

End Sub

Private Sub cmdLaserReadings_Click()
'   Button on screen has been pressed, take the laser reading
Dim ResponseString As String
Dim Response As String
Dim DepartmentNo As String
Dim dbReading As Double
On Error GoTo ErrorTrap

If iPts >= iTNPts Then GoTo ExitSub
If Not txtLaserReading(0).Visible Then Call ShowReadingBox
dbReading = TakeLaserReadings
Call DispLaserReading(txtLaserReading(iPts), dbReading)
Beep
If iPts = iTNPts - 1 Then
    'If this is the last zero, second reading is skipped for class I
    Call PutReadingInExcel(dbReading, iPts + 1)
Else
    Call PutReadingInExcel(dbReading, iPts)
End If
'places result from text box into row 3, column 2 on xl sheet
Refresh
iPts = iPts + 1
Beep
'Call PutReadingInExcel(dbReading, iPts)
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

Private Sub ProgressBar1_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

End Sub

Private Sub tmrLaserReadTrigger_Timer()
'   Checks to see if the remote has been pressed
'   If it has, take the laser reading
Dim dbReading As Double
Debug.Print E1735A_ReadSampleCount()
    If E1735A_ReadSampleCount() > 0 Then
        If iPts < iTNPts Then
           If Not txtLaserReading(0).Visible Then Call ShowReadingBox
            Call ReadAllSamples(dbReading)
            Call DispLaserReading(txtLaserReading(iPts), dbReading)
            Call PutReadingInExcel(dbReading, iPts)
            iPts = iPts + 1
        End If
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
E1735A_SetSampleTriggers (trg)
Debug.Print Units
lblUnits.Caption = Units
iTNPts = 3  'Total number of calibration points
pbBeamStrength.Max = 100
pbBeamStrength.Min = 0
SetProgressBackColour pbBeamStrength.hwnd, vbRed
SetProgressBarColour pbBeamStrength.hwnd, vbGreen
End Sub


Private Sub tmrLiveLaserReading_Timer()
'   Continuosly reads the laser and displays the reading
lblDispLaser.Caption = Format(E1735A_ReadSample(), "+# ##0.000 000;-# ##0.000 000")
pbBeamStrength.Value = E1735A_ReadBeamStrength * 100

End Sub


Public Sub ShowReadingBox()
'   Make the text boxes for the laser reading visible
txtLaserReading(0).Visible = True
txtLaserReading(1).Visible = True
txtLaserReading(2).Visible = True

End Sub

Public Sub PutReadingInExcel(dbReading As Double, iPt As Integer)
xlsheetResultsMeasurement.Cells(iPt + 3, 2) = dbReading
End Sub

Public Sub DispLaserReading(TxtBox As TextBox, dbRdg As Double)

'   Formats and displays the text txtDisp into the text box txtBox
TxtBox.Text = Format(dbRdg, "+0 000.000 000;-0 000.000 000")
End Sub
