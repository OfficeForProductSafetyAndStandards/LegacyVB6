VERSION 5.00
Begin VB.Form frmStartScreen 
   BackColor       =   &H00C0FFC0&
   Caption         =   "Rigid Laser program"
   ClientHeight    =   3900
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4935
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
   ScaleHeight     =   3900
   ScaleWidth      =   4935
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdEnd 
      Caption         =   "Quit Program"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   1140
      TabIndex        =   1
      Top             =   2880
      Width           =   2655
   End
   Begin VB.CommandButton cmdStartTest 
      Caption         =   "Start Test"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   1140
      TabIndex        =   0
      Top             =   1560
      Width           =   2655
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "2 metre rigid length program"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   300
      TabIndex        =   2
      Top             =   600
      Width           =   4335
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

Private Sub cmdEnd_Click()
    Unload Me
    'unload frmStartScreen
    End
    'end program
End Sub

Private Sub cmdStartTest_Click()
Dim ErrorString As String
Dim Datestring As String
Dim Timestring As String
Dim Monthstring As String
Setup_For_Test
On Error GoTo CancelErrorTrap
NewFileName3 = InputBox("Enter Daybook number.  Ensure that this number is correct as it cannot be changed.")
'input box for daybook number mhd 30/11/04
NewFileName1 = InputBox("Enter Department Number.  Ensure that this number is correct as it cannot be changed.")
'input box for department number
NewFileName2 = InputBox("Enter Graduation under test in mm or inches.  Ensure that this number is correct as it cannot be changed.")
'input box for graduation under test
xlsheetResultsVOLandCustomerData.Cells(2, 2) = NewFileName1
xlsheetResultsVOLandCustomerData.Cells(3, 2) = NewFileName2
xlsheetResultsVOLandCustomerData.Cells(19, 2) = NewFileName3 'need to input this into excel sheet which is protected mhd 30/11/04
Datestring = Format(Date, "dd mmm yyyy")
Timestring = Format(Time(), "hh-mm")
NewFileName = "S:\mqu\Length Results\Rigid\" & NewFileName1 & "-" & NewFileName2 & " " & Datestring & " " & Timestring
'new file name is dept number, graduation and time and date to make this  set of results unique
xlbookResults.SaveAs (NewFileName)

Load frmMeasurementSelection
frmMeasurementSelection.Show
Unload Me
Exit Sub
'Open frmMeasurementSelection form then unload this form

CancelErrorTrap:
ErrorString = "The error was " & Err.Description & " And error number " & Err.Number
Response = MsgBox("The error was " & Err.Description & " And error number " & Err.Number, vbOKOnly)
Err.Clear
On Error GoTo 0
Exit Sub
End Sub


Private Sub Form_Load()
Setup 'go to set up module to initialize excel start up
End Sub
