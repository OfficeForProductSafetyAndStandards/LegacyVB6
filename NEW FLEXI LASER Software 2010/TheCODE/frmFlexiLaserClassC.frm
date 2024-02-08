VERSION 5.00
Begin VB.Form frmLaserClassC 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Laser Readings"
   ClientHeight    =   6420
   ClientLeft      =   5505
   ClientTop       =   3990
   ClientWidth     =   8265
   LinkTopic       =   "Form2"
   ScaleHeight     =   6420
   ScaleWidth      =   8265
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   240
      Top             =   0
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   19
      Left            =   5520
      TabIndex        =   20
      Text            =   "Text1"
      Top             =   4920
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   18
      Left            =   5520
      TabIndex        =   19
      Text            =   "Text1"
      Top             =   4440
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   17
      Left            =   5520
      TabIndex        =   18
      Text            =   "Text1"
      Top             =   3960
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   16
      Left            =   5520
      TabIndex        =   17
      Text            =   "Text1"
      Top             =   3480
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   15
      Left            =   5520
      TabIndex        =   16
      Text            =   "Text1"
      Top             =   3000
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   14
      Left            =   5520
      TabIndex        =   15
      Text            =   "Text1"
      Top             =   2520
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   13
      Left            =   5520
      TabIndex        =   14
      Text            =   "Text1"
      Top             =   2040
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   12
      Left            =   5520
      TabIndex        =   13
      Text            =   "Text1"
      Top             =   1560
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   11
      Left            =   5520
      TabIndex        =   12
      Text            =   "Text1"
      Top             =   1080
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   420
      Index           =   10
      Left            =   5520
      TabIndex        =   11
      Text            =   "Text1"
      Top             =   600
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
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
      TabIndex        =   10
      Text            =   "Text1"
      Top             =   4920
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
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
      TabIndex        =   9
      Text            =   "Text1"
      Top             =   4440
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
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
      TabIndex        =   8
      Text            =   "Text1"
      Top             =   3960
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
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
      TabIndex        =   7
      Text            =   "Text1"
      Top             =   3480
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
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
      TabIndex        =   6
      Text            =   "Text1"
      Top             =   3000
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
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
      TabIndex        =   5
      Text            =   "Text1"
      Top             =   2520
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
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
      TabIndex        =   4
      Text            =   "Text1"
      Top             =   2040
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
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
      TabIndex        =   3
      Text            =   "Text1"
      Top             =   1560
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
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
      TabIndex        =   2
      Text            =   "Text1"
      Top             =   1080
      Width           =   2535
   End
   Begin VB.CommandButton cmdStop 
      Caption         =   "Stop"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5520
      TabIndex        =   1
      Top             =   5760
      Width           =   2535
   End
   Begin VB.TextBox txtLaserReading 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
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
      Top             =   600
      Width           =   2535
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Zero"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   375
      Left            =   120
      TabIndex        =   22
      Top             =   600
      Width           =   735
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Zero"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   375
      Left            =   4320
      TabIndex        =   21
      Top             =   4920
      Width           =   975
   End
End
Attribute VB_Name = "frmLaserClassC"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public laser As Integer
Public counter As Integer

Private Sub cmdStop_Click()
xlbookResults.Save
End Sub


Private Sub Form_Load()
Dim ResponseString As String
Dim Response As String
Dim x As Integer
On Error GoTo ErrorTrap
For x = 1 To 10
    Me.Refresh
    Me.Visible = True
    Me.WindowState = vbMaximized
    Me.Refresh
Next x
Dim DepartmentNo As String
For counter = 0 To NoOfPoints
    Me.Refresh
    Me.Visible = True
    Me.WindowState = vbMaximized
    txtLaserReading(counter).Text = TakeLaserReadings
    'fill text boxes with laser readings from modTakeReadings module
    xlsheetResultsMeasurement.Cells(counter + 3, 2) = txtLaserReading(counter).Text
    'text box filled with readings passed from modTakeReadings module
    Me.Refresh
    Beep
Next counter
txtLaserReading(19).Text = TakeLaserReadings
' last (Zero) reading taken and placed in last text box
xlsheetResultsMeasurement.Cells(22, 2) = txtLaserReading(19).Text
'Last zero placed in excel
Call ibdev(0, 3, 0, 0, 1, 0, laser) '
'Define laser
Call ibwrt(laser, "RS" + Chr$(10))
'reset laser
Call ibonl(laser, 0)
'Place laser interface offline
xlbookResults.Save
'save excel results file
Beep
'SQL CODE TRY OUT 7/12/04 MHD
Dim rs As ADODB.Recordset
Dim rsConn As ADODB.Connection
Dim strString As String
Dim rsLengthResultsFlexi As ADODB.Recordset
'Dim x As Integer
Dim y As Integer
Set rsConn = New ADODB.Connection
rsConn.Open ("Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=MQU_Job;Data Source=Avon\Goldmine")
Debug.Print rsConn
Set rsLengthResultsFlexi = New ADODB.Recordset
rsLengthResultsFlexi.Open "Select * From tblLengthResultsFlexi", rsConn, adOpenDynamic, adLockOptimistic
rsLengthResultsFlexi.AddNew
rsLengthResultsFlexi.Fields("DayBookNo") = xlbookResults.Sheets("VOL and Customer Data").Cells(12, 2)
rsLengthResultsFlexi.Fields("IntervalValue") = xlbookResults.Sheets("Measurement Results").Cells(4, 7)
rsLengthResultsFlexi.Fields("MeasuredValue") = xlbookResults.Sheets("Measurement Results").Cells(4, 6)
rsLengthResultsFlexi.Fields("ErrorFromNominal") = xlbookResults.Sheets("Measurement Results").Cells(4, 8)
'all the values above will need to have multiple fields as flexi do a number of results each time - look into this, mhd 7/12/04
'rsLengthResultsFlexi.Fields("MaximumTemperature") = xlbookResults.Sheets("Temperature Results").Cells(21, 5)
'rsLengthResultsFlexi.Fields("MinimumTemperature") = xlbookResults.Sheets("Temperature Results").Cells(22, 5)
'rsLengthResultsFlexi.Fields("ExpansionCoefficient") = xlbookResults.Sheets("VOL and Customer Data").Cells(5, 2)
rsLengthResultsFlexi.Fields("UncertaintyOfMeasurement") = xlbookResults.Sheets("Measurement Results").Cells(4, 9)
rsLengthResultsFlexi.Fields("TensionWeight") = xlbookResults.Sheets("VOL and Customer Data").Cells(4, 2)
Debug.Print rsLengthResultsFlexi.Fields("DayBookNo")
Debug.Print rsLengthResultsFlexi.Fields("IntervalValue")
Debug.Print rsLengthResultsFlexi.Fields("MeasuredValue")
Debug.Print rsLengthResultsFlexi.Fields("ErrorFromNominal")
'Debug.Print rsLengthResultsFlexi.Fields("MaximumTemperature")
'Debug.Print rsLengthResultsFlexi.Fields("MinimumTemperature")
'Debug.Print rsLengthResultsFlexi.Fields("ExpansionCoefficient")
Debug.Print rsLengthResultsFlexi.Fields("TensionWeight")
'may need more columns for the sql info for the auto certs - need to see 7/12/04 mhd
rsLengthResultsFlexi.Update
rsLengthResultsFlexi.Close
'END OF SQL CODE TRY OUT
PrintOutClassC

CleanUp ' run cleanup module to close out system
Load frmStartScreen
frmStartScreen.Show
Timer1.Enabled = True
'End ' end program
Exit Sub
ErrorTrap:
ResponseString = "The error was " & Err.Description & vbCrLf & "The error number was " & Err.Number
Response = MsgBox(ResponseString, vbOKOnly)
On Error GoTo 0
End
End Sub

Private Sub Timer1_Timer()
Unload Me
End Sub
