' NI-488 Direct-Entry Points

Declare Function dllibclr Lib "gpib.dll" (ByVal ud%, ibsta%, iberr%, ibcntl&) As Integer
Declare Function dllibdev Lib "gpib.dll" (ByVal Boardindex%, ByVal pad%, ByVal sad%, ByVal tmo%, ByVal eot%, ByVal eos%, ibsta%, iberr%, ibcntl&) As Integer
Declare Function dllibonl Lib "gpib.dll" (ByVal ud%, ByVal v%, ibsta%, iberr%, ibcntl&) As Integer
Declare Function dllibpad Lib "gpib.dll" (ByVal ud%, ByVal v%, ibsta%, iberr%, ibcntl&) As Integer
Declare Function dllibrd Lib "gpib.dll" (ByVal ud%, ByVal buffer$, ByVal cnt&, ibsta%, iberr%, ibcntl&) As Integer
Declare Function dllibrsp Lib "gpib.dll" (ByVal ud%, spr%, ibsta%, iberr%, ibcntl&) As Integer
Declare Function dllibtrg Lib "gpib.dll" (ByVal ud%, ibsta%, iberr%, ibcntl&) As Integer
Declare Function dllibwait Lib "gpib.dll" (ByVal ud%, ByVal mask%, ibsta%, iberr%, ibcntl&) As Integer
Declare Function dllibwrt Lib "gpib.dll" (ByVal ud%, ByVal buffer$, ByVal cnt&, ibsta%, iberr%, ibcntl&) As Integer


'NI-488.2 Direct-Entry Points

Declare Sub DLLDevClear Lib "gpib.dll" (ByVal Boardindex%, ByVal address%, ibsta%, iberr%, ibcntl&)
Declare Sub DLLFindLstn Lib "gpib.dll" (ByVal Boardindex%, padlist%, resultlist%, ByVal limit%, ibsta%, iberr%, ibcntl&)
Declare Sub DLLReadStatusByte Lib "gpib.dll" (ByVal Boardindex%, ByVal address%, result%, ibsta%, iberr%, ibcntl&)
Declare Sub DLLReceive Lib "gpib.dll" (ByVal Boardindex%, ByVal address%, ByVal buffer$, ByVal cnt&, ByVal termination%, ibsta%, iberr%, ibcntl&)
Declare Sub DLLSend Lib "gpib.dll" (ByVal Boardindex%, ByVal address%, ByVal buffer$, ByVal cnt&, ByVal eotmode%, ibsta%, iberr%, ibcntl&)
Declare Sub DLLSendIFC Lib "gpib.dll" (ByVal Boardindex%, ibsta%, iberr%, ibcntl&)
Declare Sub DLLWaitSRQ Lib "gpib.dll" (ByVal Boardindex%, result%, ibsta%, iberr%, ibcntl&)

