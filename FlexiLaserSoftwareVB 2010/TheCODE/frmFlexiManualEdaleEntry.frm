VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form frmManualEdaleEntry 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Edale Manual Temperature Measurement"
   ClientHeight    =   8595
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8310
   LinkTopic       =   "Form1"
   ScaleHeight     =   8595
   ScaleWidth      =   8310
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   30000
      Left            =   120
      Top             =   4800
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   15000
      Left            =   120
      Top             =   5280
   End
   Begin MSCommLib.MSComm MSComm2 
      Left            =   120
      Top             =   5880
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      CommPort        =   3
      DTREnable       =   -1  'True
      RThreshold      =   1
   End
   Begin VB.CommandButton cmdResultsNotOk 
      Caption         =   "No"
      Height          =   495
      Left            =   7200
      TabIndex        =   55
      Top             =   7320
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.CommandButton cmdResultsOk 
      Caption         =   "Yes"
      Height          =   495
      Left            =   6480
      TabIndex        =   54
      Top             =   7320
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   12
      Left            =   1200
      TabIndex        =   53
      Top             =   6120
      Width           =   255
   End
   Begin VB.CommandButton cmdTakeReading 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Correct reading"
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
      Left            =   4080
      Style           =   1  'Graphical
      TabIndex        =   52
      Top             =   6600
      Width           =   2295
   End
   Begin VB.Frame fraSelectThermometer 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Select Temperature Entry Method"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   1215
      Left            =   120
      TabIndex        =   51
      Top             =   6600
      Width           =   3735
      Begin VB.OptionButton optIB5390Manual 
         BackColor       =   &H80000005&
         Caption         =   "Manual"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   58
         Top             =   720
         Width           =   2415
      End
      Begin VB.OptionButton optIB5390 
         BackColor       =   &H80000005&
         Caption         =   "Automatic"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   57
         Top             =   360
         Width           =   2655
      End
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   11
      Left            =   1200
      TabIndex        =   50
      Top             =   5640
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   10
      Left            =   1200
      TabIndex        =   49
      Top             =   5160
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   9
      Left            =   1200
      TabIndex        =   48
      Top             =   4680
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   8
      Left            =   1200
      TabIndex        =   47
      Top             =   4200
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   7
      Left            =   1200
      TabIndex        =   46
      Top             =   3720
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   6
      Left            =   1200
      TabIndex        =   45
      Top             =   3240
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   5
      Left            =   1200
      TabIndex        =   44
      Top             =   2760
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   4
      Left            =   1200
      TabIndex        =   43
      Top             =   2280
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   3
      Left            =   1200
      TabIndex        =   42
      Top             =   1800
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   2
      Left            =   1200
      TabIndex        =   41
      Top             =   1320
      Width           =   255
   End
   Begin VB.CheckBox Check1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Check1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   1200
      TabIndex        =   40
      Top             =   840
      Width           =   255
   End
   Begin VB.Frame frmChooseProbe 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   5775
      Left            =   840
      TabIndex        =   39
      Top             =   600
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   23
      Left            =   3960
      TabIndex        =   35
      Top             =   6000
      Width           =   1095
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   22
      Left            =   3960
      TabIndex        =   34
      Top             =   5520
      Width           =   1095
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   21
      Left            =   3960
      TabIndex        =   33
      Top             =   5040
      Width           =   1095
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   20
      Left            =   3960
      TabIndex        =   32
      Top             =   4560
      Width           =   1095
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   19
      Left            =   3960
      TabIndex        =   31
      Top             =   4080
      Width           =   1095
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   18
      Left            =   3960
      TabIndex        =   30
      Top             =   3600
      Width           =   1095
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   17
      Left            =   3960
      TabIndex        =   29
      Top             =   3120
      Width           =   1095
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   16
      Left            =   3960
      TabIndex        =   28
      Top             =   2640
      Width           =   1095
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   15
      Left            =   3960
      TabIndex        =   27
      Top             =   2160
      Width           =   1095
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "0.00"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   2057
         SubFormatType   =   1
      EndProperty
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   14
      Left            =   3960
      TabIndex        =   26
      Top             =   1680
      Width           =   1095
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "0.00"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   2057
         SubFormatType   =   1
      EndProperty
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   13
      Left            =   3960
      TabIndex        =   25
      Top             =   1200
      Width           =   1095
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "0.00"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   2057
         SubFormatType   =   1
      EndProperty
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   12
      Left            =   3960
      TabIndex        =   24
      Top             =   720
      Width           =   1095
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   2760
      TabIndex        =   1
      Top             =   1200
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   2760
      TabIndex        =   0
      Top             =   720
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   2760
      TabIndex        =   2
      Top             =   1680
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   3
      Left            =   2760
      TabIndex        =   3
      Top             =   2160
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   4
      Left            =   2760
      TabIndex        =   4
      Top             =   2640
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   5
      Left            =   2760
      TabIndex        =   5
      Top             =   3120
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   6
      Left            =   2760
      TabIndex        =   6
      Top             =   3600
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   7
      Left            =   2760
      TabIndex        =   7
      Top             =   4080
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   8
      Left            =   2760
      TabIndex        =   8
      Top             =   4560
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   9
      Left            =   2760
      TabIndex        =   9
      Top             =   5040
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   10
      Left            =   2760
      TabIndex        =   10
      Top             =   5520
      Width           =   855
   End
   Begin VB.TextBox txtManualEdale 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   11
      Left            =   2760
      TabIndex        =   12
      Top             =   6000
      Width           =   855
   End
   Begin VB.Label Label9 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "NOTE: - Only click correct reading when all temperatures have been entered or read from the Edales"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   615
      Left            =   120
      TabIndex        =   63
      Top             =   7920
      Width           =   8055
   End
   Begin VB.Label Label8 
      BackStyle       =   0  'Transparent
      Caption         =   "Under UKAS Temperature Limits"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6360
      TabIndex        =   62
      Top             =   5520
      Width           =   1935
   End
   Begin VB.Shape Shape3 
      FillColor       =   &H00FF0000&
      FillStyle       =   0  'Solid
      Height          =   375
      Left            =   6360
      Shape           =   3  'Circle
      Top             =   5040
      Width           =   375
   End
   Begin VB.Label Label7 
      BackStyle       =   0  'Transparent
      Caption         =   "Within UKAS Temperature Limits"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6360
      TabIndex        =   61
      Top             =   4080
      Width           =   1935
   End
   Begin VB.Shape Shape2 
      FillColor       =   &H0000FF00&
      FillStyle       =   0  'Solid
      Height          =   375
      Left            =   6360
      Shape           =   3  'Circle
      Top             =   3600
      Width           =   375
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "Over UKAS Temperature Limits"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6360
      TabIndex        =   60
      Top             =   2640
      Width           =   1935
   End
   Begin VB.Shape Shape1 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Left            =   6360
      Shape           =   3  'Circle
      Top             =   2160
      Width           =   375
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Legend for temperature indicators"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   6240
      TabIndex        =   59
      Top             =   720
      Width           =   2055
   End
   Begin VB.Shape shapeRed 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   11
      Left            =   5640
      Shape           =   3  'Circle
      Top             =   6000
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Shape shapeRed 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   10
      Left            =   5640
      Shape           =   3  'Circle
      Top             =   5520
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Shape shapeRed 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   9
      Left            =   5640
      Shape           =   3  'Circle
      Top             =   5040
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Shape shapeRed 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   8
      Left            =   5640
      Shape           =   3  'Circle
      Top             =   4560
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Shape shapeRed 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   7
      Left            =   5640
      Shape           =   3  'Circle
      Top             =   4080
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Shape shapeRed 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   6
      Left            =   5640
      Shape           =   3  'Circle
      Top             =   3600
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Shape shapeRed 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   5
      Left            =   5640
      Shape           =   3  'Circle
      Top             =   3120
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Shape shapeRed 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   4
      Left            =   5640
      Shape           =   3  'Circle
      Top             =   2640
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Shape shapeRed 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   3
      Left            =   5640
      Shape           =   3  'Circle
      Top             =   2160
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Shape shapeRed 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   2
      Left            =   5640
      Shape           =   3  'Circle
      Top             =   1680
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Shape shapeRed 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   1
      Left            =   5640
      Shape           =   3  'Circle
      Top             =   1200
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Shape shapeRed 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   375
      Index           =   0
      Left            =   5640
      Shape           =   3  'Circle
      Top             =   720
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Label lblTemperatureOk 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "Are the results Ok"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   6480
      TabIndex        =   56
      Top             =   6720
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Label Label4 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Select Probes"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   840
      TabIndex        =   38
      Top             =   0
      Width           =   735
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "Corrected Results"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   3960
      TabIndex        =   37
      Top             =   0
      Width           =   975
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      Caption         =   "Uncorrected Results"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1800
      TabIndex        =   36
      Top             =   0
      Width           =   1815
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   1800
      TabIndex        =   23
      Top             =   1320
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   1800
      TabIndex        =   22
      Top             =   840
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   1800
      TabIndex        =   21
      Top             =   1800
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   3
      Left            =   1800
      TabIndex        =   20
      Top             =   2280
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   4
      Left            =   1800
      TabIndex        =   19
      Top             =   2760
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   5
      Left            =   1800
      TabIndex        =   18
      Top             =   3240
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   6
      Left            =   1800
      TabIndex        =   17
      Top             =   3720
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   7
      Left            =   1800
      TabIndex        =   16
      Top             =   4200
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   8
      Left            =   1800
      TabIndex        =   15
      Top             =   4680
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   9
      Left            =   1800
      TabIndex        =   14
      Top             =   5160
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   10
      Left            =   1800
      TabIndex        =   13
      Top             =   5640
      Width           =   855
   End
   Begin VB.Label Label1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   11
      Left            =   1800
      TabIndex        =   11
      Top             =   6120
      Width           =   855
   End
End
Attribute VB_Name = "frmManualEdaleEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public ProbeCounter As Integer
Public NoOfProbes As Integer
Dim DepartmentNo As String
Dim reading As String
Dim intcounter As Integer
Dim probe As String
Dim result As Single

Private Sub cmdResultsNotOk_Click()
Dim X As Integer
    For X = 0 To 23
        txtManualEdale(X).Text = 0 'when 'no' button clicked,
        'clears text boxes by placing a zero in them
        xlsheetResultsTemperatureUncorrected.Cells(X + 2, Rownumber) = ""
    Next X
    For X = 0 To 11
    shapeRed(X).Visible = False
    Next X
lblTemperatureOk.Visible = False 'hides these 3 buttons
cmdResultsNotOk.Visible = False
cmdResultsOk.Visible = False
If optIB5390.value = True Then
cmdTakeReading.Enabled = False
Else
End If
'hides take reading button to allow time for the digital scanning Edales
'time to bring up proper set of readings if Automatic readings are selected
End Sub

Private Sub cmdResultsOk_Click()
Dim ResponseString As String
Dim Response As String
On Error GoTo ErrorTrap
PlaceResultsInExcel (Rownumber)
'Use PlaceResultsInExcel to put all corrected values in excel
If Rownumber = 2 Then
    Rownumber = 3 'if rownumber = 2 (VOL) then increment before unloading form
    Unload Me
ElseIf Rownumber = 3 Then
    '================================
    '   Agilent SBB 8/3/2010
    Unload Me
    Load frmLaserReadingsI
    frmLaserReadingsI.Show
    'Load frmTinsleyLaserReadings
    'frmTinsleyLaserReadings.Show
    '=================================
    Rownumber = 4
    'if rownumber = 3 (Initial Material Temperatures) then load laser form and increment
ElseIf Rownumber = 4 Then
    '================================
    '   Agilent changes SBB 8/3/2010
    Unload Me
    Load frmLaserReadingsI
    frmLaserReadingsI.Show
    'Load frmTinsleyLaserReadings
    'frmTinsleyLaserReadings.Show
    '=================================
    Rownumber = 5
    'if rownumber = 4 (Intermediate Material Temperatures) then load laser form and increment
Else
xlbookResults.Save
'SQL CODE TRY OUT 7/12/04 MHD
Dim rs As ADODB.Recordset
Dim rsConn As ADODB.Connection
Dim strString As String
Dim rsLengthResultsFlexi As ADODB.Recordset
Dim X As Integer
Dim Y As Integer
Set rsConn = New ADODB.Connection
rsConn.Open ("Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=MQU_Job;Data Source=Avon\Goldmine")
Debug.Print rsConn
Set rsLengthResultsFlexi = New ADODB.Recordset
rsLengthResultsFlexi.Open "Select * From tblLengthResultsFlexi", rsConn, adOpenDynamic, adLockOptimistic
rsLengthResultsFlexi.AddNew
rsLengthResultsFlexi.Fields("DayBookNo") = xlbookResults.Sheets("VOL and Customer Data").Cells(12, 2)
rsLengthResultsFlexi.Fields("IntervalValue") = xlbookResults.Sheets("Measurement Results").Cells(4, 7)
rsLengthResultsFlexi.Fields("MeasuredValue") = xlbookResults.Sheets("Measurement Results").Cells(4, 6)
rsLengthResultsFlexi.Fields("ErrorFromNominal") = xlbookResults.Sheets("Measurement Results").Cells(4, 8)
'all the values above will need to have multiple fields as flexi do a number of results each time - look into this, mhd 7/12/04
rsLengthResultsFlexi.Fields("MaximumTemperature") = xlbookResults.Sheets("Temperature Results").Cells(21, 5)
rsLengthResultsFlexi.Fields("MinimumTemperature") = xlbookResults.Sheets("Temperature Results").Cells(22, 5)
rsLengthResultsFlexi.Fields("ExpansionCoefficient") = xlbookResults.Sheets("VOL and Customer Data").Cells(5, 2)
rsLengthResultsFlexi.Fields("UncertaintyOfMeasurement") = xlbookResults.Sheets("Measurement Results").Cells(4, 9)
rsLengthResultsFlexi.Fields("TensionWeight") = xlbookResults.Sheets("VOL and Customer Data").Cells(4, 2)
Debug.Print rsLengthResultsFlexi.Fields("DayBookNo")
Debug.Print rsLengthResultsFlexi.Fields("IntervalValue")
Debug.Print rsLengthResultsFlexi.Fields("MeasuredValue")
Debug.Print rsLengthResultsFlexi.Fields("ErrorFromNominal")
Debug.Print rsLengthResultsFlexi.Fields("MaximumTemperature")
Debug.Print rsLengthResultsFlexi.Fields("MinimumTemperature")
Debug.Print rsLengthResultsFlexi.Fields("ExpansionCoefficient")
Debug.Print rsLengthResultsFlexi.Fields("TensionWeight")
'may need more columns for the sql info for the auto certs - need to see 7/12/04 mhd
rsLengthResultsFlexi.Update
rsLengthResultsFlexi.Close
'END OF SQL CODE TRY OUT

PrintOutClassAandB
CleanUp
'if rownumber = 5 (Final Material Temperatures) then save excel results
'as per department no
End 'End program
End If
Exit Sub
ErrorTrap:
ResponseString = "The error was " & Err.Description & vbCrLf & "The error number was " & Err.Number
Response = MsgBox(ResponseString, vbOKOnly)
On Error GoTo 0
End
End Sub

Private Sub cmdTakeReading_Click()
Dim Thermometer As String
For ProbeCounter = 1 To 12
    If Check1(ProbeCounter).value = 1 Then
        ProbesSelected(ProbeCounter) = 1
    Else
        ProbesSelected(ProbeCounter) = 0
    End If
    'If the check box is ticked make ProbesSelected(Probecounter) = 1
    'signifying that this is selected
Next ProbeCounter

Set xlsheet = xlbook.Sheets("IB5390") 'goes to module TakeTemperature with name of thermometer
CorrectEdale (12) 'goes to sub CorrectEdale  with 6 as number of probes
For ProbeCounter = 0 To 11
    txtManualEdale(ProbeCounter).Text = xlsheetResultsTemperature.Cells(ProbeCounter + 3, Rownumber)
'place corrected values in text boxes
Next ProbeCounter

lblTemperatureOk.Visible = True 'make these 3 buttons visible
cmdResultsNotOk.Visible = True
cmdResultsOk.Visible = True
End Sub

Private Sub MSComm2_OnComm()
    On Error GoTo ErrorHandler
    Dim StrLen As Integer
    StrLen = 150 'Select the number of characters in the string before processing commences
    Select Case MSComm2.CommEvent
    Case comEvReceive 'fires if a chracter has been received in the input buffer
    reading = reading & MSComm2.Input
    'reading is the string into which the characters from the EDALE are read,
    'MSComm1.Input takes the characters from the input buffer and places them
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

Private Sub Form_Load()
lblTemperatureOk.Visible = False 'make these 3 buttons visible
cmdResultsNotOk.Visible = False
cmdResultsOk.Visible = False
Dim X As Integer
Dim Xstring As String
Dim Sendstr As String
For X = 0 To 11
    txtManualEdale(X).Text = 0 'clear text boxes by placing a zero in them
    Xstring$ = Str(X + 1)
    Label1(X).Caption = "Probe" + Xstring$ 'makes labels read probe 1 to probe 12
Next X
optIB5390Manual.value = True
End Sub

Sub CorrectEdale(NoOfProbes)
On Error Resume Next
    For ProbeCounter = 0 To (NoOfProbes - 1) 'takes one from NoOfProbes as text boxes start from zero
    If Check1(ProbeCounter + 1).value = 1 And txtManualEdale(ProbeCounter).Text >= 0 Then
    'If checkboxes from 1 onwards clicked and value in text box is greater or equal to 18 then
        xlsheetResultsTemperatureUncorrected.Cells(ProbeCounter + 2, Rownumber) = _
        Val(txtManualEdale(ProbeCounter))
        xlsheet.Cells(22, 2) = Val(txtManualEdale(ProbeCounter)) 'puts value from text boxes into excel sheet
        xlsheet.Cells(22, 3) = Val(ProbeCounter + 3) 'places probenumber in excel for comparison
        txtManualEdale(ProbeCounter + 12).Text = Round(xlsheet.Cells(22, 4), 2)
    Else
    End If
'Place uncorrected results into uncorrected results sheet then place result into
'the Edale correction sheet along with the pribe number then retreive the corrected
'results into the corrected results sheet
    If txtManualEdale(ProbeCounter + 12) < 18 Then
    shapeRed(ProbeCounter).FillColor = vbBlue
    ElseIf txtManualEdale(ProbeCounter + 12) > 22 Then
    shapeRed(ProbeCounter).FillColor = vbRed
    Else
    shapeRed(ProbeCounter).FillColor = vbGreen
    End If
    If Check1(ProbeCounter + 1).value = 1 Then
    shapeRed(ProbeCounter).Visible = True
    Else
    shapeRed(ProbeCounter).Visible = False
    End If
    Next ProbeCounter
'Display appropriate coloured dot in accordance with what ever temperature the
'correction has shown up
On Error GoTo 0
Refresh
End Sub

Sub PlaceResultsInExcel(Rownumber)
For ProbeCounter = 1 To 12
    If Check1(ProbeCounter).value = 1 Then
        xlsheetResultsTemperature.Cells(ProbeCounter + 1, Rownumber) = Val(txtManualEdale(ProbeCounter + 11).Text)
        'If the thermometer is an Edale then use results in the corrected boxes for
        'placement in EXCEL
        'Use the results in the first column of boxes to place in EXCEL
    Else
    End If
Next ProbeCounter
xlbookResults.Save
'Save results to EXCEL
End Sub

Private Sub optIB5390_Click()
xlsheetResultsMeasurement.Cells(24, 2) = "IB5390"
'ManualEdale (11) 'when digital edale clicked go to sub ManualEdale with no of probes as 11
MSComm2.PortOpen = True 'Open comm port for EDALE
For ProbeCounter = 0 To 11
    txtManualEdale(ProbeCounter).Enabled = False
'disable text boxes to prevent manual entry
Next ProbeCounter
Timer1.Enabled = True
Timer2.Enabled = True
End Sub

Private Sub optIB5390Manual_Click()
cmdTakeReading.Enabled = True
Timer1.Enabled = False
Timer2.Enabled = False
'enable the take reading button and stop the timers
End Sub

Private Sub Timer1_Timer()
reading = Empty
'empty reading string for new string after a period of time
End Sub

Private Sub Timer2_Timer()
cmdTakeReading.Enabled = True
'Enable take reading button after a period of time
End Sub
