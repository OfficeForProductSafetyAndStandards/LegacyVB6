(*
 *                     Win32 include file
 *          for accessing the 32-bit GPIB DLL (gpib-32.dll)
 *
 *         Contains user variables (ibsta, iberr, ibcntl),
 *         function prototypes and useful defined constants for
 *         calling 488.1 and 488.2 routines from a Borland
 *         Delphi Win32 application.
 *         Copyright Quality Instrumentation Solutions, Inc. and its licensor(s), (c) 2009
 *         All rights reserved.
 *)

unit GPIB;

interface

uses
  Windows;

(***************************************************************************
 *    HANDY CONSTANTS FOR USE BY APPLICATION PROGRAMS ...                  *
 ***************************************************************************)
const
  UNL  = $3F;    (* GPIB unlisten command            *)
  UNT  = $5F;    (* GPIB untalk command              *)
  GTL  = $1;     (* GPIB go to local                 *)
  SDC  = $4;     (* GPIB selected device clear       *)
  PPC  = $5;     (* GPIB parallel poll configure     *)
  GET  = $8;     (* GPIB group execute trigger       *)
  TCT  = $9;     (* GPIB take control                *)
  LLO  = $11;    (* GPIB local lock out              *)
  DCL  = $14;    (* GPIB device clear                *)
  PPU  = $15;    (* GPIB parallel poll unconfigure   *)
  SPE  = $18;    (* GPIB serial poll enable          *)
  SPD  = $19;    (* GPIB serial poll disable         *)
  PPE  = $60;    (* GPIB parallel poll enable        *)
  PPD  = $70;    (* GPIB parallel poll disable       *)

  (* GPIB status bit vector :
           status variable ibsta and wait mask      *)

  ERR  = $8000;      (* Error detected               *)
  TIMO = $4000;      (* Timeout                      *)
  EEND = $2000;      (* EOI or EOS detected          *)
  SRQI = $1000;      (* SRQ detected by CIC          *)
  RQS  = $800;       (* Device requesting service    *)
  CMPL = $100;       (* I/O completed                *)
  LOK  = $80;        (* Local lockout state          *)
  REM  = $40;        (* Remote state                 *)
  CIC  = $20;        (* Controller-in-Charge         *)
  ATN  = $10;        (* Attention asserted           *)
  TACS = $8;         (* Talker active                *)
  LACS = $4;         (* Listener active              *)
  DTAS = $2;         (* Device trigger state         *)
  DCAS = $1;         (* Device clear state           *)

  (* Error messages returned in global variable iberr        *)

  EDVR = 0;      (* System error                             *)
  ECIC = 1;      (* Function requires GPIB board to be CIC   *)
  ENOL = 2;      (* Write function detected no listeners     *)
  EADR = 3;      (* Interface board not addressed correctly  *)
  EARG = 4;      (* Invalid argument to function call        *)
  ESAC = 5;      (* Function requires GPIB board to be SAC   *)
  EABO = 6;      (* I/O operation aborted                    *)
  ENEB = 7;      (* Non-existent interface board             *)
  EDMA = 8;      (* DMA Error                                *)
  EOIP = 10;     (* I/O operation started before previous    *)
                 (* operation completed                      *)
  ECAP = 11;     (* No capability for intended operation     *)
  EFSO = 12;     (* File system operation error              *)
  EBUS = 14;     (* Command error during device call         *)
  ESTB = 15;     (* Serial poll status byte lost             *)
  ESRQ = 16;     (* SRQ remains asserted                     *)
  ETAB = 20;     (* The return buffer is full                *)
  ELCK = 21;     (* Address or board is locked               *)
  EARM = 22;     (* The ibnotify Callback failed to rearm    *)
  EHDL = 23;     (* The input hanndle is invalid             *)
  EWIP = 26;     (* Wait already in progress on input ud     *)
  ERST = 27;     (* The event notification was cancelled due *)
                 (* to a reset of the interface              *)
  EPWR = 28;     (* The system or board has lost power or    *)
                 (* gone to standby                          *)

  (* EOS mode bits                               *)

  BIN  = $1000;  (* Eight bit compare            *)
  XEOS = $800;   (* Send EOI with EOS byte       *)
  REOS = $400;   (* Terminate read on EOS        *)

  (* Timeout values and meanings                 *)

  TNONE  = 0;     (* Infinite timeout (disabled) *)
  T10us  = 1;     (* Timeout of 10 us (ideal)    *)
  T30us  = 2;     (* Timeout of 30 us (ideal)    *)
  T100us = 3;     (* Timeout of 100 us (ideal)   *)
  T300us = 4;     (* Timeout of 300 us (ideal)   *)
  T1ms   = 5;     (* Timeout of 1 ms (ideal)     *)
  T3ms   = 6;     (* Timeout of 3 ms (ideal)     *)
  T10ms  = 7;     (* Timeout of 10 ms (ideal)    *)
  T30ms  = 8;     (* Timeout of 30 ms (ideal)    *)
  T100ms = 9;     (* Timeout of 100 ms (ideal)   *)
  T300ms = 10;    (* Timeout of 300 ms (ideal)   *)
  T1s    = 11;    (* Timeout of 1 s (ideal)      *)
  T3s    = 12;    (* Timeout of 3 s (ideal)      *)
  T10s   = 13;    (* Timeout of 10 s (ideal)     *)
  T30s   = 14;    (* Timeout of 30 s (ideal)     *)
  T100s  = 15;    (* Timeout of 100 s (ideal)    *)
  T300s  = 16;    (* Timeout of 300 s (ideal)    *)
  T1000s = 17;    (* Timeout of 1000 s (maximum) *)

  (* IBLN constants *)

  ALL_SAD = -1;
  NO_SAD  = 0;

  (* The following constants are used for the second parameter of the
   ibconfig function.  They are the "option" selection codes.         *)

  IbcPAD            = $1;  (* Primary Address                         *)
  IbcSAD            = $2;  (* Secondary Address                       *)
  IbcTMO            = $3;  (* Timeout Value                           *)
  IbcEOT            = $4;  (* Send EOI with last data byte?           *)
  IbcPPC            = $5;  (* Parallel Poll Configure                 *)
  IbcREADDR         = $6;  (* Repeat Addressing                       *)
  IbcAUTOPOLL       = $7;  (* Disable Auto Serial Polling             *)
  IbcCICPROT        = $8;  (* Use the CIC Protocol?                   *)
  IbcIRQ            = $9;  (* Use PIO for I/O                         *)
  IbcSC             = $A;  (* Board is System Controller.             *)
  IbcSRE            = $B;  (* Assert SRE on device calls?             *)
  IbcEOSrd          = $C;  (* Terminate reads on EOS.                 *)
  IbcEOSwrt         = $D;  (* Send EOI with EOS character.            *)
  IbcEOScmp         = $E;  (* Use 7 or 8-bit EOS compare.             *)
  IbcEOSchar        = $F;  (* The EOS character.                      *)
  IbcPP2            = $10; (* Use Parallel Poll Mode 2.               *)
  IbcTIMING         = $11; (* NORMAL, HIGH, or VERY_HIGH timing.      *)
  IbcDMA            = $12; (* Use DMA for I/O.                        *)
  IbcReadAdjust     = $13; (* Swap bytes during an ibrd.              *)
  IbcWriteAdjust    = $14; (* Swap bytes during an ibwrt.             *)
  IbcSendLLO        = $17; (* Enable/disable the sending of LLO.      *)
  IbcSPollTime      = $18; (* Set the timeout value for serial polls. *)
  IbcPPollTime      = $19; (* Set the parallel poll length period     *)
  IbcEndBitIsNormal = $1A; (* Remove EOS from END bit of IBSTA.       *)
  IbcUnAddr         = $1B; (* Enable/disable device unaddressing      *)
  IbcSignalNumber   = $1C; (* Set UNIX signal number - unsupported    *)
  IbcBlockIfLocked  = $1D; (* Enable/disable blocking for locked      *)
                           (* boards/devices                          *)
  IbcHSCableLength  = $1F; (* Length of cable specified for high      *)
                           (* speed timing                            *)
  IbcIst            = $20; (* Set the IST bit                         *)
  IbcRsv            = $21; (* Set the RSV byte                        *)
  IbcLON            = $22; (* Enter listen only mode                  *)

  (*   Constants that can be used (in addition to the ibconfig constants)
     when calling the IBASK function.                                    *)

  IbaPAD            = $1;    (* Primary Address                          *)
  IbaSAD            = $2;    (* Secondary Address                        *)
  IbaTMO            = $3;    (* Timeout Value                            *)
  IbaEOT            = $4;    (* Send EOI with last data byte?            *)
  IbaPPC            = $5;    (* Parallel Poll Configure                  *)
  IbaREADDR         = $6;    (* Repeat Addressing                        *)
  IbaAUTOPOLL       = $7;    (* Disable Auto Serial Polling              *)
  IbaCICPROT        = $8;    (* Use the CIC Protocol?                    *)
  IbaIRQ            = $9;    (* Use PIO for I/O                          *)
  IbaSC             = $A;    (* Board is System Controller.              *)
  IbaSRE            = $B;    (* Assert SRE on device calls?              *)
  IbaEOSrd          = $C;    (* Terminate reads on EOS.                  *)
  IbaEOSwrt         = $D;    (* Send EOI with EOS character.             *)
  IbaEOScmp         = $E;    (* Use 7 or 8-bit EOS compare.              *)
  IbaEOSchar        = $F;    (* The EOS character.                       *)
  IbaPP2            = $10;   (* Use Parallel Poll Mode 2.                *)
  IbaTIMING         = $11;   (* NORMAL, HIGH, or VERY_HIGH timing.       *)
  IbaDMA            = $12;   (* Use DMA for I/O.                         *)
  IbaReadAdjust     = $13;   (* Swap bytes during an ibrd.               *)
  IbaWriteAdjust    = $14;   (* Swap bytes during an ibwrt.              *)
  IbaSendLLO        = $17;   (* Enable/disable the sending of LLO.       *)
  IbaSPollTime      = $18;   (* Set the timeout value for serial polls.  *)
  IbaPPollTime      = $19;   (* Set the parallel poll length period      *)
  IbaEndBitIsNormal = $1A;   (* Remove EOS from END bit of IBSTA.        *)
  IbaUnAddr         = $1B;   (* Enable/disable device unaddressing       *)
  IbaSignalNumber   = $1C;   (* Set UNIX signal number - unsupported     *)
  IbaBlockIfLocked  = $1D;   (* Enable/disable blocking for locked       *)
                             (* boards/devices                           *)
  IbaHSCableLength  = $1F;   (* Length of cable specified for high speed *)
                             (* timing                                   *)
  IbaIst            = $20;   (* Set the IST bit                          *)
  IbaRsv            = $21;   (* Set the RSV byte                         *)
  IbaLON            = $22;   (* Enter listen only mode                   *)
  IbaSerialNumber   = $23;   (* Serial Number                            *)
  IbaBNA            = $200;  (* A device's access board                  *)

  (* These are the values used by the 488.2 Send command                 *)

  NULLend = $0;            (* Do nothing at the end of a transfer        *)
  NLend   = $1;            (* Send NL with EOI after a transfer          *)
  DABend  = $2;            (* Send EOI with the last DAB                 *)

  (* This value is used by the 488.2 Receive command *)

  STOPend = $100;          (* Stop the read on EOI    *)

  (* The following values are used by the iblines function.  The integer
     returned by iblines contains:
         The lower byte will contain a "monitor" bit mask.  If a bit
                 is set (1) in this mask, then the corresponding line
                 can be monitored by the driver.  If the bit is clear (0),
                 then the line cannot be monitored.
         The upper byte will contain the status of the bus lines.
                 Each bit corresponds to a certain bus line, and has
                 a corresponding "monitor" bit in the lower byte.  *)

  ValidEOI  = $80;
  ValidATN  = $40;
  ValidSRQ  = $20;
  ValidREN  = $10;
  ValidIFC  = $8;
  ValidNRFD = $4;
  ValidNDAC = $2;
  ValidDAV  = $1;
  BusEOI    = $8000;
  BusATN    = $4000;
  BusSRQ    = $2000;
  BusREN    = $1000;
  BusIFC    = $800;
  BusNRFD   = $400;
  BusNDAC   = $200;
  BusDAV    = $100;

  (* This value is used to terminate an address list.  It should be
   assigned to the last entry.  (488.2) *)

  NOADDR = -1;

type

  (* Address types (for 488.2 calls) *)
  AddrList4882_t  = array[0..31] of smallint;
  Addr4882_t      = smallint;

  (* ibnotify callback function prototype *)
  GpibNotifyCallback_t = function(ud:integer;localibsta:integer;localiberr:integer;localibcnt:longint;data:string):integer;stdcall;

function loadDLL:integer;stdcall;
function FreeDLL:integer;stdcall;

function ibsta:integer;stdcall;
function iberr:integer;stdcall;
function ibcnt:integer;stdcall;
function ibcntl:longint;stdcall;

function ibask(ud:integer;option:integer;var value:integer):integer;stdcall;
function ibcac(ud:integer;value:integer):integer;stdcall;
function ibclr(ud:integer):integer;stdcall;
function ibcmd(ud:integer;cmdbuf:string;count:longint):integer;stdcall;
function ibcmda(ud:integer;cmdbuf:string;count:longint):integer;stdcall;
function ibconfig(ud:integer;option:integer;value:integer):integer;stdcall;
function ibdev(ud:integer;pad:integer;sad:integer;tmo:integer;eot:integer;eos:integer):integer;stdcall;
function ibdma(ud:integer;value:integer):integer;stdcall;
function ibeos(ud:integer;value:integer):integer;stdcall;
function ibeot(ud:integer;value:integer):integer;stdcall;
function ibfind(udname:string):integer;stdcall;
function ibgts(ud:integer;value:integer):integer;stdcall;
function ibist(ud:integer;value:integer):integer;stdcall;
function iblck(ud:integer;value:integer;timeout:integer;reserved:string):integer;stdcall;
function iblines(ud:integer;var clines:smallint):integer;stdcall;
function ibln(ud:integer;pad:integer;sad:integer;var listen:smallint):integer;stdcall;
function ibloc(ud:integer):integer;stdcall;
function ibonl(ud:integer;value:integer):integer;stdcall;
function ibnotify(ud:integer;mask:integer;callback:GpibNotifyCallback_t;data:string):integer;stdcall;
function ibpad(ud:integer;value:integer):integer;stdcall;
function ibpct(ud:integer):integer;stdcall;
function ibppc(ud:integer;value:integer):integer;stdcall;
function ibrd(ud:integer;var rdbuf;count: Longint):integer;stdcall;
function ibrda(ud:integer;var rdbuf;count:Longint):integer;stdcall;
function ibrdf(ud:integer;filename:string):integer;stdcall;
function ibrpp(ud:integer;var ppr:smallint):integer;stdcall;
function ibrsc(ud:integer;value:integer):integer;stdcall;
function ibrsp(ud:integer;var spr:smallint):integer;stdcall;
function ibrsv(ud:integer;value:integer):integer;stdcall;
function ibsad(ud:integer;value:integer):integer;stdcall;
function ibsic(ud:integer):integer;stdcall;
function ibsre(ud:integer;value:integer):integer;stdcall;
function ibstop(ud:integer):integer;stdcall;
function ibtmo(ud:integer;value:integer):integer;stdcall;
function ibtrg(ud:integer):integer;stdcall;
function ibwait(ud:integer;mask:integer):integer;stdcall;
function ibwrt(ud:integer;wrtbuf:string;count:longint):integer;stdcall;
function ibwrta(ud:integer;wrtbuf:string;count:Longint):integer;stdcall;
function ibwrtf(ud:integer;filename:string):integer;stdcall;

procedure AllSpoll(boardID:integer;addrlist:AddrList4882_t;var resultlist:AddrList4882_t);stdcall;
procedure DevClear(boardID:integer;address:Addr4882_t);stdcall;
procedure DevClearList(boardID:integer;var addrlist:AddrList4882_t);stdcall;
procedure EnableLocal(boardID:integer;addrlist:AddrList4882_t);stdcall;
procedure EnableRemote(boardID:integer;addrlist:AddrList4882_t);stdcall;
procedure FindLstn(boardID:integer;var padlist:AddrList4882_t;var resultlist:AddrList4882_t;limit:integer);stdcall;
procedure FindRQS(boardID:integer;addrlist:AddrList4882_t;var result:Addr4882_t);stdcall;
procedure PassControl(boardID:integer;address:Addr4882_t);stdcall;
procedure PPoll(boardID:integer;var result:smallint);stdcall;
procedure PPollConfig(boardID:integer;address:Addr4882_t;dataline:integer;linesend:integer);stdcall;
procedure PPollUnconfig(boardID:integer;addrlist:AddrList4882_t);stdcall;
procedure RcvRespMsg(boardID:integer;var buffer;count:longint;termination:integer);stdcall;
procedure ReadStatusByte(boardID:integer;address:Addr4882_t;var result:smallint);stdcall;
procedure Receive(boardID:integer;address:Addr4882_t;var buffer;count:longint;termination:integer);stdcall;
procedure ReceiveSetup(boardID:integer;address:Addr4882_t);stdcall;
procedure ResetSys(boardID:integer;addrlist:AddrList4882_t);stdcall;
procedure Send(boardID:integer;address:Addr4882_t;buffer:string;count:longint;eotmode:integer);stdcall;
procedure SendCmds(boardID:integer;buffer:string;count:longint);stdcall;
procedure SendDataBytes(boardID:integer;buffer:string;count:longint;eot:integer);stdcall;
procedure SendIFC(boardID:integer);stdcall;
procedure SendList(boardID:integer;addrlist:AddrList4882_t;buffer:string;count:longint;eotmode:integer);stdcall;
procedure SendLLO(boardID:integer);stdcall;
procedure SendSetup(boardID:integer;addrlist:AddrList4882_t);stdcall;
procedure SetRWLS(boardID:integer;addrlist:AddrList4882_t);stdcall;
procedure TestSRQ(boardID:integer;var result:smallint);stdcall;
procedure TestSys(boardID:integer;addrlist:AddrList4882_t;var resultlist);stdcall;
procedure Trigger(boardID:integer;address:Addr4882_t);stdcall;
procedure TriggerList(boardID:integer;addrlist:AddrList4882_t);stdcall;
procedure WaitSRQ(boardID:integer;var result:smallint);stdcall;

function ThreadIbsta:integer;stdcall;
function ThreadIberr:integer;stdcall;
function ThreadIbcnt:integer;stdcall;
function ThreadIbcntl:longint;stdcall;

implementation

type

  (* Type declarations for exported GPIB Global Variables.           *)
  Tibsta          =  function                    : integer; stdcall;
  Tiberr          =  function                    : integer; stdcall;
  Tibcnt          =  function                    : integer; stdcall;
  Tibcntl         =  function                    : longint; stdcall;

 (* Type declarations for exported GPIB functions.                    *)
  Tibask          =  function (ud : integer;
                              option : integer;
                              var value : integer) : integer; stdcall;
  Tibcac          =  function (ud : integer;
                              value : integer)   : integer; stdcall;
  Tibclr          =  function (ud : integer)     : integer; stdcall;
  Tibcmd          =  function (ud : integer;
                              cmdbuf : string;
                              count : longint)   : integer; stdcall;
  Tibcmda         =  function (ud : integer;
                              cmdbuf : string;
                              count : longint)   : integer; stdcall;
  Tibconfig       =  function (ud : integer;
                              option : integer;
                              value : integer)   : integer; stdcall;
  Tibdev          =  function (ud:  integer;
                              pad: integer;
                              sad: integer;
                              tmo: integer;
                              eot: integer;
                              eos: integer)      : integer; stdcall;
  Tibdma          =  function (ud : integer;
                              value : integer)   : integer; stdcall;
  Tibeos          =  function (ud : integer;
                              value : integer)   : integer; stdcall;
  Tibeot          =  function (ud : integer;
                              value : integer)   : integer; stdcall;
  TibfindA        =  function (udname : string)  : integer; stdcall;
  Tibgts          =  function (ud : integer;
                              value : integer)   : integer; stdcall;
  Tibist          =  function (ud : integer;
                              value : integer)   : integer; stdcall;
  Tiblck          =  function (ud       : integer;
                               value    : integer;
                               timeout  : integer;
                               reserved : string) : integer; stdcall;
  Tiblines        =  function (ud : integer;
                              var clines : smallint) : integer; stdcall;
  Tibln           =  function (ud : integer;
                              pad : integer;
                              sad : integer;
                              var listen : smallint) : integer; stdcall;
  Tibloc          =  function (ud : integer)     : integer; stdcall;
  Tibonl          =  function (ud: integer;
                              value:  integer)   : integer; stdcall;
  Tibnotify       =  function (ud       : integer;
                               mask     : integer;
                               callback : GpibNotifyCallback_t;
                               data     : string) : integer; stdcall;
  Tibpad          =  function (ud : integer;
                              value : integer)   : integer; stdcall;
  Tibpct          =  function (ud : integer)     : integer; stdcall;
  Tibppc          =  function (ud : integer;
                              value : integer)   : integer; stdcall;
  Tibrd           =  function (ud:  integer;
                              var  rdbuf;
                              count: Longint)    : integer; stdcall;
  Tibrda          =  function (ud : integer;
                              var rdbuf;
                              count : Longint)   : integer; stdcall;
  TibrdfA         =  function (ud : integer;
                              filename : string) : integer; stdcall;
  Tibrpp          =  function (ud : integer;
                               var ppr : short)    : integer; stdcall;
  Tibrsc          =  function (ud : integer;
                              value : integer)   : integer; stdcall;
  Tibrsp          =  function (ud : integer;
                              var spr: short)     : integer; stdcall;
  Tibrsv          =  function (ud : integer;
                              value : integer)   : integer; stdcall;
  Tibsad          =  function (ud : integer;
                              value : integer)   : integer; stdcall;
  Tibsic          =  function (ud : integer)     : integer; stdcall;
  Tibsre          =  function (ud : integer;
                              value : integer)   : integer; stdcall;
  Tibstop         =  function (ud : integer)     : integer; stdcall;
  Tibtmo          =  function (ud : integer;
                              value : integer)   : integer; stdcall;
  Tibtrg          =  function (ud : integer)     : integer; stdcall;
  Tibwait         =  function (ud:   integer;
                              mask: integer)     : integer; stdcall;
  Tibwrt          =  function (ud:  integer;
                              wrtbuf : string;
                              count: longint)      : integer; stdcall;
  Tibwrta         =  function (ud : integer;
                              wrtbuf : string;
                              count : Longint)   : integer; stdcall;
  TibwrtfA        =  function (ud : integer;
                              filename : string) : integer; stdcall;

  (* Type declarations for exported GPIB routines                    *)
  TAllSpoll       = procedure (boardID: integer;
                              addrlist : AddrList4882_t;
                              var resultlist : AddrList4882_t);   stdcall;
  TDevClear       = procedure (boardID: integer;
                              address: Addr4882_t);         stdcall;
  TDevClearList   = procedure (boardID : integer;
                              var addrlist : AddrList4882_t);   stdcall;
  TEnableLocal    = procedure (boardID : integer;
                              addrlist : AddrList4882_t);   stdcall;
  TEnableRemote   = procedure (boardID : integer;
                              addrlist : AddrList4882_t);   stdcall;
  TFindLstn       = procedure (boardID : integer;
                              var padlist : AddrList4882_t;
                              var resultlist : AddrList4882_t;
                              limit : integer);             stdcall;
  TFindRQS        = procedure (boardID : integer;
                              addrlist : AddrList4882_t;
                              var result : smallint);       stdcall;
  TPassControl    = procedure (boardID : integer;
                              address : Addr4882_t);        stdcall;
  TPPoll          = procedure (boardID : integer;
                              var result : smallint);       stdcall;
  TPPollConfig    = procedure (boardID : integer;
                              address : Addr4882_t;
                              dataline : integer;
                              linesend : integer);          stdcall;
  TPPollUnconfig  = procedure (boardID : integer;
                              addrlist : AddrList4882_t);   stdcall;
  TRcvRespMsg     = procedure (boardID : integer;
                              var buffer;
                              count : longint;
                              termination : integer);       stdcall;
  TReadStatusByte = procedure (boardID : integer;
                              address : Addr4882_t;
                         var result : smallint);       stdcall;
  TReceive        = procedure (boardID : integer;
                              address : Addr4882_t;
                         var buffer;
                          count : longint;
                         termination : integer);       stdcall;
  TReceiveSetup   = procedure (boardID : integer;
                              address : Addr4882_t);        stdcall;
  TResetSys       = procedure (boardID : integer;
                              addrlist : AddrList4882_t);   stdcall;
  TSend           = procedure (boardID : integer;
                              address : Addr4882_t;
                         buffer : string;
                         count : longint;
                         eotmode : integer);           stdcall;
  TSendCmds       = procedure (boardID : integer;
                              buffer : string;
                              count : longint);             stdcall;
  TSendDataBytes  = procedure (boardID : integer;
                              buffer : string;
                              count : longint;
                              eot : integer);               stdcall;
  TSendIFC        = procedure (boardID : integer);          stdcall;
  TSendList       = procedure (boardID : integer;
                              addrlist : AddrList4882_t;
                              buffer : string;
                              count : longint;
                              eotmode : integer);           stdcall;
  TSendLLO        = procedure (boardID : integer);          stdcall;
  TSendSetup      = procedure (boardID : integer;
                              addrlist : AddrList4882_t);   stdcall;
  TSetRWLS        = procedure (boardID : integer;
                              addrlist : AddrList4882_t);   stdcall;
  TTestSRQ        = procedure (boardID : integer;
                              var result : smallint);       stdcall;
  TTestSys        = procedure (boardID : integer;
                              addrlist : AddrList4882_t;
                              var resultlist);              stdcall;
  TTrigger        = procedure (boardID : integer;
                              address : Addr4882_t);        stdcall;
  TTriggerList    = procedure (boardID : integer;
                              addrlist : AddrList4882_t);   stdcall;
  TWaitSRQ        = procedure (boardID : integer;
                               var result:smallint);        stdcall;



var
  (* Declaration for the Handle for the GPIB library *)
  Gpib32Lib        : THandle;

  (* Pointers to the GPIB global status variables *)
  Pibsta           : ^integer;
  Piberr           : ^integer;
  Pibcnt           : ^integer;
  Pibcntl          : ^Longint;

  (* Declarations for the 488.1 GPIB calls *)
  ibask32          : Tibask;
  ibcac32          : Tibcac;
  ibclr32          : Tibclr;
  ibcmd32          : Tibcmd;
  ibcmda32         : Tibcmda;
  ibconfig32       : Tibconfig;
  ibdev32          : Tibdev;
  ibdma32          : Tibdma;
  ibeos32          : Tibeos;
  ibeot32          : Tibeot;
  ibfind32         : TibfindA;
  ibgts32          : Tibgts;
  ibist32          : Tibist;
  iblck32          : Tiblck;
  iblines32        : Tiblines;
  ibln32           : Tibln;
  ibloc32          : Tibloc;
  ibonl32          : Tibonl;
  ibnotify32       : Tibnotify;
  ibpad32          : Tibpad;
  ibpct32          : Tibpct;
  ibppc32          : Tibppc;
  ibrd32           : Tibrd;
  ibrda32          : Tibrda;
  ibrdf32          : TibrdfA;
  ibrpp32          : Tibrpp;
  ibrsc32          : Tibrsc;
  ibrsp32          : Tibrsp;
  ibrsv32          : Tibrsv;
  ibsad32          : Tibsad;
  ibsic32          : Tibsic;
  ibsre32          : Tibsre;
  ibstop32         : Tibstop;
  ibtmo32          : Tibtmo;
  ibtrg32          : Tibtrg;
  ibwait32         : Tibwait;
  ibwrt32          : Tibwrt;
  ibwrta32         : Tibwrta;
  ibwrtf32         : TibwrtfA;

  (* Declarations for the 488.2 GPIB calls *)
  AllSpoll32       : TAllSpoll;
  DevClear32       : TDevClear;
  DevClearList32   : TDevClearList;
  EnableLocal32    : TEnableLocal;
  EnableRemote32   : TEnableRemote;
  FindLstn32       : TFindLstn;
  FindRQS32        : TFindRQS;
  PassControl32    : TPassControl;
  PPoll32          : TPPoll;
  PPollConfig32    : TPPollConfig;
  PPollUnconfig32  : TPPollUnconfig;
  RcvRespMsg32     : TRcvRespMsg;
  ReadStatusByte32 : TReadStatusByte;
  Receive32        : TReceive;
  ReceiveSetup32   : TReceiveSetup;
  ResetSys32       : TResetSys;
  Send32           : TSend;
  SendCmds32       : TSendCmds;
  SendDataBytes32  : TSendDataBytes;
  SendIFC32        : TSendIFC;
  SendList32       : TSendList;
  SendLLO32        : TSendLLO;
  SendSetup32      : TSendSetup;
  SetRWLS32         : TSetRWLS;
  TestSRQ32        : TTestSRQ;
  TestSys32        : TTestSys;
  Trigger32        : TTrigger;
  TriggerList32    : TTriggerList;
  WaitSRQ32        : TWaitSRQ;

  (* Declarations for multithreaded application functions *)
  ThreadIbsta32    : Tibsta;
  ThreadIberr32    : Tiberr;
  ThreadIbcnt32    : Tibcnt;
  ThreadIbcntl32   : Tibcntl;

(* =====================================================================
 *                      Procedure loadDLL
 * This procedure loads the GPIB-32.DLL library. If the LoadLibrary
 * call is successful, the next step is to get the addresses of the
 * global status variables and functions using GetProcAddress. If the
 * GetProcAddress calls were successful, the procedure returns to the
 * main routine. Otherwise, it will free the library and HALT.
 *
 * The HALT function will terminate this program.
 * ===================================================================== *)
function loadDLL : integer; stdcall;
 (* var
  str : string;  *)
  begin
    (* Load the GPIB-32.DLL library using the LoadLibrary function. *)
    Gpib32Lib := LoadLibrary('GPIB-32.DLL');

    (* Check to see if library loaded successfully. If the library could
       not be loaded, display an error message and then HALT the program. *)
    If Gpib32Lib = 0 Then
      Begin
           LoadDLL := -1;
           Exit;
      End;

    (* Get the addresses of the GPIB Global Variables. *)
    Pibsta          := GetProcAddress(Gpib32Lib, 'user_ibsta');
    Piberr          := GetProcAddress(Gpib32Lib, 'user_iberr');
    Pibcnt          := GetProcAddress(Gpib32Lib, 'user_ibcnt');
    Pibcntl         := GetProcAddress(Gpib32Lib, 'user_ibcnt');

    (* Get the addresses of the GPIB functions. *)
    @ibask32          := GetProcAddress(Gpib32Lib, 'ibask');
    @ibcac32          := GetProcAddress(Gpib32Lib, 'ibcac');
    @ibclr32          := GetProcAddress(Gpib32Lib, 'ibclr');
    @ibcmd32          := GetProcAddress(Gpib32Lib, 'ibcmd');
    @ibcmda32         := GetProcAddress(Gpib32Lib, 'ibcmda');
    @ibconfig32       := GetProcAddress(Gpib32Lib, 'ibconfig');
    @ibdev32          := GetProcAddress(Gpib32Lib, 'ibdev');
    @ibdma32          := GetProcAddress(Gpib32Lib, 'ibdma');
    @ibeos32          := GetProcAddress(Gpib32Lib, 'ibeos');
    @ibeot32          := GetProcAddress(Gpib32Lib, 'ibeot');
    @ibfind32         := GetProcAddress(Gpib32Lib, 'ibfindA');
    @ibgts32          := GetProcAddress(Gpib32Lib, 'ibgts');
    @ibist32          := GetProcAddress(Gpib32Lib, 'ibist');
    @iblck32          := GetProcAddress(Gpib32Lib, 'iblck');
    @iblines32        := GetProcAddress(Gpib32Lib, 'iblines');
    @ibln32           := GetProcAddress(Gpib32Lib, 'ibln');
    @ibloc32          := GetProcAddress(Gpib32Lib, 'ibloc');
    @ibonl32          := GetProcAddress(Gpib32Lib, 'ibonl');
    @ibnotify32       := GetProcAddress(Gpib32Lib, 'ibnotify');
    @ibpad32          := GetProcAddress(Gpib32Lib, 'ibpad');
    @ibpct32          := GetProcAddress(Gpib32Lib, 'ibpct');
    @ibppc32          := GetProcAddress(Gpib32Lib, 'ibppc');
    @ibrd32           := GetProcAddress(Gpib32Lib, 'ibrd');
    @ibrda32          := GetProcAddress(Gpib32Lib, 'ibrda');
    @ibrdf32          := GetProcAddress(Gpib32Lib, 'ibrdfA');
    @ibrpp32          := GetProcAddress(Gpib32Lib, 'ibrpp');
    @ibrsc32          := GetProcAddress(Gpib32Lib, 'ibrsc');
    @ibrsp32          := GetProcAddress(Gpib32Lib, 'ibrsp');
    @ibrsv32          := GetProcAddress(Gpib32Lib, 'ibrsv');
    @ibsad32          := GetProcAddress(Gpib32Lib, 'ibsad');
    @ibsic32          := GetProcAddress(Gpib32Lib, 'ibsic');
    @ibsre32          := GetProcAddress(Gpib32Lib, 'ibsre');
    @ibstop32         := GetProcAddress(Gpib32Lib, 'ibstop');
    @ibtmo32          := GetProcAddress(Gpib32Lib, 'ibtmo');
    @ibtrg32          := GetProcAddress(Gpib32Lib, 'ibtrg');
    @ibwait32         := GetProcAddress(Gpib32Lib, 'ibwait');
    @ibwrt32          := GetProcAddress(Gpib32Lib, 'ibwrt');
    @ibwrta32         := GetProcAddress(Gpib32Lib, 'ibwrta');
    @ibwrtf32         := GetProcAddress(Gpib32Lib, 'ibwrtfA');

    (* Get the addresses of the GPIB 488.2 routines *)
    @AllSpoll32       := GetProcAddress(Gpib32Lib, 'AllSpoll');
    @DevClear32       := GetProcAddress(Gpib32Lib, 'DevClear');
    @DevClearList32   := GetProcAddress(Gpib32Lib, 'DevClearList');
    @EnableLocal32    := GetProcAddress(Gpib32Lib, 'EnableLocal');
    @EnableRemote32   := GetProcAddress(Gpib32Lib, 'EnableRemote');
    @FindLstn32       := GetProcAddress(Gpib32Lib, 'FindLstn');
    @FindRQS32        := GetProcAddress(Gpib32Lib, 'FindRQS');
    @PassControl32    := GetProcAddress(Gpib32Lib, 'PassControl');
    @PPoll32          := GetProcAddress(Gpib32Lib, 'PPoll');
    @PPollConfig32    := GetProcAddress(Gpib32Lib, 'PPollConfig');
    @PPollUnconfig32  := GetProcAddress(Gpib32Lib, 'PPollUnconfig');
    @RcvRespMsg32     := GetProcAddress(Gpib32Lib, 'RcvRespMsg');
    @ReadStatusByte32 := GetProcAddress(Gpib32Lib, 'ReadStatusByte');
    @Receive32        := GetProcAddress(Gpib32Lib, 'Receive');
    @ReceiveSetup32   := GetProcAddress(Gpib32Lib, 'ReceiveSetup');
    @ResetSys32       := GetProcAddress(Gpib32Lib, 'ResetSys');
    @Send32           := GetProcAddress(Gpib32Lib, 'Send');
    @SendCmds32       := GetProcAddress(Gpib32Lib, 'SendCmds');
    @SendDataBytes32  := GetProcAddress(Gpib32Lib, 'SendDataBytes');
    @SendIFC32        := GetProcAddress(Gpib32Lib, 'SendIFC');
    @SendList32       := GetProcAddress(Gpib32Lib, 'SendList');
    @SendLLO32        := GetProcAddress(Gpib32Lib, 'SendLLO');
    @SendSetup32      := GetProcAddress(Gpib32Lib, 'SendSetup');
    @SetRWLS32        := GetProcAddress(Gpib32Lib, 'SetRWLS');
    @TestSRQ32        := GetProcAddress(Gpib32Lib, 'TestSRQ');
    @TestSys32        := GetProcAddress(Gpib32Lib, 'TestSys');
    @Trigger32        := GetProcAddress(Gpib32Lib, 'Trigger');
    @TriggerList32    := GetProcAddress(Gpib32Lib, 'TriggerList');
    @WaitSRQ32        := GetProcAddress(Gpib32Lib, 'WaitSRQ');

    (* Get the addresses of the GPIB multithreaded functions. *)
    @ThreadIbsta32    := GetProcAddress(Gpib32Lib, 'ThreadIbsta');
    @ThreadIberr32    := GetProcAddress(Gpib32Lib, 'ThreadIberr');
    @ThreadIbcnt32    := GetProcAddress(Gpib32Lib, 'ThreadIbcnt');
    @ThreadIbcntl32   := GetProcAddress(Gpib32Lib, 'ThreadIbcntl');

  (* Verify that addresses were obtained. If unable to get any one of
     the addresses, then free the library, display an error message and
     HALT the program. *)
    if (Pibsta            = NIL) Or
       (Piberr            = NIL) Or
       (Pibcnt            = NIL) Or
       (Pibcntl           = NIL) Or
       (@ibask32          = NIL) Or
       (@ibcac32          = NIL) Or
       (@ibclr32          = NIL) Or
       (@ibcmd32          = NIL) Or
       (@ibcmda32         = NIL) Or
       (@ibconfig32       = NIL) Or
       (@ibdev32          = NIL) Or
       (@ibdma32          = NIL) Or
       (@ibeos32          = NIL) Or
       (@ibeot32          = NIL) Or
       (@ibfind32         = NIL) Or
       (@ibgts32          = NIL) Or
       (@ibist32          = NIL) Or
       (@iblck32          = NIL) Or
       (@iblines32        = NIL) Or
       (@ibln32           = NIL) Or
       (@ibloc32          = NIL) Or
       (@ibonl32          = NIL) Or
       (@ibnotify32       = NIL) Or
       (@ibpad32          = NIL) Or
       (@ibpct32          = NIL) Or
       (@ibppc32          = NIL) Or
       (@ibrd32           = NIL) Or
       (@ibrda32          = NIL) Or
       (@ibrdf32          = NIL) Or
       (@ibrpp32          = NIL) Or
       (@ibrsc32          = NIL) Or
       (@ibrsp32          = NIL) Or
       (@ibrsv32          = NIL) Or
       (@ibsad32          = NIL) Or
       (@ibsic32          = NIL) Or
       (@ibsre32          = NIL) Or
       (@ibstop32         = NIL) Or
       (@ibtmo32          = NIL) Or
       (@ibtrg32          = NIL) Or
       (@ibwait32         = NIL) Or
       (@ibwrt32          = NIL) Or
       (@ibwrta32         = NIL) Or
       (@ibwrtf32         = NIL) Or
       (@AllSpoll32       = NIL) Or
       (@DevClear32       = NIL) Or
       (@DevClearList32   = NIL) Or
       (@EnableLocal32    = NIL) Or
       (@EnableRemote32   = NIL) Or
       (@FindLstn32       = NIL) Or
       (@FindRQS32        = NIL) Or
       (@PassControl32    = NIL) Or
       (@PPoll32          = NIL) Or
       (@PPollConfig32    = NIL) Or
       (@PPollUnconfig32  = NIL) Or
       (@RcvRespMsg32     = NIL) Or
       (@ReadStatusByte32 = NIL) Or
       (@Receive32        = NIL) Or
       (@ReceiveSetup32   = NIL) Or
       (@ResetSys32       = NIL) Or
       (@Send32           = NIL) Or
       (@SendCmds32       = NIL) Or
       (@SendDataBytes32  = NIL) Or
       (@SendIFC32        = NIL) Or
       (@SendList32       = NIL) Or
       (@SendLLO32        = NIL) Or
       (@SendSetup32      = NIL) Or
       (@SetRWLS32        = NIL) Or
       (@TestSRQ32        = NIL) Or
       (@TestSys32        = NIL) Or
       (@Trigger32        = NIL) Or
       (@TriggerList32    = NIL) Or
       (@WaitSRQ32        = NIL) Or
       (@ThreadIbsta32    = NIL) Or
       (@ThreadIberr32    = NIL) Or
       (@ThreadIbcnt32    = NIL) Or
       (@ThreadIbcntl32   = NIL) Then
       Begin
         (* Free the GPIB library. *)
         FreeLibrary(Gpib32Lib);
         LoadDLL := -2;
         Exit;
       End;
       LoadDLL := 0;
  end;

(* =====================================================================
 *                      Procedure FreeDLL
 *         This procedure unloads the GPIB-32.DLL library.
 * ===================================================================== *)
function FreeDLL:integer;stdcall;
begin
  if Gpib32Lib = 0 then
    FreeDLL := -1
  else
  begin
     FreeLibrary(Gpib32Lib);
     FreeDLL := 0;
  end;
end;

function ibsta : integer; stdcall;
begin
     ibsta := Pibsta^;
end;

function iberr : integer; stdcall;
begin
     iberr := Piberr^;
end;

function ibcnt : integer; stdcall;
begin
     ibcnt := Pibcnt^;
end;

function ibcntl : longint; stdcall;
begin
     ibcntl := Pibcntl^;
end;

function ThreadIbsta : integer; stdcall;
begin
     ThreadIbsta := ThreadIbsta32;
end;

function ThreadIberr : integer; stdcall;
begin
     ThreadIberr := ThreadIberr32;
end;

function ThreadIbcnt : integer; stdcall;
begin
     ThreadIbcnt := ThreadIbcnt32;
end;

function ThreadIbcntl : longint; stdcall;
begin
     ThreadIbcntl := ThreadIbcntl32;
end;

function ibask(ud:integer;option:integer;var value:integer):integer;stdcall;
begin
     ibask := ibask32(ud, option, value);
end;

function ibcac(ud:integer;value:integer):integer;stdcall;
begin
     ibcac := ibcac32(ud, value);
end;

function ibclr(ud:integer):integer;stdcall;
begin
     ibclr := ibclr32(ud);
end;

function ibcmd(ud:integer;cmdbuf:string;count:longint):integer;stdcall;
begin
     ibcmd := ibcmd32(ud, cmdbuf, count);
end;

function ibcmda(ud:integer;cmdbuf:string;count:longint):integer;stdcall;
begin
     ibcmda := ibcmda32(ud, cmdbuf, count);
end;

function ibconfig(ud:integer;option:integer;value:integer):integer;stdcall;
begin
     ibconfig := ibconfig32(ud, option, value);
end;

function ibdev(ud:integer;pad:integer;sad:integer;tmo:integer;eot:integer;eos:integer):integer;stdcall;
begin
     ibdev := ibdev32(ud, pad, sad, tmo, eot, eos);
end;

function ibdma(ud:integer;value:integer):integer;stdcall;
begin
     ibdma := ibdma32(ud, value);
end;

function ibeos(ud:integer;value:integer):integer;stdcall;
begin
     ibeos := ibeos32(ud, value);
end;

function ibeot(ud:integer;value:integer):integer;stdcall;
begin
     ibeot := ibeot32(ud, value);
end;

function ibfind(udname:string):integer;stdcall;
begin
     ibfind := ibfind32(udname);
end;

function ibgts(ud:integer;value:integer):integer;stdcall;
begin
     ibgts := ibgts32(ud, value);
end;

function ibist(ud:integer;value:integer):integer;stdcall;
begin
     ibist := ibist32(ud, value);
end;

function iblck(ud:integer;value:integer;timeout:integer;reserved:string):integer;stdcall;
begin
     iblck := iblck32(ud, value, timeout, reserved);
end;

function iblines(ud:integer;var clines:smallint):integer;stdcall;
begin
     iblines := iblines32(ud, clines);
end;

function ibln(ud:integer;pad:integer;sad:integer;var listen:smallint):integer;stdcall;
begin
     ibln := ibln32(ud, pad, sad, listen);
end;

function ibloc(ud:integer):integer;stdcall;
begin
     ibloc := ibloc32(ud);
end;

function ibonl(ud:integer;value:integer):integer;stdcall;
begin
     ibonl := ibonl32(ud, value);
end;

function ibnotify(ud:integer;mask:integer;callback:GpibNotifyCallback_t;data:string):integer;stdcall;
begin
     ibnotify := ibnotify32(ud, mask, callback, data);
end;

function ibpad(ud:integer;value:integer):integer;stdcall;
begin
     ibpad := ibpad32(ud, value);
end;

function ibpct(ud:integer):integer;stdcall;
begin
     ibpct := ibpct32(ud);
end;

function ibppc(ud:integer;value:integer):integer;stdcall;
begin
     ibppc := ibppc32(ud, value);
end;

function ibrd(ud:integer;var  rdbuf;count: Longint):integer;stdcall;
begin
     ibrd := ibrd32(ud, rdbuf, count);
end;

function ibrda(ud:integer;var rdbuf;count:Longint):integer;stdcall;
begin
     ibrda := ibrda32(ud, rdbuf, count);
end;

function ibrdf(ud:integer;filename:string):integer;stdcall;
begin
     ibrdf := ibrdf32(ud, filename);
end;

function ibrpp(ud : integer; var ppr : short) : integer; stdcall;
begin
     ibrpp := ibrpp32(ud, ppr);
end;

function ibrsc(ud:integer;value:integer):integer;stdcall;
begin
     ibrsc := ibrsc32(ud, value);
end;

function ibrsp(ud:integer;var spr:smallint):integer;stdcall;
begin
     ibrsp := ibrsp32(ud, spr);
end;

function ibrsv(ud:integer;value:integer):integer;stdcall;
begin
     ibrsv := ibrsv32(ud, value);
end;

function ibsad(ud:integer;value:integer):integer;stdcall;
begin
     ibsad := ibsad32(ud, value);
end;

function ibsic(ud:integer):integer;stdcall;
begin
     ibsic := ibsic32(ud);
end;

function ibsre(ud:integer;value:integer):integer;stdcall;
begin
     ibsre := ibsre32(ud, value);
end;

function ibstop(ud:integer):integer;stdcall;
begin
     ibstop := ibstop32(ud);
end;

function ibtmo(ud:integer;value:integer):integer;stdcall;
begin
     ibtmo := ibtmo32(ud, value);
end;

function ibtrg(ud:integer):integer;stdcall;
begin
     ibtrg := ibtrg32(ud);
end;

function ibwait(ud:integer;mask:integer):integer;stdcall;
begin
     ibwait := ibwait32(ud, mask);
end;

function ibwrt(ud:integer;wrtbuf:string;count:longint):integer;stdcall;
begin
     ibwrt := ibwrt32(ud, wrtbuf, count);
end;

function ibwrta(ud:integer;wrtbuf:string;count:Longint):integer;stdcall;
begin
     ibwrta := ibwrta32(ud, wrtbuf, count);
end;

function ibwrtf(ud:integer;filename:string):integer;stdcall;
begin
     ibwrtf := ibwrtf32(ud, filename);
end;

procedure AllSpoll(boardID:integer;addrlist:AddrList4882_t;var resultlist:AddrList4882_t);stdcall;
begin
     AllSpoll32(boardID, addrlist, resultlist);
end;

procedure DevClear(boardID:integer;address:Addr4882_t);stdcall;
begin
     DevClear32(boardID, address);
end;

procedure DevClearList(boardID:integer;var addrlist:AddrList4882_t);stdcall;
begin
     DevClearList32(boardID, addrlist);
end;

procedure EnableLocal(boardID:integer;addrlist:AddrList4882_t);stdcall;
begin
     EnableLocal32(boardID, addrlist);
end;

procedure EnableRemote(boardID:integer;addrlist:AddrList4882_t);stdcall;
begin
     EnableRemote32(boardID, addrlist);
end;

procedure FindLstn(boardID:integer;var padlist:AddrList4882_t;var resultlist:AddrList4882_t;limit:integer);stdcall;
begin
     FindLstn32(boardID, padlist, resultlist, limit);
end;

procedure FindRQS(boardID:integer;addrlist:AddrList4882_t;var result:smallint);stdcall;
begin
     FindRQS32(boardID, addrlist, result);
end;

procedure PassControl(boardID:integer;address:Addr4882_t);stdcall;
begin
     PassControl32(boardID, address);
end;

procedure PPoll(boardID:integer;var result:smallint);stdcall;
begin
     PPoll32(boardID, result);
end;

procedure PPollConfig(boardID:integer;address:Addr4882_t;dataline:integer;linesend:integer);stdcall;
begin
     PPollConfig32(boardID, address, dataline, linesend);
end;

procedure PPollUnconfig(boardID:integer;addrlist:AddrList4882_t);stdcall;
begin
     PPollUnconfig32(boardID, addrlist);
end;

procedure RcvRespMsg(boardID:integer;var buffer;count:longint;termination:integer);stdcall;
begin
     RcvRespMsg32(boardID, buffer, count, termination);
end;

procedure ReadStatusByte(boardID:integer;address:Addr4882_t;var result:smallint);stdcall;
begin
     ReadStatusByte32(boardID, address, result);
end;

procedure Receive(boardID:integer;address:Addr4882_t;var buffer;count:longint;termination:integer);stdcall;
begin
     Receive32(boardID, address, buffer, count, termination);
end;

procedure ReceiveSetup(boardID:integer;address:Addr4882_t);stdcall;
begin
     ReceiveSetup32(boardID, address);
end;

procedure ResetSys(boardID:integer;addrlist:AddrList4882_t);stdcall;
begin
     ResetSys32(boardID, addrlist);
end;

procedure Send(boardID:integer;address:Addr4882_t;buffer:string;count:longint;eotmode:integer);stdcall;
begin
     Send32(boardID, address, buffer, count, eotmode);
end;

procedure SendCmds(boardID:integer;buffer:string;count:longint);stdcall;
begin
     SendCmds32(boardID, buffer, count);
end;

procedure SendDataBytes(boardID:integer;buffer:string;count:longint;eot:integer);stdcall;
begin
     SendDataBytes32(boardID, buffer, count, eot);
end;

procedure SendIFC(boardID:integer);stdcall;
begin
     SendIFC32(boardID);
end;

procedure SendList(boardID:integer;addrlist:AddrList4882_t;buffer:string;count:longint;eotmode:integer);stdcall;
begin
     SendList32(boardID, addrlist, buffer, count, eotmode);
end;

procedure SendLLO(boardID:integer);stdcall;
begin
     SendLLO32(boardID);
end;

procedure SendSetup(boardID:integer;addrlist:AddrList4882_t);stdcall;
begin
     SendSetup32(boardID, addrlist);
end;

procedure SetRWLS(boardID:integer;addrlist:AddrList4882_t);stdcall;
begin
     SetRWLS32(boardID, addrlist);
end;

procedure TestSRQ(boardID:integer;var result:smallint);stdcall;
begin
     TestSRQ32(boardID, result);
end;

procedure TestSys(boardID:integer;addrlist:AddrList4882_t;var resultlist);stdcall;
begin
     TestSys32(boardID, addrlist, resultlist);
end;

procedure Trigger(boardID:integer;address:Addr4882_t);stdcall;
begin
     Trigger32(boardID, address);
end;

procedure TriggerList(boardID:integer;addrlist:AddrList4882_t);stdcall;
begin
     TriggerList32(boardID, addrlist);
end;

procedure WaitSRQ(boardID:integer;var result:smallint);stdcall;
begin
     WaitSRQ32(boardID, result);
end;


initialization
LoadDLL;

finalization
FreeDLL;

end.
