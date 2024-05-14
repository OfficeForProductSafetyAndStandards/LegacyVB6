VERSION 5.00
Begin VB.Form frmFinalSheet 
   BackColor       =   &H00C0FFC0&
   Caption         =   "End of Calibration"
   ClientHeight    =   5160
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8760
   LinkTopic       =   "Form1"
   ScaleHeight     =   5160
   ScaleWidth      =   8760
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdQuit 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Quit Program"
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
      Height          =   855
      Left            =   2633
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   3960
      Width           =   3495
   End
   Begin VB.CommandButton CmdNo 
      BackColor       =   &H00FFFF80&
      Caption         =   "No"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   4519
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton CmdYes 
      BackColor       =   &H00FFFF80&
      Caption         =   "Yes"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   3026
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   2640
      Width           =   1215
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "End of Calibration.  Your results have been saved in Excel as S:\mqu\LengthResults\Rigid\deptnumber-interval-date-time.xls "
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   173
      TabIndex        =   4
      Top             =   240
      Width           =   8415
   End
   Begin VB.Label Label2 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Do you want to continue calibration?"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1913
      TabIndex        =   0
      Top             =   1560
      Width           =   4935
   End
End
Attribute VB_Name = "frmFinalSheet"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdQuit_Click()
    CleanUp
    Unload Me
    'unload this form
    End
End Sub

Private Sub CmdYes_Click()
Load frmStartScreen
frmStartScreen.Show
Unload Me
'to continue calibration load start screen and unload this screen
End Sub

Private Sub CmdNo_Click()
cmdQuit.Enabled = True
'shows quit button if no clicked so program can be exited
End Sub

