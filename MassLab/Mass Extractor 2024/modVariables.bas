Attribute VB_Name = "modVariables"
Option Explicit

Public xl As Excel.Application
Public xlResults As Excel.Application
Public xlBookResults As Excel.Workbook
Public xlSheetResults As Excel.Worksheet
Public xlBookMass As Excel.Workbook
Public xlsheetmass As Excel.Worksheet
Public xlsheetPrint As Excel.Worksheet
Public xlTest As Excel.Worksheet

Public Position1 As Integer
Public Position2 As Integer
Public Results1 As Integer
Public Results2 As Integer
Public SelectedPosition As String
Public SelectedResults As String
Public StandardPosition As Object

'Public StandardNo As String
'Public StandardIBNo As String
'Public StandardValue As String
'Public StandardDenominationString As String
Public No_Of_Weights As Integer
'Public UnknownDensity As Single
'Public UnknownPosition As String

Public rsEnviron As ADODB.Recordset
Public rsEnvironConn As ADODB.Connection
Public rsEnvironStr As String
' Public Const rsEnvironStr = "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=MQU_Job;Data Source=Avon\Goldmine"
' Public Const rsEnvironStr = "Provider=SQLOLEDB.1;Persist Security Info=False;" & _
"User ID=sa;Initial Catalog=MQU_Job;Data Source=Goldmine"

Public TestNo(4) As String
Public TextBoxNo As Integer
Public ClassOfTest As String

'Public fso As New FileSystemObject
'Public FileType, FileModification, WhenCreated, WhenModified
'Public strNumericResults(4) As String

Public MeanPressure As Single
Public MeanTemperature As Single
Public MeanHumidity As Single

Public EntryRow As Integer
Public UnknownDuplicate As String
Public LastDepartmentNo As String
Public DataRow As Integer

Public StandardCheckResults(2, 7) As String
Public UnknownResults() As String
Public ResultsSet() As String


'==========================================
'   Added SBB
Public strStartTime As String   'the start time of the environmentals
Public strEndTime As String     'the finish time of the environmentals
