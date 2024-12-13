VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMassExtract 
   BackColor       =   &H00C0FFC0&
   Caption         =   "Mass Extractor 2024"
   ClientHeight    =   7515
   ClientLeft      =   2715
   ClientTop       =   1560
   ClientWidth     =   10095
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   ScaleHeight     =   7515
   ScaleWidth      =   10095
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtDayBookNo 
      Height          =   375
      Index           =   4
      Left            =   8280
      TabIndex        =   38
      Top             =   3000
      Width           =   1575
   End
   Begin VB.TextBox txtDayBookNo 
      Height          =   375
      Index           =   3
      Left            =   6600
      TabIndex        =   37
      Top             =   3000
      Width           =   1575
   End
   Begin VB.TextBox txtDayBookNo 
      Height          =   375
      Index           =   2
      Left            =   4920
      TabIndex        =   36
      Top             =   3000
      Width           =   1575
   End
   Begin VB.TextBox txtDayBookNo 
      Height          =   375
      Index           =   1
      Left            =   3240
      TabIndex        =   35
      Top             =   3000
      Width           =   1575
   End
   Begin VB.TextBox txtDayBookNo 
      Height          =   375
      Index           =   0
      Left            =   1560
      TabIndex        =   34
      Top             =   3000
      Width           =   1575
   End
   Begin VB.ComboBox cboClass 
      Height          =   315
      Index           =   4
      ItemData        =   "Mass Extractor.frx":0000
      Left            =   8280
      List            =   "Mass Extractor.frx":000A
      TabIndex        =   31
      Text            =   "Combo1"
      Top             =   3480
      Width           =   1575
   End
   Begin VB.ComboBox cboClass 
      Height          =   315
      Index           =   3
      ItemData        =   "Mass Extractor.frx":0016
      Left            =   6600
      List            =   "Mass Extractor.frx":0020
      TabIndex        =   30
      Text            =   "Combo1"
      Top             =   3480
      Width           =   1575
   End
   Begin VB.ComboBox cboClass 
      Height          =   315
      Index           =   2
      ItemData        =   "Mass Extractor.frx":002C
      Left            =   4920
      List            =   "Mass Extractor.frx":0036
      TabIndex        =   29
      Text            =   "Combo1"
      Top             =   3480
      Width           =   1575
   End
   Begin VB.ComboBox cboClass 
      Height          =   315
      Index           =   1
      ItemData        =   "Mass Extractor.frx":0042
      Left            =   3240
      List            =   "Mass Extractor.frx":004C
      TabIndex        =   28
      Text            =   "Combo1"
      Top             =   3480
      Width           =   1575
   End
   Begin VB.ComboBox cboClass 
      Height          =   315
      Index           =   0
      ItemData        =   "Mass Extractor.frx":0058
      Left            =   1560
      List            =   "Mass Extractor.frx":0062
      TabIndex        =   27
      Text            =   "Combo1"
      Top             =   3480
      Width           =   1575
   End
   Begin VB.CommandButton cmdSelectTestData 
      BackColor       =   &H0080C0FF&
      Caption         =   "Select Test Data"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   25
      Top             =   4800
      Width           =   2175
   End
   Begin VB.CheckBox chkStandardsTest 
      Caption         =   "Ignore database"
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
      Left            =   3240
      TabIndex        =   24
      Top             =   3960
      Value           =   1  'Checked
      Width           =   6615
   End
   Begin VB.TextBox txtSTDNo 
      Height          =   375
      Index           =   3
      Left            =   6600
      TabIndex        =   23
      Top             =   2520
      Width           =   1575
   End
   Begin VB.ComboBox cboMetrologist 
      Height          =   315
      ItemData        =   "Mass Extractor.frx":006E
      Left            =   1560
      List            =   "Mass Extractor.frx":0070
      TabIndex        =   22
      Top             =   3960
      Width           =   1575
   End
   Begin VB.TextBox txtSTDNo 
      Height          =   375
      Index           =   4
      Left            =   8280
      TabIndex        =   21
      Top             =   2520
      Width           =   1575
   End
   Begin VB.TextBox txtCustomerNo 
      Height          =   1335
      Index           =   4
      Left            =   8280
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   20
      Text            =   "Mass Extractor.frx":0072
      Top             =   1080
      Width           =   1575
   End
   Begin VB.TextBox txtCustomerNo 
      Height          =   1335
      Index           =   3
      Left            =   6600
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   19
      Text            =   "Mass Extractor.frx":0078
      Top             =   1080
      Width           =   1575
   End
   Begin VB.TextBox txtDeptNo 
      Height          =   375
      Index           =   4
      Left            =   8280
      TabIndex        =   18
      Top             =   600
      Width           =   1575
   End
   Begin VB.TextBox txtDeptNo 
      Height          =   375
      Index           =   3
      Left            =   6600
      TabIndex        =   17
      Top             =   600
      Width           =   1575
   End
   Begin VB.TextBox txtSTDNo 
      Height          =   375
      Index           =   2
      Left            =   4920
      TabIndex        =   16
      Top             =   2520
      Width           =   1575
   End
   Begin VB.TextBox txtSTDNo 
      Height          =   375
      Index           =   1
      Left            =   3240
      TabIndex        =   15
      Top             =   2520
      Width           =   1575
   End
   Begin VB.TextBox txtSTDNo 
      Height          =   375
      Index           =   0
      Left            =   1560
      TabIndex        =   14
      Top             =   2520
      Width           =   1575
   End
   Begin VB.TextBox txtCustomerNo 
      Height          =   1335
      Index           =   2
      Left            =   4920
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   13
      Text            =   "Mass Extractor.frx":007E
      Top             =   1080
      Width           =   1575
   End
   Begin VB.TextBox txtCustomerNo 
      Height          =   1335
      Index           =   1
      Left            =   3240
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   12
      Text            =   "Mass Extractor.frx":0084
      Top             =   1080
      Width           =   1575
   End
   Begin VB.TextBox txtCustomerNo 
      Height          =   1335
      Index           =   0
      Left            =   1560
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   11
      Text            =   "Mass Extractor.frx":008A
      Top             =   1080
      Width           =   1575
   End
   Begin VB.TextBox txtDeptNo 
      Height          =   375
      Index           =   2
      Left            =   4920
      TabIndex        =   10
      Top             =   600
      Width           =   1575
   End
   Begin VB.TextBox txtDeptNo 
      Height          =   375
      Index           =   1
      Left            =   3240
      TabIndex        =   9
      Top             =   600
      Width           =   1575
   End
   Begin VB.TextBox txtDeptNo 
      Height          =   375
      Index           =   0
      Left            =   1560
      TabIndex        =   8
      Top             =   600
      Width           =   1575
   End
   Begin VB.CommandButton cmdEnd 
      BackColor       =   &H0080C0FF&
      Caption         =   "End"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   4800
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   4800
      Width           =   2175
   End
   Begin VB.CommandButton cmdExtractData 
      BackColor       =   &H0080C0FF&
      Caption         =   "Extract data"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   2520
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   4800
      Width           =   2175
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   240
      Top             =   1560
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Label Label7 
      Caption         =   "DayBook No"
      Height          =   375
      Left            =   240
      TabIndex        =   33
      Top             =   3000
      Width           =   1215
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   $"Mass Extractor.frx":0090
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1575
      Left            =   240
      TabIndex        =   32
      Top             =   5640
      Width           =   9375
   End
   Begin VB.Label Label9 
      Caption         =   "Class Of Test"
      Height          =   375
      Left            =   240
      TabIndex        =   26
      Top             =   3480
      Width           =   1215
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      Caption         =   "Set Details"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1560
      TabIndex        =   7
      Top             =   120
      Width           =   8295
   End
   Begin VB.Label Label6 
      Caption         =   "Tested By"
      Height          =   375
      Left            =   240
      TabIndex        =   6
      Top             =   3960
      Width           =   1215
   End
   Begin VB.Label Label5 
      Caption         =   "STD No"
      Height          =   375
      Left            =   240
      TabIndex        =   5
      Top             =   2520
      Width           =   1215
   End
   Begin VB.Label Label4 
      Caption         =   "Customer"
      Height          =   375
      Left            =   240
      TabIndex        =   4
      Top             =   1080
      Width           =   1215
   End
   Begin VB.Label Label3 
      Caption         =   "Department No"
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   600
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Weight Details"
      Height          =   375
      Left            =   240
      TabIndex        =   2
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmMassExtract"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim strStartTime As String   'the start time of the environmentals
Dim strStartDate As String  'the date the calibration started
Dim strEndTime As String     'the finish time of the environmentals
Dim strDuration As String   'Duration if the calibtaion
Dim dtStartTime As Date     'The full formated start date & time
Dim dtEndTime As Date       'The full formated end date and time
Dim iTempProbeNo() As Integer
Dim strBalanceId As String


Public Sub cmdSelectTestData_Click()
'On Error GoTo ErrorHandler
Dim RowCounter As Integer
Dim i As Integer
Dim iDay As Integer
Dim dtTime As Date

RowCounter = 1
Set xl = CreateObject("Excel.Application")
Set xlResults = CreateObject("Excel.Application")
MsgBox "Select worksheet with results data and wait for transposition of results"
Dim NextFile As String
CommonDialog1.InitDir = App.Path & "\AX64004 Results"
'CommonDialog1.InitDir = "\\Avon\shared\mqu\AX64004 Results" 'this folder is OK, mhd 11/04
'set directory for Mettler results
CommonDialog1.Filter = "Excel Sheets (.xls)|*.xls"
CommonDialog1.ShowOpen
NextFile = CommonDialog1.FileName
If NextFile = "" Then Exit Sub
Set xlBookResults = xlResults.Workbooks.Open(NextFile)
'xlResults.Visible = True
Set xlSheetResults = xlBookResults.Worksheets(1)
xlResults.Visible = True

'Set FileType = CreateObject("Scripting.FileSystemObject")
'Set FileModification = FileType.GetFile(NextFile)
'WhenCreated = DateValue(FileModification.DateCreated)
'WhenModified = FileModification.DateLastModified
'Set FileType = Nothing
'Set FileModification = Nothing

'   Get the type of balance used, first line of file
strBalanceId = xlSheetResults.Cells(RowCounter, 1)
strBalanceId = UCase(Left(strBalanceId, InStr(strBalanceId, "control") - 1))


'   Get the start date/time
Do Until InStr(xlSheetResults.Cells(RowCounter, 1), "Start date")
RowCounter = RowCounter + 1
Loop
strStartDate = Trim(Mid(xlSheetResults.Cells(RowCounter, 1), 40, 15))
RowCounter = RowCounter + 1
strStartTime = Trim(Mid(xlSheetResults.Cells(RowCounter, 1), 37, 12))
dtStartTime = Format(strStartDate, "dd/mm/yyyy") & Format(strStartTime, " hh:mm:ss")

RowCounter = RowCounter + 1
'strDuration = Trim(Mid(xlSheetResults.Cells(RowCounter, 1), 40, 12))
'dtEndTime = DateAdd("h", Left(strDuration, InStr(strDuration, ":") - 1), dtStartTime) 'add the hours
'dtEndTime = DateAdd("n", Right(strDuration, 2) + 20, dtEndTime) 'add the minutes plus a 20 min overlap

Do Until xlSheetResults.Cells(RowCounter, 1) = "Position"
RowCounter = RowCounter + 1
Loop

'   Assign the row where the weight positions start
Position1 = RowCounter + 1
RowCounter = Position1

'   count the rows that contain the position info
Do Until xlSheetResults.Cells(RowCounter, 1) = ""
RowCounter = RowCounter + 1
Loop
Position2 = RowCounter - 1

'   Go through the entries in the position and trim the position format
With xlSheetResults
    For i = Position1 To Position2
        .Cells(i, 1) = Trim(.Cells(i, 1))
    Next i
End With


    ''   Find the information regarding the balance
    '   I have removed this, as unfortunately not all the Mettler software
    '   has BalanceID under the balance heading
    'Do Until xlSheetResults.Cells(RowCounter, 1) = "Balance settings"
    '    RowCounter = RowCounter + 1
    '    DoEvents
    'Loop
    ''   Assign the balance id
    'RowCounter = RowCounter + 2
    'strBalanceId = Trim(xlSheetResults.Cells(RowCounter, 1))
    'strBalanceId = Trim(Right(strBalanceId, (Len(strBalanceId) - 18)))
'   Find where the calibration data is, designated by the string 'Day'
Do Until xlSheetResults.Cells(RowCounter, 1) = "Day"
RowCounter = RowCounter + 1
Loop
Results1 = RowCounter + 2
RowCounter = Results1

'   get the start time of the calibration
iDay = Val(xlSheetResults.Cells(RowCounter, 1))
dtTime = xlSheetResults.Cells(RowCounter, 2)
Do Until Second(dtTime) = Second(dtStartTime)
    dtStartTime = DateAdd("s", 1, dtStartTime)
Loop
Do Until Minute(dtTime) = Minute(dtStartTime)
    dtStartTime = DateAdd("n", 1, dtStartTime)
Loop
Do Until Hour(dtTime) = Hour(dtStartTime)
    dtStartTime = DateAdd("h", 1, dtStartTime)
Loop
Do Until iDay = Day(dtStartTime)
    dtStartTime = DateAdd("d", 1, dtStartTime)
Loop
Debug.Print , dtTime, dtStartTime





'   Insert the weights ID, density and nominal value
'   Code changed to stop error occurring due to search ID including spaces - use of TRIM
Do Until xlSheetResults.Cells(RowCounter, 1) = ""
    xlSheetResults.Range("J" & RowCounter).Formula = "=VLOOKUP(TRIM(D" & _
    RowCounter & "),A" & Position1 & ":G" & Position2 & ",4,FALSE)"  'insert the Weight id
        Debug.Print "VLOOKUP(TRIM(D" & RowCounter & "),A" & Position1 & ":G" & Position2 & ",4,FALSE)"
    xlSheetResults.Range("K" & RowCounter).Formula = "=VLOOKUP(TRIM(D" & _
    RowCounter & "),A" & Position1 & ":G" & Position2 & ",3,false)"  'insert the set id
        Debug.Print "VLOOKUP(TRIM(D" & RowCounter & "),A" & Position1 & ":G" & Position2 & ",3,FALSE)"
    xlSheetResults.Range("L" & RowCounter).Formula = "=VLOOKUP(TRIM(D" & _
    RowCounter & "),A" & Position1 & ":G" & Position2 & ",7,FALSE)"  'insert the density of the weight
        Debug.Print "VLOOKUP(TRIM(D" & RowCounter & "),A" & Position1 & ":G" & Position2 & ",7,FALSE)"
    xlSheetResults.Range("M" & RowCounter).Formula = "=VLOOKUP(TRIM(D" & _
    RowCounter & "),A" & Position1 & ":G" & Position2 & ",5,FALSE)"  'insert the nominal value
        Debug.Print "VLOOKUP(TRIM(D" & RowCounter & "),A" & Position1 & ":G" & Position2 & ",5,FALSE)"
    RowCounter = RowCounter + 1
Loop

'   Assign where the calibration data finishes
Results2 = RowCounter - 1
'==============================================
'   Assign the finish time
'   get the start time of the calibration
iDay = Val(xlSheetResults.Cells(Results2, 1))
dtTime = xlSheetResults.Cells(Results2, 2)
dtEndTime = dtStartTime
Do Until Second(dtTime) = Second(dtEndTime)
    dtEndTime = DateAdd("s", 1, dtEndTime)
Loop
Do Until Minute(dtTime) = Minute(dtEndTime)
    dtEndTime = DateAdd("n", 1, dtEndTime)
Loop
Do Until Hour(dtTime) = Hour(dtEndTime)
    dtEndTime = DateAdd("h", 1, dtEndTime)
Loop
Do Until iDay = Day(dtEndTime)  'Changed 21/5/2008 from dtStartTime IRJ
    dtEndTime = DateAdd("d", 1, dtEndTime)
Loop
Debug.Print , dtTime, dtEndTime






Dim TestCount As Integer
Dim x As Integer
ReDim ResultsSet(11, TestCount)
xl.Visible = True

'   Assign the balance reading to the array ResultsSet()
For x = Results1 To Results2 Step 6
        ReDim Preserve ResultsSet(11, TestCount)
        ResultsSet(0, TestCount) = xlSheetResults.Cells(x, 5)       'Balance reading Wt A
        ResultsSet(1, TestCount) = xlSheetResults.Cells(x + 1, 5)   'Balance reading Wt B
        ResultsSet(2, TestCount) = xlSheetResults.Cells(x + 2, 5)   'Balance reading Wt A
        ResultsSet(3, TestCount) = xlSheetResults.Cells(x + 3, 5)   'Balance reading Wt B
        ResultsSet(4, TestCount) = xlSheetResults.Cells(x + 4, 5)   'Balance reading Wt A
        ResultsSet(5, TestCount) = xlSheetResults.Cells(x + 5, 5)   'Balance reading Wt B
        ResultsSet(6, TestCount) = xlSheetResults.Cells(x, 11)      'Wt A Set-ID
        ResultsSet(7, TestCount) = xlSheetResults.Cells(x + 1, 12)  'Wt B Density
        ResultsSet(8, TestCount) = xlSheetResults.Cells(x + 1, 11)  'Wt B Set-ID
        ResultsSet(9, TestCount) = xlSheetResults.Cells(x + 1, 13)  'Wt B Nominal Mass
        ResultsSet(10, TestCount) = xlSheetResults.Cells(x + 1, 10) 'Wt B Weight-ID
        ResultsSet(11, TestCount) = xlSheetResults.Cells(x, 10)     'Wt A Weight-ID
        
        TestCount = TestCount + 1
Next x

'   Add a worksheet "TabResults" to the result excel file
Set xlTest = xlBookResults.Worksheets.Add
xlTest.Name = "TabResults"
Dim y As Integer
For x = 0 To UBound(ResultsSet, 2)
For y = 0 To UBound(ResultsSet, 1)

'   Place the results into the excel worksheet "TabResults"
xlTest.Cells(x + 1, y + 1) = ResultsSet(y, x)
Next y
Next x
xlTest.Visible = xlSheetVisible

''   Setup the string to extract the environmental data from the database
'strNumericResults(1) = "Exec Probe7 '" & Format(dtStartTime, "yyyy-mm-dd hh:mm:ss") & "' ,'" & _
'Format(dtEndTime, "yyyy-mm-dd hh:mm:ss") & "'"
'Debug.Print strNumericResults(1)
''==================================================
'   Above replaced
'   assign string for the average of the 4 probes
'For i = 0 To UBound(iTempProbeNo)
'    strNumericResults(i) = "Exec Probe" & CStr(iTempProbeNo(i)) & " '" & Format(dtStartTime, "yyyy-mm-dd hh:mm:ss") & "' ,'" & _
'    Format(dtEndTime, "yyyy-mm-dd hh:mm:ss") & "'"
'Debug.Print strNumericResults(i)
'Next i

'   Clear some fields
For x = 0 To 4
txtDeptNo(x).Text = ""
txtCustomerNo(x).Text = ""
txtSTDNo(x).Text = ""
Next x

TextBoxNo = 0
Dim LastDeptNo As String

'Has the checkbox been selected
If chkStandardsTest.Value = 1 Then
    For x = Position1 To Position2
         If xlSheetResults.Cells(x, 2) = "T" Then
            If LastDeptNo = xlSheetResults.Cells(x, 3) Then
            Else
                TestNo(TextBoxNo) = xlSheetResults.Cells(x, 3)
                Debug.Print "TestNo("; TextBoxNo; ") = "; TestNo(TextBoxNo)
                txtDeptNo(TextBoxNo).Text = xlSheetResults.Cells(x, 3)
                LastDeptNo = xlSheetResults.Cells(x, 3)
                TextBoxNo = TextBoxNo + 1
            End If
        Else
        End If
    Next x
Else
    Dim rs As ADODB.Recordset
    Dim rsConn As ADODB.Connection
    Set rsConn = New ADODB.Connection
    rsConn.Open rsEnvironStr
    Set rs = New ADODB.Recordset
    For x = Position1 To Position2
    '   Remover due to conflict between position of standards and 'Dummy' on different balances
        'If Left(xlSheetResults.Cells(x, 3), 2) = "IB" Or InStr(UCase(xlSheetResults.Cells(x, 3)), "DUMMY") Then
        'Me.Visible = True
        'MsgBox "Test Results imported" & vbCrLf & "Done!"
        'Exit Sub
        '   Only read strings that are numbers, ie department numbers
        '   SBB 12/06/2007
        If Val(xlSheetResults.Cells(x, 3)) < 1 Then
        Else
        'End If
        If LastDeptNo = xlSheetResults.Cells(x, 3) Then
        Else
            TestNo(TextBoxNo) = xlSheetResults.Cells(x, 3)
            txtDeptNo(TextBoxNo).Text = xlSheetResults.Cells(x, 3)
            Debug.Print txtDeptNo(TextBoxNo).Text
'                The part below works when there is a daybook number and the job has been booked in New Delta
            rs.Open "call GetLatestCompany ('" & txtDeptNo(TextBoxNo).Text & "');", rsConn
            txtCustomerNo(TextBoxNo).Text = rs.Fields("Company")
            txtSTDNo(TextBoxNo).Text = rs.Fields("STDNo")
            txtDayBookNo(TextBoxNo).Text = rs.Fields("DayBookNo")
            LastDeptNo = xlSheetResults.Cells(x, 3)
            TextBoxNo = TextBoxNo + 1
            rs.Close    'Added sbb 16/4/2007
        End If
        End If
    Next x
    rsConn.Close
    Set rs = Nothing
    Set rsConn = Nothing
End If


Me.Visible = True
xlSheetResults.Visible = xlSheetHidden

MsgBox "Test Results imported"
Exit Sub
'ErrorHandler:
'MsgBox "There was an error of " & vbCrLf & Err.Number & vbCrLf & _
'Err.Description
'xl.Quit
'xlResults.Quit

End Sub

Private Sub cmdExtractData_Click()
On Error GoTo ErrorHandler
GetEnvironment
PlaceResultsInMassSpreadsheet
xlSheetResults.Activate
xlSheetResults.PageSetup.Zoom = 70
xlSheetResults.PageSetup.PrintGridlines = True
xlSheetResults.Visible = xlSheetVisible
xlResults.Visible = True
xlSheetResults.PrintOut
MsgBox "Done!"
Exit Sub
ErrorHandler:
MsgBox "There was an error of " & vbCrLf & Err.Number & vbCrLf & _
Err.Description
xl.Quit
xlResults.Quit

End Sub

Private Sub cmdEnd_Click()
On Error Resume Next
xlBookResults.Close False
xlBookMass.Close False
xl.Quit
xlResults.Quit
'   Clear out the worksheets etc
Set xl = Nothing
Set xlResults = Nothing
Set xlBookResults = Nothing
Set xlSheetResults = Nothing
Set xlBookMass = Nothing
Set xlsheetmass = Nothing
End
End Sub

Function GetEnvironment()
On Error GoTo ErrorHandler
Dim strFirstDay As String
Dim strFirstMonth As String
Dim strFirstYear As String
Dim strSecondDay As String
Dim strSecondMonth As String
Dim strSecondYear As String
Dim strNumericResults As String
Dim strMsg As String
Dim DateString As String
Dim DateStringEnd As String
Dim i As Integer
Dim iTNP As Integer
Set rsEnvironConn = New ADODB.Connection
Set rsEnviron = New ADODB.Recordset

If Not GetInstrumentInfo Then
    strMsg = "This may be due to no temperature probes associated to the balance: " & vbCrLf & _
    strBalanceId & " in the instrument.ini file. Please edit the file and start again."
    End
End If



'   Setup string for getting environmental data back, remember each temperature probe gets humidity, pressure
'iTNP = UBound(iTempProbeNo)
''ReDim strNumericResults(iTNP)
'For i = 1 To iTNP
'Debug.Print strNumericResults(i)
'Next i

'   Open the database
rsEnvironConn.Open rsEnvironStr
With rsEnviron
    For i = 1 To UBound(iTempProbeNo)
        strNumericResults = "call Probe" & CStr(iTempProbeNo(i)) & " ('" & Format(dtStartTime, "yyyy-mm-dd hh:mm:ss") & "' ,'" & _
        Format(dtEndTime, "yyyy-mm-dd hh:mm:ss") & "');"
        Debug.Print strNumericResults
        rsEnviron.Open strNumericResults, rsEnvironConn ', adOpenStatic, adLockOptimistic
        MeanPressure = .Fields("MeanPressure") + MeanPressure
        MeanTemperature = .Fields("MeanTemp") + MeanTemperature
        MeanHumidity = .Fields("MeanHumidity") + MeanHumidity
        Debug.Print MeanPressure, MeanTemperature, MeanHumidity
        rsEnviron.Close
    Next i
End With
'   Now calculate the average
MeanPressure = MeanPressure / (UBound(iTempProbeNo))
MeanTemperature = MeanTemperature / (UBound(iTempProbeNo))
MeanHumidity = MeanHumidity / (UBound(iTempProbeNo))
Debug.Print MeanPressure, MeanTemperature, MeanHumidity
Set rsEnviron = Nothing
Set rsEnvironConn = Nothing
Exit Function
ErrorHandler:
MsgBox "There was an error of " & vbCrLf & Err.Number & vbCrLf & _
Err.Description
xl.Quit
xlResults.Quit
End Function

Sub PlaceResultsInMassSpreadsheet()
On Error GoTo ErrorHandler

Dim IniFile As String
IniFile = App.Path & "\" & "Instruments.Ini"
Dim strMassWorkbookLocation As String
Call GetStringFromIni(IniFile, "Paths", "MassWorkbook", strMassWorkbookLocation)

DataRow = 31
Dim rsComm As ADODB.Recordset
Dim rsConn As ADODB.Connection
Dim strWeightId As String
Dim strUnit As String
Dim sngMass As Single
Dim strWtPrefix As String
Set rsConn = New ADODB.Connection
rsConn.Open rsEnvironStr
Set rsComm = New ADODB.Recordset
Set xlBookMass = xl.Workbooks.Open(strMassWorkbookLocation)
Set xlsheetmass = xlBookMass.Worksheets("MassNew")
Set xlsheetPrint = xlBookMass.Worksheets("Print Preview")
xlBookMass.Activate
xlsheetmass.Activate
xlBookMass.Activate
xl.Run "header_input"
'Debug.Print MeanPressure, MeanTemperature, MeanHumidity
xlsheetmass.Cells(8, 2) = MeanPressure
xlsheetmass.Cells(8, 5) = MeanTemperature
xlsheetmass.Cells(9, 2) = MeanHumidity
xl.Run "input_activate"
xl.Visible = True
Debug.Print EntryRow
No_Of_Weights = 2
LastDepartmentNo = ResultsSet(8, 2)
    xlBookMass.Activate
xl.Run "header_input"
'Debug.Print MeanPressure, MeanTemperature, MeanHumidity
xlsheetmass.Cells(8, 2) = MeanPressure
xlsheetmass.Cells(8, 5) = MeanTemperature
xlsheetmass.Cells(9, 2) = MeanHumidity
EntryRow = 27
StandardDataToExcel
Dim TestNumber As Integer


Do Until No_Of_Weights > UBound(ResultsSet, 2) + 1

    On Error Resume Next
    
'==============================================================================
'   If the First weight (Weight B), in the comparison,
'   is a standard and we haven't finished the calibration, then do the following
'=============================================================================
    If ResultsSet(8, No_Of_Weights) <> TestNo(TestNumber) _
    Or No_Of_Weights > UBound(ResultsSet, 2) Then
       
        If TestNo(TestNumber) = "" Then Exit Sub
        xlBookMass.Activate
        xl.Run "header_input"
        If cboClass(TestNumber).Text = "E2" Then
            xl.Run "twocycle"
            xlsheetmass.Cells(6, 3) = "E2"
        Else
            xlsheetmass.Cells(6, 3) = "F1"
        End If

        GoSub PutGeneralInfoInToExcel
        
        GoSub FormatWorkSheet
        
        xl.Run "Print_E2_F1"
        
        GoSub WriteCalDataToDatabase
        
        GoSub RefreshWorksheet
        
'       Re-set some variables
        TestNumber = TestNumber + 1
        EntryRow = 27
        StandardDataToExcel
        
        
'=========================================================
'   If the First weight is a test weight, do the following
'=========================================================
    Else
        GoSub WriteWtAInfoToExcel

'       Re-set some variables
        EntryRow = EntryRow + 1
        LastDepartmentNo = ResultsSet(8, No_Of_Weights)
        No_Of_Weights = No_Of_Weights + 1
    End If
'==========================
'   Go round the loop again
Loop
'==========================

Exit Sub

'=======================================================================
'=======================================================================
'                           SubRoutines
'=======================================================================

'======================================================================
'   Insert the calibration data to the database table tblMassResults
'======================================================================
WriteCalDataToDatabase:
Dim strMassResults As String
Do While xlsheetPrint.Cells(DataRow, 7) <> " "
    Debug.Print xlsheetPrint.Cells(DataRow, 7)
    strMassResults = "Insert into tblMassResults(DayBookNo, NominalValue, " & _
    "Denomination, Duplicate, MeasuredUncertainty, MeasuredValue, " & _
    "Error, StatedUncertainty, DateOfTest) Values (" & _
    txtDayBookNo(TestNumber).Text & "," & _
    xlsheetPrint.Cells(DataRow, 7) & ",'" & _
    xlsheetPrint.Cells(DataRow, 8) & "','" & _
    xlsheetPrint.Cells(DataRow, 14) & "'," & _
    xlsheetPrint.Cells(DataRow, 32) & "," & _
    xlsheetPrint.Cells(DataRow, 33) & "," & _
    xlsheetPrint.Cells(DataRow, 38) & "," & _
    xlsheetPrint.Cells(DataRow, 40) & ",'" & _
    Format(dtStartTime, "yyyy-mm-dd") & "')"
    Debug.Print strMassResults, xlsheetPrint.Cells(DataRow, 7)
    rsComm.Open strMassResults, rsConn
    rsComm.Close
    DataRow = DataRow + 2
Loop
Return
'==========================================================================

FormatWorkSheet:
'======================================================================
'   Format the excel worksheet
'======================================================================
        xlsheetPrint.Unprotect ("kilo18")
        xlsheetPrint.Range("N14", "O14").Merge
        xlsheetPrint.Range("N14").WrapText = True
        xlsheetPrint.Range("N14").HorizontalAlignment = xlLeft
        xlsheetPrint.Range("14:14").RowHeight = 40
        
Return

PutGeneralInfoInToExcel:
'=====================================================================
'       Set-up the excel worksheet, assign customer, metrologist, etc
'=====================================================================
    With xlsheetmass
        .Cells(2, 2) = txtCustomerNo(TestNumber).Text
        .Cells(2, 5) = cboMetrologist.Text
        .Cells(3, 2) = txtSTDNo(TestNumber).Text
        .Cells(3, 5) = dtStartTime
        .Cells(4, 2) = txtDeptNo(TestNumber).Text
        .Cells(14, 2) = 1
        .Cells(17, 2) = 0
        .Cells(17, 5) = 0
        .Cells(18, 2) = 1
        .Cells(18, 5) = 1
    End With
Return

WriteWtAInfoToExcel:
'=====================================================================
'   Write the information regarding Weight A to the excel worksheet
'=====================================================================
    strWeightId = Trim(ResultsSet(11, No_Of_Weights))
   Call SplitupWeight(strWeightId, strWtPrefix, sngMass, strUnit)
    With xlsheetmass
        .Cells(EntryRow, 1) = strWtPrefix & sngMass   'GetMassPart(ResultsSet(11, No_Of_Weights))    'Wt A, Mass value
        .Cells(EntryRow, 2) = strUnit   'GetUnitPart(ResultsSet(11, No_Of_Weights))    'Wt A, Denomination
        .Cells(EntryRow, 3) = Replace(ResultsSet(6, No_Of_Weights), " ", "") 'Wt A, Set-ID
        .Cells(EntryRow, 8) = GetFrontStringPart(ResultsSet(10, No_Of_Weights))
        .Cells(EntryRow, 12) = ResultsSet(0, No_Of_Weights) 'Balance reading(1) Wt A
        .Cells(EntryRow, 13) = ResultsSet(2, No_Of_Weights) 'Balance reading(2) Wt A
        .Cells(EntryRow, 14) = ResultsSet(4, No_Of_Weights) 'Balance reading(3) Wt A
        .Cells(EntryRow, 15) = ResultsSet(1, No_Of_Weights) 'Balance reading(1) Wt B
        .Cells(EntryRow, 16) = ResultsSet(3, No_Of_Weights) 'Balance reading(2) Wt B
        .Cells(EntryRow, 17) = ResultsSet(7, No_Of_Weights) 'Density Wt B
        .Cells(EntryRow, 9) = "L"                           'The side of the equation that the standard is on
    End With
Return

RefreshWorksheet:
'===========================================================================
'   Refresh the excel worksheet, ready for the next set of calibration data
'===========================================================================
    xl.Run "clear_sheet"
    xlsheetmass.Cells(8, 2) = MeanPressure
    xlsheetmass.Cells(8, 5) = MeanTemperature
    xlsheetmass.Cells(9, 2) = MeanHumidity
Return

ErrorHandler:
MsgBox "There was an error of " & vbCrLf & Err.Number & vbCrLf & _
Err.Description
xl.Quit
xlResults.Quit

End Sub

Public Sub StandardDataToExcel()
On Error GoTo ErrorHandler
EntryRow = 27
Dim dbMassValue As Single
Dim strUnit As String
Dim sngMass As Single
Dim strWeightId As String
Dim strWtPrefix As String
Dim No_Of_Weights_Standards As Integer
For No_Of_Weights_Standards = 0 To 1
'   Enter the data into the 'Input' worksheet
    strWeightId = Trim(ResultsSet(11, No_Of_Weights_Standards))
    Call SplitupWeight(strWeightId, strWtPrefix, sngMass, strUnit)

    With xlsheetmass
        .Cells(EntryRow, 1) = strWtPrefix & sngMass   'GetMassPart(ResultsSet(11, No_Of_Weights_Standards))
        .Cells(EntryRow, 2) = strUnit   'GetUnitPart(ResultsSet(11, No_Of_Weights_Standards))
        .Cells(EntryRow, 3) = Replace(ResultsSet(6, No_Of_Weights_Standards), " ", "")
        .Cells(EntryRow, 8) = GetFrontStringPart(ResultsSet(10, No_Of_Weights_Standards))
        .Cells(EntryRow, 12) = ResultsSet(0, No_Of_Weights_Standards)
        .Cells(EntryRow, 13) = ResultsSet(2, No_Of_Weights_Standards)
        .Cells(EntryRow, 14) = ResultsSet(4, No_Of_Weights_Standards)
        .Cells(EntryRow, 15) = ResultsSet(1, No_Of_Weights_Standards)
        .Cells(EntryRow, 16) = ResultsSet(3, No_Of_Weights_Standards)
        .Cells(EntryRow, 17) = ResultsSet(7, No_Of_Weights_Standards)
        .Cells(EntryRow, 9) = "L"
        .Cells(EntryRow, 8) = "STDCHK" 'this std check must be done first in cal cycle
    End With
    EntryRow = EntryRow + 1
Next No_Of_Weights_Standards
Exit Sub
ErrorHandler:
MsgBox "There was an error of " & vbCrLf & Err.Number & vbCrLf & _
Err.Description
xl.Quit
xlResults.Quit

End Sub


Public Function GetUnitPart(strWeightId As String) As String
'   Separate the mass value from the units
'   10kg would be split into
'   sngMass = 10
'   strUnit = kg
Dim strUnit As String
Dim sngMass As Single
On Error Resume Next
    strUnit = Trim(strWeightId)
    sngMass = Val(strWeightId)
    GetUnitPart = Right(strUnit, Len(strUnit) - Len(Trim(sngMass)))
End Function
Public Function GetMassPart(strWeightId As String) As Single
'   Separate the mass value from the units
'   10kg would be split into
'   sngMass = 10
'   strUnit = kg
Dim strUnit As String
Dim sngMass As Single
On Error Resume Next
    GetMassPart = Val(strWeightId)
End Function
Public Function GetFrontStringPart(strWeightId As String) As String
'   Separate the string part at the front of the weight id
'   The initial part of the weight id designates if the weight
'   is plain , dot , double dot etc
'   If there is no identifying marks on the weight then it is assumed to be plain
Dim strID As String
Dim i As Integer
Dim iChrVal As Integer

strWeightId = Trim(strWeightId)
For i = 1 To Len(strWeightId)
    iChrVal = Asc(Mid(strWeightId, i, 1))
    If iChrVal > 43 And iChrVal < 57 Then Exit For  'check if its a numeric
Next i
strID = Left(strWeightId, i - 1)
If strID = "" Then strID = "plain"
GetFrontStringPart = strID
End Function

Private Sub Form_Load()
Call SetupDefaults
End Sub

Public Sub SetupDefaults()

    Dim IniFile As String
    IniFile = App.Path & "\" & "Instruments.Ini"
    
    Dim sMetrologists As String
    Call GetStringFromIni(IniFile, "Metrologists", "Names", sMetrologists)
    Dim aMetrologists() As String
    aMetrologists = Split(sMetrologists, ",")
    Dim i As Integer
    For i = 0 To UBound(aMetrologists)
       cboMetrologist.AddItem aMetrologists(i)
    Next
    
    Call GetStringFromIni(IniFile, "Paths", "DataSource", rsEnvironStr)

End Sub

Public Function GetInstrumentInfo() As Boolean
Dim IniFile As String
Dim strHeading As String
Dim strPressSerNo As String
Dim strTopic As String
Dim strPressLocation As String
Dim strProbes As String
Dim strHumSerNo As String
Dim strHumLocation As String
Dim strArray() As String
Dim strRet As String
Dim i As Integer

On Error GoTo FunExit
'   Assign the name of the ini file
IniFile = App.Path & "\" & "Instruments.Ini"

'======================================================
'   Read/Write some general topics

'   Read information regarding the Pressure transducer
strHeading = "Pressure"
strTopic = "SerialNo"
Call GetStringFromIni(IniFile, strHeading, strTopic, strRet)
If strRet = Empty Then
    strPressSerNo = "Unknown"
    Call WriteStringToIni(IniFile, strHeading, strTopic, strPressSerNo)
Else
    strPressSerNo = strRet
End If

strTopic = "Location"
Call GetStringFromIni(IniFile, strHeading, strTopic, strRet)
If strRet = Empty Then
    strPressLocation = "Unknown"
    Call WriteStringToIni(IniFile, strHeading, strTopic, strPressSerNo)
Else
    strPressLocation = strRet
End If

'   Read information regarding the Humidity transducer
strHeading = "Humidity"
strTopic = "SerialNo"
Call GetStringFromIni(IniFile, strHeading, strTopic, strRet)
If strRet = Empty Then
    strHumSerNo = "Unknown"
    Call WriteStringToIni(IniFile, strHeading, strTopic, strHumSerNo)
Else
    strHumSerNo = strRet
End If

strTopic = "Location"
Call GetStringFromIni(IniFile, strHeading, strTopic, strRet)
If strRet = Empty Then
    strHumLocation = "Unknown"
    Call WriteStringToIni(IniFile, strHeading, strTopic, strHumSerNo)
Else
    strHumLocation = strRet
End If

'======================================================
strHeading = "ProbePosition"
strTopic = strBalanceId
Call GetStringFromIni(IniFile, strHeading, strTopic, strRet)
If strRet = Empty Then
    strProbes = "Unknown"
    Call WriteStringToIni(IniFile, strHeading, strTopic, strPressSerNo)
Else
    strProbes = strRet
End If

strArray() = Split(strProbes, ",")
If strProbes = "Unknown" Then GoTo FunExit
    
ReDim iTempProbeNo(UBound(strArray) + 1)
For i = LBound(strArray) To UBound(strArray)
    iTempProbeNo(i + 1) = Val(strArray(i))
Next i
GetInstrumentInfo = True
Exit Function

FunExit:

End Function

Public Sub SplitupWeight(strWeightId As String, strWtPrefix As String, sngMass As Single, strUnit As String)
'   Split up the weight into the suffix letter, if there is one.
'   The mass of the weight
'   and the mass unit
Dim strMass As String
Dim i As Integer
Dim iPt As Integer
Dim iChrVal As Integer
Dim iTNP As Integer
strWeightId = Trim(strWeightId)
iTNP = Len(strWeightId)
'   Get the prefix
strWtPrefix = Empty
For i = 1 To iTNP
    iChrVal = Asc(Mid(strWeightId, i, 1))
    If iChrVal > 43 And iChrVal < 57 Then Exit For  'check if its a numeric
    strWtPrefix = strWtPrefix & Mid(strWeightId, i, 1)
Next i

iPt = i
'   Get the mass of the weight
For i = iPt To iTNP
    iChrVal = Asc(Mid(strWeightId, i, 1))
    If iChrVal > 43 And iChrVal < 57 Then
        strMass = strMass & Mid(strWeightId, i, 1)
    Else
        Exit For
    End If
Next i
sngMass = Val(strMass)
strUnit = Right(strWeightId, iTNP - i + 1)

End Sub
