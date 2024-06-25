Attribute VB_Name = "INIHelper"
Option Explicit

Private Declare Function WritePrivateProfileString Lib "kernel32" _
Alias "WritePrivateProfileStringA" _
                        (ByVal lpApplicationName As String, _
                        ByVal lpKeyName As Any, _
                        ByVal lpString As Any, _
                        ByVal lpFileName As String) As Long

Private Declare Function GetPrivateProfileString Lib "kernel32" _
Alias "GetPrivateProfileStringA" _
                        (ByVal lpApplicationName As String, _
                        ByVal lpKeyName As Any, _
                        ByVal lpDefault As String, _
                        ByVal lpReturnedString As String, _
                        ByVal nSize As Long, _
                        ByVal lpFileName As String) As Long
                        
Public Function INIWrite(sSection As String, sKeyName As String, sNewString As String) As Boolean
  Dim sINIFileName As String
  sINIFileName = App.Path & "\CONFIG.INI"
  Call WritePrivateProfileString(sSection, sKeyName, sNewString, sINIFileName)
  INIWrite = (Err.Number = 0)
End Function

Public Function INIRead(sSection As String, sKeyName As String) As String
  Dim sINIFileName As String
  sINIFileName = App.Path & "\CONFIG.INI"
  Dim sRet As String
  sRet = String(255, Chr(0))
  INIRead = Left(sRet, GetPrivateProfileString(sSection, ByVal sKeyName, "", sRet, Len(sRet), sINIFileName))
End Function

