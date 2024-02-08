VERSION 5.00
Begin VB.Form frmTinsleyLaserReadings 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Laser Readings"
   ClientHeight    =   6300
   ClientLeft      =   5505
   ClientTop       =   3990
   ClientWidth     =   8595
   LinkTopic       =   "Form2"
   ScaleHeight     =   6300
   ScaleWidth      =   8595
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   600
      Top             =   5040
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   19
      Left            =   5640
      TabIndex        =   19
      Text            =   "Text1"
      Top             =   4440
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   18
      Left            =   5640
      TabIndex        =   18
      Text            =   "Text1"
      Top             =   3960
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   17
      Left            =   5640
      TabIndex        =   17
      Text            =   "Text1"
      Top             =   3480
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   16
      Left            =   5640
      TabIndex        =   16
      Text            =   "Text1"
      Top             =   3000
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   15
      Left            =   5640
      TabIndex        =   15
      Text            =   "Text1"
      Top             =   2520
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   14
      Left            =   5640
      TabIndex        =   14
      Text            =   "Text1"
      Top             =   2040
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   13
      Left            =   5640
      TabIndex        =   13
      Text            =   "Text1"
      Top             =   1560
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   12
      Left            =   5640
      TabIndex        =   12
      Text            =   "Text1"
      Top             =   1080
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   11
      Left            =   5640
      TabIndex        =   11
      Text            =   "Text1"
      Top             =   600
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   10
      Left            =   5640
      TabIndex        =   10
      Text            =   "Text1"
      Top             =   120
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   9
      Left            =   1320
      TabIndex        =   9
      Text            =   "Text1"
      Top             =   4440
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   8
      Left            =   1320
      TabIndex        =   8
      Text            =   "Text1"
      Top             =   3960
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   7
      Left            =   1320
      TabIndex        =   7
      Text            =   "Text1"
      Top             =   3480
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   6
      Left            =   1320
      TabIndex        =   6
      Text            =   "Text1"
      Top             =   3000
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   5
      Left            =   1320
      TabIndex        =   5
      Text            =   "Text1"
      Top             =   2520
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   4
      Left            =   1320
      TabIndex        =   4
      Text            =   "Text1"
      Top             =   2040
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   3
      Left            =   1320
      TabIndex        =   3
      Text            =   "Text1"
      Top             =   1560
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   2
      Left            =   1320
      TabIndex        =   2
      Text            =   "Text1"
      Top             =   1080
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   1
      Left            =   1320
      TabIndex        =   1
      Text            =   "Text1"
      Top             =   600
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   0
      Left            =   1320
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   120
      Width           =   2535
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Zero"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   21
      Top             =   240
      Width           =   735
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Zero"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4440
      TabIndex        =   20
      Top             =   4440
      Width           =   975
   End
End
Attribute VB_Name = "frmTinsleyLaserReadings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public laser As Integer
Public counter As Integer
Dim x As Integer

Private Sub Form_Load()
On Error Resume Next
Unload frmTakeInitalTinsleyTemperatures
On Error GoTo 0
Me.WindowState = vbMaximized
Me.Refresh
Timer1.Enabled = False
TypeOfThermometer = xlsheetResultsMeasurement.Cells(28, 2)
If TypeOfThermometer = "Tinsley" Then
    Unload frmIntermediateandFinalTinsleyTemperatures
Else
    Unload frmManualEdaleEntry
End If
'Check which thermometer used and close appropriate form
If LaserTestSetNo = 2 Then
    RefreshLaserScreen
    For counter = 0 To NoOfPoints
        RefreshLaserScreen 'Refresh form with subroutine
        txtLaserReading(counter).Text = TakeLaserReadings
        'Get results and place into text boxes
        Me.Refresh 'refresh form
        xlsheetResultsMeasurement.Cells(counter + 3, LaserTestSetNo) = _
        txtLaserReading(counter).Text
        'text box filled with readings passed from modTakeReadings module
        Me.Refresh
        Beep
    Next counter
    For x = 1 To 3
        Beep 'beep 3 times
    Next x
Else
    RefreshLaserScreen
    For counter = NoOfPoints To 0 Step -1
        RefreshLaserScreen
        txtLaserReading(counter).Text = TakeLaserReadings
        'Get results and place into text boxes
        Me.Refresh
        xlsheetResultsMeasurement.Cells(counter + 3, LaserTestSetNo) _
        = txtLaserReading(counter).Text
        'text box filled with readings passed from modTakeReadings module
        Beep
        Refresh
    Next counter
    For x = 1 To 3
        Beep 'beep 3 times
    Next x
End If
xlbookResults.Save
LaserTestSetNo = 3
If TypeOfThermometer = "Tinsley" Then
    Load frmIntermediateandFinalTinsleyTemperatures
    frmIntermediateandFinalTinsleyTemperatures.Show
Else
    Load frmManualEdaleEntry
    frmManualEdaleEntry.Show
End If
'Check which thermometer used and open appropriate form
Timer1.Enabled = True ' start timer to unload form
End Sub

Private Sub Timer1_Timer()
Unload Me
End Sub

Sub RefreshLaserScreen()
Me.Refresh
Me.Visible = True
Me.WindowState = vbMaximized
End Sub
