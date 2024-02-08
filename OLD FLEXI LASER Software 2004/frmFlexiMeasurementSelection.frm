VERSION 5.00
Begin VB.Form frmMeasurementSelection 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Laser system set up"
   ClientHeight    =   7755
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6180
   LinkTopic       =   "Form1"
   ScaleHeight     =   7755
   ScaleWidth      =   6180
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdNextScreenWithoutVOL 
      BackColor       =   &H00E0E0E0&
      Caption         =   "No VOL"
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
      Height          =   1215
      Left            =   3240
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   6360
      Width           =   2655
   End
   Begin VB.CommandButton cmdNextScreen 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Take VOL"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   6360
      Width           =   2535
   End
   Begin VB.Frame fraLaser 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Select Laser"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2295
      Left            =   240
      TabIndex        =   11
      Top             =   2880
      Width           =   1815
      Begin VB.OptionButton optIB4073 
         BackColor       =   &H00FFFFFF&
         Caption         =   "IB4073"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   120
         TabIndex        =   13
         Top             =   1080
         Value           =   -1  'True
         Width           =   1335
      End
      Begin VB.OptionButton optIB3812 
         BackColor       =   &H00FFFFFF&
         Caption         =   "IB3812"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   12
         Top             =   600
         Width           =   1215
      End
   End
   Begin VB.Frame fraComposite 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Composite"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2295
      Left            =   4200
      TabIndex        =   8
      Top             =   2880
      Width           =   1695
      Begin VB.OptionButton optNoComposite 
         BackColor       =   &H00FFFFFF&
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
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   1200
         Value           =   -1  'True
         Width           =   1335
      End
      Begin VB.OptionButton optYesComposite 
         BackColor       =   &H00FFFFFF&
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
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   600
         Width           =   1215
      End
   End
   Begin VB.Frame fraClass 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Class of Tape"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2295
      Left            =   2160
      TabIndex        =   4
      Top             =   2880
      Width           =   1935
      Begin VB.OptionButton optClassIII 
         BackColor       =   &H00FFFFFF&
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
         Height          =   375
         Left            =   240
         TabIndex        =   7
         Top             =   1680
         Width           =   1335
      End
      Begin VB.OptionButton optClassII 
         BackColor       =   &H00FFFFFF&
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
         Height          =   375
         Left            =   240
         TabIndex        =   6
         Top             =   1140
         Width           =   1215
      End
      Begin VB.OptionButton optClassI 
         BackColor       =   &H00FFFFFF&
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
         Height          =   375
         Left            =   240
         TabIndex        =   5
         Top             =   600
         Width           =   1335
      End
   End
   Begin VB.CommandButton cmdSetUpLaser 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      Caption         =   "Set Up Laser for Metric or Imperial"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   840
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   1680
      Width           =   4455
   End
   Begin VB.Frame fraImperialMetric 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Imperial or Metric"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   1215
      Left            =   840
      TabIndex        =   0
      Top             =   240
      Width           =   4455
      Begin VB.OptionButton optMetric 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Metric"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF8080&
         Height          =   375
         Left            =   2160
         TabIndex        =   2
         Top             =   600
         Value           =   -1  'True
         Width           =   1695
      End
      Begin VB.OptionButton optImperial 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Imperial"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF8080&
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Top             =   600
         Width           =   1695
      End
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Make appropriate selections above and select whether to take VOL before taking laser measurements"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   120
      TabIndex        =   16
      Top             =   5280
      Width           =   6015
   End
End
Attribute VB_Name = "frmMeasurementSelection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public Units As String
Public BenchUsed As String


Private Sub cmdNextScreen_Click()
Load frmVOLCompensationForm
frmVOLCompensationForm.Show
Unload Me
'Load the VOL compensation then unload the Measurement form
End Sub

Private Sub cmdNextScreenWithoutVOL_Click()
Load frmCustomerDetails
frmCustomerDetails.Show
Unload Me
'Load the Customer form then unload the Measurement form
End Sub

Private Sub cmdSetUpLaser_Click()
BenchUsed = "D1" 'sets bench for single pass
If optImperial = True Then
'check if imperial or metric option button selected
Units = "UE" 'set units to inches on display panel
xlsheetResultsMeasurement.Cells(25, 5) = "Imperial"
Else
Units = "UM" 'set units to mm on display panel
xlsheetResultsMeasurement.Cells(25, 5) = "Metric"
End If
xlbookResults.Save
Call setuplaser(BenchUsed, Units) 'call setuplaser module
cmdSetUpLaser.Enabled = False ' disable set up laser button
End Sub


Private Sub Form_Load()
xlsheetResultsMeasurement.Cells(27, 2) = "IB4073"
xlsheetResultsMeasurement.Cells(27, 5) = "No"
xlsheetResultsMeasurement.Cells(25, 5) = "Metric"
'On loading the form set default values
End Sub

Private Sub optClassI_Click()
xlsheetResultsMeasurement.Cells(24, 5) = "Class I"
cmdNextScreenWithoutVOL.Enabled = False
cmdNextScreen.Enabled = True
'set Class as Class I then enable next screen button
End Sub

Private Sub optClassII_Click()
xlsheetResultsMeasurement.Cells(24, 5) = "Class II"
cmdNextScreenWithoutVOL.Enabled = False
cmdNextScreen.Enabled = True
'set Class as Class II then enable next screen button
End Sub

Private Sub optClassIII_Click()
xlsheetResultsMeasurement.Cells(24, 5) = "Class III"
cmdNextScreenWithoutVOL.Enabled = True
cmdNextScreen.Enabled = False
'set Class as Class III then enable next screen button
End Sub

Private Sub optIB3812_Click()
xlsheetResultsMeasurement.Cells(27, 2) = "IB3812"
'place Laser number in spreadsheet IB3812
End Sub

Private Sub optIB4073_Click()
xlsheetResultsMeasurement.Cells(27, 2) = "IB4073"
'place Laser number in spreadsheet IB4073
End Sub

Private Sub optNoComposite_Click()
xlsheetResultsMeasurement.Cells(27, 5) = "No"
'place composite as 'no' into spreadsheet
End Sub

Private Sub optYesComposite_Click()
xlsheetResultsMeasurement.Cells(27, 5) = "Yes"
'place composite as 'yes' into spreadsheet
End Sub
