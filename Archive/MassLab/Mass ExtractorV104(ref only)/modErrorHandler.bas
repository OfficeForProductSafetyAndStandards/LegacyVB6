Attribute VB_Name = "modErrorHandler"
Option Explicit
Public Sub ErrorHandler()
ErrorHandler:
MsgBox "There was an error of " & vbCrLf & Err.Number & vbCrLf & _
Err.Description
xl.Quit
xlResults.Quit

End Sub

