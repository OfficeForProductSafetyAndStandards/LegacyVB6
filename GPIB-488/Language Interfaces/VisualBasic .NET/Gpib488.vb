'
' Gpib488.vb - GPIB-488 VB.NET Language Interface
'
' Copyright Quality Instrumentation Solutions, Inc. and its licensors, (c) 2007
' All Rights Reserved.
'

Imports System.Text
Imports System.Runtime.InteropServices

Namespace QISI

    Public Class Gpib488Consts

        ' GPIB Status
        Public Const EERR As Integer = 1 << 15
        Public Const TIMO As Integer = 1 << 14
        Public Const EEND As Integer = 1 << 13
        Public Const SRQI As Integer = 1 << 12
        Public Const RQS As Integer = 1 << 11
        Public Const CMPL As Integer = 1 << 8
        Public Const LOK As Integer = 1 << 7
        Public Const RREM As Integer = 1 << 6
        Public Const CIC As Integer = 1 << 5
        Public Const ATN As Integer = 1 << 4
        Public Const TACS As Integer = 1 << 3
        Public Const LACS As Integer = 1 << 2
        Public Const DTAS As Integer = 1 << 1
        Public Const DCAS As Integer = 1 << 0

        ' GPIB Errors
        Public Const EDVR As Integer = 0
        Public Const ECIC As Integer = 1
        Public Const ENOL As Integer = 2
        Public Const EADR As Integer = 3
        Public Const EARG As Integer = 4
        Public Const ESAC As Integer = 5
        Public Const EABO As Integer = 6
        Public Const ENEB As Integer = 7
        Public Const EDMA As Integer = 8
        Public Const EOIP As Integer = 10
        Public Const ECAP As Integer = 11
        Public Const EFSO As Integer = 12
        Public Const EBUS As Integer = 14
        Public Const ESTB As Integer = 15
        Public Const ESRQ As Integer = 16
        Public Const ETAB As Integer = 20
        Public Const ELCK As Integer = 21
        Public Const EARM As Integer = 22
        Public Const EHDL As Integer = 23
        Public Const EWIP As Integer = 26
        Public Const ERST As Integer = 27

        ' Timeout values
        Public Const TNONE As Integer = 0
        Public Const T10us As Integer = 1
        Public Const T30us As Integer = 2
        Public Const T100us As Integer = 3
        Public Const T300us As Integer = 4
        Public Const T1ms As Integer = 5
        Public Const T3ms As Integer = 6
        Public Const T10ms As Integer = 7
        Public Const T30ms As Integer = 8
        Public Const T100ms As Integer = 9
        Public Const T300ms As Integer = 10
        Public Const T1s As Integer = 11
        Public Const T3s As Integer = 12
        Public Const T10s As Integer = 13
        Public Const T30s As Integer = 14
        Public Const T100s As Integer = 15
        Public Const T300s As Integer = 16
        Public Const T1000s As Integer = 17

        ' ibln() constants
        Public Const NO_SAD As Integer = 0
        Public Const ALL_SAD As Integer = -1

        ' ibconfig() options
        Public Const IbcPAD As Integer = &H1
        Public Const IbcSAD As Integer = &H2
        Public Const IbcTMO As Integer = &H3
        Public Const IbcEOT As Integer = &H4
        Public Const IbcPPC As Integer = &H5
        Public Const IbcREADDR As Integer = &H6
        Public Const IbcAUTOPOLL As Integer = &H7
        Public Const IbcCICPROT As Integer = &H8
        Public Const IbcIRQ As Integer = &H9
        Public Const IbcSC As Integer = &HA
        Public Const IbcSRE As Integer = &HB
        Public Const IbcEOSrd As Integer = &HC
        Public Const IbcEOSwrt As Integer = &HD
        Public Const IbcEOScmp As Integer = &HE
        Public Const IbcEOSchar As Integer = &HF
        Public Const IbcPP2 As Integer = &H10
        Public Const IbcTIMING As Integer = &H11
        Public Const IbcDMA As Integer = &H12
        Public Const IbcReadAdjust As Integer = &H13
        Public Const IbcWriteAdjust As Integer = &H14
        Public Const IbcSendLLO As Integer = &H17
        Public Const IbcSPollTime As Integer = &H18
        Public Const IbcPPollTime As Integer = &H19
        Public Const IbcEndBitIsNormal As Integer = &H1A
        Public Const IbcUnAddr As Integer = &H1B
        Public Const IbcBlockIfLocked As Integer = &H1D
        Public Const IbcHSCableLength As Integer = &H1F
        Public Const IbcIst As Integer = &H20
        Public Const IbcRsv As Integer = &H21
        Public Const IbcLON As Integer = &H22

        ' ibask() options
        Public Const IbaPAD As Integer = &H1
        Public Const IbaSAD As Integer = &H2
        Public Const IbaTMO As Integer = &H3
        Public Const IbaEOT As Integer = &H4
        Public Const IbaPPC As Integer = &H5
        Public Const IbaREADDR As Integer = &H6
        Public Const IbaAUTOPOLL As Integer = &H7
        Public Const IbaCICPROT As Integer = &H8
        Public Const IbaIRQ As Integer = &H9
        Public Const IbaSC As Integer = &HA
        Public Const IbaSRE As Integer = &HB
        Public Const IbaEOSrd As Integer = &HC
        Public Const IbaEOSwrt As Integer = &HD
        Public Const IbaEOScmp As Integer = &HE
        Public Const IbaEOSchar As Integer = &HF
        Public Const IbaPP2 As Integer = &H10
        Public Const IbaTIMING As Integer = &H11
        Public Const IbaDMA As Integer = &H12
        Public Const IbaReadAdjust As Integer = &H13
        Public Const IbaWriteAdjust As Integer = &H14
        Public Const IbaSendLLO As Integer = &H17
        Public Const IbaSPollTime As Integer = &H18
        Public Const IbaPPollTime As Integer = &H19
        Public Const IbaEndBitIsNormal As Integer = &H1A
        Public Const IbaUnAddr As Integer = &H1B
        Public Const IbaBlockIfLocked As Integer = &H1D
        Public Const IbaHSCableLength As Integer = &H1F
        Public Const IbaIst As Integer = &H20
        Public Const IbaRsv As Integer = &H21
        Public Const IbaLON As Integer = &H22
        Public Const IbaBNA As Integer = &H200

        ' Send() 488.2 constants
        Public Const NULLend As Integer = &H0
        Public Const NLend As Integer = &H1
        Public Const DABend As Integer = &H2

        ' Receive() 488.2 constants
        Public Const STOPend As Integer = &H100

        ' Address List terminator
        Public Const NOADDR As Short = -1

        Public Shared Function MakeAddr(ByVal pad As Byte, ByVal sad As Byte) As Short
            Return (pad) Or (sad << 8)
        End Function

        Public Shared Function GetPad(ByVal val As Short) As Byte
            Return val & &HFF
        End Function

        Public Shared Function GetSad(ByVal val As Short) As Byte
            Return (val >> 8) & &HFF
        End Function

    End Class

    Public Class Gpib488

        Private Const _GpibDll As String = "gpib488.dll"

        <DllImport(_GpibDll, EntryPoint:="ibask")> _
        Private Shared Function _ibask(ByVal ud As Integer, ByVal opt As Integer, ByRef v As Integer) As Integer
        End Function
        Public Shared Function ibask(ByVal ud As Integer, ByVal opt As Integer, ByVal v As Integer) As Integer
            Return _ibask(ud, opt, v)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibcac")> _
        Private Shared Function _ibcac(ByVal ud As Integer, ByVal v As Integer) As Integer
        End Function
        Public Shared Function ibcac(ByVal ud As Integer, ByVal v As Integer) As Integer
            Return _ibcac(ud, v)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibclr")> _
        Private Shared Function _ibclr(ByVal ud As Integer) As Integer
        End Function
        Public Shared Function ibclr(ByVal ud As Integer) As Integer
            Return _ibclr(ud)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibcmd")> _
        Private Shared Function _ibcmd(ByVal ud As Integer, ByVal buffer As Byte(), ByVal count As IntPtr) As Integer
        End Function
        Public Shared Function ibcmd(ByVal ud As Integer, ByVal buffer As Byte(), ByVal count As Integer) As Integer
            Return _ibcmd(ud, buffer, New IntPtr(count))
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibcmd")> _
        Private Shared Function _ibcmd(ByVal ud As Integer, ByVal buffer As String, ByVal count As IntPtr) As Integer
        End Function
        Public Shared Function ibcmd(ByVal ud As Integer, ByVal buffer As String, ByVal count As Integer) As Integer
            Return _ibcmd(ud, buffer, New IntPtr(count))
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibconfig")> _
        Private Shared Function _ibconfig(ByVal ud As Integer, ByVal opt As Integer, ByVal v As Integer) As Integer
        End Function
        Public Shared Function ibconfig(ByVal ud As Integer, ByVal opt As Integer, ByVal v As Integer) As Integer
            Return _ibconfig(ud, opt, v)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibdev")> _
        Private Shared Function _ibdev(ByVal board As Integer, ByVal pad As Integer, ByVal sad As Integer, ByVal tmo As Integer, ByVal eot As Integer, ByVal eos As Integer) As Integer
        End Function
        Public Shared Function ibdev(ByVal board As Integer, ByVal pad As Integer, ByVal sad As Integer, ByVal tmo As Integer, ByVal eot As Integer, ByVal eos As Integer) As Integer
            Return _ibdev(board, pad, sad, tmo, eot, eos)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibfind")> _
        Private Shared Function _ibfind(ByVal name As String) As Integer
        End Function
        Public Shared Function ibfind(ByVal name As String) As Integer
            Return _ibfind(name)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibgts")> _
        Private Shared Function _ibgts(ByVal ud As Integer, ByVal v As Integer) As Integer
        End Function
        Public Shared Function ibgts(ByVal ud As Integer, ByVal v As Integer) As Integer
            Return _ibgts(ud, v)
        End Function

        <DllImport(_GpibDll, EntryPoint:="iblines")> _
        Private Shared Function _iblines(ByVal ud As Integer, ByRef result As Short) As Integer
        End Function
        Public Shared Function iblines(ByVal ud As Integer, ByRef result As Short) As Integer
            Return _iblines(ud, result)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibln")> _
        Private Shared Function _ibln(ByVal ud As Integer, ByVal pad As Integer, ByVal sad As Integer, ByRef listen As Short) As Integer
        End Function
        Public Shared Function ibln(ByVal ud As Integer, ByVal pad As Integer, ByVal sad As Integer, ByRef listen As Short) As Integer
            Return _ibln(ud, pad, sad, listen)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibloc")> _
        Private Shared Function _ibloc(ByVal ud As Integer) As Integer
        End Function
        Public Shared Function ibloc(ByVal ud As Integer) As Integer
            Return _ibloc(ud)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibonl")> _
        Private Shared Function _ibonl(ByVal ud As Integer, ByVal v As Integer) As Integer
        End Function
        Public Shared Function ibonl(ByVal ud As Integer, ByVal v As Integer) As Integer
            Return _ibonl(ud, v)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibpct")> _
        Private Shared Function _ibpct(ByVal ud As Integer) As Integer
        End Function
        Public Shared Function ibpct(ByVal ud As Integer) As Integer
            Return _ibpct(ud)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibppc")> _
        Private Shared Function _ibppc(ByVal ud As Integer, ByVal v As Integer) As Integer
        End Function
        Public Shared Function ibppc(ByVal ud As Integer, ByVal v As Integer) As Integer
            Return _ibppc(ud, v)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibrd")> _
        Private Shared Function _ibrd(ByVal ud As Integer, <MarshalAs(UnmanagedType.LPStr)> ByRef buffer As StringBuilder, ByVal count As IntPtr) As Integer
        End Function
        Public Shared Function ibrd(ByVal ud As Integer, ByRef buffer As StringBuilder, ByVal count As Integer) As Integer
            Return _ibrd(ud, buffer, New IntPtr(count))
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibrd")> _
        Private Shared Function _ibrd(ByVal ud As Integer, ByRef buffer As Byte(), ByVal count As IntPtr) As Integer
        End Function
        Public Shared Function ibrd(ByVal ud As Integer, ByRef buffer As Byte(), ByVal count As Integer) As Integer
            Return _ibrd(ud, buffer, New IntPtr(count))
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibrdf")> _
        Private Shared Function _ibrdf(ByVal ud As Integer, ByVal filename As String) As Integer
        End Function
        Public Shared Function ibrdf(ByVal ud As Integer, ByVal filename As String) As Integer
            Return _ibrdf(ud, filename)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibrpp")> _
        Private Shared Function _ibrpp(ByVal ud As Integer, ByRef ppr As Byte) As Integer
        End Function
        Public Shared Function ibrpp(ByVal ud As Integer, ByRef ppr As Byte) As Integer
            Return _ibrpp(ud, ppr)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibrsp")> _
        Private Shared Function _ibrsp(ByVal ud As Integer, ByRef spr As Byte) As Integer
        End Function
        Public Shared Function ibrsp(ByVal ud As Integer, ByRef spr As Byte) As Integer
            Return _ibrsp(ud, spr)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibsic")> _
        Private Shared Function _ibsic(ByVal ud As Integer) As Integer
        End Function
        Public Shared Function ibsic(ByVal ud As Integer) As Integer
            Return _ibsic(ud)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibstop")> _
        Private Shared Function _ibstop(ByVal ud As Integer) As Integer
        End Function
        Public Shared Function ibstop(ByVal ud As Integer) As Integer
            Return _ibstop(ud)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibtrg")> _
        Private Shared Function _ibtrg(ByVal ud As Integer) As Integer
        End Function
        Public Shared Function ibtrg(ByVal ud As Integer) As Integer
            Return _ibtrg(ud)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibwait")> _
        Private Shared Function _ibwait(ByVal ud As Integer, ByVal mask As Integer) As Integer
        End Function
        Public Shared Function ibwait(ByVal ud As Integer, ByVal mask As Integer) As Integer
            Return _ibwait(ud, mask)
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibwrt")> _
        Private Shared Function _ibwrt(ByVal ud As Integer, ByVal buffer As Byte(), ByVal count As IntPtr) As Integer
        End Function
        Public Shared Function ibwrt(ByVal ud As Integer, ByVal buffer As Byte(), ByVal count As Integer) As Integer
            Return _ibwrt(ud, buffer, New IntPtr(count))
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibwrt")> _
        Private Shared Function _ibwrt(ByVal ud As Integer, ByVal buffer As String, ByVal count As IntPtr) As Integer
        End Function
        Public Shared Function ibwrt(ByVal ud As Integer, ByVal buffer As String, ByVal count As Integer) As Integer
            Return _ibwrt(ud, buffer, New IntPtr(count))
        End Function

        <DllImport(_GpibDll, EntryPoint:="ibwrtf")> _
        Private Shared Function _ibwrtf(ByVal ud As Integer, ByVal filename As String) As Integer
        End Function
        Public Shared Function ibwrtf(ByVal ud As Integer, ByVal filename As String) As Integer
            Return _ibwrtf(ud, filename)
        End Function

        '''''

        <DllImport(_GpibDll, EntryPoint:="Ibsta")> _
        Private Shared Function _Ibsta() As Integer
        End Function
        Public Shared Function Ibsta() As Integer
            Return _Ibsta()
        End Function

        <DllImport(_GpibDll, EntryPoint:="Iberr")> _
        Private Shared Function _Iberr() As Integer
        End Function
        Public Shared Function Iberr() As Integer
            Return _Iberr()
        End Function

        <DllImport(_GpibDll, EntryPoint:="Ibcnt")> _
        Private Shared Function _Ibcnt() As Integer
        End Function
        Public Shared Function Ibcnt() As Integer
            Return _Ibcnt()
        End Function

        '''''

        <DllImport(_GpibDll, EntryPoint:="ThreadIbsta")> _
        Private Shared Function _ThreadIbsta() As Integer
        End Function
        Public Shared Function ThreadIbsta() As Integer
            Return _ThreadIbsta()
        End Function

        <DllImport(_GpibDll, EntryPoint:="ThreadIberr")> _
        Private Shared Function _ThreadIberr() As Integer
        End Function
        Public Shared Function ThreadIberr() As Integer
            Return _ThreadIberr()
        End Function

        <DllImport(_GpibDll, EntryPoint:="ThreadIbcnt")> _
        Private Shared Function _ThreadIbcnt() As Integer
        End Function
        Public Shared Function ThreadIbcnt() As Integer
            Return _ThreadIbcnt()
        End Function

        '''''

        <DllImport(_GpibDll, EntryPoint:="AllSpoll")> _
        Private Shared Sub _AllSpoll(ByVal board As Integer, ByVal addrlist As Short(), ByVal results As Short())
        End Sub
        Public Shared Sub AllSpoll(ByVal board As Integer, ByVal addrlist As Short(), ByVal results As Short())
            _AllSpoll(board, addrlist, results)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="DevClear")> _
        Private Shared Sub _DevClear(ByVal board As Integer, ByVal address As Short)
        End Sub
        Public Shared Sub DevClear(ByVal board As Integer, ByVal address As Short)
            _DevClear(board, address)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="DevClearList")> _
        Private Shared Sub _DevClearList(ByVal board As Integer, ByVal addrlist As Short())
        End Sub
        Public Shared Sub DevClearList(ByVal board As Integer, ByVal addrlist As Short())
            _DevClearList(board, addrlist)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="EnableLocal")> _
        Private Shared Sub _EnableLocal(ByVal board As Integer, ByVal addrlist As Short())
        End Sub
        Public Shared Sub EnableLocal(ByVal board As Integer, ByVal addrlist As Short())
            _EnableLocal(board, addrlist)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="EnableRemote")> _
        Private Shared Sub _EnableRemote(ByVal board As Integer, ByVal addrlist As Short())
        End Sub
        Public Shared Sub EnableRemote(ByVal board As Integer, ByVal addrlist As Short())
            _EnableRemote(board, addrlist)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="FindLstn")> _
        Private Shared Sub _FindLstn(ByVal board As Integer, ByVal addrlist As Short(), ByVal results As Short(), ByVal limit As IntPtr)
        End Sub
        Public Shared Sub FindLstn(ByVal board As Integer, ByVal addrlist As Short(), ByVal results As Short(), ByVal limit As Integer)
            _FindLstn(board, addrlist, results, New IntPtr(limit))
        End Sub

        <DllImport(_GpibDll, EntryPoint:="FindRQS")> _
        Private Shared Sub _FindRQS(ByVal board As Integer, ByVal addrlist As Short(), ByRef devstat As Short)
        End Sub
        Public Shared Sub FindRQS(ByVal board As Integer, ByVal addrlist As Short(), ByRef devstat As Short)
            _FindRQS(board, addrlist, devstat)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="PPoll")> _
        Private Shared Sub _PPoll(ByVal board As Integer, ByRef result As Short)
        End Sub
        Public Shared Sub PPoll(ByVal board As Integer, ByRef result As Short)
            _PPoll(board, result)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="PPollConfig")> _
        Private Shared Sub _PPollConfig(ByVal board As Integer, ByVal address As Short, ByVal dataline As Integer, ByVal linesense As Integer)
        End Sub
        Public Shared Sub PPollConfig(ByVal board As Integer, ByVal address As Short, ByVal dataline As Integer, ByVal linesense As Integer)
            _PPollConfig(board, address, dataline, linesense)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="PPollUnconfig")> _
        Private Shared Sub _PPollUnconfig(ByVal board As Integer, ByVal addrlist As Short())
        End Sub
        Public Shared Sub PPollUnconfig(ByVal board As Integer, ByVal addrlist As Short())
            _PPollUnconfig(board, addrlist)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="PassControl")> _
        Private Shared Sub _PassControl(ByVal board As Integer, ByVal address As Short)
        End Sub
        Public Shared Sub PassControl(ByVal board As Integer, ByVal address As Short)
            _PassControl(board, address)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="RcvRespMsg")> _
        Private Shared Sub _RcvRespMsg(ByVal board As Integer, ByVal buffer As Byte(), ByVal count As IntPtr, ByVal termination As Integer)
        End Sub
        Public Shared Sub RcvRespMsg(ByVal board As Integer, ByVal buffer As Byte(), ByVal count As Integer, ByVal termination As Integer)
            _RcvRespMsg(board, buffer, New IntPtr(count), termination)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="RcvRespMsg")> _
        Private Shared Sub _RcvRespMsg(ByVal board As Integer, <MarshalAs(UnmanagedType.LPStr)> ByVal buffer As StringBuilder, ByVal count As IntPtr, ByVal termination As Integer)
        End Sub
        Public Shared Sub RcvRespMsg(ByVal board As Integer, <MarshalAs(UnmanagedType.LPStr)> ByVal buffer As StringBuilder, ByVal count As Integer, ByVal termination As Integer)
            _RcvRespMsg(board, buffer, New IntPtr(count), termination)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="ReadStatusByte")> _
        Private Shared Sub _ReadStatusByte(ByVal board As Integer, ByVal address As Short, ByRef result As Short)
        End Sub
        Public Shared Sub ReadStatusByte(ByVal board As Integer, ByVal address As Short, ByRef result As Short)
            _ReadStatusByte(board, address, result)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="Receive")> _
        Private Shared Sub _Receive(ByVal board As Integer, ByVal address As Short, ByVal buffer As Byte(), ByVal count As IntPtr, ByVal termination As Integer)
        End Sub
        Public Shared Sub Receive(ByVal board As Integer, ByVal address As Short, ByVal buffer As Byte(), ByVal count As Integer, ByVal termination As Integer)
            _Receive(board, address, buffer, New IntPtr(count), termination)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="Receive")> _
        Private Shared Sub _Receive(ByVal board As Integer, ByVal address As Short, <MarshalAs(UnmanagedType.LPStr)> ByVal buffer As StringBuilder, ByVal count As IntPtr, ByVal termination As Integer)
        End Sub
        Public Shared Sub Receive(ByVal board As Integer, ByVal address As Short, <MarshalAs(UnmanagedType.LPStr)> ByVal buffer As StringBuilder, ByVal count As Integer, ByVal termination As Integer)
            _Receive(board, address, buffer, New IntPtr(count), termination)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="ReceiveSetup")> _
        Private Shared Sub _ReceiveSetup(ByVal board As Integer, ByVal address As Short)
        End Sub
        Public Shared Sub ReceiveSetup(ByVal board As Integer, ByVal address As Short)
            _ReceiveSetup(board, address)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="ResetSys")> _
        Private Shared Sub _ResetSys(ByVal board As Integer, ByVal addrlist As Short())
        End Sub
        Public Shared Sub ResetSys(ByVal board As Integer, ByVal addrlist As Short())
            _ResetSys(board, addrlist)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="Send")> _
        Private Shared Sub _Send(ByVal board As Integer, ByVal address As Short, ByVal buffer As Byte(), ByVal count As IntPtr, ByVal eotmode As Integer)
        End Sub
        Public Shared Sub Send(ByVal board As Integer, ByVal address As Short, ByVal buffer As Byte(), ByVal count As Integer, ByVal eotmode As Integer)
            _Send(board, address, buffer, New IntPtr(count), eotmode)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="Send")> _
        Private Shared Sub _Send(ByVal board As Integer, ByVal address As Short, ByVal buffer As String, ByVal count As IntPtr, ByVal eotmode As Integer)
        End Sub
        Public Shared Sub Send(ByVal board As Integer, ByVal address As Short, ByVal buffer As String, ByVal count As Integer, ByVal eotmode As Integer)
            _Send(board, address, buffer, New IntPtr(count), eotmode)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="SendCmds")> _
        Private Shared Sub _SendCmds(ByVal board As Integer, ByVal buffer As Byte(), ByVal count As IntPtr)
        End Sub
        Public Shared Sub SendCmds(ByVal board As Integer, ByVal buffer As Byte(), ByVal count As Integer)
            _SendCmds(board, buffer, New IntPtr(count))
        End Sub

        <DllImport(_GpibDll, EntryPoint:="SendCmds")> _
        Private Shared Sub _SendCmds(ByVal board As Integer, ByVal buffer As String, ByVal count As IntPtr)
        End Sub
        Public Shared Sub SendCmds(ByVal board As Integer, ByVal buffer As String, ByVal count As Integer)
            _SendCmds(board, buffer, New IntPtr(count))
        End Sub

        <DllImport(_GpibDll, EntryPoint:="SendDataBytes")> _
        Private Shared Sub _SendDataBytes(ByVal board As Integer, ByVal buffer As Byte(), ByVal count As IntPtr, ByVal eotmode As Integer)
        End Sub
        Public Shared Sub SendDataBytes(ByVal board As Integer, ByVal buffer As Byte(), ByVal count As Integer, ByVal eotmode As Integer)
            _SendDataBytes(board, buffer, New IntPtr(count), eotmode)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="SendDataBytes")> _
        Private Shared Sub _SendDataBytes(ByVal board As Integer, ByVal buffer As String, ByVal count As IntPtr, ByVal eotmode As Integer)
        End Sub
        Public Shared Sub SendDataBytes(ByVal board As Integer, ByVal buffer As String, ByVal count As Integer, ByVal eotmode As Integer)
            _SendDataBytes(board, buffer, New IntPtr(count), eotmode)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="SendIFC")> _
        Private Shared Sub _SendIFC(ByVal board As Integer)
        End Sub
        Public Shared Sub SendIFC(ByVal board As Integer)
            _SendIFC(board)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="SendLLO")> _
        Private Shared Sub _SendLLO(ByVal board As Integer)
        End Sub
        Public Shared Sub SendLLO(ByVal board As Integer)
            _SendLLO(board)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="SendList")> _
        Private Shared Sub _SendList(ByVal board As Integer, ByVal addrlist As Short(), ByVal buffer As Byte(), ByVal count As IntPtr, ByVal eotmode As Integer)
        End Sub
        Public Shared Sub SendList(ByVal board As Integer, ByVal addrlist As Short(), ByVal buffer As Byte(), ByVal count As Integer, ByVal eotmode As Integer)
            _SendList(board, addrlist, buffer, New IntPtr(count), eotmode)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="SendList")> _
        Private Shared Sub _SendList(ByVal board As Integer, ByVal addrlist As Short(), ByVal buffer As String, ByVal count As IntPtr, ByVal eotmode As Integer)
        End Sub
        Public Shared Sub SendList(ByVal board As Integer, ByVal addrlist As Short(), ByVal buffer As String, ByVal count As Integer, ByVal eotmode As Integer)
            _SendList(board, addrlist, buffer, New IntPtr(count), eotmode)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="SendSetup")> _
        Private Shared Sub _SendSetup(ByVal board As Integer, ByVal addrlist As Short())
        End Sub
        Public Shared Sub SendSetup(ByVal board As Integer, ByVal addrlist As Short())
            _SendSetup(board, addrlist)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="SendRWLS")> _
        Private Shared Sub _SendRWLS(ByVal board As Integer, ByVal addrlist As Short())
        End Sub
        Public Shared Sub SendRWLS(ByVal board As Integer, ByVal addrlist As Short())
            _SendRWLS(board, addrlist)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="TestSRQ")> _
        Private Shared Sub _TestSRQ(ByVal board As Integer, ByRef result As Short)
        End Sub
        Public Shared Sub TestSRQ(ByVal board As Integer, ByRef result As Short)
            _TestSRQ(board, result)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="TestSys")> _
        Private Shared Sub _TestSys(ByVal board As Integer, ByVal addrlist As Short(), ByVal results As Short())
        End Sub
        Public Shared Sub TestSys(ByVal board As Integer, ByVal addrlist As Short(), ByVal results As Short())
            _TestSys(board, addrlist, results)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="Trigger")> _
        Private Shared Sub _Trigger(ByVal board As Integer, ByVal address As Short)
        End Sub
        Public Shared Sub Trigger(ByVal board As Integer, ByVal address As Short)
            _Trigger(board, address)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="TriggerList")> _
        Private Shared Sub _TriggerList(ByVal board As Integer, ByVal addrlist As Short())
        End Sub
        Public Shared Sub TriggerList(ByVal board As Integer, ByVal addrlist As Short())
            _TriggerList(board, addrlist)
        End Sub

        <DllImport(_GpibDll, EntryPoint:="WaitSRQ")> _
        Private Shared Sub _WaitSRQ(ByVal board As Integer, ByRef result As Short)
        End Sub
        Public Shared Sub WaitSRQ(ByVal board As Integer, ByRef result As Short)
            _WaitSRQ(board, result)
        End Sub
    End Class

End Namespace
