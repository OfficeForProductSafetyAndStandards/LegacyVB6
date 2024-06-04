VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form frmVOLCompensationForm 
   BackColor       =   &H00FFFFFF&
   Caption         =   "VOL Compensation Form"
   ClientHeight    =   5385
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9375
   LinkTopic       =   "Form1"
   ScaleHeight     =   5385
   ScaleWidth      =   9375
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdIB5270 
      BackColor       =   &H00E0E0E0&
      Caption         =   "IB5270"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   6120
      Style           =   1  'Graphical
      TabIndex        =   19
      Top             =   2040
      Width           =   1335
   End
   Begin VB.CommandButton cmdIB5271 
      BackColor       =   &H00E0E0E0&
      Caption         =   "IB5271"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   7800
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   2040
      Width           =   1335
   End
   Begin VB.CommandButton cmdIB5276 
      BackColor       =   &H00E0E0E0&
      Caption         =   "IB5276"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   6120
      Style           =   1  'Graphical
      TabIndex        =   17
      Top             =   1200
      Width           =   1335
   End
   Begin VB.CommandButton cmdIB5277 
      BackColor       =   &H00E0E0E0&
      Caption         =   "IB5277"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   7800
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   1200
      Width           =   1335
   End
   Begin VB.CommandButton cmdPrintout 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Printout VOL"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   7200
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   3720
      Width           =   1935
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   6000
      Top             =   2880
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.CommandButton cmdEndProgram 
      BackColor       =   &H00E0E0E0&
      Caption         =   "End Program"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   4920
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   3720
      Width           =   1935
   End
   Begin VB.CommandButton cmdReturnToMainMenu 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Return to main menu"
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   2640
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   3720
      Width           =   1935
   End
   Begin VB.CommandButton cmdTinsley 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Tinsley"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4560
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   360
      Width           =   1215
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
      TabIndex        =   8
      Top             =   2880
      Width           =   2175
   End
   Begin VB.CommandButton cmdTakeVOL 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Take VOL"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4560
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   2880
      Width           =   1215
   End
   Begin VB.CommandButton cmdClose 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Continue to Customer Details"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial Narrow"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   360
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   3720
      Width           =   1935
   End
   Begin VB.Timer tmrTemperature 
      Interval        =   1000
      Left            =   6720
      Top             =   3000
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
      TabIndex        =   5
      Top             =   360
      Width           =   2175
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
      TabIndex        =   4
      Top             =   2040
      Width           =   2175
   End
   Begin VB.CommandButton cmdHumidityIB5269 
      BackColor       =   &H00E0E0E0&
      Caption         =   "IB5269"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4560
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   2040
      Width           =   1215
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
      TabIndex        =   2
      Top             =   1200
      Width           =   2175
   End
   Begin VB.CommandButton cmdIB5211 
      BackColor       =   &H00E0E0E0&
      Caption         =   "IB5211"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4560
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton cmdTakeTemperature 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Edales"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   6120
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   360
      Width           =   1335
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Humidity"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2640
      TabIndex        =   14
      Top             =   2160
      Width           =   1935
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Pressure"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2640
      TabIndex        =   13
      Top             =   1320
      Width           =   1935
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Temperature"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2640
      TabIndex        =   12
      Top             =   480
      Width           =   1935
   End
End
Attribute VB_Name = "frmVOLCompensationForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub cmdClose_Click()
Dim ErrMsg As String * 100
Dim laser As Integer
Dim VOLString As String
Dim VOL As Single
VOL = xlsheetResultsVOLandCustomerData.Cells(13, 2)
VOLString = Left(VOL, 5)
VOLString = Str(VOLString)
'VOLString = VOLString + "VL" + Chr$(10)
Call ibdev(0, 3, 0, 0, 1, 0, laser)
' Define device desription
'Call Send(0, 13, VOLString, 0)
Call ibwrt(laser, VOLString + "VL" + Chr$(10))
'Puts VOL Compensation into laser
Call ibonl(laser, 0)
'Places Laser interface offline
    If (ibsta And EERR) Then
    ' Error trap for device problems
        ErrMsg = "Unable to open device" & Chr(13) & "ibsta = &H" & _
        Hex(ibsta) & Chr(13) & "iberr = " & iberr
        MsgBox ErrMsg, vbCritical, "Error"
        End
    End If
Load frmCustomerDetails
frmCustomerDetails.Show
Unload Me
End Sub

Private Sub cmdEndProgram_Click()
CleanUp
End
'clean up and end program
End Sub

Private Sub cmdHumidityIB5269_Click()
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
xlsheetResultsMeasurement.Cells(26, 2) = "IB5269"
End Sub

Private Sub cmdIB5211_Click()
txtBarometer.Text = TakeBarometerReading
xlsheetResultsMeasurement.Cells(25, 2) = "IB5211"
'go to take barometer module and put 'IB5211' into spreadsheet
End Sub

Private Sub cmdIB5270_Click()
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
xlsheetResultsMeasurement.Cells(26, 2) = "IB5270"
End Sub

Private Sub cmdIB5271_Click()
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
xlsheetResultsMeasurement.Cells(26, 2) = "IB5271"
'close Comm port display humidity reading and place 'IB5271' into the spreadsheet
End Sub

Private Sub cmdIB5276_Click()
txtBarometer.Text = TakeBarometerReading
xlsheetResultsMeasurement.Cells(25, 2) = "IB5276"
'go to take barometer module and put 'IB5211' into spreadsheet
End Sub

Private Sub cmdIB5277_Click()
txtBarometer.Text = TakeBarometerReading
xlsheetResultsMeasurement.Cells(25, 2) = "IB5277"
'go to take barometer module and put 'IB5211' into spreadsheet
End Sub

Private Sub cmdPrintout_Click()
PrintoutVOL
'run printout module
End Sub

Private Sub cmdReturnToMainMenu_Click()
    CleanUp
    Load frmStartScreen
    frmStartScreen.Show
    Unload Me
'run cleanup module, load Start screen and unload VOL form
End Sub

Private Sub cmdTakeTemperature_Click()
    TypeOfThermometer = "Edale"
    xlsheetResultsMeasurement.Cells(28, 2) = TypeOfThermometer
    xlsheetResultsMeasurement.Cells(24, 2) = "IB5390"
    Load frmManualEdaleEntry
    frmManualEdaleEntry.Show
    'set TypeOfThermometer as Edale and the IB No as IB5390 then
    'load Manual Edale form
End Sub

Private Sub cmdTakeVOL_Click()
    tmrTemperature.Enabled = False
    xlsheetResultsVOLandCustomerData.Cells(10, 2) = Val(txtHumidity.Text)
    xlsheetResultsVOLandCustomerData.Cells(11, 2) = Val(txtBarometer.Text)
    xlbookResults.Save
    txtVOL = xlsheetResultsVOLandCustomerData.Cells(13, 2)
    cmdClose.Enabled = True
    'place results from humidity and barometric pressure into spreadsheet
    'save the spreadsheet get VOL from calculated value sheet
End Sub

Private Sub cmdTinsley_Click()
    TypeOfThermometer = "Tinsley"
    xlsheetResultsMeasurement.Cells(24, 2) = "IB5272"
    xlsheetResultsMeasurement.Cells(28, 2) = TypeOfThermometer
    Load frmTakeVOLTinsleyTemperatures
    frmTakeVOLTinsleyTemperatures.Show
    'Set TypeOfThermometer as Tinsley then put the IB No of the Tinsley and Tinsley
    'in their respective boxes then load the Tinsley VOL form
End Sub

Private Sub tmrTemperature_Timer()
On Error Resume Next
txtTemperature = xlsheetResultsTemperature.Cells(16, 2)
'place the temperature in the text box or create an error which the error trap then
'resumes next
On Error GoTo 0
If txtTemperature = "" Or txtHumidity = "" Or txtBarometer = "" Then
    cmdTakeVOL.Enabled = False
Else
    cmdTakeVOL.Enabled = True
    'once all the text boxes are filled then enablle the take VOL box
End If
End Sub
