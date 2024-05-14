Attribute VB_Name = "modSetUpTinsley"
Option Explicit
Sub SetUpTinsley()
Dim Tinsley As Integer
Dim Sendstr As String
'SendIFC (0)
Call ibtmo(0, T10s) 'sets the timeout period for I/O operation at 10 seconds
Call ibdev(0, 7, 0, T10s, 1, 0, Tinsley) 'open and initialize device descriptor
Sleep (1000) 'wait 1 second
Sendstr = "RAN2" & vbCr 'will make Tinsley select 100 ohm range, when sent in the call command below
Call Send(0, 7, Sendstr, DABend)
Sleep (1000) 'wait 1 second
Sendstr = "STDI" & vbCr 'select internal resisitor
Call Send(0, 7, Sendstr, DABend)
Sleep (1000)
Sendstr = "CUR2" & vbCr 'select 0.3 mA
Call Send(0, 7, Sendstr, DABend)
Sleep (1000)
Sendstr = "X1.4" & vbCr 'select root 2
Call Send(0, 7, Sendstr, DABend)
Sleep (1000)
Sendstr = "AUTO" & vbCr 'select auto mode
Call Send(0, 7, Sendstr, DABend)
Sleep (1000)
Sendstr = "DISC" & vbCr 'select degrees C
Call Send(0, 7, Sendstr, DABend)
Sleep (1000)
Call ibonl(Tinsley, 0) 'places Tinsely interface off line
If (ibsta And EERR) Then
    ' error check for IEEE, like we need it Ha!
    Call GPIBCleanup("Unable to clear device")
End If

End Sub

