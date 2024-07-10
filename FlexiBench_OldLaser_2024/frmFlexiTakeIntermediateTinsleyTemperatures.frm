VERSION 5.00
Begin VB.Form frmIntermediateandFinalTinsleyTemperatures 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Tinsley Intermediate and Final Material Temperature Measurement"
   ClientHeight    =   8445
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6960
   LinkTopic       =   "Form1"
   ScaleHeight     =   8445
   ScaleWidth      =   6960
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   435
      Index           =   9
      Left            =   4680
      TabIndex        =   20
      Text            =   "0"
      Top             =   7320
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   435
      Index           =   8
      Left            =   4680
      TabIndex        =   19
      Text            =   "0"
      Top             =   6600
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   435
      Index           =   7
      Left            =   4680
      TabIndex        =   18
      Text            =   "0"
      Top             =   5880
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   435
      Index           =   6
      Left            =   4680
      TabIndex        =   17
      Text            =   "0"
      Top             =   5160
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   435
      Index           =   5
      Left            =   4680
      TabIndex        =   16
      Text            =   "0"
      Top             =   4440
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   435
      Index           =   4
      Left            =   4680
      TabIndex        =   15
      Text            =   "0"
      Top             =   3720
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   435
      Index           =   3
      Left            =   4680
      TabIndex        =   14
      Text            =   "0"
      Top             =   3000
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   435
      Index           =   2
      Left            =   4680
      TabIndex        =   13
      Text            =   "0"
      Top             =   2280
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   435
      Index           =   1
      Left            =   4680
      TabIndex        =   12
      Text            =   "0"
      Top             =   1560
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   435
      Index           =   0
      Left            =   4680
      TabIndex        =   11
      Text            =   "0"
      Top             =   840
      Width           =   2175
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Results"
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
      Height          =   495
      Left            =   4680
      TabIndex        =   10
      Top             =   120
      Width           =   2175
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Probe 2"
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
      Index           =   1
      Left            =   360
      TabIndex        =   9
      Top             =   1620
      Width           =   4095
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Probe 1"
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
      Index           =   0
      Left            =   360
      TabIndex        =   8
      Top             =   900
      Width           =   4095
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Probe 3"
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
      Index           =   2
      Left            =   360
      TabIndex        =   7
      Top             =   2340
      Width           =   4095
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Probe 4"
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
      Index           =   3
      Left            =   360
      TabIndex        =   6
      Top             =   3060
      Width           =   4095
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Probe 5"
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
      Index           =   4
      Left            =   360
      TabIndex        =   5
      Top             =   3780
      Width           =   4095
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Probe 6"
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
      Index           =   5
      Left            =   360
      TabIndex        =   4
      Top             =   4500
      Width           =   4095
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Probe 7"
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
      Index           =   6
      Left            =   360
      TabIndex        =   3
      Top             =   5220
      Width           =   4095
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Probe 8"
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
      Index           =   7
      Left            =   360
      TabIndex        =   2
      Top             =   5940
      Width           =   4095
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Probe 9"
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
      Index           =   8
      Left            =   360
      TabIndex        =   1
      Top             =   6660
      Width           =   4095
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Probe 10"
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
      Index           =   9
      Left            =   360
      TabIndex        =   0
      Top             =   7380
      Width           =   4095
   End
End
Attribute VB_Name = "frmIntermediateandFinalTinsleyTemperatures"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim x As Integer

Private Sub Form_Load()
Dim ResponseString As String
Dim Response As String
Set xlsheet = xlbook.Sheets("Tinsley") 'goes to module TakeTemperature with name of thermometer
'set Edale Correction to look for the Tinsley sheet
Unload frmTinsleyLaserReadings
'Unload the Tinsley laser readings form
'On Error GoTo ErrorTrap
RefreshTinsleyTempScreen 'Run screen refresh routine to bring up screen
Dim DepartmentNo As String
If LaserTestSetNo = 3 Then
Unload frmTinsleyLaserReadings
'If this is the laser readings taken before loading this screen were
'the last then unload the laser form
Else
End If
For ProbeCounter = 1 To 10
RefreshTinsleyTempScreen 'Run screen refresh routine to bring up screen
    If ProbesSelected(ProbeCounter) = 1 Then
        xlsheetResultsTemperatureUncorrected.Cells((ProbeCounter + 1), Rownumber) = _
        TakeTinsleyReadings(ProbeCounter - 1)
'Place uncorrected Tinsley temperature results into Uncorrected results sheet
        xlsheet.Cells(22, 2) = _
        xlsheetResultsTemperatureUncorrected.Cells((ProbeCounter + 1), Rownumber)
        xlsheet.Cells(22, 3) = ProbeCounter + 2
        txtTinsleyResult(ProbeCounter - 1) = Round((xlsheet.Cells(22, 4)), 4)
        Me.Refresh
        xlsheetResultsTemperature.Cells(ProbeCounter + 1, Rownumber) = _
        Val(txtTinsleyResult(ProbeCounter - 1))
    Else
    End If
'Place uncorrected temperature result and the probe number into correction sheet
'then take resulting corrected value out then place that result into the corrected
'temperature sheet
Next ProbeCounter
For x = 1 To 3
Beep 'beep 3 times
Next
If Rownumber = 5 And LaserTestSetNo = 3 Then
Beep
xlbookResults.Save
End

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
rsLengthResultsFlexi.Fields("MaximumTemperature") = xlbookResults.Sheets("Temperature Results").Cells(21, 5)
rsLengthResultsFlexi.Fields("MinimumTemperature") = xlbookResults.Sheets("Temperature Results").Cells(22, 5)
rsLengthResultsFlexi.Fields("ExpansionCoefficient") = xlbookResults.Sheets("VOL and Customer Data").Cells(5, 2)
rsLengthResultsFlexi.Fields("UncertaintyOfMeasurement") = xlbookResults.Sheets("Measurement Results").Cells(4, 9)
rsLengthResultsFlexi.Fields("TensionWeight") = xlbookResults.Sheets("VOL and Customer Data").Cells(4, 2)
Debug.Print rsLengthResultsFlexi.Fields("DayBookNo")
Debug.Print rsLengthResultsFlexi.Fields("IntervalValue")
Debug.Print rsLengthResultsFlexi.Fields("MeasuredValue")
Debug.Print rsLengthResultsFlexi.Fields("ErrorFromNominal")
Debug.Print rsLengthResultsFlexi.Fields("MaximumTemperature")
Debug.Print rsLengthResultsFlexi.Fields("MinimumTemperature")
Debug.Print rsLengthResultsFlexi.Fields("ExpansionCoefficient")
Debug.Print rsLengthResultsFlexi.Fields("TensionWeight")
'may need more columns for the sql info for the auto certs - need to see 7/12/04 mhd
rsLengthResultsFlexi.Update
rsLengthResultsFlexi.Close
'END OF SQL CODE TRY OUT
PrintOutClassAandB
CleanUp
End
'if this is the last set of temperatures then save and print results then close program
Else
Rownumber = 5 ' make rownumber = 5 to signal last run
Load frmTinsleyLaserReadings
frmTinsleyLaserReadings.Show
'load and show Tinsley laser readings
End If
ErrorTrap:
ResponseString = "The error was " & Err.Description & vbCrLf & "The error number was " & Err.Number
Response = MsgBox(ResponseString, vbOKOnly)
On Error GoTo 0
End Sub

Sub RefreshTinsleyTempScreen()
Me.Refresh ' refresh form
Me.Visible = True 'ensure form is visible
Me.WindowState = vbMaximized 'maximise form
End Sub
