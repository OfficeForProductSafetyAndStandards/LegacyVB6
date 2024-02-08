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
'read bytes into buffer and place into ValueStr$ up to 1024 bytes of data
    DisplayStr = Left(ValueStr, ibcntl - 1)
'ibcntl counts the actual number of bytes received and uses it
'to get the value from the string
    TakeBarometerReading = Val(DisplayStr)
End Function
