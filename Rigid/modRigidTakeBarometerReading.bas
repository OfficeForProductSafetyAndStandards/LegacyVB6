Attribute VB_Name = "modTakeBarometerReading"
Option Explicit

Function TakeBarometerReading()
Dim barometer As Integer
Dim ValueStr As String * 1024
Dim DisplayStr As String

Call ibdev(0, 20, 0, 10, 1, 0, barometer) 'define device description
    ilclr barometer  'reset the GPIB of device
    If (ibsta And EERR) Then 'if error call GPIB clean up module
        Call GPIBCleanup("Unable to clear device")
    End If
    ilrd barometer, ValueStr$, Len(ValueStr$)
    DisplayStr = Left(ValueStr, ibcntl - 1)
    TakeBarometerReading = Val(DisplayStr)
'    TakeBarometerReading = 1024 'gives a reading of 1024 when barometer not connected
End Function
