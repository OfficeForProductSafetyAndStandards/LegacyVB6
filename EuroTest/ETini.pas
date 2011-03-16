unit ETini;
interface
uses
  SysUtils,IniFiles,CommDrv,Registry,Windows,Classes;

procedure CtiIniFile(fname:string);
procedure SaveIniFile(fname:string);
Procedure IniOdvozene;
Procedure NactiIniFileGeneral;
Procedure UlozIniFileGeneral;

const
  sSectionDir='Directory';
    sDirET='KET';
    sDirDat1='Data';
  sSectionKETset='Default';
    sDefaultRampRate='Default_Ramp_Rate';
    sDefaultStabTime='Default_Stab_Time';
  sSectionKETcom='KETcom';
    sIntervalSet='Interval_Set_Temp';
  sSectionSerial='Serial';
           sPort='Port';
  sSectionEurotherm='Eurotherm';
    sDeg='Units';
    sDec='Decimals';
  sSectionForm='Form';
    sLeft='Left';
    sTop='Top';
    sWidth='Width';
    sHeight='Height';

  mfLeft:integer=0; mfWidth:integer=500;
  mfTop:integer=0;  mfHeight:integer=500;

implementation
uses Main,EuroUnit,UnitPom,Konstant;

Procedure IniOdvozene;
begin
  cestaket:=ksoftdir+'\'+ketdir1;
  FNameSampleReady:=EnvDfntData+'\'+FNameSampleReady1;
  FNameEuroCom:=EnvDfntData+'\'+FNameEuroCom1;
  FNameEuroLog:=EnvDfntData+'\'+FNameEuroLog1;

  FNameExeCom:=ksoftdir+'\exe\'+FNameExeCom1+'.exe';
  FNameExeUtf:=ksoftdir+'\exe\'+FNameExeUtf1+'.exe';
  FNameExeSet:=ksoftdir+'\exe\'+FNameExeSet1+'.exe';
  FNameExeRaw:=ksoftdir+'\exe\'+FNameExeRaw1+'.exe';
  FNameDelUtf:=ksoftdir+'\exe\'+FNameDelUtf1;

  FNameHelp:=ksoftdir+'\exe\'+FNameHelp1;
end;

Function CtiDFNTzRegistru:string;
var q1:string; i:integer;
begin
  CtiDFNTzRegistru:='';
  with TRegistry.Create do
    try
      RootKey:=HKEY_CURRENT_USER;
      if OpenKey('\Software\SIEMENS\DIFFRAC32', False) then begin
        q1:=ReadString('DFNT$FIL_1:');
        CtiDFNTzRegistru:=ExcludeTrailingPathDelimiter(q1);
        q1:=ReadString('DFNT$SYSTEM:');
        EnvDfntSyst:=ExcludeTrailingPathDelimiter(q1);
        CloseKey;
      end;
      if OpenKey('Software\Microsoft\Windows\CurrentVersion\Extensions',False)
      then begin
        q1:=ReadString('doc');
        i:=pos('^',q1); if i>1 then q1:=copy(q1,1,i-2);
        WinWordCesta:=q1;
        CloseKey;
      end;
    finally
      Free;
    end;
end;

procedure CtiIniFile(fname:string);
var KetIni:TIniFile; k:integer; f:double; q1:string;
begin
  if not FileExists(fname) then exit;
  KetIni:=TIniFile.Create(fname);

(* Adresare z Registru *)
  EnvDfntData:=''; EnvDfntData:=CtiDFNTzRegistru;

(* Adresare *)
  ksoftdir:=KetIni.ReadString(sSectionDir,sDirET,ksoftdir);
  if EnvDfntData='' then
    EnvDfntData:=KetIni.ReadString(sSectionDir,sDirDat1,EnvDfntData);

(* KETset *)
  f:=KetIni.ReadFloat(sSectionKETset,sDefaultRampRate,SprDef);
    if (f>=SprDefM) and (f<=SprDefX) then SprDef:=f;
  k:=KetIni.ReadInteger(sSectionKETset,sDefaultStabTime,StabDef);
    if (k>=StabDefM) and (k<=StabDefX) then StabDef:=k;

(* KETcom *)
  k:=KetIni.ReadInteger(sSectionKETcom,sIntervalSet,kIntervalSet);
    if (k>=kIntervalSetM) and (k<=kIntervalSetX) then kIntervalSet:=k;

(* Serial *)
  IniPort:=KetIni.ReadInteger(sSectionSerial,sPort,0);

(* Eurotherm *)
  q1:=KetIni.ReadString(sSectionEurotherm,sDeg,'C');
    if q1='K' then iStupne:=0 else iStupne:=1;
  k:=KetIni.ReadInteger(sSectionEurotherm,sDec,fdt);
    if (k=0) or (k=1) then fdt:=k;

(* Form *)
  mfLeft:=KetIni.ReadInteger(sSectionForm,sLeft,mfLeft);
  mfTop:=KetIni.ReadInteger(sSectionForm,sTop,mfTop);
  mfWidth:=KetIni.ReadInteger(sSectionForm,sWidth,mfWidth);
  mfHeight:=KetIni.ReadInteger(sSectionForm,sHeight,mfHeight);

(* FREE IniFile *)
  KetIni.Free;
end;

procedure SaveIniFile(fname:string);
var KetIni: TIniFile;
begin
  KetIni:=TIniFile.Create(fname);

(* Adresare *)
  KetIni.WriteString(sSectionDir,sDirET,ksoftdir);
  KetIni.WriteString(sSectionDir,sDirDat1,EnvDfntData);

(* KETset *)
  KetIni.WriteFloat(sSectionKETset,sDefaultRampRate,SprDef);
  KetIni.WriteInteger(sSectionKETset,sDefaultStabTime,StabDef);

(* KETcom *)
  KetIni.WriteInteger(sSectionKETcom,sIntervalSet,kIntervalSet);

(* Serial *)
  KetIni.WriteInteger(sSectionSerial,sPort,IniPort);

(* Eurotherm *)
  KetIni.WriteString(sSectionEurotherm,sDeg,cStupne[iStupne]);
  KetIni.WriteInteger(sSectionEurotherm,sDec,fdt);

(* FREE IniFile *)
  KetIni.Free;
end;

Procedure NactiIniFileGeneral;
var fname,adr:string;
begin
  adr:=ksysvar.WinDir;
  fname:=adr+'\'+IniFileName;
  CtiIniFile(fname);
  IniOdvozene;
end;

Procedure UlozIniFileGeneral;
var fname,adr:string;
begin
  adr:=ksysvar.WinDir;
  fname:=adr+'\'+IniFileName;
  SaveIniFile(fname);
end;

end.
