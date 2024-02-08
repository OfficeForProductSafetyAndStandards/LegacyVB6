VERSION 5.00
Begin VB.Form frmTakeInitalTinsleyTemperatures 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Tinsley Initial Temperature Measurement"
   ClientHeight    =   8985
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8835
   LinkTopic       =   "Form1"
   ScaleHeight     =   8985
   ScaleWidth      =   8835
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdTakeReadings 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Take Temperatures"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   6240
      Style           =   1  'Graphical
      TabIndex        =   24
      Top             =   3000
      Width           =   2175
   End
   Begin VB.CheckBox chkProbe10 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Probe 10"
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
      Height          =   555
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   23
      Top             =   7320
      Width           =   2175
   End
   Begin VB.CheckBox chkProbe9 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Probe 9"
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
      Height          =   555
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   22
      Top             =   6600
      Width           =   2175
   End
   Begin VB.CheckBox chkProbe8 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Probe 8"
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
      Height          =   555
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   21
      Top             =   5880
      Width           =   2175
   End
   Begin VB.CheckBox chkProbe7 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Probe 7"
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
      Height          =   555
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   20
      Top             =   5160
      Width           =   2175
   End
   Begin VB.CheckBox chkProbe6 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Probe 6"
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
      Height          =   555
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   19
      Top             =   4440
      Width           =   2175
   End
   Begin VB.CheckBox chkProbe5 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Probe 5"
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
      Height          =   555
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   3720
      Width           =   2175
   End
   Begin VB.CheckBox chkProbe4 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Probe 4"
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
      Height          =   555
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   17
      Top             =   3000
      Width           =   2175
   End
   Begin VB.CheckBox chkProbe3 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Probe 3"
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
      Height          =   555
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   2280
      Width           =   2175
   End
   Begin VB.CheckBox chkProbe2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Probe 2"
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
      Height          =   555
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   1560
      Width           =   2175
   End
   Begin VB.CheckBox chkProbe1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Probe 1"
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
      Height          =   555
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   840
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   555
      Index           =   9
      Left            =   3480
      TabIndex        =   13
      Text            =   "0"
      Top             =   7320
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   555
      Index           =   8
      Left            =   3480
      TabIndex        =   12
      Text            =   "0"
      Top             =   6600
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   555
      Index           =   7
      Left            =   3480
      TabIndex        =   11
      Text            =   "0"
      Top             =   5880
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   555
      Index           =   6
      Left            =   3480
      TabIndex        =   10
      Text            =   "0"
      Top             =   5160
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   555
      Index           =   5
      Left            =   3480
      TabIndex        =   9
      Text            =   "0"
      Top             =   4440
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   555
      Index           =   4
      Left            =   3480
      TabIndex        =   8
      Text            =   "0"
      Top             =   3720
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   555
      Index           =   3
      Left            =   3480
      TabIndex        =   7
      Text            =   "0"
      Top             =   3000
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   555
      Index           =   2
      Left            =   3480
      TabIndex        =   6
      Text            =   "0"
      Top             =   2280
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   555
      Index           =   1
      Left            =   3480
      TabIndex        =   5
      Text            =   "0"
      Top             =   1560
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.TextBox txtTinsleyResult 
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
      Height          =   555
      Index           =   0
      Left            =   3480
      TabIndex        =   4
      Text            =   "0"
      Top             =   840
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.CommandButton cmdResultsNotOk 
      BackColor       =   &H00E0E0E0&
      Caption         =   "No"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   7440
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   1920
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.CommandButton cmdResultsOk 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Yes"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   6240
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   1920
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Label lblTemperatureOk 
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Are the results Ok"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   855
      Left            =   6240
      TabIndex        =   3
      Top             =   840
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Results"
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
      Height          =   495
      Left            =   3480
      TabIndex        =   0
      Top             =   120
      Width           =   2175
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "frmTakeInitalTinsleyTemperatures"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'all chkProbe code below makes visible/invisible as well as
'updating ProbesSelected in accordance with what has been done to the
'check button pressed

Private Sub chkProbe1_Click()
If ProbesSelected(1) = 1 Then
    txtTinsleyResult(0).Visible = False
    ProbesSelected(1) = 0
Else
    txtTinsleyResult(0).Visible = True
    ProbesSelected(1) = 1
End If
End Sub


Private Sub chkProbe10_Click()
If ProbesSelected(10) = 1 Then
    txtTinsleyResult(9).Visible = False
    ProbesSelected(10) = 0
Else
    txtTinsleyResult(9).Visible = True
    ProbesSelected(10) = 1
End If
End Sub

Private Sub chkProbe2_Click()
    If ProbesSelected(2) = 1 Then
    txtTinsleyResult(1).Visible = False
    ProbesSelected(2) = 0
Else
    txtTinsleyResult(1).Visible = True
    ProbesSelected(2) = 1
End If
End Sub

Private Sub chkProbe3_Click()
        If ProbesSelected(3) = 1 Then
    txtTinsleyResult(2).Visible = False
    ProbesSelected(3) = 0
Else
    txtTinsleyResult(2).Visible = True
    ProbesSelected(3) = 1
End If
End Sub

Private Sub chkProbe4_Click()
       If ProbesSelected(4) = 1 Then
    txtTinsleyResult(3).Visible = False
    ProbesSelected(4) = 0
Else
    txtTinsleyResult(3).Visible = True
    ProbesSelected(4) = 1
End If
End Sub

Private Sub chkProbe5_Click()
If ProbesSelected(5) = 1 Then
    txtTinsleyResult(4).Visible = False
    ProbesSelected(5) = 0
Else
    txtTinsleyResult(4).Visible = True
    ProbesSelected(5) = 1
End If
End Sub

Private Sub chkProbe6_Click()
If ProbesSelected(6) = 1 Then
    txtTinsleyResult(5).Visible = False
    ProbesSelected(6) = 0
Else
    txtTinsleyResult(5).Visible = True
    ProbesSelected(6) = 1
End If
End Sub

Private Sub chkProbe7_Click()
If ProbesSelected(7) = 1 Then
    txtTinsleyResult(6).Visible = False
    ProbesSelected(7) = 0
Else
    txtTinsleyResult(6).Visible = True
    ProbesSelected(7) = 1
End If
End Sub

Private Sub chkProbe8_Click()
If ProbesSelected(8) = 1 Then
    txtTinsleyResult(7).Visible = False
    ProbesSelected(8) = 0
Else
    txtTinsleyResult(7).Visible = True
    ProbesSelected(8) = 1
End If
End Sub

Private Sub chkProbe9_Click()
If ProbesSelected(9) = 1 Then
    txtTinsleyResult(8).Visible = False
    ProbesSelected(9) = 0
Else
    txtTinsleyResult(8).Visible = True
    ProbesSelected(9) = 1
End If
End Sub

Private Sub cmdResultsNotOk_Click()
cmdResultsNotOk.Visible = False
cmdResultsOk.Visible = False
lblTemperatureOk.Visible = False
For ProbeCounter = 2 To 13
    xlsheetResultsTemperature.Cells(ProbeCounter, Rownumber) = ""
    'Clears Excel spreadsheet by placing 0's in all boxes
    xlsheetResultsTemperatureUncorrected.Cells(ProbeCounter, Rownumber) = ""
Next ProbeCounter
'when pressed this button makes  invisible the OK/Not OK buttons
'and clears all the text boxes out
End Sub

Private Sub cmdResultsOk_Click()
Me.WindowState = vbMinimized
Rownumber = 4 ' increment rownumber to let program know the next time
'temperatures are called it is for Intermediate Material temperatures
'=============================
' Agilent changes SBB 8/3/2010
Load frmLaserReadingsI
frmLaserReadingsI.Show
'Load frmTinsleyLaserReadings
'frmTinsleyLaserReadings.Show
'=============================

'loads TinsleyLaserReading form
End Sub

Private Sub cmdTakeReadings_Click()
For ProbeCounter = 1 To 10
Me.Refresh
Me.Visible = True
Me.WindowState = vbMaximized
If ProbesSelected(ProbeCounter) = 1 Then
        xlsheetResultsTemperatureUncorrected.Cells((ProbeCounter + 1), Rownumber) = _
        TakeTinsleyReadings(ProbeCounter - 1)
'Place uncorrected result into uncorrected spreadsheet
        xlsheet.Cells(22, 2) = _
        xlsheetResultsTemperatureUncorrected.Cells((ProbeCounter + 1), Rownumber)
        xlsheet.Cells(22, 3) = ProbeCounter + 2
        txtTinsleyResult(ProbeCounter - 1) = Round((xlsheet.Cells(22, 4)), 4)
        Me.Refresh
        xlsheetResultsTemperature.Cells(ProbeCounter + 1, Rownumber) = _
        Val(txtTinsleyResult(ProbeCounter - 1))
Else
End If
'once clicked this button checks whether the ProbesSelected is = 1 then uses
'TakeTinsleyReadings mod to get Tinsley to give results which are then output to excel
Next ProbeCounter
Beep
cmdResultsNotOk.Visible = True
cmdResultsOk.Visible = True
lblTemperatureOk.Visible = True
End Sub

Private Sub Form_Load()
Unload frmCustomerDetails 'Unload customer details form
For ProbeCounter = 1 To 10
ProbesSelected(ProbeCounter) = 0
Next ProbeCounter
'clears out probe selected so all are not selected
Set xlsheet = xlbook.Sheets("Tinsley") 'goes to module TakeTemperature with name of thermometer
End Sub
