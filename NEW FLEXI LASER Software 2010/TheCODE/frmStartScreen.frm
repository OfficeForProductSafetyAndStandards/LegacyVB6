VERSION 5.00
Begin VB.Form frmStartScreen 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Flexi Laser program"
   ClientHeight    =   4350
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4500
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   15.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   4350
   ScaleWidth      =   4500
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox cboMetrologist 
      Height          =   480
      Left            =   600
      TabIndex        =   2
      Text            =   "Select Metrologist"
      Top             =   240
      Width           =   3495
   End
   Begin VB.CommandButton cmdEnd 
      Caption         =   "End Program"
      Enabled         =   0   'False
      Height          =   840
      Left            =   480
      TabIndex        =   1
      Top             =   3120
      Width           =   3495
   End
   Begin VB.CommandButton cmdStartTest 
      BackColor       =   &H000000FF&
      Caption         =   "Start Test"
      Enabled         =   0   'False
      Height          =   840
      Left            =   480
      TabIndex        =   0
      Top             =   960
      Width           =   3495
   End
End
Attribute VB_Name = "frmStartScreen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Response As String
Dim Answer As String

Private Sub cboMetrologist_Change()
cmdEnd.Enabled = True
cmdStartTest.Enabled = True
'On changing metrologist enable all buttons
End Sub

Private Sub cboMetrologist_Click()
cmdEnd.Enabled = True
cmdStartTest.Enabled = True
'On changing metrologist enable all buttons
End Sub

Private Sub cboMetrologist_Validate(Cancel As Boolean)
cmdEnd.Enabled = True
cmdStartTest.Enabled = True
'On changing metrologist enable all buttons
End Sub


Private Sub cmdEnd_Click()
CleanUp
End 'End program
End Sub

Private Sub cmdStartTest_Click()
Dim ErrorString As String
Dim Datestring As String
Dim Timestring As String
Dim Monthstring As String
Setup_For_Test
On Error GoTo CancelErrorTrap
NewFileName = InputBox("What File for saving results, use Department No for simplicity")
xlsheetResultsVOLandCustomerData.Cells(2, 2) = NewFileName
Datestring = Format(Date, "dd mmm yyyy")
Timestring = Format(Time(), "hh-mm")
NewFileName = "S:\mqu\Length Results\Flexi\" & NewFileName & " " & Datestring & " " & Timestring
'Using Department No add time and date to make this set of results unique
xlbookResults.SaveAs (NewFileName)
xlsheetResultsMeasurement.Cells(26, 5) = cboMetrologist.Text
NewFileName1 = InputBox("Enter Daybook number.  Ensure that this number is correct as it cannot be changed.")
xlsheetResultsVOLandCustomerData.Cells(12, 2) = NewFileName1
Load frmMeasurementSelection
frmMeasurementSelection.Show
Unload Me
Exit Sub
'Open frmMeasurementSelection form then unload form
CancelErrorTrap:
ErrorString = "The error was " & Err.Description & " And error number " & Err.Number
Response = MsgBox("The error was " & Err.Description & " And error number " & Err.Number, vbOKOnly)
Err.Clear
On Error GoTo 0
Exit Sub
End Sub

Private Sub Form_Load()
If Rownumber = 5 And LaserTestSetNo = 3 Then
    '==================================
    '   Agilent changes sbb 8/3/2010
    Unload frmLaserReadingsI
    'Unload frmTinsleyLaserReadings
    '==================================
    Unload frmIntermediateandFinalTinsleyTemperatures
Else
End If
Setup
'=========================================
'   Names updated SBB 8/3/2010
    cboMetrologist.AddItem "Robert Harper"
    cboMetrologist.AddItem "Leighton Burgess"
    cboMetrologist.AddItem "Alan Tuck"
    cboMetrologist.AddItem "Guest"
'unload all previous forms if from previous calibration and populate
'combo box with appropriate names
End Sub
