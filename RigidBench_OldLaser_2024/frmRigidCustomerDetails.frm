VERSION 5.00
Begin VB.Form frmCustomerDetails 
   BackColor       =   &H00C0FFC0&
   Caption         =   "Customer details"
   ClientHeight    =   8175
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8310
   LinkTopic       =   "Form1"
   ScaleHeight     =   8175
   ScaleWidth      =   8310
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox cboNames 
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      ItemData        =   "frmRigidCustomerDetails.frx":0000
      Left            =   5640
      List            =   "frmRigidCustomerDetails.frx":0002
      TabIndex        =   1
      Top             =   240
      Width           =   2415
   End
   Begin VB.CommandButton cmdQuit 
      Caption         =   "Quit program"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   5108
      TabIndex        =   15
      Top             =   7200
      Width           =   2775
   End
   Begin VB.CommandButton cmdReturn 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Return to Measurement Selection"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   480
      TabIndex        =   14
      Top             =   7200
      Width           =   2775
   End
   Begin VB.CommandButton cmdGotoNextScreen 
      BackColor       =   &H00FFFF80&
      Caption         =   "Proceed to next screen"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   1680
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   5640
      Visible         =   0   'False
      Width           =   5055
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   240
      Top             =   6600
   End
   Begin VB.TextBox txtLengthUnderTest 
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5640
      Locked          =   -1  'True
      TabIndex        =   4
      Top             =   2280
      Width           =   2415
   End
   Begin VB.TextBox txtDate 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5640
      TabIndex        =   7
      Top             =   4560
      Width           =   2415
   End
   Begin VB.TextBox txtReferenceTemperature 
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5640
      TabIndex        =   6
      Top             =   3840
      Width           =   2415
   End
   Begin VB.TextBox txtCoefficientOfThermalExpansion 
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5640
      TabIndex        =   5
      Top             =   3000
      Width           =   2415
   End
   Begin VB.TextBox txtDepartmentNumber 
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5640
      Locked          =   -1  'True
      TabIndex        =   3
      Top             =   1560
      Width           =   2415
   End
   Begin VB.TextBox txtCustomerName 
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5640
      MultiLine       =   -1  'True
      TabIndex        =   2
      Top             =   840
      Width           =   2415
   End
   Begin VB.Label LblMetrologist 
      BackStyle       =   0  'Transparent
      Caption         =   "Metrologist"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   240
      TabIndex        =   16
      Top             =   240
      Width           =   3135
   End
   Begin VB.Label lblDate 
      BackStyle       =   0  'Transparent
      Caption         =   "Date of Test"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   240
      TabIndex        =   13
      Top             =   4440
      Width           =   3135
   End
   Begin VB.Label lblReferenceTemperature 
      BackStyle       =   0  'Transparent
      Caption         =   "Reference Temperature "
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   240
      TabIndex        =   12
      Top             =   3720
      Width           =   5055
   End
   Begin VB.Label lblCoefficientOfThermalExpansion 
      BackStyle       =   0  'Transparent
      Caption         =   "Coefficient of Thermal Expansion"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   240
      TabIndex        =   11
      Top             =   3000
      Width           =   5175
   End
   Begin VB.Label lblNumberOfPoints 
      BackStyle       =   0  'Transparent
      Caption         =   "Length under test "
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   240
      TabIndex        =   10
      Top             =   2280
      Width           =   4335
   End
   Begin VB.Label lblDepartmentNumber 
      BackStyle       =   0  'Transparent
      Caption         =   "Department Number"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   240
      TabIndex        =   9
      Top             =   1560
      Width           =   3495
   End
   Begin VB.Label lblCustomerName 
      BackStyle       =   0  'Transparent
      Caption         =   "Customer Name"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   840
      Width           =   3135
   End
End
Attribute VB_Name = "frmCustomerDetails"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public laser As Integer
Public counter As Integer

Private Sub cmdGotoNextScreen_Click()
    Dim TypeOfTape As String
    Dim ClassOfTape As String
    Dim Metrologist As String
    Metrologist = cboNames.Text
    'shows metrologist names as those described in combo box
    Beep
    xlsheetResultsVOLandCustomerData.Cells(1, 2) = txtCustomerName
    xlsheetResultsMeasurement.Cells(17, 5) = Metrologist
    xlsheetResultsVOLandCustomerData.Cells(4, 2) = txtCoefficientOfThermalExpansion
    xlsheetResultsVOLandCustomerData.Cells(5, 2) = txtReferenceTemperature
    xlsheetResultsVOLandCustomerData.Cells(6, 2) = txtDate
    xlsheetResultsVOLandCustomerData.Cells(6, 3) = "Time of test was " & Format(Time, "hh:mm AMPM")
    ClassOfTape = xlsheetResultsMeasurement.Cells(15, 5)
    'the code above places all customer details into xl sheets VOL and measurement
If ClassOfTape = "Class A" Then
    Load frmVOLCompensationForm
    frmVOLCompensationForm.Show
    'if class A is selected load and show VOL Compensation Form
Else
    Load frmLaserReadingsB
    frmLaserReadingsB.Show
    'otherwise load and show LaserReadingsB form
    Unload Me
    End If
    Unload Me
    'unload this form
End Sub

Private Sub cmdQuit_Click()
    CleanUp
    Unload Me
    ' go to clean up module to close system and unload form
End
End Sub

Private Sub cmdReturn_Click()
    Load frmMeasurementSelection
    frmMeasurementSelection.Show
    Unload Me
    'go back to Measurement Selection and unload this form
End Sub

Private Sub Form_Load()
    Dim sMetrologists As String
    sMetrologists = INIRead("Metrologists", "Names")
    Dim aMetrologists() As String
    aMetrologists = Split(sMetrologists, ",")
    Dim i As Integer
    For i = 0 To UBound(aMetrologists)
       cboNames.AddItem aMetrologists(i)
    Next
   'set combo box names which can be selected from drop down
If ClassOfMeasurement = "Class B" Then
    lblCoefficientOfThermalExpansion.Visible = False
    lblReferenceTemperature.Visible = False
    txtCoefficientOfThermalExpansion.Visible = False
    txtReferenceTemperature.Visible = False
    'if Class B, do not show these text boxes
Else
End If
    txtDate.Text = Date
    'shows system date
    Refresh
    'updates the date
    txtReferenceTemperature.Text = 20
    'this sets the reference temp to the normal value of 20 degrees C, it can be changed_
    'by user interface also if required
    txtDepartmentNumber.Text = xlsheetResultsVOLandCustomerData.Cells(2, 2)
    'puts the department number obtained from start screen automatically_
    'into this form so user does not have to re-enter it, this must have been _
    'entered correctly first as I have locked the text box as changes here_
    'are not made to spreadsheet anyway as it has already been saved
    txtLengthUnderTest.Text = xlsheetResultsVOLandCustomerData.Cells(3, 2)
    'puts the length under test obtained from start screen automatically
    'into this form so user does not have to re-enter it, this must have been _
    'entered correctly first as I have locked the text box as changes here_
    'are not made to spreadsheet anyway as it has already been saved
End Sub

Private Sub txtLengthundertest_LostFocus()
If ClassOfMeasurement = "Class B" Then
    cmdGotoNextScreen.Visible = True
    'when length under test text box has been tabbed show next screen command button if Class B
Else
End If
End Sub

Private Sub txtReferenceTemperature_LostFocus()
If ClassOfMeasurement = "Class A" Then
    cmdGotoNextScreen.Visible = True
    'when reference temp text box has been tabbed show next screen command button if Class A
Else
End If
End Sub


