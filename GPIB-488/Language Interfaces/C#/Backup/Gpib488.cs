//
// Gpib488.cs - GPIB-488 C# Language Interface
//
// Copyright Quality Instrumentation Solutions, Inc. and its licensors, (c) 2007
// All Rights Reserved.
// 

using System;
using System.Text;
using System.Runtime.InteropServices;

namespace QISI
{
	public class Gpib488Consts
	{
		// GPIB Status
		public const int ERR  = 1 << 15; // Error detected
		public const int TIMO = 1 << 14; // Timeout
		public const int END  = 1 << 13; // EOI or EOS detected
		public const int SRQI = 1 << 12; // SRQ detected by CIC
		public const int RQS  = 1 << 11; // Device needs service
		public const int CMPL = 1 << 8;  // I/O completed
		public const int LOK  = 1 << 7;  // Local lockout state
		public const int REM  = 1 << 6;  // Remote state
		public const int CIC  = 1 << 5;  // Controller-in-Charge
		public const int ATN  = 1 << 4;  // Attention asserted
		public const int TACS = 1 << 3;  // Talker active
		public const int LACS = 1 << 2;  // Listener active
		public const int DTAS = 1 << 1;  // Device trigger state
		public const int DCAS = 1 << 0;  // Device clear state

		// GPIB Errors
		public const int EDVR = 0;  // System error
		public const int ECIC = 1;  // Function requires GPIB board to be CIC
		public const int ENOL = 2;  // Write function detected no Listeners
		public const int EADR = 3;  // Interface board not addressed correctly
		public const int EARG = 4;  // Invalid argument to function call
		public const int ESAC = 5;  // Function requires GPIB board to be SAC
		public const int EABO = 6;  // I/O operation aborted
		public const int ENEB = 7;  // Non-existent interface board
		public const int EDMA = 8;  // Error performing DMA
		public const int EOIP = 10; // I/O operation started before previous operation completed
		public const int ECAP = 11; // No capability for intended operation
		public const int EFSO = 12; // File system operation error
		public const int EBUS = 14; // Command error during device call
		public const int ESTB = 15; // Serial poll status byte lost
		public const int ESRQ = 16; // SRQ remains asserted
		public const int ETAB = 20; // The return buffer is full
		public const int ELCK = 21; // Address or board is locked
		public const int EARM = 22; // The ibnotify Callback failed to rearm
		public const int EHDL = 23; // The input handle is invalid
		public const int EWIP = 26; // Wait already in progress on input ud
		public const int ERST = 27; // The event notification was cancelled due to a reset of the interface

		// Timeout values
		public const int TNONE  = 0;  // Infinite timeout (disabled)
		public const int T10us  = 1;  // Timeout of 10 us (ideal)
		public const int T30us  = 2;  // Timeout of 30 us (ideal)
		public const int T100us = 3;  // Timeout of 100 us (ideal)
		public const int T300us = 4;  // Timeout of 300 us (ideal)
		public const int T1ms   = 5;  // Timeout of 1 ms (ideal)
		public const int T3ms   = 6;  // Timeout of 3 ms (ideal)
		public const int T10ms  = 7;  // Timeout of 10 ms (ideal)
		public const int T30ms  = 8;  // Timeout of 30 ms (ideal)
		public const int T100ms = 9;  // Timeout of 100 ms (ideal)
		public const int T300ms = 10; // Timeout of 300 ms (ideal)
		public const int T1s    = 11; // Timeout of 1 s (ideal)
		public const int T3s    = 12; // Timeout of 3 s (ideal)
		public const int T10s   = 13; // Timeout of 10 s (ideal)
		public const int T30s   = 14; // Timeout of 30 s (ideal)
		public const int T100s  = 15; // Timeout of 100 s (ideal)
		public const int T300s  = 16; // Timeout of 300 s (ideal)
		public const int T1000s = 17; // Timeout of 1000 s (ideal)

		// ibln() constants
		public const int NO_SAD  = 0;
		public const int ALL_SAD = -1;

		// ibconfig() options
		public const int IbcPAD            = 0x0001; // Primary Address
		public const int IbcSAD            = 0x0002; // Secondary Address
		public const int IbcTMO            = 0x0003; // Timeout Value
		public const int IbcEOT            = 0x0004; // Send EOI with last data byte?
		public const int IbcPPC            = 0x0005; // Parallel Poll Configure
		public const int IbcREADDR         = 0x0006; // Repeat Addressing
		public const int IbcAUTOPOLL       = 0x0007; // Disable Auto Serial Polling
		public const int IbcCICPROT        = 0x0008; // Use the CIC Protocol?
		public const int IbcIRQ            = 0x0009; // Use PIO for I/O
		public const int IbcSC             = 0x000A; // Board is System Controller?
		public const int IbcSRE            = 0x000B; // Assert SRE on device calls?
		public const int IbcEOSrd          = 0x000C; // Terminate reads on EOS
		public const int IbcEOSwrt         = 0x000D; // Send EOI with EOS character
		public const int IbcEOScmp         = 0x000E; // Use 7 or 8-bit EOS compare
		public const int IbcEOSchar        = 0x000F; // The EOS character
		public const int IbcPP2            = 0x0010; // Use Parallel Poll Mode 2
		public const int IbcTIMING         = 0x0011; // NORMAL, HIGH, or VERY_HIGH timing
		public const int IbcDMA            = 0x0012; // Use DMA for I/O
		public const int IbcReadAdjust     = 0x0013; // Swap bytes during an ibrd
		public const int IbcWriteAdjust    = 0x0014; // Swap bytes during an ibwrt
		public const int IbcSendLLO        = 0x0017; // Enable/disable the sending of LLO
		public const int IbcSPollTime      = 0x0018; // Set the timeout value for serial polls
		public const int IbcPPollTime      = 0x0019; // Set the parallel poll length period
		public const int IbcEndBitIsNormal = 0x001A; // Remove EOS from END bit of IBSTA
		public const int IbcUnAddr         = 0x001B; // Enable/disable device unaddressing
		public const int IbcBlockIfLocked  = 0x001D; // Enable/disable blocking for locked boards/devices
		public const int IbcHSCableLength  = 0x001F; // Length of cable specified for high speed timing
		public const int IbcIst            = 0x0020; // Set the IST bit
		public const int IbcRsv            = 0x0021; // Set the RSV byte
		public const int IbcLON            = 0x0022; // Enter listen only mode

		// ibask() options
		public const int IbaPAD            = 0x0001; // Primary Address
		public const int IbaSAD            = 0x0002; // Secondary Address
		public const int IbaTMO            = 0x0003; // Timeout Value
		public const int IbaEOT            = 0x0004; // Send EOI with last data byte?
		public const int IbaPPC            = 0x0005; // Parallel Poll Configure
		public const int IbaREADDR         = 0x0006; // Repeat Addressing
		public const int IbaAUTOPOLL       = 0x0007; // Disable Auto Serial Polling
		public const int IbaCICPROT        = 0x0008; // Use the CIC Protocol?
		public const int IbaIRQ            = 0x0009; // Use PIO for I/O
		public const int IbaSC             = 0x000A; // Board is System Controller?
		public const int IbaSRE            = 0x000B; // Assert SRE on device calls?
		public const int IbaEOSrd          = 0x000C; // Terminate reads on EOS
		public const int IbaEOSwrt         = 0x000D; // Send EOI with EOS character
		public const int IbaEOScmp         = 0x000E; // Use 7 or 8-bit EOS compare
		public const int IbaEOSchar        = 0x000F; // The EOS character
		public const int IbaPP2            = 0x0010; // Use Parallel Poll Mode 2
		public const int IbaTIMING         = 0x0011; // NORMAL, HIGH, or VERY_HIGH timing
		public const int IbaDMA            = 0x0012; // Use DMA for I/O
		public const int IbaReadAdjust     = 0x0013; // Swap bytes during an ibrd
		public const int IbaWriteAdjust    = 0x0014; // Swap bytes during an ibwrt
		public const int IbaSendLLO        = 0x0017; // Enable/disable the sending of LLO
		public const int IbaSPollTime      = 0x0018; // Set the timeout value for serial polls
		public const int IbaPPollTime      = 0x0019; // Set the parallel poll length period
		public const int IbaEndBitIsNormal = 0x001A; // Remove EOS from END bit of IBSTA
		public const int IbaUnAddr         = 0x001B; // Enable/disable device unaddressing
		public const int IbaBlockIfLocked  = 0x001D; // Enable/disable blocking for locked boards/devices
		public const int IbaHSCableLength  = 0x001F; // Length of cable specified for high speed timing
		public const int IbaIst            = 0x0020; // Set the IST bit
		public const int IbaRsv            = 0x0021; // Set the RSV byte
		public const int IbaLON            = 0x0022; // Enter listen only mode
		public const int IbaBNA            = 0x0200; // A device's access board

		// Send() 488.2 constants
		public const int NULLend = 0x00; // Do nothing at the end of a transfer
		public const int NLend   = 0x01; // Send NL with EOI after a transfer
		public const int DABend  = 0x02; // Send EOI with the last DAB

		// Receive() 488.2 constants
		public const int STOPend = 0x0100;

		// Address List terminator
		public const short NOADDR = unchecked((short)0xFFFF);
		
		// Addressing Utility functions
		public static short MakeAddr(byte pad, byte sad)
		{
			return ((short)(((pad)&0xFF) | ((sad)<<8)));
		}

		public static byte GetPAD(short val)
		{
			return (byte)((val) & 0xFF); 
		}

		public static byte GetSAD(short val)
		{
			return (byte)(((val) >> 8) & 0xFF);
		}
	}

	/// <summary>
	/// Summary description for Gpib488.
	/// </summary>
	public class Gpib488
	{
		private const string _GpibDll = "gpib488.dll";

		[DllImport(_GpibDll, EntryPoint="ibask")]
		private static extern int _ibask(int ud, int option, out int v);
		public static int ibask(int ud, int option, out int v)
		{
			return _ibask(ud, option, out v);
		}

		[DllImport(_GpibDll, EntryPoint="ibcac")]
		private static extern int _ibcac(int ud, int v);
		public static int ibcac(int ud, int v)
		{
			return _ibcac(ud, v);
		}

		[DllImport(_GpibDll, EntryPoint="ibclr")]
		private static extern int _ibclr(int ud);
		public static int ibclr(int ud)
		{
			return _ibclr(ud);
		}

		[DllImport(_GpibDll, EntryPoint="ibcmd")]
		private static extern int _ibcmd(int ud, byte[] buffer, IntPtr count);
		public static int ibcmd(int ud, byte[] buffer, int count)
		{
			return _ibcmd(ud, buffer, (IntPtr)count);
		}

		[DllImport(_GpibDll, EntryPoint="ibcmd")]
		private static extern int _ibcmd(int ud, string buffer, IntPtr count);
		public static int ibcmd(int ud, string buffer, int count)
		{
			return _ibcmd(ud, buffer, (IntPtr)count);
		}

		[DllImport(_GpibDll, EntryPoint="ibconfig")]
		private static extern int _ibconfig(int ud, int option, int v);
		public static int ibconfig(int ud, int option, int v)
		{
			return _ibconfig(ud, option, v);
		}

		[DllImport(_GpibDll, EntryPoint="ibdev")]
		private static extern int _ibdev(int board, int pad, int sad, int tmo, int eot, int eos);
		public static int ibdev(int board, int pad, int sad, int tmo, int eot, int eos)
		{
			return _ibdev(board, pad, sad, tmo, eot, eos);
		}

		[DllImport(_GpibDll, EntryPoint="ibfind")]
		private static extern int _ibfind(string name);
		public static int ibfind(string name)
		{
			return _ibfind(name);
		}

		[DllImport(_GpibDll, EntryPoint="ibgts")]
		private static extern int _ibgts(int ud, int v);
		public static int ibgts(int ud, int v)
		{
			return _ibgts(ud, v);
		}

		[DllImport(_GpibDll, EntryPoint="iblines")]
		private static extern int _iblines(int ud, out short result);
		public static int iblines(int ud, out short result)
		{
			return _iblines(ud, out result);
		}

		[DllImport(_GpibDll, EntryPoint="ibln")]
		private static extern int _ibln(int ud, int pad, int sad, out short listen);
		public static int ibln(int ud, int pad, int sad, out short listen)
		{
			return _ibln(ud, pad, sad, out listen);
		}

		[DllImport(_GpibDll, EntryPoint="ibloc")]
		private static extern int _ibloc(int ud);
		public static int ibloc(int ud)
		{
			return _ibloc(ud);
		}

		[DllImport(_GpibDll, EntryPoint="ibonl")]
		private static extern int _ibonl(int ud, int v);
		public static int ibonl(int ud, int v)
		{
			return _ibonl(ud, v);
		}

		[DllImport(_GpibDll, EntryPoint="ibpct")]
		private static extern int _ibpct(int ud);
		public static int ibpct(int ud)
		{
			return _ibpct(ud);
		}

		[DllImport(_GpibDll, EntryPoint="ibppc")]
		private static extern int _ibppc(int ud, int v);
		public static int ibppc(int ud, int v)
		{
			return _ibppc(ud, v);
		}

		[DllImport(_GpibDll, EntryPoint="ibrd")]
		private static extern int _ibrd(int ud, [MarshalAs(UnmanagedType.LPStr)] StringBuilder buffer, IntPtr count);
		public static int ibrd(int ud, StringBuilder buffer, int count)
		{
			return _ibrd(ud, buffer, (IntPtr)count);
		}

		[DllImport(_GpibDll, EntryPoint="ibrd")]
		private static extern int _ibrd(int ud, byte[] buffer, IntPtr count);
		public static int ibrd(int ud, byte[] buffer, int count)
		{
			return _ibrd(ud, buffer, (IntPtr)count);
		}

		[DllImport(_GpibDll, EntryPoint="ibrdf")]
		private static extern int _ibrdf(int ud, string filename);
		public static int ibrdf(int ud, string filename)
		{
			return _ibrdf(ud, filename);
		}

		[DllImport(_GpibDll, EntryPoint="ibrpp")]
		private static extern int _ibrpp(int ud, out byte ppr);
		public static int ibrpp(int ud, out byte ppr)
		{
			return _ibrpp(ud, out ppr);
		}

		[DllImport(_GpibDll, EntryPoint="ibrsp")]
		private static extern int _ibrsp(int ud, out byte spr);
		public static int ibrsp(int ud, out byte spr)
		{
			return _ibrsp(ud, out spr);
		}

		[DllImport(_GpibDll, EntryPoint="ibsic")]
		private static extern int _ibsic(int ud);
		public static int ibsic(int ud)
		{
			return _ibsic(ud);
		}

		[DllImport(_GpibDll, EntryPoint="ibstop")]
		private static extern int _ibstop(int ud);
		public static int ibstop(int ud)
		{
			return _ibstop(ud);
		}

		[DllImport(_GpibDll, EntryPoint="ibtrg")]
		private static extern int _ibtrg(int ud);
		public static int ibtrg(int ud)
		{
			return _ibtrg(ud);
		}

		[DllImport(_GpibDll, EntryPoint="ibwait")]
		private static extern int _ibwait(int ud, int mask);
		public static int ibwait(int ud, int mask)
		{
			return _ibwait(ud, mask);
		}

		[DllImport(_GpibDll, EntryPoint="ibwrt")]
		private static extern int _ibwrt(int ud, byte[] buffer, IntPtr count);
		public static int ibwrt(int ud, byte[] buffer, int count)
		{
			return _ibwrt(ud, buffer, (IntPtr)count);
		}

		[DllImport(_GpibDll, EntryPoint="ibwrt")]
		private static extern int _ibwrt(int ud, string buffer, IntPtr count);
		public static int ibwrt(int ud, string buffer, int count)
		{
			return _ibwrt(ud, buffer, (IntPtr)count);
		}

		[DllImport(_GpibDll, EntryPoint="ibwrtf")]
		private static extern int _ibwrtf(int ud, string filename);
		public static int ibwrtf(int ud, string filename)
		{
			return _ibwrtf(ud, filename);
		}

		/////

		[DllImport(_GpibDll, EntryPoint="Ibsta")]
		private static extern int _Ibsta();
		public static int Ibsta()
		{
			return _Ibsta();
		}

		[DllImport(_GpibDll, EntryPoint="Iberr")]
		private static extern int _Iberr();
		public static int Iberr()
		{
			return _Iberr();
		}

		[DllImport(_GpibDll, EntryPoint="Ibcnt")]
		private static extern int _Ibcnt();
		public static int Ibcnt()
		{
			return _Ibcnt();
		}

		/////

		[DllImport(_GpibDll, EntryPoint="ThreadIbsta")]
		private static extern int _ThreadIbsta();
		public static int ThreadIbsta()
		{
			return _ThreadIbsta();
		}

		[DllImport(_GpibDll, EntryPoint="ThreadIberr")]
		private static extern int _ThreadIberr();
		public static int ThreadIberr()
		{
			return _ThreadIberr();
		}

		[DllImport(_GpibDll, EntryPoint="ThreadIbcnt")]
		private static extern int _ThreadIbcnt();
		public static int ThreadIbcnt()
		{
			return _ThreadIbcnt();
		}

		/////

		[DllImport(_GpibDll, EntryPoint="AllSpoll")]
		private static extern void _AllSpoll(int board, short[] addrlist, short[] results);
		public static void AllSpoll(int board, short[] addrlist, short[] results)
		{
			_AllSpoll(board, addrlist, results);
		}

		[DllImport(_GpibDll, EntryPoint="DevClear")]
		private static extern void _DevClear(int board, short address);
		public static void DevClear(int board, short address)
		{
			_DevClear(board, address);
		}

		[DllImport(_GpibDll, EntryPoint="DevClearList")]
		private static extern void _DevClearList(int board, short[] addrlist);
		public static void DevClearList(int board, short[] addrlist)
		{
			_DevClearList(board, addrlist);
		}

		[DllImport(_GpibDll, EntryPoint="EnableLocal")]
		private static extern void _EnableLocal(int board, short[] addrlist);
		public static void EnableLocal(int board, short[] addrlist)
		{
			_EnableLocal(board, addrlist);
		}

		[DllImport(_GpibDll, EntryPoint="EnableRemote")]
		private static extern void _EnableRemote(int board, short[] addrlist);
		public static void EnableRemote(int board, short[] addrlist)
		{
			_EnableRemote(board, addrlist);
		}

		[DllImport(_GpibDll, EntryPoint="FindLstn")]
		private static extern void _FindLstn(int board, short[] addrlist, short[] results, IntPtr limit);
		public static void FindLstn(int board, short[] addrlist, short[] results, int limit)
		{
			_FindLstn(board, addrlist, results, (IntPtr)limit);
		}

		[DllImport(_GpibDll, EntryPoint="FindRQS")]
		private static extern void _FindRQS(int board, short[] addrlist, out short devstat);
		public static void FindRQS(int board, short[] addrlist, out short devstat)
		{
			_FindRQS(board, addrlist, out devstat);
		}

		[DllImport(_GpibDll, EntryPoint="PPoll")]
		private static extern void _PPoll(int board, out short result);
		public static void PPoll(int board, out short result)
		{
			_PPoll(board, out result);
		}

		[DllImport(_GpibDll, EntryPoint="PPollConfig")]
		private static extern void _PPollConfig(int board, short address, int dataline, int linesense);
		public static void PPollConfig(int board, short address, int dataline, int linesense)
		{
			_PPollConfig(board, address, dataline, linesense);
		}

		[DllImport(_GpibDll, EntryPoint="PPollUnconfig")]
		private static extern void _PPollUnconfig(int board, short[] addrlist);
		public static void PPollUnconfig(int board, short[] addrlist)
		{
			_PPollUnconfig(board, addrlist);
		}

		[DllImport(_GpibDll, EntryPoint="PassControl")]
		private static extern void _PassControl(int board, short address);
		public static void PassControl(int board, short address)
		{
			_PassControl(board, address);
		}

		[DllImport(_GpibDll, EntryPoint="RcvRespMsg")]
		private static extern void _RcvRespMsg(int board, byte[] buffer, IntPtr count, int termination);
		public static void RcvRespMsg(int board, byte[] buffer, int count, int termination)
		{
			_RcvRespMsg(board, buffer, (IntPtr)count, termination);
		}

		[DllImport(_GpibDll, EntryPoint="RcvRespMsg")]
		private static extern void _RcvRespMsg(int board, [MarshalAs(UnmanagedType.LPStr)]StringBuilder buffer, IntPtr count, int termination);
		public static void RcvRespMsg(int board, [MarshalAs(UnmanagedType.LPStr)]StringBuilder buffer, int count, int termination)
		{
			_RcvRespMsg(board, buffer, (IntPtr)count, termination);
		}

		[DllImport(_GpibDll, EntryPoint="ReadStatusByte")]
		private static extern void _ReadStatusByte(int board, short addr, out short result);
		public static void ReadStatusByte(int board, short addr, out short result)
		{
			_ReadStatusByte(board, addr, out result);
		}

		[DllImport(_GpibDll, EntryPoint="Receive")]
		private static extern void _Receive(int board, short address, byte[] buffer, IntPtr count, int termination);
		public static void Receive(int board, short address, byte[] buffer, int count, int termination)
		{
			_Receive(board, address, buffer, (IntPtr)count, termination);
		}

		[DllImport(_GpibDll, EntryPoint="Receive")]
		private static extern void _Receive(int board, short address, [MarshalAs(UnmanagedType.LPStr)]StringBuilder buffer, IntPtr count, int termination);
		public static void Receive(int board, short address, [MarshalAs(UnmanagedType.LPStr)]StringBuilder buffer, int count, int termination)
		{
			_Receive(board, address, buffer, (IntPtr)count, termination);
		}

		[DllImport(_GpibDll, EntryPoint="ReceiveSetup")]
		private static extern void _ReceiveSetup(int board, short address);
		public static void ReceiveSetup(int board, short address)
		{
			_ReceiveSetup(board, address);
		}

		[DllImport(_GpibDll, EntryPoint="ResetSys")]
		private static extern void _ResetSys(int board, short[] addrlist);
		public static void ResetSys(int board, short[] addrlist)
		{
			_ResetSys(board, addrlist);
		}

		[DllImport(_GpibDll, EntryPoint="Send")]
		private static extern void _Send(int board, short address, byte[] buffer, IntPtr count, int eotmode);
		public static void Send(int board, short address, byte[] buffer, int count, int eotmode)
		{
			_Send(board, address, buffer, (IntPtr)count, eotmode);
		}

		[DllImport(_GpibDll, EntryPoint="Send")]
		private static extern void _Send(int board, short address, string buffer, IntPtr count, int eotmode);
		public static void Send(int board, short address, string buffer, int count, int eotmode)
		{
			_Send(board, address, buffer, (IntPtr)count, eotmode);
		}

		[DllImport(_GpibDll, EntryPoint="SendCmds")]
		private static extern void _SendCmds(int board, byte[] buffer, IntPtr count);
		public static void SendCmds(int board, byte[] buffer, int count)
		{
			_SendCmds(board, buffer, (IntPtr)count);
		}

		[DllImport(_GpibDll, EntryPoint="SendCmds")]
		private static extern void _SendCmds(int board, string buffer, IntPtr count);
		public static void SendCmds(int board, string buffer, int count)
		{
			_SendCmds(board, buffer, (IntPtr)count);
		}

		[DllImport(_GpibDll, EntryPoint="SendDataBytes")]
		private static extern void _SendDataBytes(int board, byte[] buffer, IntPtr count, int eotmode);
		public static void SendDataBytes(int board, byte[] buffer, int count, int eotmode)
		{
			_SendDataBytes(board, buffer, (IntPtr)count, eotmode);
		}

		[DllImport(_GpibDll, EntryPoint="SendDataBytes")]
		private static extern void _SendDataBytes(int board, string buffer, IntPtr count, int eotmode);
		public static void SendDataBytes(int board, string buffer, int count, int eotmode)
		{
			_SendDataBytes(board, buffer, (IntPtr)count, eotmode);
		}

		[DllImport(_GpibDll, EntryPoint="SendIFC")]
		private static extern void _SendIFC(int board);
		public static void SendIFC(int board)
		{
			_SendIFC(board);
		}

		[DllImport(_GpibDll, EntryPoint="SendLLO")]
		private static extern void _SendLLO(int board);
		public static void SendLLO(int board)
		{
			_SendLLO(board);
		}

		[DllImport(_GpibDll, EntryPoint="SendList")]
		private static extern void _SendList(int board, short[] addrlist, byte[] buffer, IntPtr count, int eotmode);
		public static void SendList(int board, short[] addrlist, byte[] buffer, int count, int eotmode)
		{
			_SendList(board, addrlist, buffer, (IntPtr)count, eotmode);
		}

		[DllImport(_GpibDll, EntryPoint="SendList")]
		private static extern void _SendList(int board, short[] addrlist, string buffer, IntPtr count, int eotmode);
		public static void SendList(int board, short[] addrlist, string buffer, int count, int eotmode)
		{
			_SendList(board, addrlist, buffer, (IntPtr)count, eotmode);
		}

		[DllImport(_GpibDll, EntryPoint="SendSetup")]
		private static extern void _SendSetup(int board, short[] addrlist);
		public static void SendSetup(int board, short[] addrlist)
		{
			_SendSetup(board, addrlist);
		}

		[DllImport(_GpibDll, EntryPoint="SendRWLS")]
		private static extern void _SendRWLS(int board, short[] addrlist);
		public static void SendRWLS(int board, short[] addrlist)
		{
			_SendRWLS(board, addrlist);
		}

		[DllImport(_GpibDll, EntryPoint="TestSRQ")]
		private static extern void _TestSRQ(int board, out short result);
		public static void TestSRQ(int board, out short result)
		{
			_TestSRQ(board, out result);
		}

		[DllImport(_GpibDll, EntryPoint="TestSys")]
		private static extern void _TestSys(int board, short[] addrlist, short[] results);
		public static void TestSys(int board, short[] addrlist, short[] results)
		{
			_TestSys(board, addrlist, results);
		}

		[DllImport(_GpibDll, EntryPoint="Trigger")]
		private static extern void _Trigger(int board, short address);
		public static void Trigger(int board, short address)
		{
			_Trigger(board, address);
		}

		[DllImport(_GpibDll, EntryPoint="TriggerList")]
		private static extern void _TriggerList(int board, short[] addrlist);
		public static void TriggerList(int board, short[] addrlist)
		{
			_TriggerList(board, addrlist);
		}

		[DllImport(_GpibDll, EntryPoint="WaitSRQ")]
		private static extern void _WaitSRQ(int board, out short result);
		public static void WaitSRQ(int board, out short result)
		{
			_WaitSRQ(board, out result);
		}
	}
}
