unit UnitPom;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Grids, ComCtrls, Math, StdCtrls, ToolWin, Spin,Registry,
  TeEngine, Series, TeeProcs, Chart, Konstant, FileCtrl;
type
  TUnitPomDlg = class(TForm)
    LabelSize: TLabel;
    KChartMenu: TPopupMenu;
    mpKChartResetaxes1: TMenuItem;
    mpKChartManualX1: TMenuItem;
    mpKChartManualY1: TMenuItem;
    mpKChartLogarithmicX1: TMenuItem;
    mpKChartLogarithmicY1: TMenuItem;
    mpKChartResetX1: TMenuItem;
    mpKChartResetY1: TMenuItem;
    mpKChartManualY2: TMenuItem;
    mpKChartResetY2: TMenuItem;
    mpKChartBottomX1: TMenuItem;
    mpKChartLeftY1: TMenuItem;
    mpKChartRightY2: TMenuItem;
    N1: TMenuItem;
    mpKChartManualX2: TMenuItem;
    ManualY12: TMenuItem;
    mpKChartDoubleX1: TMenuItem;
    mpKChartDoubleY1: TMenuItem;
    Memo1: TMemo;
    LabelSizeFont: TLabel;
(* ***** CHART ************************************************************** *)
    procedure mpKChartResetaxes1Click(Sender: TObject);
    procedure mpKChartManualX1Click(Sender: TObject);
    procedure mpKChartManualY1Click(Sender: TObject);
    procedure mpKChartLogarithmicX1Click(Sender: TObject);
    procedure mpKChartLogarithmicY1Click(Sender: TObject);
    procedure mpKChartResetX1Click(Sender: TObject);
    procedure mpKChartResetY1Click(Sender: TObject);
    procedure mpKChartManualY2Click(Sender: TObject);
    procedure mpKChartResetY2Click(Sender: TObject);
    procedure ManualY12Click(Sender: TObject);
    procedure mpKChartManualX2Click(Sender: TObject);
    procedure mpKChartDoubleY1Click(Sender: TObject);
    procedure mpKChartDoubleX1Click(Sender: TObject);
(* ***** Form Key ***************************************************** ***** *)
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  UnitPomDlg: TUnitPomDlg;
  KChart:TChart;
(* ***************************************************************** *)

type
  tFilePristup=(fpReset,fpAppend);
const
  aFaktorialMax=170;
  aFaktorialMaxExtended=1754;
  blEnterAtConsoleEnd:boolean=true;

(* **** SYSTEM ********************************************* *)
Function CheckKalvadosSubDir(adr:string):boolean;
function ShortToLongPath(qpi:string):string;
Procedure Consolend;
Procedure GetSystemVar(var sv:tsysvar);
Procedure KWinVersionP(var qver:string; var iverlolo,iverlohi,iverhi16:word);
Function KWinVersionF:string;
Function KCopyFile(q1,q2:string):boolean;
Function KAssignFileB(var haf:file; fname:string; l:integer):integer;
Function KAssignFileT
  (var haf:textfile; fname:string; fp:tFilePristup; k:integer):integer;
Procedure KPausa(ms:double);
Procedure KPausaSec(t:double);    (* Delay v [s] *)
Function UbehloSec(t0:TDateTime):double;
Function KHodMinSecToString(t:TDateTime):string;
Function KHodMinToString(t:TDateTime):string;
Function KSecToString(t:TDateTime):string;
Function Komando(pz:string; t:integer):boolean;
Function CtizRegistruStr(rkey:HKEY; qkey,qstr:string):string;
Function ZapisDoRegistruStr
  (rkey:HKEY; qNameofKey,qValueName,qValueData:string):boolean;
Function VymazRegistrValue(rkey:HKEY; qNameofKey,qValueName:string):boolean;
Function OteviraExt1(sext:string; var stype,scontent,spz:string):string;
Function OteviraExt(sext:string):string;
Function CtizRegistru_CestaWinWord:string;

(* **** STRINGY ******************************************** *)
Procedure LengthPixFont(ft:TFont);
Function  LengthPix(q:string):integer;
Function  UpravStr(qp:string):string;
Procedure ZrusMezery(var q:string);
Function  fZrusMezery(q:string):string;
Procedure ZrusMezeryNaKonci(var q:string);
Procedure ZrusMezeryNaZacatku(var q:string);
Procedure ZrusDveMezery(var q:string);
Procedure ZrusChars(var q:string; qc:string);
Procedure PremenChars(var q:string; qc:string; ch:char);
Procedure MezToTab(var q1:string);
Procedure UpravFileName(var fname:string);
Function  SpojCesta(fadr,fnam:string):string;
Function  NadCesta(fadr:string):string;
Procedure NulyZleva(var qp:string; k:integer);
Function fNulyZleva(q1:string; k:integer):string;
Procedure MezeryZprava(var qp:string; k:integer);
//Procedure PripravRozdelNum(var qp:string);
Procedure PripravRozdelVal(var qp:string);
Procedure PripravRozdelValNechMinus(var qp:string);
Procedure Vald(q1:string; var d:double; var kval:integer);
Function fvald(q1:string; var d:double):boolean;
Function fvali(q1:string; var i:integer):boolean;
Function fvalrat(qi:string; var d:double):boolean;
Function fStrToXYa(q0:string; var x,y:double):boolean;
Procedure PripravMinusNula(var qp:string);
Function  iblnum(bl:boolean):integer;
Function  blinum(i:integer):boolean;
Procedure dsdot(var q1:string);
Procedure RozdelStrN(var ps,ps1:string; n:integer);
Procedure RozdelStr(var ps,ps1:string; sep:char);
Procedure SeparStr(var ps1,ps2:string; sep:char);
Procedure VyberValEsd(ps:string; var a,da:double);
Procedure ZrusCestinu(var q:string);

(* **** SOUBORY ***************************************** *)
Procedure FSplit(FName:string; var SPath,SName,SExt:string);
Function  CtiF(var haf:text; n:integer):double;
Function  CtiStr(var haf:text; n:integer):string;
//Function  CtiCislo(var haf:text):double;

(* ***** Windows ******************************************* *)
Procedure PisPanel(var sb:TStatusBar; ip:integer; qp:string);
Function  ButtonToStr(Button: TMouseButton):string;
Function  ShiftStateToString(Shift:TShiftState):string;
Procedure CentrForm(Form1:TForm);
procedure NulStringGrid(var sg:TStringGrid);
procedure NulRadkuSg(var sg:TStringGrid; k:integer);
Procedure DeleteRowSg(var sg:TStringGrid; k:integer);
Procedure InsertRowSg(var sg:TStringGrid; k:integer);
Function  CheckSelRow(sg1:TStringGrid; k1,k2:integer):boolean;
Procedure SgSort(var sg:TStringGrid; k,n1o,n2o:integer; blsort:boolean);
Procedure SgSort2(var sg:TStringGrid; k1,k2,n1o,n2o:integer);
Function  CtiSpinEdit(var se:TSpinEdit; idef:integer):integer;
Function  Inputd(q1,q2:string; var d:double; dmin,dmax:double):boolean;

(* ***** bit *********************************************** *)
Function HiBit4(b:byte):byte;
Function LoBit4(b:byte):byte;
Function HiByte8(b:word):word;
Function LoByte8(b:word):word;
Function HiWord16(b:longword):longword;
Function LoWord16(b:longword):longword;
Function KBinToDec8(qi:string):integer;
Function KDecToBin(ki:integer):string;
Procedure SmallIntToBytes(si:smallint; var b0,b1:byte);
Procedure WordToBytes(si:word; var b0,b1:byte);

(* ***** KDif, KDist *************************************** *)
Function  Decko(th,lam1:double):double;  (* 2theta => d[A] *)
Function  Theta( d,lam1:double):double;  (* d[A] => 2theta *)
Procedure Lampa(anx:txan; var lmbd1,lmbd2,plmbd,lmbdbeta:double);
Procedure Vlna(var anx:txan; lam1,lam2:double; var plam:double);
Function  fxtzi(i:integer):double;
Function  fitzx(t:double):integer;
Function  RoundMinThk(tf:double):double;
Procedure PodlahaExt(var d:double; p1,p2:double);
Procedure KorDispZero;
Procedure FDispZeroReset(disp,zero:double; ndm:integer);

(* ***** FixPix ******************************************** *)
Procedure PixFixStringGrid(var sg:TStringGrid; fr:double; w1:integer);
Procedure PixFixStatusBar(var sb:TStatusBar; fr:double; k:integer);
Procedure PixFixToolBar(var tb:TToolBar; fr:double);

(* ***** funkce ******************************************** *)
Function KCubicSpline(x,x0,y0,x1,y1,x2,y2,x3,y3:double; var k:integer):double;
Function KRoundD(tf:double; k:integer):double;
Procedure MantExp(f:double; var m:double; var e:integer; var im:integer);
Function  MinOfTwoI(a1,a2:integer):integer;
Function faktorial(a:integer):double;
Function FaktorialExtended(a:integer):extended;
Function Interpold(x,x1,x2,y1,y2:double):double;

(* ***** sin,cos ******************************************* *)
Function tan(a:double):double;
Function cotan(a:double):double;
Function arcsin(a:double) : double;                          // -pi/2 - pi/2
Function arccos(a:double) : double;                          // 0 - pi
Function arccotan(a:double):double;                          // -pi/2 - pi/2

(* ***** CHART ********************************************* *)
Procedure KChartUkazMenu(x,y:integer);
Procedure KChartZvetsiOsu2(ax:TChartAxis);
Procedure KChartZmensiOsu2(ax:TChartAxis);
Procedure KChartResetOsy(chr1:TChart);
Procedure KChartManualOsa(ax:TChartAxis);
Procedure NastavOsuMinMax(ax:TChartAxis; x1,x2:double);

(* **** SYSTEM ********************************************* *)
var
  KSysVar:TSysVar;

implementation
{$R *.dfm}

(* **** SYSTEM ********************************************* *)
(*
  rkey:=HKEY_CURRENT_USER
  qNameofKey:='\Environment';
  qValueName:='Kalvados';
  qValueData='C:\Karel\Kalvados';
*)
Function ZapisDoRegistruStr
  (rkey:HKEY; qNameofKey,qValueName,qValueData:string):boolean;
begin
  ZapisDoRegistruStr:=false;
  if (Length(qNameofKey)<=0) OR (Length(qValueName)<=0)
    OR (Length(qValueData)<=0) then exit;
  with TRegistry.Create do try
    RootKey:=rkey;
    CreateKey(qNameofKey);
    if OpenKey(qNameofKey,False) then begin
      WriteString(qValueName,qValueData);
      ZapisDoRegistruStr:=true;
      CloseKey;
    end;
    finally Free;
  end;
end;

Function VymazRegistrValue(rkey:HKEY; qNameofKey,qValueName:string):boolean;
begin
  VymazRegistrValue:=false;
  if (Length(qNameofKey)<=0) OR (Length(qValueName)<=0) then exit;
  with TRegistry.Create do try
    RootKey:=rkey;
    if OpenKey(qNameofKey,False) then begin
      VymazRegistrValue:=DeleteValue(qValueName);
    end;
    finally Free;
  end;
end;

Function CtizRegistruStr(rkey:HKEY; qkey,qstr:string):string;
var q1:string; i:integer;
begin
  CtizRegistruStr:='';
  with TRegistry.Create do try
    RootKey:=rkey;
    if OpenKey(qkey,False) then begin
      q1:=ReadString(qstr);
      i:=pos('^',q1); if i>1 then q1:=copy(q1,1,i-2);
      CtizRegistruStr:=q1;
      CloseKey;
    end;
    finally Free;
  end;
end;

Function CtizRegistru_CestaWinWord:string;
begin
  CtizRegistru_CestaWinWord:=CtizRegistruStr(HKEY_CURRENT_USER,
    'Software\Microsoft\Windows\CurrentVersion\Extensions','doc');
end;

Function OteviraExt1(sext:string; var stype,scontent,spz:string):string;
var spg:string; i:integer;
begin
  stype:=CtizRegistruStr(HKEY_LOCAL_MACHINE,
         Format('SOFTWARE\Classes\.%s',[sext]),'');
  scontent:=CtizRegistruStr(HKEY_LOCAL_MACHINE,
         Format('SOFTWARE\Classes\.%s',[sext]),'Content type');
  spz:=CtizRegistruStr(HKEY_CLASSES_ROOT,
         Format('%s\Shell\Open\Command',[stype]),'');
  spg:=spz;
  i:=pos('"',spg);
  if i=1 then begin delete(spg,i,1); i:=pos('"',spg) end else i:=0;
  if i=0 then i:=pos(' ',spg);
  spg:=copy(spg,1,i-1);
  spg:=ShortToLongPath(spg);
  OteviraExt1:=spg;
end;

Function OteviraExt(sext:string):string;
var stype,scontent,spz:string;
begin
  OteviraExt:=OteviraExt1(sext,stype,scontent,spz);
end;

Function Komando(pz:string; t:integer):boolean;
var qc:pchar; k:integer;
begin
  qc:=pChar(pz); k:=-1;
  case t of
   0: k:=WinExec(qc,sw_minimize);
   1: k:=WinExec(qc,sw_show);
  end;
//  KPausa(100);
  if k<32 then Komando:=false else Komando:=true;
end;

function AlternateToLFN(AltName:String):String;
var temp: TWIN32FindData; searchHandle: THandle;
begin
  searchHandle:=FindFirstFile(PChar(AltName),temp) ;
  if searchHandle <> ERROR_INVALID_HANDLE
    then result := String(temp.cFileName)
    else result := '';
  Windows.FindClose(searchHandle) ;
end;

function ShortToLongPath(qpi:string):string;
var qpl,qps,qp2:string; j,k:integer;
begin
  if pos('~',qpi)=0 then begin
    ShortToLongPath:=qpi; exit;
  end;
  qps:=qpi; qpl:='';
  repeat
    qp2:=AlternateToLFN(qps);
    qpl:=Format('\%s%s',[qp2,qpl]);
    k:=-1; for j:=1 to length(qps) do if qps[j]='\' then k:=j;
    if k>0 then qps:=copy(qps,1,k-1) else qps:='';
  until pos('\',qps)=0;
  qpl:=qps+qpl;
  ShortToLongPath:=qpl;
end;

Function CheckKalvadosSubDir(adr:string):boolean;
var bl:boolean;
begin
  bl:=DirectoryExists(adr);
  if bl=false then
    AddErrorStr(Format('Directory %s not found',[adr]));
  CheckKalvadosSubDir:=bl;
end;

Procedure Consolend;
begin
  if blEnterAtConsoleEnd then begin
    writeln('Press ENTER to close console'); readln;
  end;
  halt;
//  Application.Terminate;
end;

Procedure KWinVersionP(var qver:string; var iverlolo,iverlohi,iverhi16:word);
var iver:longword; iverlo16:word;
begin
  qver:='OS'; {GetEnvironmentVariable('OS');}
  iver:=GetVersion;
  iverlo16:=LoWord16(iver);    iverhi16:=HiWord16(iver);
  iverlolo:=LoByte8(iverlo16);
  iverlohi:=HiByte8(iverlo16);
end;

Function KWinVersionF:string;
var qver:string; var iver1,iver2,iver3:word;
begin
  KWinVersionP(qver,iver1,iver2,iver3);
  KWinVersionF:=Format('%d.%d %s',[iver1,iver2,qver])
end;

Procedure GetSystemVar(var sv:tsysvar);
var  pcWinDir:PChar;
begin
  with sv do begin
    GetMem(pcWinDir,255);
    GetWindowsDirectory(pcWinDir,255); WinDir:=pcWinDir;
    GetSystemDirectory(pcWinDir,255);  WinSystemDir:=pcWinDir;
    GetTempPath(255,pcWinDir);         TempDir:=pcWinDir;
    {  TempDir:=ExcludeTrailingPathDelimiter(tempdir);}
    TempDir:=ExcludeTrailingBackslash(tempdir);
    FreeMem(pcWinDir,255);
  end;
end;

Function KCopyFile(q1,q2:string):boolean;
var adr2:string; lp1,lp2:pchar;
begin
  q1:=StringReplace(q1,'\\','\',[rfReplaceAll]);
  q2:=StringReplace(q2,'\\','\',[rfReplaceAll]);
  adr2:=ExtractFileDir(q2);
  if (adr2<>'') AND (DirectoryExists(adr2)=false) then ForceDirectories(adr2);
  lp1:=pChar(q1); lp2:=pChar(q2);
  KCopyFile:=CopyFile(lp1,lp2,false);
//  KCopyFile:=CopyFileTo(q1,q2);
end;

Function KAssignFileB(var haf:file; fname:string; l:integer):integer;
var ior:integer;
begin
  if FileExists(FName)=false then begin
    AddErrorStr(Format('%s: not found',[FName]));
    KAssignFileB:=-1;
    exit;
  end;
{$I-}
  AssignFile(haf,fname); reset(haf,l); ior:=IOResult;
{$I+}
  if ior<>0 then begin
    AddErrorStr(Format('%s: File access error #%d',[fname,ior]));
    KAssignFileB:=ior;
    exit;
  end;
  KAssignFileB:=0;
end;

Function KAssignFileT
  (var haf:textfile; fname:string; fp:tFilePristup; k:integer):integer;
var ior:integer;
begin
  if FileExists(FName)=false then begin
    if k=1 then AddErrorStr(Format('%s: not found',[FName]));
    KAssignFileT:=-1;
    exit;
  end;
{$I-}
  AssignFile(haf,fname);
  case fp of fpReset: reset(haf); fpAppend: append(haf); end;
  ior:=IOResult;
{$I+}
  if ior<>0 then begin
    if k=1 then AddErrorStr(Format('%s: File access error #%d',[fname,ior]));
    KAssignFileT:=ior;
    exit;
  end;
  KAssignFileT:=0;
end;

Procedure KPausa(ms:double);      (* Delay v [ms] *)
var Ted1:TDateTime;
begin
  if ms<=0 then exit;
  Ted1:=Now;
  repeat until ((Now-Ted1)*MSecsPerDay)>ms;
end;

Procedure KPausaSec(t:double);    (* Delay v [s] *)
begin
  KPausa(t*1000);
end;

Function UbehloSec(t0:TDateTime):double;
var t:TDateTime; d:double;
begin
  t:=Now-t0;
  d:=t*SecsPerDay;
  UbehloSec:=d;
end;

Function KSecToString(t:TDateTime):string;
var q,q2:string; h1,h2,h,n,n2,s,s2:integer;
begin
  DateTimeToString(q,'h:nn:ss.zzz',t);
  h1:=floor(t)*24;                   // hodiny pres 1 den
  RozdelStr(q,q2,':'); fvali(q2,h2); // hodiny do 1 dne; q2='h'; q='nn:ss.zzz'
  h:=h1+h2;                          // hodiny celkem
  RozdelStr(q,q2,':'); fvali(q2,n2); // minuty; q2='nn'; q='ss.zzz'
  n:=h*60+n2;                        // minuty+hodiny*60
  RozdelStr(q,q2,'.'); fvali(q2,s2); // sekundy; q2='ss'; q='zzz'
  s:=n*60+s2;                        // sekundy+minuty*60
  q:=Format('%d.%ss',[s,q]);
  KSecToString:=q;
end;

Function KHod_ToString(t:TDateTime; qft:string):string;
var q,q2:string; h1,h2,h:integer;
begin
  DateTimeToString(q,qft,t);
  if t>=1 then begin
    h1:=floor(t)*24;                   // h pres 1 den
    RozdelStr(q,q2,':'); fvali(q2,h2); // h do 1 dne; q2='h'; q='nn:ss'\'nn'
    h:=h1+h2;                          // hodiny celkem
    q:=Format('%d:%s',[h,q]);
  end;
  KHod_ToString:=q;
end;

Function KHodMinSecToString(t:TDateTime):string;
begin
  KHodMinSecToString:=KHod_ToString(t,'h:nn:ss');
end;

Function KHodMinToString(t:TDateTime):string;
begin
  KHodMinToString:=KHod_ToString(t,'h:nn');
end;

(* **** STRINGY ******************************************** *)

Procedure LengthPixFont(ft:TFont);
begin
  with UnitPomDlg.LabelSize do begin
    Font:=ft; Font.Style:=ft.Style; Font.Height:=ft.Height;
  end;
end;

Function LengthPix(q:string):integer;
begin
  with UnitPomDlg.LabelSize do begin Caption:=q; LengthPix:=Width+8 end;
//  UnitPomDlg.ShowModal;
end;

Function UpravStr(qp:string):string;
var qc:pchar; qv:string;
begin
  qc:=PChar(qp); qv:=AnsiExtractQuotedStr(qc,'''');
  UpravStr:=qv;
end;

Function fZrusMezery(q:string):string;
var q1:string;
begin
  q1:=StringReplace(q,#9,'',[rfReplaceAll, rfIgnoreCase]);
  q1:=StringReplace(q1,' ','',[rfReplaceAll, rfIgnoreCase]);
  fZrusMezery:=q1;
end;

Procedure ZrusMezery(var q:string);
begin
  q:=fZrusMezery(q);
end;

Procedure ZrusDveMezery(var q:string);
begin
  q:=StringReplace(q,#9,' ',[rfReplaceAll, rfIgnoreCase]);
  while pos('  ',q)>0 do
    q:=StringReplace(q,'  ',' ',[rfReplaceAll]);
  if length(q)>0 then if q[1]=' ' then delete(q,1,1);
  if length(q)>0 then if q[length(q)]=' ' then delete(q,length(q),1);
end;

Procedure ZrusChars(var q:string; qc:string);
var i:integer;
begin
  for i:=1 to length(qc) do
    q:=StringReplace(q,qc[i],'',[rfReplaceAll]);
end;

Procedure PremenChars(var q:string; qc:string; ch:char);
var i:integer;
begin
  for i:=1 to length(qc) do
    q:=StringReplace(q,qc[i],ch,[rfReplaceAll]);
end;

Procedure MezToTab(var q1:string);
begin
  ZrusDveMezery(q1);
  q1:=StringReplace(q1,' ',#9,[rfReplaceAll]);
end;

Function NadCesta(fadr:string):string;
var q1:string;
begin
  q1:=SpojCesta(fadr,'..');
  q1:=ExpandFileName(q1);
  NadCesta:=q1;
end;

Function SpojCesta(fadr,fnam:string):string;
var q1:string; l:integer;
begin
  if fadr<>'' then begin
    l:=length(fadr); if fadr[l]='\' then delete(fadr,l,1) end;
  if fnam<>'' then   if fnam[1]='\' then delete(fnam,1,1);
  if fadr<>'' then q1:=Format('%s\%s',[fadr,fnam]) else q1:=fnam;
  SpojCesta:=q1;
end;

Procedure UpravFileName(var fname:string);
begin
  ZrusChars(fname,'*?/\:<>|"');             // Windows: '*?/\:<>|"'
  ZrusChars(fname,' ;#$%&@');
end;

Procedure ZrusMezeryNaKonci(var q:string);
var le,k:integer;
begin
  le:=length(q); k:=le;
  while (k>=1) AND (q[k]=' ') do dec(k);       (* => k=1.non-space od konce *)
  if k<le then delete(q,k+1,le-k);
end;

Procedure ZrusMezeryNaZacatku(var q:string);
var le,k:integer;
begin
  le:=length(q); k:=1;
  while (k<=le) AND (q[k]=' ') do inc(k);     (* => k=1.non-space od zacatku *)
  if k>1  then delete(q,1,k-1);
end;

Procedure NulyZleva(var qp:string; k:integer);
begin
  while length(qp)<k do qp:='0'+qp;
end;

Function fNulyZleva(q1:string; k:integer):string;
var qp:string;
begin
  qp:=q1;
  while length(qp)<k do qp:='0'+qp;
  fNulyZleva:=qp;
end;

Procedure MezeryZprava(var qp:string; k:integer);
begin
  while length(qp)<k do qp:=qp+' '; qp:=copy(qp,1,k);
end;
{
Procedure PripravRozdelNum(var qp:string);
begin
  qp:=StringReplace(qp,'-',' -',[rfReplaceAll]);
  if DecimalSeparator='.'
    then qp:=StringReplace(qp,',',DecimalSeparator,[rfReplaceAll]);
  if DecimalSeparator=','
    then qp:=StringReplace(qp,'.',DecimalSeparator,[rfReplaceAll]);
  ZrusDveMezery(qp);
end;
}
Procedure PripravRozdelVal(var qp:string);
begin
  qp:=StringReplace(qp,'-',' -',[rfReplaceAll]);
  qp:=StringReplace(qp,'e -','e-',[rfReplaceAll,rfIgnoreCase]);
  qp:=StringReplace(qp,',','.',[rfReplaceAll]);
  ZrusDveMezery(qp);
end;

Procedure PripravRozdelValNechMinus(var qp:string);
begin
  qp:=StringReplace(qp,',','.',[rfReplaceAll]);
  ZrusDveMezery(qp);
end;

Procedure dsdot(var q1:string);
begin
  if DecimalSeparator<>'.' then
    q1:=StringReplace(q1,DecimalSeparator,'.',[rfReplaceAll]);
end;

Procedure Vald(q1:string; var d:double; var kval:integer);
var qp:string;
begin
  qp:=q1;
  ZrusMezery(qp);
  if DecimalSeparator<>'.' then
    q1:=StringReplace(q1,DecimalSeparator,'.',[rfReplaceAll]);
  qp:=StringReplace(qp,',','.',[rfReplaceAll]);
  val(qp,d,kval);
end;

Function fvald(q1:string; var d:double):boolean;
var kval:integer;
begin
  Vald(q1,d,kval);
  fvald:=kval=0;
end;

Function fvali(q1:string; var i:integer):boolean;
var kval:integer;
begin
  Val(q1,i,kval);
  fvali:=kval=0;
end;

Function fvalrat(qi:string; var d:double):boolean;
var d1,d2:double; q1,q2:string; bl:boolean;
begin
  if pos('/',qi)>0 then begin
    q1:=fZrusMezery(qi); SeparStr(q1,q2,'/');
    bl:=fvald(q1,d1) AND fvald(q2,d2) AND (d2<>0);
    if bl then d:=d1/d2 else d:=0;
  end
  else bl:=fvald(qi,d);
  fvalrat:=bl;
end;

Function fStrToXYa(q0:string; var x,y:double):boolean;
const chsep=' ';
var q1,q2:string; blx,bly:boolean;
begin
  q1:=q0; ZrusDveMezery(q1); x:=0; y:=0;
  RozdelStr(q1,q2,chsep); blx:=fvald(q2,x);
  RozdelStr(q1,q2,chsep); if q2='' then bly:=true else bly:=fvald(q2,y);
  fStrToXYa:=blx AND bly;
end;

Function MinOfTwoI(a1,a2:integer):integer;
begin
  if a1<=a2 then MinOfTwoI:=a1 else MinOfTwoI:=a2;
end;

Procedure PripravMinusNula(var qp:string);
var q1,q2:string;
begin
  q1:='-0'+DecimalSeparator;
  q2:=' -'+DecimalSeparator;
  qp:=StringReplace(qp,q1,q2,[rfReplaceAll]);
end;

Function iblnum(bl:boolean):integer;
begin
  if bl then iblnum:=1 else iblnum:=0;
end;

Function blinum(i:integer):boolean;
begin
  if i=0 then blinum:=false else blinum:=true;
end;

(* **** SOUBORY ***************************************** *)

Procedure FSplit(FName:string; var SPath,SName,SExt:string);
var qp:string;
begin
  SPath:=ExtractFilePath(FName);
  SExt:=ExtractFileExt(FName);
  qp:=ExtractFileName(FName);
  SName:=ChangeFileExt(qp,'');
{
  i:=LastDelimiter(':\',FName);
  j:=LastDelimiter('.',FName);
  l:=length(FName);
  if i>0 then SPath:=Copy(FName,1,i) else SPath:='';
  if j>0 then SExt:=Copy(FName,j+1,l-j) else SExt:='';
  if j=0 then j:=l+1; SName:=Copy(FName,i+1,j-i-1);
}
end;

function Ctizfajlu(var haf:text; n:integer;
                   StrSet1,StrSet2:setofchar):string;
var ch:char; p:string; i:integer;
begin
  p:=''; if n=0 then n:=-255;
  if not Eof(haf) then begin

    if n<0 then begin
      i:=1; ch:=#0; n:=abs(n);                   (* !!!!!!!!!!!!! *)
      if not Eoln(haf) then
        repeat read(haf,ch)
        until (Eoln(haf)) or (ch in StrSet1);
      if not Eoln(haf) then
        repeat inc(i); p:=p+ch; read(haf,ch);
        until (Eoln(haf)) or (not (ch in StrSet2)) or (i>=n);
      if ch in StrSet1 then p:=p+ch;
    end

    else begin
      for i:=1 to n do if not Eoln(haf) then begin read(haf,ch); p:=p+ch end;
    end;

  end;
  Ctizfajlu:=p;
end;

Function CtiStr(var haf:text; n:integer):string;
begin
  CtiStr:=Ctizfajlu(haf,n,[#33..#255],[#33..#255]);
end;

Function CtiCislo(var haf:text):double;
var q:string; d:double; i:integer;
begin
  q:=Ctizfajlu(haf,0,['0'..'9',DecimalSeparator,'-','+'],
                     ['0'..'9',DecimalSeparator,'-','+','e','E']);
  val(q,d,i);
  cticislo:=d;
end;

Function iCtiCislo(var haf:text):integer;
var f1:double;
begin
  f1:=cticislo(haf); icticislo:=round(f1);
end;

Function CtiF(var haf:text; n:integer):double;
var q:string; d:double; i:integer;
begin
  q:=Ctizfajlu(haf,n,[' ','0'..'9',DecimalSeparator,'-','+'],
                     [' ','0'..'9',DecimalSeparator,'-','+','e','E']);
  ZrusMezery(q); val(q,d,i);
  CtiF:=d;
end;

Function CtiChr(var haf:text):char;
var ch:char;
begin
  if not SeekEof(haf) then read(haf,ch) else ch:=#0;
  CtiChr:=ch;
end;

(* ***** WINDOWS ******************************************** *)

Procedure PisPanel(var sb:TStatusBar; ip:integer; qp:string);
var q1:string; l:integer;
begin
  q1:=Format(' %s ',[qp]);
  with UnitPomDlg.LabelSizeFont do begin
    Font:=sb.Font;
    Font.Style:=sb.Font.Style;
    Font.Height:=sb.Font.Height;
    Caption:=q1; l:=Width+8;
  end;
  with sb.Panels[ip] do begin Width:=l; Text:=q1 end;
end;

Function  ShiftStateToString(Shift:TShiftState):string;
var strShift:string;
begin
  strShift:='';
  if ssShift  in Shift then strShift:=strShift+'S'; (* The Shift key is held down. *)
  if ssAlt    in Shift then strShift:=strShift+'A'; (* The Alt key is held down.   *)
  if ssCtrl   in Shift then strShift:=strShift+'C'; (* The Ctrl key is held down.  *)
  if ssLeft   in Shift then strShift:=strShift+'L'; (* The left mouse button is held down.  *)
  if ssRight  in Shift then strShift:=strShift+'R'; (* The right mouse button is held down. *)
  if ssMiddle in Shift then strShift:=strShift+'M'; (* The middle mouse button is held down.*)
  if ssDouble in Shift then strShift:=strShift+'D'; (* The mouse was double-clicked.        *)
  ShiftStateToString:=strShift;
end;

Function ButtonToStr(Button: TMouseButton):string;
var strButt:string;
begin
  strButt:=' ';
  case Button of
    mbLeft  : strButt:='L';
    mbRight : strButt:='R';
    mbMiddle: strButt:='M';
  end;
  ButtonToStr:=strButt;
end;

Procedure CentrForm(Form1:TForm);
var sw,sh,fw,fh:integer;
begin
  with Screen do begin sw:=Width; sh:=Height end;
  with Form1 do begin
    fw:=Width; fh:=Height;
    if fw>sw then Left:=0
             else Left:=(sw-fw) div 2;
    if fh>sh then Top :=0
             else Top :=(sh-fh) div 2;
  end;
end;

procedure NulStringGrid(var sg:TStringGrid);
begin
  with sg do begin
    RowCount:=FixedRows+1; row:=RowCount-1; rows[row].Clear;
  end;
end;

procedure NulRadkuSg(var sg:TStringGrid; k:integer);
begin
  with sg do begin
    if (k<0) or (k>(rowcount-1)) then exit;
//    for j:=FixedCols to colcount-1 do cells[j,k]:='';
    rows[k].Clear;
  end;
end;

Procedure DeleteRowSg(var sg:TStringGrid; k:integer);
var i:integer;
begin
  with sg do begin
    if (k<FixedRows) OR (k>(RowCount-1)) then exit;
    if (RowCount-FixedRows)<2 then begin
      NulRadkuSg(sg,k);
      exit;
    end;
    for i:=k to RowCount-2 do rows[i]:=rows[i+1];
//      for j:=0 to ColCount-1 do cells[j,i]:=cells[j,i+1];
    if row>(RowCount-2) then row:=RowCount-2;
    RowCount:=RowCount-1;
//    row:=Min(k,RowCount-1);
  end;
end;

Procedure InsertRowSg(var sg:TStringGrid; k:integer);
var i:integer;
begin
  with sg do begin
    if (k<FixedRows) OR (k>(RowCount-1)) then exit;
    RowCount:=RowCount+1;
    for i:=RowCount-2 downto k do rows[i+1]:=rows[i];
    rows[k].Clear;
  end;
end;

Function  CtiSpinEdit(var se:TSpinEdit; idef:integer):integer;
var k,kval:integer;
begin
  with se do begin
//    if text='' then text:='0';
    val(text,k,kval);
    if (k<minvalue) OR (k>maxvalue) then begin k:=idef; {value:=k} end;
  end;
  CtiSpinEdit:=k;
end;

Function CheckSelRow(sg1:TStringGrid; k1,k2:integer):boolean;
var bl:boolean;
begin
  bl:=true;
  with sg1 do begin
    if k1>k2 then bl:=false;
    if (k1<FixedRows) OR (k1>(rowcount-1)) then bl:=false;
    if (k2<FixedRows) OR (k2>(rowcount-1)) then bl:=false;
  end;
  CheckSelRow:=bl;
end;

Procedure SgSort(var sg:TStringGrid; k,n1o,n2o:integer; blsort:boolean);
var p,p1,j,i,n1,n2:integer;
begin
  with sg do begin
    if (n1o<FixedRows) OR (n1o>(rowcount-1)) then n1:=FixedRows else n1:=n1o;
    if (n2o<FixedRows) OR (n2o>(rowcount-1)) then n2:=rowcount-1 else n2:=n2o;
    if (n2-n1)<1 then exit;
    p1:=n2-1;
    repeat p:=p1; p1:=n1-1;
      for j:=n1 to p do if (cells[k,j]<>cells[k,j+1]) AND
                          ((cells[k,j]> cells[k,j+1])=blsort) then begin
        for i:=0 to colcount-1 do cols[i].Exchange(j,j+1);
        p1:=j-1;
      end;
    until p1<n1;
  end;
end;

Procedure SgSort2(var sg:TStringGrid; k1,k2,n1o,n2o:integer);
var p,p1,j,i,n1,n2:integer; bl1a,bl1b,bl2,blsort1,blsort2:boolean;
begin
  blsort1:=(k1>0); blsort2:=(k2>0);
  k1:=abs(k1); k2:=abs(k2);
  with sg do begin
    if (n1o<FixedRows) OR (n1o>(rowcount-1)) then n1:=FixedRows else n1:=n1o;
    if (n2o<FixedRows) OR (n2o>(rowcount-1)) then n2:=rowcount-1 else n2:=n2o;
    if (n2-n1)<1 then exit;
    p1:=n2-1;
    repeat p:=p1; p1:=n1-1;
      for j:=n1 to p do begin
        bl1a:=cells[k1,j]=cells[k1,j+1];
        bl1b:=(cells[k1,j]> cells[k1,j+1])=blsort1;
        bl2:=(cells[k2,j]<>cells[k2,j+1]) AND
            ((cells[k2,j]> cells[k2,j+1])=blsort2);
        if ((bl1a=false) AND bl1b) OR (bl1a AND bl2) then begin
          for i:=0 to colcount-1 do cols[i].Exchange(j,j+1);
          p1:=j-1;
        end;
      end;
    until p1<n1;
  end;
end;

(* **** RESIZE PixelPerInch ******************************** *)

Procedure PixFixStringGrid(var sg:TStringGrid; fr:double; w1:integer);
var i,sumcol:integer;
begin
  with sg do begin
    if fr>1 then begin
      DefaultRowHeight:=round(DefaultRowHeight*fr);
//      DefaultColWidth:=round(DefaultColWidth*fr);
      for i:=0 to ColCount-1 do ColWidths[i]:=round(ColWidths[i]*fr);
    end;
    if w1>0 then begin
      sumcol:=0;
      for i:=0 to ColCount-1 do sumcol:=sumcol+ColWidths[i]+GridLineWidth;
      Width:=sumcol+w1+4;
    end;
  end;
end;

Procedure PixFixStatusBar(var sb:TStatusBar; fr:double; k:integer);
var i:integer;
begin
  with sb do begin
    if k=1 then Height:=round(Height*fr);
    for i:=0 to Panels.Count-1 do Panels[i].Width:=round(Panels[i].Width*fr)
  end;
end;

Procedure PixFixToolBar(var tb:TToolBar; fr:double);
begin
  with tb do begin
    Height:=round(Height*fr);
  end;
end;

(* **** POCTY ********************************************** *)

Procedure SortMusterAscen(n1,n2:integer);
type tb=string;                                                     // tb!
const na1=0; na2=10; var amuster:array[na1..na2] of tb;
var p,p1,j:integer; b:tb;                                              (*SORT*)
begin                                                                  (*SORT*)
  if (n2-n1)<1 then exit;                                              (*SORT*)
  p1:=n2-1;                                                            (*SORT*)
  repeat p:=p1; p1:=n1-1;                                              (*SORT*)
    for j:=n1 to p do if amuster[j]>amuster[j+1] then begin         // amuster!
      b:=amuster[j]; amuster[j]:=amuster[j+1]; amuster[j+1]:=b;     // amuster!
      p1:=j-1;      // j a j+1 jsou serazene, j-1 mozna neni serazeny  (*SORT*)
    end;                                                               (*SORT*)
  until p1<n1;                                                         (*SORT*)
end;

Procedure VyberValEsd(ps:string; var a,da:double);
var i,j,kval:integer; ps1:string;
begin
  i:=pos('(',ps);
  if i>0 then begin
    ps1:=ps;
    delete(ps1,1,i);
    ZrusChars(ps1,'()');
    val(ps1,da,kval);
    delete(ps,i,length(ps)-i+1);
    i:=pos(DecimalSeparator,ps); j:=-(length(ps)-i);
    da:=da*IntPower(10,j);
  end;
  val(ps,a,kval);
end;

Procedure ZrusCestinu(var q:string);
const nczx=16;
  aczu:array[1..nczx] of char=('¡','»','…','Ã','Õ','œ','“','”','ÿ','Ÿ','⁄','›','ä','é','ç','‹');
  aenu:array[1..nczx] of char=('A','C','E','E','I','D','N','O','R','U','U','Y','S','Z','T','U');
  aczl:array[1..nczx] of char=('·','Ë','È','Ï','Ì','Ô','Ú','Û','¯','˘','˙','˝','ö','û','ù','¸');
  aenl:array[1..nczx] of char=('a','c','e','e','i','d','n','o','r','u','u','y','s','z','t','u');
var i:integer;
begin
  for i:=1 to nczx do q:=StringReplace(q,aczu[i],aenu[i],[rfReplaceAll]);
  for i:=1 to nczx do q:=StringReplace(q,aczl[i],aenl[i],[rfReplaceAll]);
end;

Function Inputd(q1,q2:string; var d:double; dmin,dmax:double):boolean;
var qi:string; kval:integer;
begin
  Inputd:=false;
  qi:=FloatToStr(d);
  q2:=Format('%s [min=%g max=%g]',[q2,dmin,dmax]);
  if InputQuery(q1,q2,qi)=false then exit;
  if qi='' then exit;
  val(qi,d,kval);
  if kval<>0 then exit;
  if (d<dmin) OR (d>dmax) then exit;
  Inputd:=true;
end;

// ps='123ABC' => ps1:='123'; ps:='ABC'
//       n
Procedure RozdelStrN(var ps,ps1:string; n:integer);
begin
  ps1:=copy(ps,1,n);
  delete(ps,1,n);
end;

// ps='123sepABC' => ps1:='123'; ps:='ABC'
// ps='123'       => ps1:='123'; ps:=''
Procedure RozdelStr(var ps,ps1:string; sep:char);
var i1,i2:integer;
begin
  i1:=pos(sep,ps); i2:=i1;
  if i1=0 then begin i1:=length(ps)+1; i2:=i1-1 end;
  ps1:=copy(ps,1,i1-1);
  delete(ps,1,i2);
end;

// ps1='123sepABC' => ps1:='123'; ps2:='ABC'
// ps1='123'       => ps1:='123'; ps2:=''
Procedure SeparStr(var ps1,ps2:string; sep:char);
var ps:string;
begin
  RozdelStr(ps1,ps2,sep);
  ps:=ps2; ps2:=ps1; ps1:=ps;
end;

(* ***** funkce ******************************************** *)

Function KCubicSplinePar(x0,y0,x1,y1,x2,y2,x3,y3:double; k:integer;
                     var a0,a1,a2,a3:double):boolean;
var s1,s2,a:double;                 // k=0 pokracuje spline
begin                               // k<>0 pokracuje linear
  KCubicSplinePar:=false;
  if x0>=x1 then exit; if x1>=x2 then exit; if x2>=x3 then exit;
  if k=0 then s1:=(y2-y0)/(x2-x0) else s1:=(y1-y0)/(x1-x0);
  s2:=(y3-y2)/(x3-x2);
  a:=power(x1,3)-power(x2,3)-3*sqr(x1)*x2+3*x1*sqr(x2);
  if a=0 then exit;
  a3:=(2*(y2-y1)+(s2+s1)*(x1-x2))/a;
  a2:=(s1-s2-3*a3*(sqr(x1)-sqr(x2)))/(2*(x1-x2));
  a1:=s2-2*a2*x2-3*a3*sqr(x2);
  a0:=y1-s1*x1+a2*sqr(x1)+2*a3*power(x1,3);
  KCubicSplinePar:=true;
end;

Function KCubicSplineVyp(x,a0,a1,a2,a3:double):double;
begin
  KCubicSplineVyp:=a0+a1*x+a2*x*x+a3*x*x*x;
end;

Function KCubicSpline(x,x0,y0,x1,y1,x2,y2,x3,y3:double; var k:integer):double;
var a0,a1,a2,a3:double; k1:integer;
begin
  KCubicSpline:=0; k1:=k; k:=-1;
  if (x<x1) OR (x>x2) then exit;
  if KCubicSplinePar(x0,y0,x1,y1,x2,y2,x3,y3,k1,a0,a1,a2,a3)=false then exit;
  KCubicSpline:=KCubicSplineVyp(x,a0,a1,a2,a3); k:=0;
end;

Function KRoundD(tf:double; k:integer):double;
begin
  KRoundD:=round(tf*power(10,k))/power(10,k);
//  KRoundD:=RoundTo(tf,-k);
end;

Procedure MantExp(f:double; var m:double; var e:integer; var im:integer);
begin
  if f=0 then begin m:=0; e:=1 end
  else begin
    e:=floor(log10(abs(f)));
    m:=f/intpower(10,e);
  end;
  im:=round(m);
end;

Function faktorial(a:integer):double;
var d:double; i:integer;
begin
  if a>aFaktorialMax then begin faktorial:=-1; exit end;
  d:=1;
  for i:=2 to a do d:=d*i;
  faktorial:=d;
end;

Function FaktorialExtended(a:integer):extended;
var d:extended; i:integer;
begin
  if a>aFaktorialMaxExtended then begin FaktorialExtended:=-1; exit end;
  d:=1;
  for i:=2 to a do d:=d*i;
  FaktorialExtended:=d;
end;

Function Interpold(x,x1,x2,y1,y2:double):double;
begin
  Interpold:=(x-x2)*(y1-y2)/(x1-x2)+y2;
end;

(* **** BYTE,BIT ******************************************* *)

Function KDecToBin(ki:integer):string;
var i,b,k:integer; q:string;
begin
  b:=128; q:=''; k:=ki;
  for i:=1 to 8 do begin
    if k>=b then begin q:=q+'1'; k:=k-b end
           else       q:=q+'0';
    b:=b div 2;
  end;
  KDecToBin:=q;
end;

Function KBinToDec8(qi:string):integer;
var i,b,k:integer; q:string;
begin
  q:=qi; NulyZleva(q,8);
  b:=128; k:=0;
  for i:=1 to 8 do begin
    if q[i]='1' then k:=k+b;
    b:=b div 2;
  end;
  KBinToDec8:=k;
end;

Function HiBit4(b:byte):byte; begin HiBit4:=   b div 16 end;
Function LoBit4(b:byte):byte; begin LoBit4:=b-(b div 16)*16 end;
Function HiByte8(b:word):word; begin HiByte8:=   b div 256  end;
Function LoByte8(b:word):word; begin LoByte8:=b-(b div 256)*256 end;
Function HiWord16(b:longword):longword; begin HiWord16:=   b div 65536  end;
Function LoWord16(b:longword):longword; begin LoWord16:=b-(b div 65536)*65536 end;

Procedure SmallIntToBytes(si:smallint; var b0,b1:byte);
begin
  b1:=Hi(si);
  b0:=Lo(si);
end;

Procedure WordToBytes(si:word; var b0,b1:byte);
begin
  b1:=Hi(si); b0:=Lo(si);
//  b1:=si div 256; b0:=si-b1*256;
end;

(* **** XRD ************************************************ *)

Function decko(th,lam1:double):double;    (* 2th => dA *)
begin
  decko:=0;
  if (th>0) AND (th<=180) then decko:=lam1/(2*sin(th*pi/360));
  if th>180               then decko:=lam1/(2*sin(180*pi/360));
end;

Function theta(d,lam1:double):double;     (* dA => 2th *)
begin
  theta:=0;
  if (d>0) AND ((lam1/(2*d))<=1) then theta:=(360/pi)*arcsin(lam1/(2*d));
  if (lam1/(2*d))>1              then theta:=180;
end;
                                                  (* anoda -> lam1,lam2,plam *)
Procedure Lampa(anx:txan; var lmbd1,lmbd2,plmbd,lmbdbeta:double);
var i,j:integer;
begin
  lmbd2:=0; lmbd1:=0; plmbd:=0; lmbdbeta:=0;
  anx:=LowerCase(anx); anx[1]:=UpCase(anx[1]);
  i:=0; for j:=1 to nlamx do if anx=anody[j] then i:=j;
  if i<>0 then begin
    lmbd1:=anlam1[i]; lmbd2:=anlam2[i]; plmbd:=0.5; lmbdbeta:=anlamb[i];
  end;
end;
                                                            (* lam1 -> anoda *)
Procedure Vlna(var anx:txan; lam1,lam2:double; var plam:double);
const rozl=1e-2;
var i,j:integer;
begin
  anx:=''; i:=0;
  for j:=1 to nlamx do if abs(lam1-anlam1[j])<rozl then i:=j;
  if i<>0 then begin
    anx:=anody[i];
    if lam2>0 then plam:=0.5;
  end;
end;

Function fxtzi(i:integer):double;
begin
  with xdat1 do fxtzi:=RoundMinThk(xths+(i-1)*xthk);
end;

Function fitzx(t:double):integer;
begin
  with xdat1 do if xthk>0 then fitzx:=round((t-xths)/xthk+1) else fitzx:=0;
end;

Function RoundMinThk(tf:double):double;
begin
  RoundMinThk:=round(tf/MinThkRound)*MinThkRound;
end;

Procedure PodlahaExt(var d:double; p1,p2:double);
var j:integer; p:double;
begin
  p:=p2-p1; if p<=0 then exit;
  j:=floor((d-p1)/p); d:=d-j*p;
end;

(* DefaultXrd: theta => zero,disp=0 *)
Procedure FDispZeroReset(disp,zero:double; ndm:integer);
var x1d,x1p,x1m,x2,x2m,x3:double; i:integer;
begin
  if disp=0
    then for i:=1 to ndm do xadt[i]:=xadt[i]-zero
    else for i:=1 to ndm do begin
    x1d:=xadt[i]-zero;
    x1p:=x1d+disp*cos(x1d*pi/360);      // x1d +disp
    x1m:=x1p-disp*cos(x1p*pi/360);      // x1p -disp
    x2:=x1d+x1p-x1m;                    // x1d +x1p -x1m
    x2m:=x2-disp*cos(x2*pi/360);        // x2 -disp
    x3:=x1d+x2-x2m;                     // x1d +x2 -x2m
    xadt[i]:=RoundMinThk(x3);
  end;
end;

Procedure KorDispZero;
var i:integer;
begin
  with xdat1 do if xdisp<>0 then begin
    for i:=1 to xndm do xadt[i]:=xadt[i]-xdisp*cos(xadt[i]*pi/360);
    xths:=xadt[1]; xthe:=xadt[xndm]; xthk:=0;
  end;
  with xdat1 do if xzero<>0 then begin
    for i:=1 to xndm do xadt[i]:=xadt[i]-xzero;
    xths:=xadt[1]; xthe:=xadt[xndm];
  end;
end;

(* ***** SIN, COS, TAN, COTAN ***** *)

Function tan(a:double):double; begin tan:=sin(a)/cos(a) end;
Function cotan(a:double):double; begin cotan:=cos(a)/sin(a) end;
                                                     // arctan: -pi/2 - pi/2
Function arcsin(a:double):double;                          // -pi/2 - pi/2
begin
  if a>1 then a:=1; if a<-1 then a:=-1;
  if (a=1) or (a=-1) then arcsin:=a*pi/2
                     else arcsin:=arctan(a/sqrt(1-sqr(a)));
end;

Function arccos(a:double):double;                          // 0 - pi
begin
  arccos:=0;
  if abs(a)>1 then begin
   if a>0 then a:=1 else a:=-1;
  end;
  if a=0 then arccos:=pi/2;
  if a>0 then arccos:=arctan(sqrt(1-sqr(a))/a);
  if a<0 then arccos:=pi-arctan(-sqrt(1-sqr(a))/a);
end;

Function arccotan(a:double):double;                          // -pi/2 - pi/2
begin if a=0 then arccotan:=pi/2 else arccotan:=arctan(1/a) end;

(* ***** CHART ********************************************* *)

Procedure NastavOsuMinMax(ax:TChartAxis; x1,x2:double);
begin
  if x2<=x1 then exit;
  ax.SetMinMax(x1,x2);
{  with ax do begin
    ax.Automatic:=false;
    if x1>Maximum then begin Maximum:=x2; Minimum:=x1 end
                  else begin Minimum:=x1; Maximum:=x2 end;
  end;}
end;

Procedure KChartZvetsiOsu2(ax:TChartAxis);
var f1:double;
begin
  with ax do begin
    f1:=(Maximum-Minimum)/2;
    NastavOsuMinMax(ax,Minimum-f1,Maximum+f1);
  end;
end;

Procedure KChartZmensiOsu2(ax:TChartAxis);
var f1:double;
begin
  with ax do begin
    f1:=(Maximum-Minimum)/4;
    NastavOsuMinMax(ax,Minimum+f1,Maximum-f1);
  end;
end;

Procedure KChartResetOsu(ax:TChartAxis);
begin
  ax.Automatic:=true;
end;

Procedure KChartResetOsy(chr1:TChart);
begin
  with chr1 do begin
    BottomAxis.Automatic:=true;
    LeftAxis.Automatic:=true;
    TopAxis.Automatic:=true;
    RightAxis.Automatic:=true;
  end;
end;

Procedure KChartManualOsa(ax:TChartAxis);
var q1,q2,qm,qx:string; fx,fm:double;
begin
  with ax do begin
    q1:='Set axis minimum and maximum';
//    q2:=Format('%3.6g %3.6g',[Minimum,Maximum]);
    q2:=Format('%g %g',[Minimum,Maximum]);
    if InputQuery(q1,'Minimum Maximum',q2)=false then exit;
    ZrusDveMezery(q2);
    if q2='' then begin ax.Automatic:=true; exit end;
    RozdelStr(q2,qm,' '); RozdelStr(q2,qx,' ');
    if fvald(qx,fx)=false then exit;
    if fvald(qm,fm)=false then exit;
    if fx<=fm then exit;
    NastavOsuMinMax(ax,fm,fx);
  end;
end;

procedure TUnitPomDlg.mpKChartDoubleY1Click(Sender: TObject);
begin
  KChartZvetsiOsu2(KChart.LeftAxis);
end;

procedure TUnitPomDlg.mpKChartDoubleX1Click(Sender: TObject);
begin
  KChartZvetsiOsu2(KChart.BottomAxis);
end;

procedure TUnitPomDlg.mpKChartResetaxes1Click(Sender: TObject);
begin
  KChartResetOsy(KChart);
end;

procedure TUnitPomDlg.mpKChartManualX1Click(Sender: TObject);
begin
  KChartManualOsa(KChart.BottomAxis);
end;

procedure TUnitPomDlg.mpKChartManualX2Click(Sender: TObject);
begin
  KChartManualOsa(KChart.BottomAxis);
end;

procedure TUnitPomDlg.mpKChartManualY1Click(Sender: TObject);
begin
  KChartManualOsa(KChart.LeftAxis);
end;

procedure TUnitPomDlg.ManualY12Click(Sender: TObject);
begin
  KChartManualOsa(KChart.LeftAxis);
end;

procedure TUnitPomDlg.mpKChartManualY2Click(Sender: TObject);
begin
  KChartManualOsa(KChart.RightAxis);
end;

Procedure KChartOsaLog(ax:TChartAxis);
begin
  with ax do begin
    if Logarithmic then Logarithmic:=false
    else begin
      if Maximum<1 then begin Automatic:=false; Maximum:=1 end;
      if Minimum<0 then begin Automatic:=false; Minimum:=0 end;
      Logarithmic:=true;
    end;
  end;
end;

procedure TUnitPomDlg.mpKChartLogarithmicX1Click(Sender: TObject);
begin
  KChartOsaLog(KChart.BottomAxis);
  mpKChartLogarithmicX1.Checked:=KChart.BottomAxis.Logarithmic;
end;

procedure TUnitPomDlg.mpKChartLogarithmicY1Click(Sender: TObject);
begin
  KChartOsaLog(KChart.LeftAxis);
  mpKChartLogarithmicY1.Checked:=KChart.LeftAxis.Logarithmic;
end;

procedure TUnitPomDlg.mpKChartResetX1Click(Sender: TObject);
begin
  KChartResetOsu(KChart.BottomAxis);
end;

procedure TUnitPomDlg.mpKChartResetY2Click(Sender: TObject);
begin
  KChartResetOsu(KChart.RightAxis);
end;

procedure TUnitPomDlg.mpKChartResetY1Click(Sender: TObject);
begin
  KChartResetOsu(KChart.LeftAxis);
end;

Procedure KChartUkazMenu(x,y:integer);
var blr:boolean; i:integer;
begin
  with UnitPomDlg,KChart do begin
    blr:=false;
    for i:=0 to SeriesCount-1 do if Series[i].VertAxis=aRightAxis then blr:=true;
    mpKChartRightY2.Visible:=blr;
//    mpKChartResetY2.Visible:=blr;  mpKChartManualY2.Visible:=blr;
    mpKChartLogarithmicX1.Checked:=BottomAxis.Logarithmic;
    mpKChartLogarithmicY1.Checked:=LeftAxis.Logarithmic;
    KChartMenu.Popup(x,y);
    CancelMouse:=true;
  end;
end;

(* ***** Form Key ***************************************************** ***** *)

procedure TUnitPomDlg.FormKeyPress(Sender: TObject; var Key: Char);
var q1:string;
begin
  q1:=Format('KeyPress: %s',[key]);
  Memo1.Lines.Add(q1);
end;

procedure TUnitPomDlg.FormKeyDown(Sender:TObject; var Key:Word; Shift: TShiftState);
var q1:string;
begin
  q1:=Format('KeyDown: [%s] %d',[ShiftStateToString(Shift),key]);
  Memo1.Lines.Add(q1);
end;

procedure TUnitPomDlg.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var q1:string;
begin
  q1:=Format('KeyUp: [%s] %d',[ShiftStateToString(Shift),key]);
  Memo1.Lines.Add(q1);
end;

begin
  GetSystemVar(KSysVar);
end.

