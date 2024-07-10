Attribute VB_Name = "modSetUpLaser"
Option Explicit
Sub setuplaser(BenchUsed, Units)
Dim ErrMsg As String * 100
Dim laser As Integer
Call ibdev(0, 3, 0, 13, 1, 0, laser)
' Define device desription
Call ibwrt(laser, "M1" + Chr$(10))
'Puts laser into distance mode
Call ibwrt(laser, BenchUsed + Chr$(10))
'Set laser to single pass (Flexi length) or double pass (Rigid length)
Call ibwrt(laser, Units + Chr$(10))
'Set units (UM for metric or UE for imperial, values passed from
'frmMeasurementselection form.
Call ibonl(laser, 0)
'Places Laser interface offline
    If (ibsta And EERR) Then
    ' Error trap for device problems
        ErrMsg = "Unable to open device" & Chr(13) & "ibsta = &H" & _
        Hex(ibsta) & Chr(13) & "iberr = " & iberr
        MsgBox ErrMsg, vbCritical, "Error"
        End
    End If
End Sub

