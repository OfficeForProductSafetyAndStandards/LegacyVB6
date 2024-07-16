Attribute VB_Name = "modSetUp"
Option Explicit
Public NoOfProbes As Integer
Public TypeOfThermometer As String
Public LengthUnderTest As Integer
Public NoOfPoints As Integer
Public Rownumber As Integer
Public LaserTestSetNo As Integer
Public ClassOfMeasurement As String
Public ProbeCounter As Integer
Public ClearanceCounter As Integer
Public xlbook As Excel.Workbook
Public xlbookResults As Excel.Workbook
Public xlsheetResults As Excel.Worksheet
Public xlsheetResultsTemperature As Excel.Worksheet
Public xlsheetResultsVOLandCustomerData As Excel.Worksheet
Public xlsheetResultsMeasurement As Excel.Worksheet
Public xlsheetResultsTemperatureUncorrected As Excel.Worksheet
Public xlsheet As Excel.Worksheet
Public xl As Excel.Application
Public xlrow As Integer
Public ProbesSelected(1 To 12) As Single
Public LaserReadings(2, 12) As Single
Public eventtime As Integer 'this pertains to the "Hour(now)" parts of tmr2
Public NewFileName As String
Public NewFileName1 As String
Public NewFileName2 As String


Sub Setup()
On Error Resume Next                            'ignore errors
Set xl = GetObject(, "Excel.Application")       'look for a running copy of Excel
If Err.Number <> 0 Then                         'If Excel is not running then
    Set xl = CreateObject("Excel.Application")  'run it
End If
Err.Clear                   'Clear Err object in case error occurred.
On Error GoTo 0             'Resume normal error processing
'Set xlbook = xl.Workbooks.Open("c:\metrology\@Private\@Mu\Edale Correction.xls", , , , , , True)
Set xlbook = xl.Workbooks.Open(INIRead("MappedLocations", "EdaleCorrection"), , , , , , True)
'This is the location of the read only Edale Corrections sheet
End Sub

Sub Setup_For_Test()
On Error Resume Next                            'ignore errors
Set xl = GetObject(, "Excel.Application")       'look for a running copy of Excel
If Err.Number <> 0 Then                         'If Excel is not running then
    Set xl = CreateObject("Excel.Application")  'run it
End If
Err.Clear                   'Clear Err object in case error occurred.
On Error GoTo 0             'Resume normal error processing
'Set xlbookResults = xl.Workbooks.Open("c:\metrology\@Private\@Mu\Length Bench Results Rigid.xls", , , , , , True)
Set xlbookResults = xl.Workbooks.Open(INIRead("MappedLocations", "TestResultSheet"), , , , , , True)
'This is the location of the Read-only version of the Rigid length results sheet
Set xlsheetResultsTemperature = xlbookResults.Sheets("Temperature Results")
Set xlsheetResultsMeasurement = xlbookResults.Sheets("Measurement Results")
Set xlsheetResultsVOLandCustomerData = xlbookResults.Sheets("VOL and Customer Data")
Set xlsheetResultsTemperatureUncorrected = xlbookResults.Sheets("Temperature Results Uncorrected")
'Open Excel workbook and select Temperature Results etc sheets
Rownumber = 2
LaserTestSetNo = 2
xlsheetResultsMeasurement.Range("B3:C22") = ""
xlsheetResultsTemperature.Range("B2:E13") = ""
'Clears Excel spreadsheet by placing 0's in all boxes
End Sub
' Set the objects to Nothing.
Sub CleanUp()
' This should force an unload of Microsoft Excel,
' providing no other applications or users have it loaded.
On Error Resume Next
xl.DisplayAlerts = False 'no display alerts will be shown
xlbookResults.Save
xl.Quit
On Error GoTo 0
End Sub
'
Sub PrintOutClassB()
With xlsheetResultsMeasurement.PageSetup
.LeftHeader = "Department Number " & NewFileName1 & "  Interval under test " & NewFileName2
.RightFooter = NewFileName
.PrintArea = "$A$1:$G$21"
.Zoom = 80
End With
xlsheetResultsMeasurement.PrintOut
'print out module for low-level calibration, class B, measurement only
End Sub
'
Sub PrintOutClassA()
With xlsheetResultsMeasurement.PageSetup
    .LeftHeader = "Department Number " & NewFileName1 & "  Interval under test " & NewFileName2
    .RightFooter = NewFileName
    .PrintArea = "$A$1:$H$21"
    .Zoom = 80
End With
xlsheetResultsMeasurement.PrintOut
With xlsheetResultsTemperature.PageSetup
.LeftHeader = "Department Number " & NewFileName1 & "  Interval under test " & NewFileName2
.RightFooter = NewFileName
.PrintArea = "$A$1:$F$22"
.Zoom = 80
End With
xlsheetResultsTemperature.PrintOut
With xlsheetResultsTemperatureUncorrected.PageSetup
.LeftHeader = "Department Number " & NewFileName1 & "  Interval under test " & NewFileName2
.RightFooter = NewFileName
.PrintArea = "$A$1:$F$13"
.Zoom = 80
End With
xlsheetResultsTemperatureUncorrected.PrintOut
'print out module for high-level calibration, class A, temps corrected and uncorrected and measurement
End Sub
'
Sub PrintoutVOL()
With xlsheetResultsVOLandCustomerData.PageSetup
    .LeftHeader = "Department Number " & NewFileName1 & "  Interval under test " & NewFileName2
    .RightFooter = NewFileName
    .PrintArea = "$A$1:$D$11"
    .Zoom = 80
End With
xlsheetResultsVOLandCustomerData.PrintOut
'print out module for VOL data
End Sub
