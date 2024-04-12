VERSION 5.00
Begin VB.Form frmLaserReadingsB 
   BackColor       =   &H00C0FFC0&
   Caption         =   "Laser Readings - Class B"
   ClientHeight    =   6630
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7800
   LinkTopic       =   "Form1"
   ScaleHeight     =   6630
   ScaleWidth      =   7800
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
      Height          =   615
      Left            =   482
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   1680
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
      Left            =   5423
      MaskColor       =   &H8000000F&
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   5400
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
      Left            =   3023
      MaskColor       =   &H00FFFF80&
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   5400
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
      Left            =   4037
      TabIndex        =   2
      Top             =   2520
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
      Left            =   4037
      TabIndex        =   1
      Top             =   3375
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
      Left            =   4037
      TabIndex        =   0
      Top             =   4320
      Visible         =   0   'False
      Width           =   2535
   End
   Begin VB.Timer tmrLaser 
      Interval        =   10
      Left            =   4943
      Top             =   6120
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
      Left            =   463
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
      Left            =   793
      TabIndex        =   6
      Top             =   5520
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
      Left            =   898
      TabIndex        =   5
      Top             =   4320
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
      Left            =   898
      TabIndex        =   4
      Top             =   3360
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
      Left            =   898
      TabIndex        =   3
      Top             =   2520
      Width           =   2415
   End
End
Attribute VB_Name = "frmLaserReadingsB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public laser As Integer
Public counter As Integer
Dim DepartmentNo As String

Private Sub cmdNotOk_Click()
Dim X As Integer
    For X = 0 To 2
        txtLaserReading(X).Text = 0 'when 'no' button clicked,
        'clears text boxes by placing a zero in them
    Next X
    txtLaserReading(0).Visible = False
    txtLaserReading(1).Visible = False
    txtLaserReading(2).Visible = False
    'makes the text boxes invisible until the take laser readings button has been pressed_
    'this is to make people press this button otherwise program can crash

End Sub

Private Sub CmdOK_Click()
Dim NewFileName As String
Call ibdev(0, 3, 0, 0, 1, 0, laser)
'define laser description
Call ibwrt(laser, "RS" + Chr$(10))
'reset laser
Call ibonl(laser, 0)
'Place laser interface offline
xlbookResults.Save
PrintOutClassB
'goes to module SetUp for print instructions

frmFinalSheet.Show
'shows final sheet
Unload Me

End Sub

Private Sub cmdLaserReadings_Click()
Dim ResponseString As String
Dim Response As String
Dim DepartmentNo As String
On Error GoTo ErrorTrap
txtLaserReading(0).Visible = True
txtLaserReading(1).Visible = True
txtLaserReading(2).Visible = True
'makes the text boxes invisible until the take laser readings button has been pressed_
'this is to make people press this button otherwise program can crash
NoOfPoints = 1
'Takes 2 readings first - zero and 1st point
Call ibdev(0, 3, 0, 0, 1, 0, laser)
'define laser
Call ibonl(laser, 0)
'laser interface off line
For counter = 0 To NoOfPoints
txtLaserReading(counter).Text = TakeLaserReadings
Beep
'text box filled with readings passed from modTakeReadings module
xlsheetResultsMeasurement.Cells(counter + 3, 2) = txtLaserReading(counter).Text
'places result from text box into row 3, column 2 on xl sheet
Refresh
'
Next counter
'counter is zero and one
txtLaserReading(2).Text = TakeLaserReadings
Beep
'3rd point done like this so that the result can be placed specifically in correct place in excel
xlsheetResultsMeasurement.Cells(6, 2) = txtLaserReading(2).Text
'places 2nd zero point in xl sheet row 6, column 2
Exit Sub
ErrorTrap:
ResponseString = "The error was " & Err.Description & vbCrLf & "The error number was " & Err.Number
Response = MsgBox(ResponseString, vbOKOnly)
On Error GoTo 0
End
End Sub


