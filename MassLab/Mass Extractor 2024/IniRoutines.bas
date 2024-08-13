Attribute VB_Name = "IniRoutines"
'==============================================================================================
'       Module to read in the information saved in the *.INI file associated to ther program
'
'   Please keep to naming convention, that is:
'       If the program is called Prog01 then the ini file is called:
'       Prog01.ini located in the same directory
'
'       Author  S Brown
'       Version 1.0.1
'       Date    30/9/2006
'
'===============================================================================================
'       Required variables

'===============================================================================================


Option Explicit

Public Declare Function GetPrivateProfileInt Lib "kernel32" Alias "GetPrivateProfileIntA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal nDefault As Long, ByVal lpFileName As String) As Long

'The GetPrivateProfileInt function retrieves an integer associated with a key in the 'specified section of an initialization file.
'lpApplicationName :.. Pointer to a null-terminated string specifying the name of the 'section in the initialization file
'lpKeyName :.. Pointer to the null-terminated string specifying the name of the key whose value is to be retrieved.
'nDefault :.. Specifies the default value to return if the key name cannot be found 'in the initialization file.
'lpFileName :... Pointer to a null-terminated string that specifies the name of the 'initialization file.


Public Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long

'The GetPrivateProfileString function retrieves an integer associated with a key in 'the specified section of an initialization file.

Public Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long

'The WritePrivateProfileString function copies a string into the specified section of 'the specified initialization file.

Public Function WriteStringToIni(IniFile As String, strHeading As String, strTopic As String, strMsg As String) As Boolean
'   Write to the ini file, find the heading and write to the topic the string StrMsg
'Routines Called:
'   WritePrivateProfileString

Dim SubTitle As String
On Error GoTo ErrorTrap
SubTitle = "WriteStringToIni"

WritePrivateProfileString strHeading, strTopic, strMsg, IniFile
Fun_Exit:
WriteStringToIni = True
Exit Function

ErrorTrap:
WriteStringToIni = False
MsgBox Err.Description, vbExclamation + vbOKOnly, SubTitle

End Function

Public Function GetStringFromIni(IniFile As String, strHeading As String, strTopic As String, StrReturn As String) As Boolean
'   Read parameters from the ini file
'   Find where in the ini file the heading StrHeading is,
'   go to the sub, StrTopic and return its string
'Routines Called:
'   GetPrivateProfileString

Dim MyStr As String * 255
Dim Iret As Integer 'returned string length

Dim SubTitle As String
On Error GoTo ErrorTrap
SubTitle = "GetStringFromIni"

Iret = GetPrivateProfileString(strHeading, strTopic, "", MyStr, Len(MyStr), IniFile)
StrReturn = Left(MyStr, Iret)
Fun_Exit:
If StrReturn <> Empty Then GetStringFromIni = True
Exit Function

ErrorTrap:
GetStringFromIni = False
MsgBox Err.Description, vbExclamation + vbOKOnly, SubTitle
End Function

Public Function GetArrayFromIni(IniFile As String, strHeading As String, strArray() As String) As Boolean
'   Reads the ini file IniFile
'   Points to the headingg strHeading
'   and reads the subtopics 1,2,3,4...... until there the input is empty
'   and assignes the entry to the array
'   If the number of entries is greater than 1, and no errors are found then True is returned
'   otherwise false is returned
'Routines Called:
'   GetStringFromIni


Dim NP As Integer   'reusable pointer for the number of points
Dim strRet As String    'dummy string
On Error GoTo ErrorTrap

NP = 1
Do Until GetStringFromIni(IniFile, strHeading, CStr(NP), strRet) = False
    ReDim Preserve strArray(NP)
    strArray(NP) = strRet
    NP = NP + 1
Loop

'If no entries in the array, then unsuccessful
If UBound(strArray()) > 0 Then GetArrayFromIni = True
FunExit:
Exit Function

ErrorTrap:


End Function



