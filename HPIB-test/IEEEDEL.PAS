UNIT ieeedel;
{
        Delphi 2.0 to CEC488 interface

        created from older Turbo Pascal and TPW interface files.

        11/96 original
        01/97 modifications for Win-NT.  Added .DLL extension to
              declarations.  Use temp variable for string argument
              to transmit(), due to strange Delphi limitation
              on local (stack) variables.
              Also added stdcall to some routines (functions)
              where it was missing.
              Also fixed EOI parameter in tarray.
        05/97 added new routines for CEC488 v5.0
        10/97 corrected external library name for gpib_feature routine
}

{----------------------------------------------------------------------}
INTERFACE
{----------------------------------------------------------------------}
{
  Declares the standard CEC-488 routines.
}

procedure initialize (addr,level : integer);
procedure transmit (cmd : string; var status : integer);
procedure receive (var s : string; maxlen : word; var len : word;
                   var status : integer);
procedure send (addr : integer; s : string; var status : integer);
procedure enter (var s : string; maxlen : word; var len : word;
                 addr : integer; var status : integer);
procedure spoll (addr : integer; var poll : byte; var status : integer);
procedure ppoll (var poll : byte);
procedure tarray (var d; count : word; eoi : boolean; var status : integer);
procedure rarray (var d; count : word; var len : word; var status : integer);

function srq : boolean;

procedure setport (boardnum : integer; ioaddr : word);
procedure boardselect (boardnum : integer);
procedure dmachannel (c : integer);
procedure settimeout (t : word);
procedure setoutputEOS (eos1,eos2 : byte);
procedure setinputEOS (eos : byte);

procedure enable_488ex (enable : boolean);
procedure enable_488sd (enable : boolean; timing : integer);
function listener_present (addr : integer) : boolean;
function gpib_board_present : byte;
function gpib_feature (f : integer) : integer;

{ Feature inquiry codes for gpib_feature routine }
const
   { Hardware features }
   IEEEListener = 0;
   IEEE488SD = 1;
   IEEEDMA = 2;
   { Hardware settings }
   IEEEIOBASE = 100;
   { Software settings }
   IEEETIMEOUT = 200;
   IEEEINPUTEOS = 201;
   IEEEOUTPUTEOS1 = 202;
   IEEEOUTPUTEOS2 = 203;
   IEEEBOARDSELECT = 204;
   IEEEDMACHANNEL = 205;

{----------------------------------------------------------------------}
IMPLEMENTATION
{----------------------------------------------------------------------}

{$F+}
var
   temp : string;   { used for temporary storage in some routines }

procedure ieee488_initialize (addr,level : longint) stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_INITIALIZE';
procedure ieee488_transmit (cmd : pointer; cmdlen : longint; var status : longint) stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_TRANSMIT';
procedure ieee488_receive (s : pointer; maxlen : longint; var len : longint;
                   var status : longint) stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_RECEIVE';
procedure ieee488_send (addr : longint; c : pointer; len : longint; var status : longint) stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_SEND';
procedure ieee488_enter (c : pointer; maxlen : longint; var len : longint;
                 addr : longint; var status : longint) stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_ENTER';
procedure ieee488_spoll (addr : longint; var poll : byte; var status : longint) stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_SPOLL';
procedure ieee488_ppoll (var poll : byte) stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_PPOLL';
procedure ieee488_tarray (var d; count : longint; eoi : longint;
                 var status : longint) stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_TARRAY';
procedure ieee488_rarray (var d; count : longint; var len : longint;
                 var status : longint) stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_RARRAY';

function ieee488_srq : boolean stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_SRQ';

procedure ieee488_setport (boardnum : longint; ioaddr : word) stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_SETPORT';
procedure ieee488_boardselect (boardnum : longint) stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_BOARDSELECT';
procedure ieee488_dmachannel (c : longint) stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_DMACHANNEL';
procedure ieee488_settimeout (t : longint) stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_SETTIMEOUT';
procedure ieee488_setoutputEOS (eos1,eos2 : longint) stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_SETOUTPUTEOS';
procedure ieee488_setinputEOS (eos : longint) stdcall;
        external 'IEEE_32M.DLL' name 'IEEE488_SETINPUTEOS';
procedure ieee488_dma2; external 'IEEE_32M.DLL' name 'IEEE488_DMA2';

procedure ieee488_enable_488ex (e : longint) stdcall;
   external 'IEEE_32M.DLL' name 'IEEE488_ENABLE_488EX';
procedure ieee488_enable_488sd (e : longint; t : longint) stdcall;
   external 'IEEE_32M.DLL' name 'IEEE488_ENABLE_488SD';
function ieee488_listener_present (a : longint) : boolean stdcall;
  external 'IEEE_32M.DLL' name 'IEEE488_LISTENER_PRESENT';
function ieee488_board_present : byte stdcall;
  external 'IEEE_32M.DLL' name 'IEEE488_BOARD_PRESENT';
function ieee488_feature (f : longint) : longint stdcall;
  external 'IEEE_32M.DLL' name '_ieee_feature@4';
{----------------------------------------------------------------------}

procedure initialize;
begin
        ieee488_initialize(addr,level);
end;
procedure transmit;
var
        st : longint;
begin
     { note: forced to copy cmd to a static variable,
        not on the stack.  For some reason Delphi does
        not allow write-access to it on the stack,
        and transmit does temporarily write to the string
        while parsing. }
        temp := cmd;
        ieee488_transmit(Pointer(temp),Length(temp),st);
        status := integer(st);
end;
procedure receive;
var
        st : longint;
        l : longint;
        stemp : string;
begin
        stemp := '';
        for l := 0 to maxlen div 10 do stemp := Concat (stemp,'          ');
        stemp := Concat (stemp,'          ');
        ieee488_receive(Pointer(stemp),maxlen,l,st);
        len := word(l);
        s := Copy (stemp,1,len);
        status := integer(st);
end;
procedure send;
var
        st : longint;
begin
        ieee488_send(addr,Pointer(s),Length(s),st);
        status := integer(st);
end;
procedure enter;
var
        st : longint;
        stemp : string;
        l : longint;
begin
        stemp := '';
        for l := 0 to maxlen div 10 do stemp := Concat (stemp,'          ');
        stemp := Concat (stemp,'          ');
        ieee488_enter(Pointer(stemp),maxlen,l,addr,st);
        len := word(l);
        s := Copy (stemp,1,len);
        status := integer(st);
end;
procedure spoll;
var
        st : longint;
begin
        ieee488_spoll(addr,poll,st);
        status := integer(st);
end;
procedure ppoll;
begin
        ieee488_ppoll(poll);
end;
procedure tarray;
var
          e : longint;
        st : longint;
begin
        if (eoi) then e := 1 else e := 0;
        ieee488_tarray(d,count,e,st);
        status := integer(st);
end;
procedure rarray;
var
        st : longint;
        l : longint;
begin
        ieee488_rarray(d,count,l,st);
        len := integer(l);
        status := integer(st);
end;
function srq;
begin
        srq := ieee488_srq;
end;
procedure setport;
begin
        ieee488_setport(boardnum,ioaddr);
end;
procedure boardselect;
begin
        ieee488_boardselect(boardnum);
end;
procedure dmachannel;
begin
        ieee488_dmachannel(c);
end;
procedure settimeout;
begin
        ieee488_settimeout(t);
end;
procedure setoutputEOS;
begin
        ieee488_setoutputEOS(eos1,eos2);
end;
procedure setinputEOS;
begin
        ieee488_setinputEOS(eos);
end;

procedure enable_488ex;
var l : longint;
begin
     if enable then l:=1 else l:=0;
     ieee488_enable_488ex(l);
end;
procedure enable_488sd;
var l : longint;
begin
     if enable then l:=1 else l:=0;
     ieee488_enable_488sd(l,timing);
end;
function listener_present;
begin
     listener_present := ieee488_listener_present(addr);
end;
function gpib_board_present;
begin
     gpib_board_present := ieee488_board_present;
end;
function gpib_feature;
begin
     gpib_feature := ieee488_feature(f);
end;

end.

