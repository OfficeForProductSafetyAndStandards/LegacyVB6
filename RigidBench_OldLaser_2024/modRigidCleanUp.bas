Attribute VB_Name = "modErrorCleanUp"
Option Explicit
'general clean up module for GPIB devices - laser
Sub GPIBCleanup(msg$)
    Dim ErrorMnemonic
    Dim ErrMsg As String * 100
    Dim laser As Integer
    ErrorMnemonic = Array("EDVR", "ECIC", "ENOL", "EADR", "EARG", _
    "ESAC", "EABO", "ENEB", "EDMA", "", _
    "EOIP", "ECAP", "EFSO", "", "EBUS", _
    "ESTB", "ESRQ", "", "", "", "ETAB")
    ErrMsg$ = msg$ & Chr(13) & "ibsta = &h" & Hex(ibsta) & Chr(13) _
    & "iberr = " & iberr & " <" & ErrorMnemonic(iberr) & ">"
    MsgBox ErrMsg$, vbCritical, "error"
    ilonl laser, 0
    End
End Sub

