Attribute VB_Name = "modTakeLaserReadings"
Option Explicit

Function TakeLaserReadings()
Dim laser As Integer
Dim counter As Integer
Dim ibuf$
Call ibdev(0, 3, 0, 0, 1, 0, laser%) ' Define device desription
    ibuf$ = Space$(15)
    'Give a space for Laser buffer to put info into GPIB buffer
    Call ibwait(laser, RQS)
    'Instruct program to wait until the Button is pressed
    Call ibrd(laser, ibuf$)
    'Read from the newly created buffer ibuf$ to get value out
TakeLaserReadings = Val(ibuf$)
Call ibonl(laser%, 0)
' put value into TakeReadings variable for passing
' back to main procedure - really cool
If (ibsta And EERR) Then
    ' error check for IEEE, like we need it Ha!
    Call GPIBCleanup("Unable to clear device")
End If
' Oh my god that was hard to find out
End Function
