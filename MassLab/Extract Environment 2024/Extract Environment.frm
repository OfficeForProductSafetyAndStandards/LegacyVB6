VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmExtract 
   Caption         =   "Get Environmental Data"
   ClientHeight    =   2355
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8385
   LinkTopic       =   "Form1"
   ScaleHeight     =   2355
   ScaleWidth      =   8385
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   615
      Left            =   240
      TabIndex        =   5
      Top             =   1440
      Width           =   1455
   End
   Begin MSComCtl2.DTPicker dtpEnd 
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "d/MM/yyyy"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1033
         SubFormatType   =   3
      EndProperty
      Height          =   615
      Left            =   5160
      TabIndex        =   2
      Top             =   480
      Width           =   2895
      _ExtentX        =   5106
      _ExtentY        =   1085
      _Version        =   393216
      Format          =   135069697
      CurrentDate     =   36494
   End
   Begin MSComCtl2.DTPicker dtpStart 
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "d/MM/yyyy"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1033
         SubFormatType   =   3
      EndProperty
      Height          =   615
      Left            =   1920
      TabIndex        =   1
      Top             =   480
      Width           =   3015
      _ExtentX        =   5318
      _ExtentY        =   1085
      _Version        =   393216
      Format          =   135069697
      CurrentDate     =   36494
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Get extract"
      Height          =   615
      Left            =   240
      TabIndex        =   0
      Top             =   480
      Width           =   1455
   End
   Begin VB.Label Label3 
      Caption         =   $"Extract Environment.frx":0000
      Height          =   855
      Left            =   5160
      TabIndex        =   6
      Top             =   1440
      Width           =   2895
   End
   Begin VB.Label Label2 
      Caption         =   "End Date"
      Height          =   375
      Left            =   5160
      TabIndex        =   4
      Top             =   120
      Width           =   2895
   End
   Begin VB.Label Label1 
      Caption         =   "Start Date"
      Height          =   375
      Left            =   1920
      TabIndex        =   3
      Top             =   120
      Width           =   3015
   End
End
Attribute VB_Name = "frmExtract"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdExit_Click()
Unload Me
    End
    'end program
End Sub

Private Sub Command1_Click()
On Error GoTo CancelErrorTrap
Dim DateString As String
Dim xl As Excel.Application
Dim xlBook As Excel.Workbook
Dim xlSheet As Excel.Worksheet
Dim rs As ADODB.Recordset
Dim rsConn As ADODB.Connection
Dim rsCount As Integer
Dim x As Integer
Dim y As Integer
y = 1
Dim connStr As String
connStr = INIRead("Paths", "DataSource")
Dim ExtractString As String
ExtractString = "call GetEnvironment ('" & Format(dtpStart.Value, "yyyy-mm-dd hh:mm:ss") & _
"','" & Format(dtpEnd.Value, "yyyy-mm-dd hh:mm:ss") & "');"
Debug.Print ExtractString
Screen.MousePointer = vbHourglass
On Error Resume Next
Set xl = GetObject(, "Excel.Application")
If Err.Number <> 0 Then
        Set xl = CreateObject("Excel.Application")
End If
On Error GoTo CancelErrorTrap
Set xlBook = xl.Workbooks.Add
Set xlSheet = xlBook.Worksheets("Sheet1")
Set rsConn = New ADODB.Connection
rsConn.Open connStr
Set rs = New ADODB.Recordset
rs.Open ExtractString, rsConn
rsCount = rs.Fields.Count
For x = 0 To rsCount - 1
xlSheet.Cells(y, x + 1) = CStr(rs.Fields(x).Name)
Debug.Print x, rs.Fields(x).Name
Next x
y = y + 1
rs.MoveFirst
Do Until rs.EOF
xlSheet.Cells(y, 1) = rs.Fields(0)
xlSheet.Cells(y, 2) = rs.Fields(1)
xlSheet.Cells(y, 3) = rs.Fields(2)
xlSheet.Cells(y, 4) = rs.Fields(3)
xlSheet.Cells(y, 5) = rs.Fields(4)
xlSheet.Cells(y, 6) = rs.Fields(5)
xlSheet.Cells(y, 7) = rs.Fields(6)
xlSheet.Cells(y, 8) = rs.Fields(7)
xlSheet.Cells(y, 9) = rs.Fields(8)
xlSheet.Cells(y, 10) = rs.Fields(9)
xlSheet.Cells(y, 11) = rs.Fields(10)
xlSheet.Cells(y, 12) = rs.Fields(11)
xlSheet.Cells(y, 13) = rs.Fields(12)
xlSheet.Cells(y, 14) = rs.Fields(13)
xlSheet.Cells(y, 15) = CStr(rs.Fields(14))


'xlSheet.Columns(x).NumberFormat = "dd/mm/yyyy hh:mm:ss"
y = y + 1
rs.MoveNext
Loop
xl.Visible = True

rs.Close
Set rs = Nothing
rsConn.Close
Screen.MousePointer = vbDefault

Exit Sub

CancelErrorTrap:
    ErrorString = "The error was " & Err.Description & " And error number " & Err.Number
    Debug.Print ErrorString
    Response = MsgBox(ErrorString, vbOKOnly)
    Err.Clear
    On Error GoTo 0
    If Not xl Is Nothing Then
        xl.Quit
    End If
    Screen.MousePointer = vbDefault

    Exit Sub


End Sub

Private Sub Form_Load()
With dtpStart
    .Value = DateAdd("d", -1, Now)
    .Hour = 0
    .Minute = 0
    .Second = 0
End With
With dtpEnd
    .Value = DateAdd("d", 0, Now)
'    .Hour = 0
'    .Minute = 0
'    .Second = 0
End With
'.Value = DateAdd("d", 1, Now)

End Sub
