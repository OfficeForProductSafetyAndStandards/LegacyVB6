Attribute VB_Name = "modTakeTinsleyReadings"
Option Explicit

Function TakeTinsleyReadings(ProbeCounter)
Dim OutputResult As String
Dim PRT As String
Dim result As String * 100
Dim Tinsley As Integer
SetUpTinsley 'go to module SetUpTinsley
    Select Case ProbeCounter
    Case 0
    PRT = "SEL1" & vbCr 'when checkbox 1 is clicked PRT is channel 1
    Case 1
    PRT = "SEL2" & vbCr
    Case 2
    PRT = "SEL3" & vbCr
    Case 3
    PRT = "SEL4" & vbCr
    Case 4
    PRT = "SEL5" & vbCr
    Case 5
    PRT = "SEL6" & vbCr
    Case 6
    PRT = "SEL7" & vbCr
    Case 7
    PRT = "SEL8" & vbCr
    Case 8
    PRT = "SELA" & vbCr
    Case 9
    PRT = "SELB" & vbCr 'when checkbox 10 is clicked PRT is channel B
    End Select
Call Send(0, 7, PRT, 0) 'sends channel selected to Tinsley
Sleep (5000) 'suspends execution for 10 seconds
result = Space$(15) 'Give a space for Tinsley buffer to put info into GPIB buffer
Call Receive(0, 7, result, 1) 'reads result from Tinsley
Sleep (1000)
OutputResult = Val(Mid$(result, 6, 7))
'gives the character position in string to start reading from and the length of characters to return
TakeTinsleyReadings = OutputResult
Call ibonl(Tinsley, 0) 'set Tinsley interface off line
End Function
