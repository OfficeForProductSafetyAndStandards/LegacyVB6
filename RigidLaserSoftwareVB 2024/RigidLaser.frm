VERSION 5.00
Begin VB.Form frmLaserReadings 
   BackColor       =   &H00C0FFC0&
   Caption         =   "Laser Readings - Class A"
   ClientHeight    =   6105
   ClientLeft      =   5505
   ClientTop       =   3990
   ClientWidth     =   8415
   LinkTopic       =   "Form2"
   ScaleHeight     =   6105
   ScaleWidth      =   8415
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdTakeReadings 
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
      Height          =   495
      Left            =   772
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   1440
      Width           =   6975
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
      Left            =   4897
      MaskColor       =   &H00FFFF80&
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   5160
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
      Left            =   2617
      MaskColor       =   &H00FFFF80&
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   5160
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
      Left            =   4432
      TabIndex        =   3
      Top             =   3960
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
      Left            =   4432
      TabIndex        =   2
      Top             =   3360
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
      Left            =   4432
      TabIndex        =   1
      Top             =   2760
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
      Left            =   4432
      TabIndex        =   0
      Top             =   2160
      Visible         =   0   'False
      Width           =   2295
   End
   Begin VB.Timer tmrLaser 
      Interval        =   10
      Left            =   7537
      Top             =   5640
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
      Left            =   787
      TabIndex        =   12
      Top             =   120
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
      Height          =   855
      Left            =   457
      TabIndex        =   11
      Top             =   5160
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
      Left            =   1537
      TabIndex        =   7
      Top             =   3960
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
      Left            =   1537
      TabIndex        =   6
      Top             =   3360
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
      Left            =   1537
      TabIndex        =   5
      Top             =   2760
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
      Left            =   1537
      TabIndex        =   4
      Top             =   2160
      Width           =   2295
   End
End
Attribute VB_Name = "frmLaserReadings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public laser As Integer
Public counter As Integer

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
'makes the text boxes invisible until the take laser readings button has been pressed_
'this is to make people press this button otherwise program can crash
End Sub

Private Sub cmdTakeReadings_Click()
'tmrLaser.Enabled = False
Unload frmManualEdaleEntry
Dim ResponseString As String
Dim Response As String
Dim DepartmentNo As String
On Error GoTo ErrorTrap
txtLaserReading(0).Visible = True
txtLaserReading(1).Visible = True
txtLaserReading(2).Visible = True
txtLaserReading(3).Visible = True
'makes the text boxes invisible until the take laser readings button has been pressed_
'this is to make people press this button otherwise program can crash
Call ibdev(0, 3, 0, 0, 1, 0, laser)
'define laser description
Call ibonl(laser, 0)
'place laser off line
NoOfPoints = 3
'4 points are taken for Class A, two zero's and two grads
If LaserTestSetNo = 2 Then
For counter = 0 To NoOfPoints
txtLaserReading(counter).Text = TakeLaserReadings
Beep
'for each counter puts results from take laser readings module into correct text box
'test set number 2 is first set of results
xlsheetResultsMeasurement.Cells(counter + 3, LaserTestSetNo) = txtLaserReading(counter).Text
'text box filled with readings passed from modTakeReadings module
'counter starts at zero so when added to 3 puts results in correct place in xl, measurement results from row 3 to row 6
Refresh
Next counter
' LaserTestSetNo = 3 set from manual edale form.  This is the 2nd set of results.  Decided to_
'set the test set no in the other form as before when you pressed No for the results not being_
'correct on the 1st run it was immediately setting to the 2nd set number (3) and that is why_
'it was not updating.
'2nd set of results
Else
For counter = 0 To NoOfPoints
txtLaserReading(counter).Text = TakeLaserReadings
Beep

xlsheetResultsMeasurement.Cells(counter + 3, LaserTestSetNo) = txtLaserReading(counter).Text
'text box filled with readings passed from modTakeReadings module
Refresh
Next counter
End If
Call ibdev(0, 3, 0, 0, 1, 0, laser)
'define laser description
Call ibonl(laser, 0)
'Place laser interface offline
xlbookResults.Save
Exit Sub
ErrorTrap:
ResponseString = "The error was " & Err.Description & vbCrLf & "The error number was " & Err.Number
Response = MsgBox(ResponseString, vbOKOnly)
On Error GoTo 0
End
End Sub

Private Sub CmdYes_Click()
    Load frmManualEdaleEntry
    frmManualEdaleEntry.Show
    Unload Me
    'load Manual Edale form and unload current form
    
    End Sub

