Attribute VB_Name = "modProgressBar"
Private Const WM_USER = &H400
Private Const CCM_FIRST       As Long = &H2000&
Private Const CCM_SETBKCOLOR  As Long = (CCM_FIRST + 1)

'set progressbar backcolor in IE3 or later
Public Const PBM_SETBKCOLOR  As Long = CCM_SETBKCOLOR

'set progressbar barcolor in IE4 or later
Public Const PBM_SETBARCOLOR As Long = (WM_USER + 9)

Public Declare Function SendMessage Lib "user32" _
   Alias "SendMessageA" _
  (ByVal hwnd As Long, _
   ByVal wMsg As Long, _
   ByVal wParam As Long, _
   lParam As Any) As Long
Public Sub SetProgressBarColour(hwndProgBar As Long, ByVal clrref As Long)

   Call SendMessage(hwndProgBar, PBM_SETBARCOLOR, 0&, ByVal clrref)

End Sub


Public Sub SetProgressBackColour(hwndProgBar As Long, ByVal clrref As Long)

   Call SendMessage(hwndProgBar, PBM_SETBKCOLOR, 0&, ByVal clrref)

End Sub


