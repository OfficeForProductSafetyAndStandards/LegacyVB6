VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form frmVOLCompensationForm 
   BackColor       =   &H00C0FFC0&
   Caption         =   "VOL Compensation Form"
   ClientHeight    =   7500
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8925
   LinkTopic       =   "Form1"
   ScaleHeight     =   7500
   ScaleWidth      =   8925
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdQuit 
      Caption         =   "Print VOL and return to START screen ONLY"
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
      TabIndex        =   15
      Top             =   6480
      Width           =   3255
   End
   Begin VB.CommandButton cmdNextScreen 
      Caption         =   "No VOL? Proceed to next screen"
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
      Left            =   5475
      TabIndex        =   14
      Top             =   6480
      Width           =   3255
   End
   Begin VB.CommandButton cmdYes 
      BackColor       =   &H00FFFF80&
      Caption         =   "Proceed to initial temperature measurement "
      Enabled         =   0   'False
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
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   4560
      Width           =   5775
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00C0C0FF&
      Caption         =   "Hygrometer Used:"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2760
      TabIndex        =   9
      Top             =   2040
      Width           =   5775
      Begin VB.OptionButton Option5271 
         BackColor       =   &H00C0C0FF&
         Caption         =   "IB5271"
         Height          =   255
         Left            =   4680
         TabIndex        =   12
         Top             =   240
         Width           =   975
      End
      Begin VB.OptionButton Option5270 
         BackColor       =   &H00C0C0FF&
         Caption         =   "IB5270"
         Height          =   255
         Left            =   3120
         TabIndex        =   11
         Top             =   240
         Width           =   975
      End
      Begin VB.OptionButton Option5269 
         BackColor       =   &H00C0C0FF&
         Caption         =   "IB5269"
         Height          =   255
         Left            =   1800
         TabIndex        =   10
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.TextBox txtHumidity 
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   360
      TabIndex        =   8
      Top             =   2040
      Width           =   2175
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00C0C0FF&
      Caption         =   "Barometer Used:"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2760
      TabIndex        =   5
      Top             =   1200
      Width           =   5775
      Begin VB.OptionButton Option5277 
         BackColor       =   &H00C0C0FF&
         Caption         =   "IB5277"
         Height          =   255
         Left            =   4680
         TabIndex        =   16
         Top             =   240
         Width           =   855
      End
      Begin VB.OptionButton Option5276 
         BackColor       =   &H00C0C0FF&
         Caption         =   "IB5276"
         Height          =   255
         Left            =   3120
         TabIndex        =   7
         Top             =   240
         Width           =   855
      End
      Begin VB.OptionButton Option5211 
         BackColor       =   &H00C0C0FF&
         Caption         =   "IB5211"
         Height          =   255
         Left            =   1800
         TabIndex        =   6
         Top             =   240
         Width           =   855
      End
   End
   Begin VB.TextBox txtBarometer 
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   360
      TabIndex        =   4
      Top             =   1200
      Width           =   2175
   End
   Begin VB.TextBox txtVOL 
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   360
      TabIndex        =   3
      Top             =   3480
      Width           =   2175
   End
   Begin VB.CommandButton cmdTakeVOL 
      BackColor       =   &H00C0C0FF&
      Caption         =   "Take VOL"
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
      Height          =   615
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   3480
      Width           =   5775
   End
   Begin VB.Timer tmrTemperature 
      Interval        =   1000
      Left            =   1080
      Top             =   4320
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   360
      Top             =   4320
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      CommPort        =   7
      DTREnable       =   -1  'True
   End
   Begin VB.TextBox txtTemperature 
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   360
      TabIndex        =   1
      Top             =   360
      Width           =   2175
   End
   Begin VB.CommandButton cmdTakeTemperature 
      BackColor       =   &H00C0C0FF&
      Caption         =   "Select Thermometer and take Temperature"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2760
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   360
      Width           =   5775
   End
End
Attribute VB_Name = "frmVOLCompensationForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub CmdClose_Click()
CleanUp
    'go to CleanUp module to close the system
    Unload Me
    'unload this form
    End
End Sub

Private Sub cmdNextScreen_Click()
Rownumber = 3
'make rownumber 3 which will be initial material temperatures even though_
'VOL has not been taken which is rownumber 2
Load frmManualEdaleEntry
    frmManualEdaleEntry.Show
    Unload Me
    'if this pressed go go manual edale screen without taking another VOL
End Sub

Private Sub cmdTakeTemperature_Click()
    Load frmManualEdaleEntry
    frmManualEdaleEntry.Show
    'load and show manual edale form for VOL temperatures
End Sub

Private Sub cmdTakeVOL_Click()
Dim dbVol As Double
tmrTemperature.Enabled = False
xlsheetResultsVOLandCustomerData.Cells(8, 2) = Val(txtHumidity.Text)
xlsheetResultsVOLandCustomerData.Cells(9, 2) = Val(txtBarometer.Text)
'places humidity and barometer reading in row and column index
''=============================================
'   Agilent code
Call E1735A_SetParameter(1, Val(txtTemperature.Text))   'Temp °C
Call E1735A_SetParameter(2, Val(txtBarometer.Text) / 10) 'mbar to Pascal
Call E1735A_SetParameter(3, Val(txtHumidity.Text))  '% humidity
dbVol = Format((Val(E1735A_GetParameter(4)) * 1000 - 999) * 1000, "###.00")
Debug.Print dbVol
xlsheetResultsVOLandCustomerData.Cells(11, 2) = dbVol


xlbookResults.Save
txtVOL = xlsheetResultsVOLandCustomerData.Cells(11, 2)
'shows final calculated VOL from xl in text box
CmdYes.Enabled = True
'Yes box shown
End Sub

Private Sub CmdYes_Click()
'when this pressed the manual edale entry form is reopened_
'this time for initial material temperatures
Beep
'Dim ErrMsg As String * 100
'Dim laser As Integer
'Dim VOLString As String
'Dim VOL As Single
'Dim dbVOL As Double
'VOL = xlsheetResultsVOLandCustomerData.Cells(11, 2)
'VOLString = Left(VOL, 5)
'VOLString = Str(VOLString)
''''=============================================
'''   Agilent code
''Call E1735A_SetParameter(1, Val(txtTemperature.Text))   'Temp °C
''Call E1735A_SetParameter(2, Val(txtBarometer.Text) / 10) 'mbar to Pascal
''Call E1735A_SetParameter(3, Val(txtHumidity.Text))  '% humidity
''dbVOL = (Val(E1735A_GetParameter(4)) * 1000 - 999) * 1000
''Debug.Print dbVOL
''xlsheetResultsVOLandCustomerData.Cells(11, 2) = dbVOL
'
'xlbookResults.Save
PrintoutVOL
'this goes to module SetUp for print instructions
Load frmManualEdaleEntry
    frmManualEdaleEntry.Show
    Unload Me
    End Sub


Private Sub cmdQuit_Click()
    PrintoutVOL
    'goes to module SetUp for print instructionsLoad frmStartScreen
    Unload Me
    'unload this form
    Load frmStartScreen
    frmStartScreen.Show
    'this gives the user the choice to restart a lowlevel program or_
    'quit program
End Sub

Private Sub Option5211_Click()
txtBarometer.Text = TakeBarometerReading
xlsheetResultsMeasurement.Cells(17, 2) = "IB5211"
'reading in text box taken from module
End Sub

Private Sub Option5276_Click()
txtBarometer.Text = TakeBarometerReading
xlsheetResultsMeasurement.Cells(17, 2) = "IB5276"
'reading in text box taken from module
End Sub

Private Sub Option5269_Click()
Dim HumidityReading As Single
MSComm1.PortOpen = True 'Open Comm port for Novasina
MSComm1.InBufferCount = 0 'Empty input buffer
Do
Loop Until MSComm1.InBufferCount >= 22
'Continue until there are 22 characters in the input buffer
On Error Resume Next
HumidityReading = Val(Mid$(MSComm1.Input, 9, 4))
'Read 4 characters from the 9th for humidity
If Err.Number = 13 Then
'If the data coming out of the error handler is not a string ignore error
End If
Err.Clear
On Error GoTo 0
MSComm1.PortOpen = False
txtHumidity.Text = HumidityReading
'value in text box is humidity reading obtained in this sub routine
xlsheetResultsMeasurement.Cells(18, 2) = "IB5269"
End Sub

Private Sub Option5270_Click()
Dim HumidityReading As Single
MSComm1.PortOpen = True 'Open Comm port for Novasina
MSComm1.InBufferCount = 0 'Empty input buffer
Do
Loop Until MSComm1.InBufferCount >= 22
'Continue until there are 22 characters in the input buffer
On Error Resume Next
HumidityReading = Val(Mid$(MSComm1.Input, 9, 4))
'Read 4 characters from the 9th for humidity
If Err.Number = 13 Then
'If the data coming out of the error handler is not a string ignore error
End If
Err.Clear
On Error GoTo 0
MSComm1.PortOpen = False
'close communication port
txtHumidity.Text = HumidityReading
'value in text box is humidity reading obtained from this sub routine
xlsheetResultsMeasurement.Cells(18, 2) = "IB5270"
End Sub

Private Sub Option5271_Click()
Dim HumidityReading As Single
MSComm1.PortOpen = True 'Open Comm port for Novasina
MSComm1.InBufferCount = 0 'Empty input buffer
Do
Loop Until MSComm1.InBufferCount >= 22
'Continue until there are 22 characters in the input buffer
On Error Resume Next
HumidityReading = Val(Mid$(MSComm1.Input, 9, 4))
'Read 4 characters from the 9th for humidity
If Err.Number = 13 Then
'If the data coming out of the error handler is not a string ignore error
End If
Err.Clear
On Error GoTo 0
MSComm1.PortOpen = False
'close communication port
txtHumidity.Text = HumidityReading
' value in this text box is obtained from this sub routine
xlsheetResultsMeasurement.Cells(18, 2) = "IB5271"
End Sub

Private Sub Option5277_Click()
txtBarometer.Text = TakeBarometerReading
xlsheetResultsMeasurement.Cells(17, 2) = "IB5277"
'reading in text box taken from module
End Sub

Private Sub tmrTemperature_Timer()
'if any of the text boxes are empty then do not show the VOL button
On Error Resume Next
txtTemperature = xlsheetResultsTemperature.Cells(16, 2)
txtTemperature = Round(xlsheetResultsTemperature.Cells(16, 2), (4))
'the line above rounds the number to 4 decimal places for neatness, it does_
'not make any difference to the calculations
On Error GoTo 0
If txtTemperature = "" Or txtHumidity = "" Or txtBarometer = "" Then
'if any of the text boxes above are blank do not show VOL button
    cmdTakeVOL.Enabled = False
Else
    cmdTakeVOL.Enabled = True
    'if all boxes filled show VOL button
End If
End Sub


