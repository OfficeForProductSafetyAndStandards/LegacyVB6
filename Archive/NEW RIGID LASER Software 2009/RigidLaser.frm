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
      TabIndex        =   12
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
      TabIndex        =   11
      Top             =   3600
      Width           =   1455
   End
   Begin VB.Timer tmrLaserReadTrigger 
      Interval        =   1
      Left            =   8880
      Top             =   6360
   End
   Begin VB.Timer tmrLiveLaserReading 
      Interval        =   100
      Left            =   8880
      Top             =   5280
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
      TabIndex        =   9
      Top             =   7920
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
      TabIndex        =   8
      Top             =   7920
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
      Index           =   3
      Left            =   6225
      TabIndex        =   3
      Top             =   6720
      Visible         =   0   'False
      Width           =   2295
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
      Left            =   6225
      TabIndex        =   2
      Top             =   6120
      Visible         =   0   'False
      Width           =   2295
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
      Left            =   6240
      TabIndex        =   1
      Top             =   5520
      Visible         =   0   'False
      Width           =   2295
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
      Left            =   6240
      TabIndex        =   0
      Top             =   4920
      Visible         =   0   'False
      Width           =   2295
   End
   Begin MSComctlLib.ProgressBar pbBeamStrength 
      Height          =   4815
      Left            =   120
      TabIndex        =   16
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
      TabIndex        =   17
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
      TabIndex        =   15
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
      TabIndex        =   14
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
      TabIndex        =   13
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
      TabIndex        =   10
      Top             =   7920
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
      Left            =   3330
      TabIndex        =   7
      Top             =   6720
      Width           =   2295
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
      Left            =   3360
      TabIndex        =   6
      Top             =   6120
      Width           =   2295
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
      Left            =   3330
      TabIndex        =   5
      Top             =   5520
      Width           =   2295
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
      Left            =   3330
      TabIndex        =   4
      Top             =   4920
      Width           =   2295
   End
End
Attribute VB_Name = "frmLaserReadings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Option Explicit
'Public laser As Integer
'Public counter As Integer
'
'Private Sub CmdNo_Click()
'Dim x As Integer
'    For x = 0 To 3
'        txtLaserReading(x).Text = 0 'when 'no' button clicked,
'        'clears text boxes by placing a zero in them
'        xlsheetResultsMeasurement.Cells(x + 2, Rownumber) = ""
'        'This clears the results in excel as row index, column index
'    Next x
'txtLaserReading(0).Visible = False
'txtLaserReading(1).Visible = False
'txtLaserReading(2).Visible = False
'txtLaserReading(3).Visible = False
''makes the text boxes invisible until the take laser readings button has been pressed_
''this is to make people press this button otherwise program can crash
'End Sub
'
'Private Sub cmdResetLaser_Click()
''   Reset the laser
'E1735A_ResetDevice
'End Sub
'
'Private Sub cmdTakeReadings_Click()
''tmrLaser.Enabled = False
'Unload frmManualEdaleEntry
'Dim ResponseString As String
'Dim Response As String
'Dim DepartmentNo As String
'On Error GoTo ErrorTrap
'txtLaserReading(0).Visible = True
'txtLaserReading(1).Visible = True
'txtLaserReading(2).Visible = True
'txtLaserReading(3).Visible = True
''makes the text boxes invisible until the take laser readings button has been pressed_
''this is to make people press this button otherwise program can crash
'Call ibdev(0, 3, 0, 0, 1, 0, laser)
''define laser description
'Call ibonl(laser, 0)
''place laser off line
'NoOfPoints = 3
''4 points are taken for Class A, two zero's and two grads
'If LaserTestSetNo = 2 Then
'    For counter = 0 To NoOfPoints
'        txtLaserReading(counter).Text = TakeLaserReadings
'        Beep
'        'for each counter puts results from take laser readings module into correct text box
'        'test set number 2 is first set of results
'        xlsheetResultsMeasurement.Cells(counter + 3, LaserTestSetNo) = txtLaserReading(counter).Text
'        'text box filled with readings passed from modTakeReadings module
'        'counter starts at zero so when added to 3 puts results in correct place in xl, measurement results from row 3 to row 6
'        Refresh
'    Next counter
'    ' LaserTestSetNo = 3 set from manual edale form.  This is the 2nd set of results.  Decided to_
'    'set the test set no in the other form as before when you pressed No for the results not being_
'    'correct on the 1st run it was immediately setting to the 2nd set number (3) and that is why_
'    'it was not updating.
'    '2nd set of results
'Else
'    For counter = 0 To NoOfPoints
'        txtLaserReading(counter).Text = TakeLaserReadings
'        Beep
'
'        xlsheetResultsMeasurement.Cells(counter + 3, LaserTestSetNo) = txtLaserReading(counter).Text
'        'text box filled with readings passed from modTakeReadings module
'        Refresh
'    Next counter
'End If
'Call ibdev(0, 3, 0, 0, 1, 0, laser)
''define laser description
'Call ibonl(laser, 0)
''Place laser interface offline
'xlbookResults.Save
'Exit Sub
'ErrorTrap:
'ResponseString = "The error was " & Err.Description & vbCrLf & "The error number was " & Err.Number
'Response = MsgBox(ResponseString, vbOKOnly)
'On Error GoTo 0
'End
'End Sub
'
'Private Sub CmdYes_Click()
'    Load frmManualEdaleEntry
'    frmManualEdaleEntry.Show
'    Unload Me
'    'load Manual Edale form and unload current form
'
'    End Sub
'
'=================================================================
'       All this has been copied from LaserReadingsB
'=================================================================
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
    For x = 0 To 3
        txtLaserReading(x).Text = 0 'when 'no' button clicked,
        'clears text boxes by placing a zero in them
        xlsheetResultsMeasurement.Cells(x + 2, Rownumber) = ""
        'This clears the results in excel as row index, column index
    Next x
txtLaserReading(0).Visible = False
txtLaserReading(1).Visible = False
txtLaserReading(2).Visible = False
txtLaserReading(3).Visible = False
iPts = 0
'makes the text boxes invisible until the take laser readings button has been pressed_
'this is to make people press this button otherwise program can crash
End Sub

'Private Sub cmdNotOk_Click()
'Dim x As Integer
'    For x = 0 To 2
'        txtLaserReading(x).Text = 0 'when 'no' button clicked,
'        'clears text boxes by placing a zero in them
'        xlsheetResultsMeasurement.Cells(x + 2, Rownumber) = ""
'        'This clears the results in excel as row,column, run
'    Next x
'    txtLaserReading(0).Visible = False
'    txtLaserReading(1).Visible = False
'    txtLaserReading(2).Visible = False
'    iPts = 0 're-start the counter
'    'makes the text boxes invisible until the take laser readings button has been pressed_
'    'this is to make people press this button otherwise program can crash
'
'End Sub
'
'Private Sub CmdOK_Click()
'Dim NewFileName As String
'
'
'
'xlbookResults.Save
'PrintOutClassB
'frmFinalSheet.Show
''shows final sheet
'Unload Me
'
'End Sub

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
        If iPts < iTNPts Then
           If Not txtLaserReading(0).Visible Then Call ShowReadingBox
            Call ReadAllSamples(dbReading)
            Call DispLaserReading(txtLaserReading(iPts), dbReading)
            Call PutReadingInExcel(dbReading, iPts, LaserTestSetNo)
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

iTNPts = 4  'Total number of calibration points
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
txtLaserReading(3).Visible = True

End Sub

Public Sub PutReadingInExcel(dbReading As Double, iRow As Integer, iCol As Integer)
xlsheetResultsMeasurement.Cells(iRow + 3, iCol) = dbReading
End Sub

Public Sub DispLaserReading(TxtBox As TextBox, dbRdg As Double)

'   Formats and displays the text txtDisp into the text box txtBox
TxtBox.Text = Format(dbRdg, "+0 000.000 000;-0 000.000 000")
End Sub

