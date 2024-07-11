VERSION 5.00
Begin VB.Form frmCustomerDetails 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Customer details"
   ClientHeight    =   7665
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9330
   LinkTopic       =   "Form1"
   ScaleHeight     =   7665
   ScaleWidth      =   9330
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox cboMaterial 
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
      Height          =   480
      Left            =   6720
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   2280
      Width           =   2415
   End
   Begin VB.CommandButton cmdGotoNextScreen 
      BackColor       =   &H00E0E0E0&
      Caption         =   "OK?"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   6720
      MousePointer    =   4  'Icon
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   5760
      Visible         =   0   'False
      Width           =   2415
   End
   Begin VB.TextBox txtNumberOfPoints 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6720
      TabIndex        =   2
      Top             =   1560
      Width           =   2415
   End
   Begin VB.TextBox txtDate 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6720
      TabIndex        =   6
      Top             =   5160
      Width           =   2415
   End
   Begin VB.TextBox txtTensionWeight 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6720
      TabIndex        =   5
      Top             =   4440
      Width           =   2415
   End
   Begin VB.TextBox txtReferenceTemperature 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6720
      TabIndex        =   3
      Top             =   3720
      Width           =   2415
   End
   Begin VB.TextBox txtDepartmentNumber 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6720
      TabIndex        =   11
      TabStop         =   0   'False
      Top             =   840
      Width           =   2415
   End
   Begin VB.TextBox txtCustomerName 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6720
      MultiLine       =   -1  'True
      TabIndex        =   1
      Top             =   240
      Width           =   2415
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Tab away from the tension weight to get OK to carry on to next stage"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   975
      Left            =   240
      TabIndex        =   17
      Top             =   5760
      Width           =   6255
   End
   Begin VB.Label lblSelectedCoefficient 
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   20.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   495
      Left            =   6720
      TabIndex        =   16
      Top             =   3000
      Width           =   2415
   End
   Begin VB.Label lblTapeMaterial 
      BackStyle       =   0  'Transparent
      Caption         =   "Tape Material"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   20.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   615
      Left            =   240
      TabIndex        =   15
      Top             =   2280
      Width           =   4815
   End
   Begin VB.Label lblDate 
      BackStyle       =   0  'Transparent
      Caption         =   "Date of Test"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   20.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   495
      Left            =   240
      TabIndex        =   13
      Top             =   5160
      Width           =   3135
   End
   Begin VB.Label lblTensionWeight 
      BackStyle       =   0  'Transparent
      Caption         =   "Tension Weight"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   20.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   495
      Left            =   240
      TabIndex        =   12
      Top             =   4440
      Width           =   3135
   End
   Begin VB.Label lblReferenceTemperature 
      BackStyle       =   0  'Transparent
      Caption         =   "Reference Temperature"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   20.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   495
      Left            =   240
      TabIndex        =   10
      Top             =   3720
      Width           =   5055
   End
   Begin VB.Label lblCoefficientOfThermalExpansion 
      BackStyle       =   0  'Transparent
      Caption         =   "Coefficient of Thermal Expansion"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   20.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   495
      Left            =   240
      TabIndex        =   9
      Top             =   3000
      Width           =   6375
   End
   Begin VB.Label lblNumberOfPoints 
      BackStyle       =   0  'Transparent
      Caption         =   "Number of Points"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   20.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   495
      Left            =   240
      TabIndex        =   8
      Top             =   1560
      Width           =   3135
   End
   Begin VB.Label lblDepartmentNumber 
      BackStyle       =   0  'Transparent
      Caption         =   "Department Number"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   20.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   495
      Left            =   240
      TabIndex        =   7
      Top             =   840
      Width           =   6255
   End
   Begin VB.Label lblCustomerName 
      BackStyle       =   0  'Transparent
      Caption         =   "Customer Name"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   20.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   3135
   End
End
Attribute VB_Name = "frmCustomerDetails"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim TapeMaterial As String
Dim TapeCoefficient As Single
Private Sub cboMaterial_Click()
TapeMaterial = cboMaterial.Text
'Change the material to match the selected value in the combo box
Select Case TapeMaterial
'Change the label for coefficient of thermal expansion in line with the
'selected material
Case "Aluminium"
lblSelectedCoefficient.Caption = 23.1
Case "Brass"
lblSelectedCoefficient.Caption = 17.5
Case "Bronze"
lblSelectedCoefficient.Caption = 17.3
Case "Invar"
lblSelectedCoefficient.Caption = 0.76
Case "Nickel Steel"
lblSelectedCoefficient.Caption = 11.42
Case "Steel"
lblSelectedCoefficient.Caption = 10.7
Case "Stainless Steel"
lblSelectedCoefficient.Caption = 14.7
Case "Carbon Steel"
lblSelectedCoefficient.Caption = 12.5
Case "Other"
TapeCoefficient = InputBox("Enter Expansion Coefficient ", "Expansion Coefficient")
lblSelectedCoefficient.Caption = TapeCoefficient
'if Other is selected then bring up an Input box for entering the required
'coefficient of expansion
End Select
End Sub

Private Sub cmdGotoNextScreen_Click()
On Error Resume Next
Dim X As Integer
Dim Point As Single
Dim TypeOfTape As String
Dim ClassOfTape As String
Dim Units As String
If xlsheetResultsMeasurement.Cells(25, 5) = "Metric" Then
Units = "metres"
Else
Units = "feet"
End If
For X = 4 To (Val(txtNumberOfPoints) + 3)
Point = InputBox("Length of interval No. " & (X - 3) & " in " & Units)
xlsheetResultsMeasurement.Cells(X, 7) = Point
Next X
'use loop to enter required points into the spreadsheet so calculations
'can be made on them
xlsheetResultsVOLandCustomerData.Cells(1, 2) = txtCustomerName
NoOfPoints = Val(txtNumberOfPoints)
xlsheetResultsVOLandCustomerData.Cells(3, 2) = txtNumberOfPoints
xlsheetResultsVOLandCustomerData.Cells(4, 2) = txtTensionWeight
If cboMaterial.Text = "Other" Then
xlsheetResultsVOLandCustomerData.Cells(5, 2) = TapeCoefficient
Else
xlsheetResultsVOLandCustomerData.Cells(5, 2) = Val(lblSelectedCoefficient.Caption)
End If
xlsheetResultsVOLandCustomerData.Cells(7, 2) = txtReferenceTemperature
xlsheetResultsVOLandCustomerData.Cells(8, 2) = txtDate
xlsheetResultsVOLandCustomerData.Cells(8, 3) = "Time of test was " & Format(Time, "hh:mm AMPM")
xlsheetResultsVOLandCustomerData.Cells(6, 2) = TapeMaterial
'Place all customer details in the appropriate excel cells in VOL and Customer Data
ClassOfTape = xlsheetResultsMeasurement.Cells(24, 5)
'Get value for class of tape from Excel as deposited by previous screens
TypeOfThermometer = xlsheetResultsMeasurement.Cells(28, 2)
If (ClassOfTape = "Class I" Or ClassOfTape = "Class II") _
And TypeOfThermometer = "Tinsley" Then
    Load frmTakeInitalTinsleyTemperatures
    frmTakeInitalTinsleyTemperatures.Show
ElseIf (ClassOfTape = "Class I" Or ClassOfTape = "Class II") _
And TypeOfThermometer = "Edale" Then
    Load frmManualEdaleEntry
    frmManualEdaleEntry.Show
Else
    Load frmLaserClassC
    frmLaserClassC.Show
End If
'Check Class of tape and the thermometer used in order to open the correct
'next screen
On Error GoTo 0
Unload Me
'unload form
End Sub

Private Sub Form_Load()
txtDate.Text = Date
txtDepartmentNumber.Text = xlsheetResultsVOLandCustomerData.Cells(2, 2)
If xlsheetResultsMeasurement.Cells(24, 5) = "Class III" Then
    lblSelectedCoefficient.Visible = False
    txtReferenceTemperature.Visible = False
    lblCoefficientOfThermalExpansion.Visible = False
    lblReferenceTemperature.Visible = False
    lblTapeMaterial.Visible = False
    cboMaterial.Visible = False
    txtNumberOfPoints.Visible = True
Else
End If
'Load form and place department number in text box and determine the class
'of tape and hide the text boxes that don't need to be used
End Sub

Private Sub txtTensionWeight_LostFocus()
cmdGotoNextScreen.Visible = True
'once the tension weight is tabbed away from the next screen button
'appears
End Sub
