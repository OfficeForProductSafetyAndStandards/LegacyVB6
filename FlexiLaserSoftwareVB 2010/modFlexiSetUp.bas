Attribute VB_Name = "modSetUp"
Option Explicit
Public TypeOfThermometer As String
Public NoOfPoints As Integer
Public Rownumber As Integer
Public LaserTestSetNo As Integer
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
Public eventtime As Integer
Public NewFileName As String
Public NewFileName1 As String
'this pertains to the "Hour(now)" parts of tmr2

Sub Setup()
On Error Resume Next                            'ignore errors
Set xl = GetObject(, "Excel.Application")       'look for a running copy of Excel
If Err.Number <> 0 Then                         'If Excel is not running then
    Set xl = CreateObject("Excel.Application")  'run it
End If
Err.Clear                   'Clear Err object in case error occurred.
On Error GoTo 0             'Resume normal error processing

'Set xlbook = xl.Workbooks.Open("\\PDC\Metrology\@Private\@MU\Edale Correction.xls", , True)
Set xlbook = xl.Workbooks.Open("c:\Metrology\@Private\@MU\Edale Correction.xls", , True)
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
'Set xlbookResults = xl.Workbooks.Open("\\PDC\Metrology\@Private\@MU\Length Bench Results Flexi.xls", , , , , , True)
Set xlbookResults = xl.Workbooks.Open("c:\Metrology\@Private\@MU\Length Bench Results Flexi.xls", , , , , , True)
'This is the location of the Read-only version of the Flexi length results sheet
Set xlsheetResultsTemperature = xlbookResults.Sheets("Temperature Results")
Set xlsheetResultsMeasurement = xlbookResults.Sheets("Measurement Results")
Set xlsheetResultsVOLandCustomerData = xlbookResults.Sheets("VOL and Customer Data")
Set xlsheetResultsTemperatureUncorrected = _
xlbookResults.Sheets("Temperature Results Uncorrected")
'Set all objects to their respective parts of the workbook
'Open Excel workbook and select Temperature Results sheet
Rownumber = 2
'Start program with selecting the first row for data
LaserTestSetNo = 2
'Start program also with selecting the first set of laser data
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

Sub PrintOutClassC()
With xlsheetResultsVOLandCustomerData.PageSetup
.RightFooter = NewFileName
.PrintArea = "$A$1:$H$29"
.Zoom = 80
End With
xlsheetResultsVOLandCustomerData.PrintOut
With xlsheetResultsMeasurement.PageSetup
    .RightFooter = NewFileName
    .PrintArea = "$A$1:$P$29"
    .Zoom = 60
End With
xlsheetResultsMeasurement.PrintOut
'set parameters for printouts required for Class C then print out
End Sub

Sub PrintOutClassAandB()
With xlsheetResultsMeasurement.PageSetup
    .RightFooter = NewFileName
    .PrintArea = "$A$1:$P$29"
   .Zoom = 60
End With
xlsheetResultsMeasurement.PrintOut
With xlsheetResultsTemperature.PageSetup
    .RightFooter = NewFileName
    .PrintArea = "$A$1:$H$29"
    .Zoom = 80
End With
xlsheetResultsTemperature.PrintOut
With xlsheetResultsVOLandCustomerData.PageSetup
.RightFooter = NewFileName
.PrintArea = "$A$1:$C$13"
.Zoom = 80
End With
xlsheetResultsVOLandCustomerData.PrintOut
With xlsheetResultsTemperatureUncorrected.PageSetup
.RightFooter = NewFileName
.PrintArea = "$A$1:$E$29"
.Zoom = 80
End With
xlsheetResultsTemperatureUncorrected.PrintOut
'set parameters for printouts required for Class  A and B then print out

End Sub

Sub PrintoutVOL()
With xlsheetResultsTemperature.PageSetup
    .RightFooter = NewFileName
    .PrintArea = "$A$1:$H$29"
    .Zoom = 80
End With
xlsheetResultsTemperature.PrintOut
With xlsheetResultsVOLandCustomerData.PageSetup
.RightFooter = NewFileName
.PrintArea = "$A$1:$C$13"
.Zoom = 80
End With
xlsheetResultsVOLandCustomerData.PrintOut
End Sub
'set parameters for printouts required for VOL only then print out


