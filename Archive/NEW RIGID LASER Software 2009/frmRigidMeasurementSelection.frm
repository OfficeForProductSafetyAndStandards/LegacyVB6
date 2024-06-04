VERSION 5.00
Begin VB.Form frmMeasurementSelection 
   BackColor       =   &H00C0FFC0&
   Caption         =   "Laser system set up"
   ClientHeight    =   4965
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5085
   LinkTopic       =   "Form1"
   ScaleHeight     =   4965
   ScaleWidth      =   5085
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdQuit 
      Caption         =   "Quit Program"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   1080
      TabIndex        =   5
      Top             =   3840
      Width           =   2655
   End
   Begin VB.CommandButton cmdStartProgram 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Start Program"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   2400
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   2280
      Width           =   2175
   End
   Begin VB.CommandButton cmdSetUpLaser 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Set Up Laser"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   2280
      Width           =   2175
   End
   Begin VB.Frame fraImperialMetric 
      BackColor       =   &H00C0FFC0&
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
      Height          =   1215
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   4455
      Begin VB.OptionButton optMetric 
         BackColor       =   &H00C0FFC0&
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
         Height          =   375
         Left            =   240
         TabIndex        =   2
         Top             =   480
         Width           =   1695
      End
      Begin VB.OptionButton optImperial 
         BackColor       =   &H00C0FFC0&
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
         Height          =   375
         Left            =   2400
         TabIndex        =   1
         Top             =   480
         Value           =   -1  'True
         Width           =   1695
      End
   End
End
Attribute VB_Name = "frmMeasurementSelection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Public Units As String
Public BenchUsed As String

Private Sub cmdQuit_Click()
    CleanUp
    'go to module CleanUp which will place laser off-line
    Unload Me
    'unload frmMeasurement Selection
    End
End Sub

Private Sub cmdSetUpLaser_Click()
Dim dbScalefactor As Double 'change from mm to inch
    BenchUsed = "D2" 'sets bench for double pass as rigid bench
    On Error Resume Next
        xlsheetResultsMeasurement.Cells(15, 7) = "Rigid"
    'puts 'rigid' in xl measurement sheet
If optImperial = True Then
'check if imperial or metric option button selected
   Units = "in" 'set units to inches for display panel
    xlsheetResultsMeasurement.Cells(16, 5) = "Imperial"
    dbScalefactor = 0.5 / 25.4
    'puts 'imperial' in xl measurement sheet
Else
    Units = "mm" 'set units to mm for display panel
    xlsheetResultsMeasurement.Cells(16, 5) = "Metric"
    dbScalefactor = 0.5
    'puts 'Metric' in xl sheet

End If
    xlbookResults.Save
'=============================================================
'   Replaced by Agilent
'    Call setuplaser(BenchUsed, Units) 'call setuplaser module
Call SetLaserParameter(10, dbScalefactor)
Call SetLaserParameter(9, -1)   'Change laser sign
    cmdSetUpLaser.Enabled = False ' disable set up laser button
    cmdStartProgram.Enabled = True ' enable start main program button
End Sub

Private Sub cmdStartProgram_Click()
    Load frmSelectClassOfMeasurement
    frmSelectClassOfMeasurement.Show
    'load the form for setting the class and laser criteria then show it
    Unload Me
    'unload frmMeasurement Selection
End Sub

Private Sub Form_Load()
    cmdStartProgram.Enabled = False
'disable start program button until the set up
'has been completed.
End Sub


