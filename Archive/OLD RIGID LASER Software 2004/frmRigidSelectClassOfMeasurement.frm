VERSION 5.00
Begin VB.Form frmSelectClassOfMeasurement 
   BackColor       =   &H00C0FFC0&
   Caption         =   "Select Class"
   ClientHeight    =   6630
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9315
   LinkTopic       =   "Form1"
   ScaleHeight     =   6630
   ScaleWidth      =   9315
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdContinue 
      BackColor       =   &H00FFFF80&
      Caption         =   "Continue Calibration"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   2162
      MaskColor       =   &H8000000A&
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   3960
      Width           =   5175
   End
   Begin VB.CommandButton cmdClassB 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Class B"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2282
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   2520
      Width           =   1455
   End
   Begin VB.CommandButton cmdIB3812 
      BackColor       =   &H00C0C0C0&
      Caption         =   "IB 3812"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   358
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   1560
      Width           =   1455
   End
   Begin VB.CommandButton cmdIB4073 
      BackColor       =   &H00C0C0C0&
      Caption         =   "IB 4073"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   373
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   2520
      Width           =   1455
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00C0FFC0&
      Height          =   2055
      Left            =   6677
      TabIndex        =   7
      Top             =   1320
      Width           =   1695
      Begin VB.OptionButton OptYes 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Yes"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   240
         TabIndex        =   9
         Top             =   1080
         Width           =   1215
      End
      Begin VB.OptionButton OptNo 
         BackColor       =   &H00C0FFC0&
         Caption         =   "No"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   240
         TabIndex        =   8
         Top             =   480
         Width           =   1215
      End
   End
   Begin VB.CommandButton cmdClassA 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Class A"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2297
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   1560
      Width           =   1455
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00C0FFC0&
      Height          =   2055
      Left            =   4397
      TabIndex        =   2
      Top             =   1320
      Width           =   1695
      Begin VB.OptionButton OptClassIII 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Class III"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   1680
         Width           =   1335
      End
      Begin VB.OptionButton OptClassII 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Class II"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   1080
         Width           =   1335
      End
      Begin VB.OptionButton OptClassI 
         BackColor       =   &H00C0FFC0&
         Caption         =   "Class I"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   480
         Width           =   1335
      End
   End
   Begin VB.CommandButton cmdQuit 
      Caption         =   "Quit program"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   6302
      TabIndex        =   1
      Top             =   5400
      Width           =   2655
   End
   Begin VB.CommandButton CmdPrevious 
      Caption         =   "Return to Measurement Selection"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   542
      TabIndex        =   0
      Top             =   5400
      Width           =   2655
   End
   Begin VB.Label lblSelectLaser 
      BackStyle       =   0  'Transparent
      Caption         =   "Select Laser"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   435
      TabIndex        =   17
      Top             =   120
      Width           =   1695
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Select class of rule"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   4397
      TabIndex        =   16
      Top             =   120
      Width           =   1935
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Is the rule a composite measure?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   6677
      TabIndex        =   15
      Top             =   0
      Width           =   2055
   End
   Begin VB.Label lblSelectClass 
      BackStyle       =   0  'Transparent
      Caption         =   "Select Class of Cal."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   2413
      TabIndex        =   14
      Top             =   120
      Width           =   1695
   End
End
Attribute VB_Name = "frmSelectClassOfMeasurement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdContinue_Click()
    Load frmCustomerDetails
    frmCustomerDetails.Show
    Unload Me
    'load and show frmCustomerDetails and unload this form
    
End Sub

Private Sub cmdIB3812_Click()
    cmdClassA.Enabled = True
    cmdClassB.Enabled = True
    cmdIB4073.Enabled = False
    On Error Resume Next
    xlsheetResultsMeasurement.Cells(19, 2) = "IB3812"
    'when IB3812 selected show Class buttons and put IB3812 into xl sheet
End Sub

Private Sub CmdPrevious_Click()
    Load frmMeasurementSelection
    frmMeasurementSelection.Show
    'load and show previous screen
    Unload Me
    'unload this form
End Sub

Private Sub cmdQuit_Click()
    CleanUp
    'go to CleanUp module to close the system
    Unload Me
    'unload this form
    End
End Sub

Private Sub Form_Load()
'    Setup
    'go to SetUp module which will set public variables and open excel worksheets
End Sub
Private Sub cmdClassA_Click()
cmdClassB.Enabled = False
    xlsheetResultsMeasurement.Cells(15, 5) = "Class A"
    'put class A into xl sheet
    xlbookResults.Save
    ClassOfMeasurement = "Class A"
    xlsheetResultsMeasurement.Cells(5, 1) = 2
    'put 2 into xl sheet to show that 2 readings are taken
    xlsheetResultsMeasurement.Cells(6, 1) = "Zero"
    'puts zero into xl sheet to show that this reading is the zero point
End Sub

Private Sub cmdClassB_Click()
cmdClassA.Enabled = False
    xlsheetResultsMeasurement.Cells(15, 5) = "Class B"
    'puts class B into xl sheet
    xlbookResults.Save
    xlsheetResultsMeasurement.Cells(5, 1) = ""
    'puts nothing into this box as only one reading is taken
    ClassOfMeasurement = "Class B"
End Sub


Private Sub cmdIB4073_Click()
    cmdClassA.Enabled = True
    cmdClassB.Enabled = True
    xlsheetResultsMeasurement.Cells(19, 2) = "IB4073"
    'when IB4073 selected show Class buttons and put IB4073 into xl sheet
End Sub


Private Sub OptClassI_Click()
xlsheetResultsMeasurement.Cells(15, 6) = "Class I"
End Sub

Private Sub OptClassII_Click()
xlsheetResultsMeasurement.Cells(15, 6) = "Class II"
End Sub

Private Sub OptClassIII_Click()
xlsheetResultsMeasurement.Cells(15, 6) = "Class III"
End Sub

Private Sub Option1_Click()

End Sub

Private Sub OptNo_Click()
xlsheetResultsMeasurement.Cells(18, 5) = "No"
End Sub

Private Sub OptYes_Click()
xlsheetResultsMeasurement.Cells(18, 5) = "Yes"
End Sub
