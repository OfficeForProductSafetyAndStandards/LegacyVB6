VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form frmManualEdaleEntry 
   BackColor       =   &H00C0FFC0&
   Caption         =   "Temperature Measurement"
   ClientHeight    =   8595
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10380
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   12
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   8595
   ScaleWidth      =   10380
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   30000
      Left            =   8640
      Top             =   8280
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   15000
      Left            =   7440
      Top             =   8280
   End
   Begin MSCommLib.MSComm MSComm2 
      Left            =   9240
      Top             =   8400
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      CommPort        =   3
      DTREnable       =   -1  'True
      RThreshold      =   1
   End
   Begin VB.CommandButton cmdResultsNotOk 
      BackColor       =   &H00FFFF80&
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
      Height          =   615
      Left            =   5475
      Style           =   1  'Graphical
      TabIndex        =   57
      Top             =   7560
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.CommandButton cmdResultsOk 
      BackColor       =   &H00FFFF80&
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
      Height          =   615
      Left            =   2475
      MaskColor       =   &H0080FF80&
      Style           =   1  'Graphical
      TabIndex        =   56
      Top             =   7560
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   12
      Left            =   600
      TabIndex        =   55
      Top             =   6480
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CommandButton cmdTakeReading 
      BackColor       =   &H00FFFF80&
      Caption         =   "Take Readings"
      Enabled         =   0   'False
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
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   54
      Top             =   3720
      Width           =   3495
   End
   Begin VB.Frame fraSelectThermometer 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0FF&
      Caption         =   "Select Thermometer used"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   1455
      Left            =   5880
      TabIndex        =   51
      Top             =   2040
      Width           =   3495
      Begin VB.OptionButton optIB5361 
         BackColor       =   &H00C0C0FF&
         Caption         =   "IB5361"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   60
         Top             =   1080
         Width           =   1335
      End
      Begin VB.OptionButton optIB5391Manual 
         BackColor       =   &H00C0C0FF&
         Caption         =   "IB5391   Manual"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   1800
         TabIndex        =   53
         Top             =   360
         Width           =   1335
      End
      Begin VB.OptionButton optIB5391 
         BackColor       =   &H00C0C0FF&
         Caption         =   "IB5391   Scanning"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         TabIndex        =   52
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   11
      Left            =   600
      TabIndex        =   50
      Top             =   6000
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   10
      Left            =   600
      TabIndex        =   49
      Top             =   5520
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   9
      Left            =   600
      TabIndex        =   48
      Top             =   5040
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   8
      Left            =   600
      TabIndex        =   47
      Top             =   4560
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   7
      Left            =   600
      TabIndex        =   46
      Top             =   4080
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   6
      Left            =   600
      TabIndex        =   45
      Top             =   3600
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   5
      Left            =   600
      TabIndex        =   44
      Top             =   3120
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   4
      Left            =   600
      TabIndex        =   43
      Top             =   2640
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   3
      Left            =   600
      TabIndex        =   42
      Top             =   2160
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   2
      Left            =   600
      TabIndex        =   41
      Top             =   1680
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   600
      TabIndex        =   40
      Top             =   1080
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Frame frmChooseProbe 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFC0&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5775
      Left            =   240
      TabIndex        =   39
      Top             =   1200
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   23
      Left            =   3720
      TabIndex        =   35
      Top             =   6360
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   22
      Left            =   3720
      TabIndex        =   34
      Top             =   5880
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   21
      Left            =   3720
      TabIndex        =   33
      Top             =   5400
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   20
      Left            =   3720
      TabIndex        =   32
      Top             =   4920
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   19
      Left            =   3720
      TabIndex        =   31
      Top             =   4440
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   18
      Left            =   3720
      TabIndex        =   30
      Top             =   3960
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   17
      Left            =   3720
      TabIndex        =   29
      Top             =   3480
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   16
      Left            =   3720
      TabIndex        =   28
      Top             =   3000
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   15
      Left            =   3720
      TabIndex        =   27
      Top             =   2520
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   14
      Left            =   3720
      TabIndex        =   26
      Top             =   2040
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   13
      Left            =   3720
      TabIndex        =   25
      Top             =   1560
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   12
      Left            =   3720
      TabIndex        =   24
      Top             =   1080
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   2160
      TabIndex        =   1
      Top             =   1560
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   2160
      TabIndex        =   0
      Top             =   1080
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   2160
      TabIndex        =   2
      Top             =   2040
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   3
      Left            =   2160
      TabIndex        =   3
      Top             =   2520
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   4
      Left            =   2160
      TabIndex        =   4
      Top             =   3000
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   5
      Left            =   2160
      TabIndex        =   5
      Top             =   3480
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   6
      Left            =   2160
      TabIndex        =   6
      Top             =   3960
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   7
      Left            =   2160
      TabIndex        =   7
      Top             =   4440
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   8
      Left            =   2160
      TabIndex        =   8
      Top             =   4920
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   9
      Left            =   2160
      TabIndex        =   9
      Top             =   5400
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   10
      Left            =   2160
      TabIndex        =   10
      Top             =   5880
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00C0FFC0&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   11
      Left            =   2160
      TabIndex        =   12
      Top             =   6360
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label lblSelect 
      BackStyle       =   0  'Transparent
      Caption         =   "Reselect Thermometer"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   975
      Left            =   7800
      TabIndex        =   64
      Top             =   7440
      Visible         =   0   'False
      Width           =   2535
   End
   Begin VB.Label Label5 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Within UKAS temperature limit"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6480
      TabIndex        =   63
      Top             =   1320
      Width           =   2775
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H0000FF00&
      FillStyle       =   0  'Solid
      Height          =   495
      Left            =   5880
      Shape           =   3  'Circle
      Top             =   1200
      Width           =   375
   End
   Begin VB.Label Label3 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Below UKAS temperature limit"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6480
      TabIndex        =   62
      Top             =   720
      Width           =   2895
   End
   Begin VB.Shape Shape2 
      FillColor       =   &H00FF0000&
      FillStyle       =   0  'Solid
      Height          =   375
      Left            =   5880
      Shape           =   3  'Circle
      Top             =   720
      Width           =   375
   End
   Begin VB.Label Label2 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Above UKAS temperature limit"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6480
      TabIndex        =   61
      Top             =   240
      Width           =   2895
   End
   Begin VB.Shape Shape1 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Left            =   5880
      Shape           =   3  'Circle
      Top             =   240
      Width           =   375
   End
   Begin VB.Shape ShapeGreen 
      FillColor       =   &H00C0FFC0&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   11
      Left            =   5040
      Shape           =   3  'Circle
      Top             =   6360
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Shape ShapeGreen 
      FillColor       =   &H00C0FFC0&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   10
      Left            =   5040
      Shape           =   3  'Circle
      Top             =   5880
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Shape ShapeGreen 
      FillColor       =   &H00C0FFC0&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   9
      Left            =   5040
      Shape           =   3  'Circle
      Top             =   5400
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Shape ShapeGreen 
      FillColor       =   &H00C0FFC0&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   8
      Left            =   5040
      Shape           =   3  'Circle
      Top             =   4920
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Shape ShapeGreen 
      FillColor       =   &H00C0FFC0&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   7
      Left            =   5040
      Shape           =   3  'Circle
      Top             =   4440
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Shape ShapeGreen 
      FillColor       =   &H00C0FFC0&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   6
      Left            =   5040
      Shape           =   3  'Circle
      Top             =   3960
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Shape ShapeGreen 
      FillColor       =   &H00C0FFC0&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   5
      Left            =   5040
      Shape           =   3  'Circle
      Top             =   3480
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Shape ShapeGreen 
      FillColor       =   &H00C0FFC0&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   4
      Left            =   5040
      Shape           =   3  'Circle
      Top             =   3000
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Shape ShapeGreen 
      FillColor       =   &H00C0FFC0&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   3
      Left            =   5040
      Shape           =   3  'Circle
      Top             =   2520
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Shape ShapeGreen 
      FillColor       =   &H00C0FFC0&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   2
      Left            =   5040
      Shape           =   3  'Circle
      Top             =   2040
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Shape ShapeGreen 
      FillColor       =   &H00C0FFC0&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   1
      Left            =   5040
      Shape           =   3  'Circle
      Top             =   1560
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Shape ShapeGreen 
      FillColor       =   &H00C0FFC0&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   0
      Left            =   5040
      Shape           =   3  'Circle
      Top             =   1080
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label lblwait 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0FFC0&
      Caption         =   $"frmRigidManualEdaleEntrySQL.frx":0000
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   2175
      Left            =   5880
      TabIndex        =   59
      Top             =   5160
      Visible         =   0   'False
      Width           =   3375
   End
   Begin VB.Label lblTemperatureOk 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Are the results Ok?"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   615
      Left            =   120
      TabIndex        =   58
      Top             =   7560
      Visible         =   0   'False
      Width           =   2175
   End
   Begin VB.Label Label4 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Select Probes"
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
      Left            =   360
      TabIndex        =   38
      Top             =   360
      Width           =   735
   End
   Begin VB.Label LblCorrected 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFC0&
      Caption         =   "Corrected Results"
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
      Left            =   3360
      TabIndex        =   37
      Top             =   360
      Width           =   1695
      WordWrap        =   -1  'True
   End
   Begin VB.Label LblUncorrected 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFC0&
      Caption         =   "Uncorrected Results"
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
      Left            =   1800
      TabIndex        =   36
      Top             =   360
      Width           =   1695
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   1200
      TabIndex        =   23
      Top             =   1680
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Index           =   0
      Left            =   1200
      TabIndex        =   22
      Top             =   1200
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   1200
      TabIndex        =   21
      Top             =   2160
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   3
      Left            =   1200
      TabIndex        =   20
      Top             =   2640
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   4
      Left            =   1200
      TabIndex        =   19
      Top             =   3120
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   5
      Left            =   1200
      TabIndex        =   18
      Top             =   3600
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   6
      Left            =   1200
      TabIndex        =   17
      Top             =   4080
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   7
      Left            =   1200
      TabIndex        =   16
      Top             =   4560
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   8
      Left            =   1200
      TabIndex        =   15
      Top             =   5040
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   9
      Left            =   1200
      TabIndex        =   14
      Top             =   5520
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   10
      Left            =   1200
      TabIndex        =   13
      Top             =   6000
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   11
      Left            =   1200
      TabIndex        =   11
      Top             =   6480
      Visible         =   0   'False
      Width           =   855
   End
End
Attribute VB_Name = "frmManualEdaleEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim DepartmentNo As String
Dim reading As String
Dim intcounter As Integer
Dim probe As String
Dim result As Single

Private Sub cmdResultsNotOk_Click()
Dim x As Integer
    For x = 0 To 23 '24 text boxes
        txtManualEdale(x).Text = 0 'when 'no' button clicked,
        'clears text boxes by placing a zero in them
        xlsheetResultsTemperatureUncorrected.Cells(x + 2, Rownumber) = ""
    Next x
    For x = 0 To 11 '12 circles
    ShapeGreen(x).Visible = False 'if not OK hide these circles
    Next x
lblTemperatureOk.Visible = False 'hides these 3 buttons
cmdResultsNotOk.Visible = False
cmdResultsOk.Visible = False
optIB5391 = False
optIB5391Manual = False
optIB5361 = False
'to disable the scanning edale button as it must be reselected if different_
'probes are then selected on scanning edale
lblSelect.Visible = True
'this label tells people to reselect thermometer
If MSComm2.PortOpen = True Then
MSComm2.PortOpen = False
'if the port is open make it closed so that the edale can be rechosen_
'and will therefore not work automatically
Else
End If

End Sub

Private Sub cmdResultsOk_Click()
Dim NewFileName As String
PlaceResultsInExcel (Rownumber)
If Rownumber = 2 Then
    Rownumber = 3
    'if rownumber = 2 (VOL) then increment to 3 before unloading form
    Unload Me
ElseIf Rownumber = 3 Then
    Load frmLaserReadings
    frmLaserReadings.Show
    Rownumber = 4
    'if rownumber = 3 (initial mat.temps) then load laser reading form and increment to 4
    Unload Me
ElseIf Rownumber = 4 Then
    LaserTestSetNo = 3
    'set it here so that if results need to be taken again on 1st run they can
    Load frmLaserReadings
    frmLaserReadings.Show
    Rownumber = 5
    'if rownumber = 4 (intermediate mat.temps) then load laser reading form and increment to 5
    Unload Me
Else
    xlbookResults.Save
    PrintOutClassA
' goes to module SetUp for print instructions
    Load frmFinalSheet
    frmFinalSheet.Show 'shows final sheet
    Unload Me
    'NEW SQL CODE BELOW
Dim rs As ADODB.Recordset
Dim rsConn As ADODB.Connection
Dim strString As String
Dim rsLengthResultsRigid As ADODB.Recordset
Dim x As Integer
Dim y As Integer
Set rsConn = New ADODB.Connection
rsConn.Open ("Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=MQU_Job;Data Source=Avon\Goldmine")
Debug.Print rsConn
Set rsLengthResultsRigid = New ADODB.Recordset
rsLengthResultsRigid.Open "Select * From tblLengthResultsRigid", rsConn, adOpenDynamic, adLockOptimistic
rsLengthResultsRigid.AddNew
rsLengthResultsRigid.Fields("DayBookNo") = xlbookResults.Sheets("VOL and Customer Data").Cells(2, 2) 'will be 19,2 when changed
rsLengthResultsRigid.Fields("IntervalValue") = xlbookResults.Sheets("VOL and Customer Data").Cells(3, 2)
rsLengthResultsRigid.Fields("MeasuredValue") = xlbookResults.Sheets("Measurement Results").Cells(8, 7)
rsLengthResultsRigid.Fields("ErrorFromNominal") = xlbookResults.Sheets("Measurement Results").Cells(11, 6)
rsLengthResultsRigid.Fields("MaximumTemperature") = xlbookResults.Sheets("Temperature Results").Cells(20, 6)
rsLengthResultsRigid.Fields("MinimumTemperature") = xlbookResults.Sheets("Temperature Results").Cells(21, 6)
rsLengthResultsRigid.Fields("ExpansionCoefficient") = xlbookResults.Sheets("VOL and Customer Data").Cells(4, 2)
'rsLengthResultsRigid.Fields("UncertaintyOfMeasurement") = xlbookResults.Sheets("Measurement Results").Cells(8, 7)'this is not calculated as yet 7/12/04
Debug.Print rsLengthResultsRigid.Fields("DayBookNo")
Debug.Print rsLengthResultsRigid.Fields("IntervalValue")
Debug.Print rsLengthResultsRigid.Fields("MeasuredValue")
Debug.Print rsLengthResultsRigid.Fields("ErrorFromNominal")
Debug.Print rsLengthResultsRigid.Fields("MaximumTemperature")
Debug.Print rsLengthResultsRigid.Fields("MinimumTemperature")
Debug.Print rsLengthResultsRigid.Fields("ExpansionCoefficient")
'may need more columns for the sql info for the auto certs - need to see 7/12/04 mhd
rsLengthResultsRigid.Update
rsLengthResultsRigid.Close
'ORIGINAL CODE
         
CleanUp
End If

End Sub

Private Sub cmdTakeReading_Click()
    Dim Thermometer As String
    Dim IB3561 As String
For ProbeCounter = 1 To 12
If Check1(ProbeCounter).Value = 1 Then
ProbesSelected(ProbeCounter) = 1
Else
ProbesSelected(ProbeCounter) = 0
End If
Next ProbeCounter
'goes through probes 1 to 12 to see which ones are selected
        If optIB5361 = True Then
        Set xlsheet = xlbook.Sheets("Edale131")
        'open xl workbook and select correct sheet
        NoOfProbes = 6
        'number of probes preselected for EdaleIB5361
        CorrectEdale (NoOfProbes)
        'passes number to sub routine CorrectEdale
   
        Else
        Set xlsheet = xlbook.Sheets("IB5391")
        'open xl workbook and select correct sheet
        NoOfProbes = 6
        'number of probes preselected for IB5361
        CorrectEdale (NoOfProbes) 'goes to sub CorrectEdale  with 6 as number of probes
     
    End If
    
For ProbeCounter = 0 To 11
        txtManualEdale(ProbeCounter).Text = xlsheetResultsTemperature.Cells(ProbeCounter + 3, Rownumber)
        'puts corrected values into text boxes
Next ProbeCounter

    lblTemperatureOk.Visible = True 'make these 3 buttons visible
    cmdResultsNotOk.Visible = True
    cmdResultsOk.Visible = True
    lblSelect.Visible = False
    
End Sub

Private Sub Form_Load()
optIB5391.Value = False
'this makes sure that the option button is not selected so that the digital edale_
'does not immediately start giving results.
    Dim x As Integer
    Dim Xstring As String
    Dim Sendstr As String
For x = 0 To 11
    txtManualEdale(x).Text = "0" 'clear text boxes by placing a zero in them
    Xstring$ = Str(x + 1)
    Label1(x).Caption = "Probe" + Xstring$ 'makes labels read probe 1 to probe 12
Next x
End Sub
Sub ManualEdale(NoOfProbes)
    
For ProbeCounter = 0 To NoOfProbes
    'the number of probes set depends on which edale has been clicked
    Check1(ProbeCounter + 1).Visible = True
    'sets up checkboxes,labels and textboxes depending on number of probes
    Label1(ProbeCounter).Visible = True
    txtManualEdale(ProbeCounter).Visible = True
    txtManualEdale(ProbeCounter).Enabled = True
Next ProbeCounter
        
For ProbeCounter = 12 To (12 + NoOfProbes)
    txtManualEdale(ProbeCounter).Visible = True
    'make corrected result boxes appear
Next

If NoOfProbes > 8 Then 'if number of probes is more than 8
    For ProbeCounter = 6 To 11
        Label1(ProbeCounter).Visible = True 'show labels,checkboxes and textboxes from 6 to 11
        Check1(ProbeCounter + 1).Visible = True
        txtManualEdale(ProbeCounter).Visible = True
    Next ProbeCounter
Else
    For ProbeCounter = 6 To 11 'if probes not greater than 8
        Label1(ProbeCounter).Visible = False 'hide labels,checkboxes and textboxes from 6 to 11
        Check1(ProbeCounter + 1).Visible = False
        txtManualEdale(ProbeCounter).Visible = False
        txtManualEdale(ProbeCounter + 12).Visible = False
    Next ProbeCounter
End If
'left for up to 12 probes in case another edale is used in the future

LblUncorrected.Visible = True
LblCorrected.Visible = True
LblUncorrected.Caption = "Uncorrected Results"
'show uncorrected and corrected labels

End Sub



Private Sub MSComm2_OnComm()
On Error GoTo ErrorHandler
    Dim StrLen As Integer
    StrLen = 150 'Select the number of characters in the string before processing commences
    Select Case MSComm2.CommEvent
    Case comEvReceive 'fires if a chracter has been received in the input buffer
    reading = reading & MSComm2.Input
    'reading is the string into which the characters from the EDALE are read,
    'MSComm2.Input takes the characters from the input buffer and places them
    'in the string called reading
    Select Case intcounter
    'Select number of channel for which the temperature is to be read
        Case 1
        probe = "CH01"
        Case 2
        probe = "CH02"
        Case 3
        probe = "CH03"
        Case 4
        probe = "CH04"
        Case 5
        probe = "CH05"
        Case 6
        probe = "CH06"
        Case 7
        probe = "CH07"
        Case 8
        probe = "CH08"
        Case 9
        probe = "CH09"
        Case 10
        probe = "CH10"
        Case 11
        probe = "CH11"
        Case 12
        probe = "CH12"
    End Select
    If Len(reading) >= StrLen Then 'When the correct number of Chars is read carry on
        result = Val(Mid$(reading, ((InStr(reading, probe)) + 5), 5))
        'InStr gives the position of the selected string ie CH01 in the main string
        'the + 5 takes the point to where the temperature reading starts
        If result = 0 Then
            txtManualEdale(intcounter - 1).Text = "Error"
            Else 'put value into channels text box
            txtManualEdale(intcounter - 1).Text = result
        End If
        End If
    If intcounter < 12 Then
    'if intcounter is less than the max number of probes then increment
    intcounter = intcounter + 1
    Else
    intcounter = 1
    End If
    End Select
    Exit Sub
ErrorHandler:
MsgBox "The error was " & Err.Number & Err.Description, vbOKOnly
End
End Sub


Private Sub optIB5391_Click()
    xlsheetResultsMeasurement.Cells(16, 2) = "IB5391"
    lblwait.Visible = True
    'shows wait message for scanning edale
    lblSelect.Visible = False
    'ensure select thermometer button is no longer visible
    ManualEdale (5) 'when digital edale clicked go to sub ManualEdale with no of probes as 11
    MSComm2.PortOpen = True
    'opens port for edale
    For ProbeCounter = 0 To 5
        txtManualEdale(ProbeCounter).Enabled = False 'disable text boxes to prevent manual entry
    Next ProbeCounter
    cmdTakeReading.Enabled = False
    Timer1.Enabled = True
    Timer2.Enabled = True
    'this is so that the button waits to be enabled for the amount of time specified by the timer_
    'this ensures that adequate time is given to the scanning process
End Sub

Private Sub optIB5391Manual_Click()
Timer1.Enabled = False
Timer2.Enabled = False
'switches timers off
lblSelect.Visible = False
xlsheetResultsMeasurement.Cells(16, 2) = "IB5391"
cmdTakeReading.Enabled = True
ManualEdale (5) 'when IB5391 clicked go to sub ManualEdale with no of probes as 6
End Sub

Private Sub optIB5361_Click()
Timer1.Enabled = False
Timer2.Enabled = False
'switches timers off
lblSelect.Visible = False
xlsheetResultsMeasurement.Cells(16, 2) = "IB5361"
cmdTakeReading.Enabled = True
ManualEdale (5) 'when IB5361 clicked go to sub ManualEdale with no of probes as 6
End Sub


Sub CorrectEdale(NoOfProbes)
On Error Resume Next
    For ProbeCounter = 0 To (NoOfProbes - 1) 'takes one from NoOfProbes as text boxes start from zero
    If Check1(ProbeCounter + 1).Value = 1 And txtManualEdale(ProbeCounter).Text >= 18 Then
    'If checkboxes from 1 onwards clicked and value in text box is greater or equal to 18 then
        xlsheetResultsTemperatureUncorrected.Cells(ProbeCounter + 2, Rownumber) = _
        Val(txtManualEdale(ProbeCounter))
        xlsheet.Cells(22, 2) = Val(txtManualEdale(ProbeCounter))
        'puts value from text boxes into excel sheet
        xlsheet.Cells(22, 3) = Val(ProbeCounter + 3)
        'places probe number into excel sheet
        txtManualEdale(ProbeCounter + 12).Text = xlsheet.Cells(22, 4)
        'puts uncorrected results into sheet, then places result into edale correction sheet_
        'along with the probe number, then retrieves the corrected result to put into_
        'corrected temperature excel sheet
    Else
    End If
    If txtManualEdale(ProbeCounter + 12) < 18 Then
    ShapeGreen(ProbeCounter).FillColor = vbBlue
    ElseIf txtManualEdale(ProbeCounter + 12) > 22 Then
    ShapeGreen(ProbeCounter).FillColor = vbRed
    Else
    ShapeGreen(ProbeCounter).FillColor = vbGreen
    End If
    If Check1(ProbeCounter + 1).Value = 1 Then
    ShapeGreen(ProbeCounter).Visible = True
    Else
    ShapeGreen(ProbeCounter).Visible = False
    End If
    Next ProbeCounter
    'shows red, green or blue depending on temperatures
    On Error GoTo 0
    Refresh
    End Sub


Sub PlaceResultsInExcel(Rownumber)
For ProbeCounter = 1 To 12
    If Check1(ProbeCounter).Value = 1 Then
        xlsheetResultsTemperature.Cells(ProbeCounter + 1, Rownumber) = Val(txtManualEdale(ProbeCounter + 11).Text)
        'use results in the corrected boxes for
        'placement in EXCEL
   Else
    End If
Next ProbeCounter
xlbookResults.Save
'Save results to EXCEL
End Sub

Private Sub Timer1_Timer()
reading = Empty
'empty reading string for new string after a period of time
End Sub

Private Sub Timer2_Timer()
cmdTakeReading.Enabled = True
'Enable take reading button after a period of time
End Sub
