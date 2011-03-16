unit Konstant;
interface
uses Graphics, SysUtils, Series,TeeProcs, TeEngine, Chart;
const
  blKalvadosOnPaint:boolean=false;
  blKalvadosNelzeStart:boolean=false;
(* ***** Adresar ************************************ *)
  ksoftdir:string='c:\Kalvados';
  cestapdf:string ='c:\pdf';
  kdifnamepdf:string='inorg.cat';       (* cestapdf *)
(* ***** Parallel port ***** *)
  LPTadr1=$378; LPTadr2=$278;                   (* Adresy paralelnich portu *)
  nLPTadr=2;
  aLPTadr:array[1..nLPTadr] of integer=(LPTadr1,LPTadr2);
(* ***** Rozmery ************************************ *)
  xndmx=20001; pndmx=2001;                    (* XRD *)
{$IFDEF KCRYST}
  nat0x=20;
{$ELSE}
  nat0x=100;
{$ENDIF}
  nekx=192; natnekx=nat0x*nekx;    (* VZD *)
  natadpx=50;
(* ***** KNumeri ************************************ *)
Const
  slrnx=200;
  slrmx=slrnx+1;
Type
  slrp =array[1..slrnx,1..slrmx] of double;
  slrv =array[1..slrnx] of double;
  slrpp=ARRAY[1..slrnx,1..slrnx] OF double;
(* ***** system ************************************* *)
type
  SetOfChar=set of char;
  TSysVar=record
    WinDir,WinSystemDir,TempDir:string;
  end;
const
(* ***** AlphaNumeric ******************************** *)
  crlf=#13+#10;
  csNumeric = ['0'..'9'];
  csNumericDec = ['0'..'9','.','-','+'];
  csPismeno = ['A'..'Z','a'..'z'];
  csAlphaNumeric = csPismeno + csNumeric;
//  csFileFirstChar=['a'..'z','A'..'Z','0'..'9','\','.'];
  csNotFileFirstChar=['*', '?', '/', '\', ':', '<', '>', '|', '"', '''',
                      ' ', ';', '#', '$', '%', '&', '@'];
  csNumDec: set of char = ['0'..'9'];
(* ***** Temperature ********************************* *)
  TCelsiusK=273.15;
(* ***** Mendelejev ********************************** *)
  nMendelx=103;
  aMendeljm:array[1..nMendelX] of string[2]=
('H ','He','Li','Be','B ','C ','N ','O ','F ','Ne',
 'Na','Mg','Al','Si','P ','S ','Cl','Ar',
 'K ','Ca','Sc','Ti','V ','Cr','Mn','Fe','Co','Ni',
 'Cu','Zn','Ga','Ge','As','Se','Br','Kr',
 'Rb','Sr','Y ','Zr','Nb','Mo','Tc','Ru','Rh','Pd',
 'Ag','Cd','In','Sn','Sb','Te','I ','Xe',
 'Cs','Ba','La',
 'Ce','Pr','Nd','Pm','Sm','Eu','Gd','Tb','Dy','Ho','Er','Tm','Yb','Lu',
 'Hf','Ta','W ','Re','Os','Ir','Pt',
 'Au','Hg','Tl','Pb','Bi','Po','At','Rn',
 'Fr','Ra','Ac',
 'Th','Pa','U ','Np','Pu','Am','Cm','Bk','Cf','Es','Fm','Md','No','Lw');
  aMendelch1m='A'; aMendelch1x='Z';
  aMendelch2m=' '; aMendelch2x='z';

(* ***** STYLE ************************************************************ *)
(* Brush Style:  bsSolid,bsClear,
   bsHorizontal,bsVertical,bsFDiagonal,bsBDiagonal,bsCross,bsDiagCross *)
(* LinePen: Color, Mode, Style, Visible, Width *)
(* Black=$000000  Red=$0000FF     Lime=$00FF00 Blue=$FF0000
   Yellow=$00FFFF Fuchsia=$FF00FF Aqua=$FFFF00 White=$FFFFFF  *)
(*
  clBlack = TColor($000000);   clMaroon = TColor($000080);
  clGreen = TColor($008000);   clOlive = TColor($008080);
  clNavy = TColor($800000);    clPurple = TColor($800080);
  clTeal = TColor($808000);    clGray = TColor($808080);
  clSilver = TColor($C0C0C0);  clRed = TColor($0000FF);
  clLime = TColor($00FF00);    clYellow = TColor($00FFFF);
  clBlue = TColor($FF0000);    clFuchsia = TColor($FF00FF);
  clAqua = TColor($FFFF00);    clLtGray = TColor($C0C0C0);
  clDkGray = TColor($808080);  clWhite = TColor($FFFFFF);
  StandardColorsCount = 16;
  clMoneyGreen = TColor($C0DCC0);  clSkyBlue = TColor($F0CAA6);
  clCream = TColor($F0FBFF);       clMedGray = TColor($A4A0A0);
  ExtendedColorsCount = 4;
*)
(* ***** Colors ************************************** *)
  clOrangeL=$80FF; clViolet=$400080; clBrown=$4080;
  KMaxDefaultColors1=17;
  KColorPalette1: Array[1..KMaxDefaultColors1] of TColor =
  (clBlack,   clRed,     clGreen,   clBlue,
   clFuchsia, clTeal,    clNavy,
   clMaroon,  clLime,    clOlive,   clPurple,
   clOrangeL, clViolet,  clBrown,   clGray,
   clSilver,  clWhite);
// clYellow, clCream, clMedGray,
// clAqua, clLtGray

(* Pointer: VertSize, HorizSize, Style, Pen *)
  nMarkStylex1=9; nMarkStylex=nMarkStylex1;
  aMarkStyle:array[1..nMarkStylex1] of TSeriesPointerStyle=
    (psCircle, psTriangle, psDownTriangle, psDiamond, psRectangle,
     psCross, psDiagCross, psStar, psSmallDot);
  sMarkStyle:array[0..nMarkStylex1] of string=
    ('None','Circle','Triangle','Down Triangle','Diamond','Rectangle',
     'Cross','Diag.Cross','Star','Small Dot');

(* ***** Line **************************************** *)
  nLineStylex1=5; nLineStylex=nLineStylex1;
  aLineStyle:array[0..nLineStylex1] of TPenStyle =
    (psClear,psSolid,psDash,psDot,psDashDot,psDashDotDot);
  sLineStyle:array[0..nLineStylex1] of string =
    ('No line','Solid','Dash','Dot','DashDot','DashDotDot');

var
  aMendelbl:array[aMendelch1m..aMendelch1x,aMendelch2m..aMendelch2x] of byte;
const
  aMendelblReady:boolean=false;
(* ***** Theta ************************************** *)
  MinThk=2e-7; MinThkRound=MinThk/2;
(* ***** Anody ***** hodnoty z ICDD ***************** *)
type
  txan=string[2];
const
  nlamx=6;
  anody:array[1..nlamx] of txan=
    ('Cr'   ,'Fe'   ,'Co'   ,'Cu'   ,'Mo'   ,'Ag');
  anlam1:array[1..nlamx] of double=
    (2.28970,1.93604,1.78897,1.54056,0.70930,0.55936);
  anlam2:array[1..nlamx] of double=
    (2.29361,1.93998,1.79285,1.54439,0.71359,0.56378);   
  anlamb:array[1..nlamx] of double=
    (2.08487,1.75661,1.62079,1.39222,0.63229,0.49707);
  LamMin=0.01; LamMax=10.0;
  iCuAnoda=4;
  lamWLalpha=1.47615; 

(* ***** Type Xrd, Pnt ****************************** *)
const
 lspadp1=20;
type
  txad=array[1..xndmx] of double;
  tpadp1=string[lspadp1];
  tpadp=array[1..pndmx] of tpadp1;
  tpad=array[1..pndmx] of double;

(* ***** DatXRD ************************************* *)
const
  nDrives=11;
  sDrives:array[0..nDrives] of string[20]=
('COUPLED','','2THETA','THETA','','','','','','','','AUX3');
//0:locked_coupled 2:detscan 3:rocking              11:tubescan
  nxuprava=1;
  xuprava_Kalpha2=1;
type
  txdat=record
    xndm:integer;                       (* pocet dat *)
    xths,xthe,xthk:double;              (* 2theta: pocatecni, koncove, krok *)
    xtime:double;                       (* cas/krok *)
    xan:txan; xlam1,xlam2,xplam:double; (* Anoda, lambda1,2, lam2:lam1 *)
    xmakovicka,xvzorec:string;          (* hlavicka, nazev *)
    xComment:string;

    xpexp:string;                       (* experimentalni podminky *)
    xkv,xma:integer;                    (* kV, mA *)
    xslitdiv,xslitasc,xslitdet:single;  (* Slit: diver.,anti-scat.,detector *)
    xsoller1,xsoller2:integer;          (* Soller slit: 0/1 *)
    xmonosec,xbetafilter:integer;       (* Monochromator sec., beta-filter *)
    xscantyp:integer;                   (* Step, Cont *)
    xmeasdate,xmeastime:string;         (* Datum,cas mereni *)
    xdrive:integer;                     (* code for drive being stepped *)
    xtheta,x2theta:double;
    xdetchan:integer;                   (* Detector channel *)
                                        (* Teplota: Setpoint[K] *)
    xTepSetp,xTepRate,xTepStab:single;  (* Ramp rate[K/m], Delay Stable[s] *)

    ximin,ximax:double;                 (* Intensita min,max *)
    xcesta:string;                      (* zdroj: cesta na disku/pattern *)
    xanMer:txan;                           (* Puvodni Anoda *)
    xlam1Mer,xlam2Mer,xplamMer:double;     (* Puvodni lambda *)
    xthk_bak:double;
    xBgNoise:double;

    xgroup:integer;                       (* Obs<0 Calc>0 *)
    xzero,xdisp:double;
    xuprava:array[1..nxuprava] of boolean;
    xiext:integer;                        (* typ souboru *)
  end;

(* ***** DatPnt ************************************* *)
type
  tpdat=record
    pndm:integer;
    pmakovicka,pvzorec:string;
    pdescr:integer;
    pan:txan; plam1,plam2,pplam:double;

    pimax:double;
    pcesta,pmineral,pcesta1:string;
    panMer:txan;                           (* Puvodni Anoda *)
    plam1Mer,plam2Mer,pplamMer:double;     (* Puvodni lambda *)
    pyor:double;
    pgroup:integer;
    phkl:integer;
  end;

(* ***** Var Xrd, Pnt ********************************* *)
var
  xdat1:txdat;            (* X: hlavicka *)
  xadt,xadi:txad;         (* X: 2t,I *)
  pdat1:tpdat;            (* P: hlavicka *)
  padt,padi:tpad;         (* P: 2t,I *)
  padp     :tpadp;        (* P: Label *)

(* ***** Errors ************************************** *)
var
  ErrorStr:string; blErrorStr:boolean;

(* ***** Xrd, Pnt ************************************ *)
Procedure VynulujPdat(var pdat1:tpdat);
Procedure VynulujXdat(var xdat1:txdat);
Procedure VynulujPdat1;
Procedure VynulujXdat1;

(* ***** Errors ************************************** *)
Procedure AddErrorStr(q1:string);
Procedure ShowErrorStr;
Procedure ClearErrorStr;
Procedure VypisErrorStr;

(* ***** Mendelejev ********************************** *)
Function fkMendel(qjm:string):integer;
Function fkMendelExt(qjm:string):integer;

implementation
uses Dialogs,UnitPom;

(* ***** Mendelejev ********************************** *)

Function fkMendel(qjm:string):integer;
var k,j:integer; q1:string;
begin
  fkMendel:=-1;
  if length(qjm)<1 then exit;
  if length(qjm)<2 then qjm:=qjm+' ';

  q1:=UpperCase(qjm[1]);
  if qjm[2] in (csPismeno+[' ']) then q1:=q1+LowerCase(qjm[2]);

  if aMendelblReady then fkMendel:=aMendelbl[q1[1],q1[2]]
  else begin
    k:=0; for j:=1 to nMendelX do if q1=aMendeljm[j] then k:=j;
    fkMendel:=k;
  end;
end;

Function fkMendelExt(qjm:string):integer;
var k:integer; 
begin
  k:=fkMendel(qjm);
  if k<=0 then k:=fkMendel(qjm[1]);
  fkMendelExt:=k;
end;

Procedure PripravMendelbl;
var ch1,ch2:char; j:integer;
begin
  for ch1:=aMendelch1m to aMendelch1x do
    for ch2:=aMendelch2m to aMendelch2x do aMendelbl[ch1,ch2]:=0;
  for j:=1 to nMendelX do aMendelbl[aMendeljm[j,1],aMendeljm[j,2]]:=j;
  aMendelblReady:=true;
end;

(* ***** Xdat, Pdat ******************************** *)

Procedure VynulujXdat(var xdat1:txdat);
var i:integer;
begin
  with xdat1 do begin
    xndm:=0; xths:=0; xthe:=0; xthk:=0; xtime:=0;
    xan:=''; xlam1:=0; xlam2:=0; xplam:=0;
    xpexp:=''; xmakovicka:=''; xvzorec:=''; xComment:='';
    xkv:=0; xma:=0;
    xslitdiv:=0; xslitasc:=0; xslitdet:=0;
    xsoller1:=0; xsoller2:=0;
    xmonosec:=0; xbetafilter:=0;
    xscantyp:=0;
    xdrive:=0; xtheta:=0; x2theta:=0;
    xdetchan:=0;
    xmeasdate:=''; xmeastime:='';
    xTepSetp:=0; xTepRate:=0; xTepStab:=0;
    xcesta:='';
    ximin:=0; ximax:=0;
    xanMer:=''; xlam1Mer:=0; xlam2Mer:=0; xplamMer:=0; xthk_bak:=0;
    xBgNoise:=0;
    xgroup:=0;
    xzero:=0; xdisp:=0;
    for i:=1 to nxuprava do xuprava[i]:=false;
    xiext:=0;
  end;
end;

Procedure VynulujPdat(var pdat1:tpdat);
begin
  with pdat1 do begin
    pndm:=0;
    pmakovicka:=''; pvzorec:='';
    pdescr:=0;
    pan:=''; plam1:=0; plam2:=0; pplam:=0;
    pimax:=0; pgroup:=0; pyor:=0; phkl:=0;
    pcesta:=''; pcesta1:=''; pmineral:='';
    panMer:=''; plam1Mer:=0; plam2Mer:=0; pplamMer:=0;
  end;
end;

Procedure VynulujXdat1;
begin
  VynulujXdat(xdat1);
end;

Procedure VynulujPdat1;
begin
  VynulujPdat(pdat1);
end;

(* ***** Errors ************************************** *)

Procedure ClearErrorStr;
begin
  ErrorStr:=''; blErrorStr:=false;
end;

Procedure AddErrorStr(q1:string);
begin
  if ErrorStr<>'' then ErrorStr:=ErrorStr+crlf;
  ErrorStr:=ErrorStr+q1;
  blErrorStr:=true;
end;

Procedure ShowErrorStr;
begin
  if not blErrorStr then exit;
  MessageDlg(ErrorStr,mtWarning,[mbOK],0);
  ClearErrorStr;
end;

Procedure VypisErrorStr;
begin
  if not blErrorStr then exit;
  writeln(ErrorStr);
  ClearErrorStr;
end;

begin
  ClearErrorStr;
  PripravMendelbl;
  csNumDec:=csNumDec+[DecimalSeparator,ThousandSeparator];
//  ForceCurrentDirectory:=true;
end.
