unit Inp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Menus, Meas;

type
  TProgForm = class(TForm)
    GroupBox4: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label5: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    CommLine: TEdit;
    aEdit: TEdit;
    bEdit: TEdit;
    cEdit: TEdit;
    LEdit: TEdit;
    roEdit: TEdit;
    mEdit: TEdit;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    IEdit: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SpeedButton3: TSpeedButton;
    Label12: TLabel;
    SpeedButton4: TSpeedButton;
    SaveDialog1: TSaveDialog;
    SaveAs1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure UpButClick(Sender: TObject);
    procedure DownButClick(Sender: TObject);
    procedure EditChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure DelButClick(Sender: TObject);
    procedure InsButClick(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProgForm: TProgForm;

  Lnp,ap,bp,cp,rop,Ip,mp:real;
  n_segp,i_segp:integer;
  df:text;
  fnp,fnq,comp:string;
  f_s,l_s,p_s,pq_s:Point_Seg;
  prog_changed,seg_changed,sam_changed,
  ins_mode,chckbx,new_file:boolean;

implementation

{$R *.DFM}

procedure ReadProg(fnq:string);
 var pomstr:string;
     i,j:integer;

 begin
  assignfile(df,fnq);
  reset(df);
  new(l_s);
  f_s:=l_s;
  readln(df,comp);
  readln(df,fnp);
  read(df,Lnp,ap,bp,cp,rop,mp); if not eoln(df)then readln(df,pomstr);
  read(df,Ip); if not eoln(df)then readln(df,pomstr);
  read(df,n_segp); if not eoln(df)then readln(df,pomstr);
  for i:=1 to n_segp do begin
   read(df,l_s^.T_Init,l_s^.T_Term,l_s^.T_Step);
   if not eoln(df)then readln(df,pomstr);
   read(df,l_s^.MField_I,l_s^.MField_F,l_s^.MField_S,j);
   if j=0 then l_s^.hyst:=false else l_s^.hyst:=true;
   if not eoln(df) then readln(df,pomstr);
   p_s:=l_s; new(l_s);
   p_s^.Next_Seg:=l_s;
  end;
  closefile(df);
 end;
{--------------------------------------------------------------}
procedure WriteProg(fnq:string);
 var retez,pomstr:string;
     i:integer;
 begin
  assignfile(df,fnq);
  rewrite(df);
  writeln(df,comp); writeln(df,fnp);
  writeln(df,Lnp:4:2,' ',ap:4:2,' ',bp:4:2,' ',cp:4:2,' ',rop:4:2,' ',mp:6:4);
  writeln(df,Ip:3:1);
  writeln(df,n_segp:2);
  pq_s:=f_s;
  for i:=1 to n_segp do begin
   str(pq_s^.T_Init:5:1,retez);
   str(pq_s^.T_Term:5:1,pomstr); retez:=retez+' '+pomstr;
   str(pq_s^.T_Step:5:1,pomstr); retez:=retez+' '+pomstr;
   writeln(df,retez);
   str(pq_s^.MField_I:4:2,retez);
   str(pq_s^.MField_F:4:2,pomstr); retez:=retez+' '+pomstr;
   str(pq_s^.MField_S:4:2,pomstr); retez:=retez+' '+pomstr;
   if pq_s^.hyst then retez:=retez+' 1'
                 else retez:=retez+' 0';
   writeln(df,retez);
   pq_s:=pq_s^.Next_Seg;
  end;
  closefile(df);
 end;
{--------------------------------------------------------------}
procedure DeleteProg;

 begin
  p_s:=f_s;
  repeat
   f_s:=p_s^.Next_Seg;
   dispose(p_s);
   p_s:=f_s;
  until p_s=l_s;
  dispose(p_s)
 end;
{--------------------------------------------------------------}
procedure Display_Seg;

 begin
  ProgForm.Edit1.Text:=IntToStr(i_segp);
  if i_segp<=n_segp then begin
   str(p_s^.T_Init:5:1,retez); ProgForm.Edit2.Text:=retez;
   str(p_s^.T_Term:5:1,retez); ProgForm.Edit3.Text:=retez;
   str(p_s^.T_Step:5:1,retez); ProgForm.Edit4.Text:=retez;
   str(p_s^.MField_I:4:2,retez); ProgForm.Edit5.Text:=retez;
   str(p_s^.MField_F:4:2,retez); ProgForm.Edit6.Text:=retez;
   str(p_s^.MField_S:4:2,retez); ProgForm.Edit7.Text:=retez;
   ProgForm.CheckBox1.Checked:=p_s^.hyst;
  end else begin
   ProgForm.Edit2.Text:=''; ProgForm.Edit3.Text:='';
   ProgForm.Edit4.Text:=''; ProgForm.Edit5.Text:='';
   ProgForm.Edit6.Text:=''; ProgForm.Edit7.Text:='';
   ProgForm.CheckBox1.Checked:=false;
  end;
  ProgForm.Edit2.Modified:=false;
  ProgForm.Edit3.Modified:=false;
  ProgForm.Edit4.Modified:=false;
  ProgForm.Edit5.Modified:=false;
  ProgForm.Edit6.Modified:=false;
  ProgForm.Edit7.Modified:=false;
  chckbx:=false; seg_changed:=false;
 end;
{--------------------------------------------------------------}
function Write_Seg:boolean;
 var test:boolean;
     ti,tk,dt,bi,bk,db:real;
     j,i,kod:integer;
     retez:string;
 begin
  test:=true;
  val(ProgForm.Edit2.Text,ti,kod); test:=test and (kod=0);
  val(ProgForm.Edit3.Text,tk,kod); test:=test and (kod=0);
  val(ProgForm.Edit4.Text,dt,kod); test:=test and (kod=0);
  val(ProgForm.Edit5.Text,bi,kod); test:=test and (kod=0);
  val(ProgForm.Edit6.Text,bk,kod); test:=test and (kod=0);
  val(ProgForm.Edit7.Text,db,kod); test:=test and (kod=0);
  if test then begin
   if i_segp>n_segp then begin
    n_segp:=i_segp;
    new(l_s); p_s^.Next_Seg:=l_s;
   end;
   if ins_mode then begin
    ins_mode:=false;
    pq_s:=l_s; new(l_s); pq_s^.Next_Seg:=l_s;
    for i:=n_segp downto i_segp do begin
     p_s:=f_s;
     for j:=1 to i-1 do p_s:=p_s^.Next_Seg;
     pq_s:=p_s^.Next_Seg;
     pq_s^.T_Init:=p_s^.T_Init;
     pq_s^.T_Term:=p_s^.T_Term;
     pq_s^.T_Step:=p_s^.T_Step;
     pq_s^.MField_I:=p_s^.MField_I;
     pq_s^.MField_F:=p_s^.MField_F;
     pq_s^.MField_S:=p_s^.MField_S;
     pq_s^.hyst:=p_s^.hyst;
    end;
    inc(n_segp);
    p_s:=f_s;
    for i:=1 to i_segp-1 do p_s:=p_s^.Next_Seg;
   end;
   prog_changed:=true;
   p_s^.T_Init:=ti;
   p_s^.T_Term:=tk;
   p_s^.T_Step:=dt;
   p_s^.MField_I:=bi;
   p_s^.MField_F:=bk;
   p_s^.MField_S:=db;
   p_s^.hyst:=ProgForm.CheckBox1.Checked;
  end else if i_segp<=n_segp then begin
   retez:='One or more edit lines'+#13+' contain wrong values';
   ShowMessage(retez);
  end;
  if i_segp>n_segp then test:=true;
  Write_Seg:=test;
 end;
{--------------------------------------------------------------}
procedure Display_SP;
 var retez:string;
 begin
  ProgForm.CommLine.Text:=Comp;
  str(ap:3:1,retez); ProgForm.aEdit.Text:=retez;
  str(bp:3:1,retez); ProgForm.bEdit.Text:=retez;
  str(cp:3:1,retez); ProgForm.cEdit.Text:=retez;
  str(Lnp:3:1,retez); ProgForm.LEdit.Text:=retez;
  str(rop:4:2,retez); ProgForm.roEdit.Text:=retez;
  str(mp:6:4,retez); ProgForm.mEdit.Text:=retez;
  str(Ip:5:3,retez); ProgForm.IEdit.Text:=retez;
  ProgForm.CommLine.Modified:=false;
  ProgForm.aEdit.Modified:=false; ProgForm.bEdit.Modified:=false;
  ProgForm.cEdit.Modified:=false; ProgForm.LEdit.Modified:=false;
  ProgForm.mEdit.Modified:=false; ProgForm.roEdit.Modified:=false;
  ProgForm.IEdit.Modified:=false;
 end;
{--------------------------------------------------------------}
procedure TProgForm.FormCreate(Sender: TObject);
 begin
  Readprog('c:\TPCM\Program.dat');
  prog_changed:=false; seg_changed:=false;
  sam_changed:=false; chckbx:=false; new_file:=false;
  ins_mode:=false;
  Display_SP;
  i_segp:=1; p_s:=f_s;
  Display_Seg;
 end;
{--------------------------------------------------------------}
procedure TProgForm.Exit1Click(Sender: TObject);
begin
 ProgForm.Close;
end;
{--------------------------------------------------------------}
procedure TProgForm.UpButClick(Sender: TObject);
var test:boolean;
begin
 test:=true;
 seg_changed:=seg_changed or chckbx;
 if seg_changed then test:=Write_Seg;
 if test then begin
  if (i_segp=1) then
   SpeedButton1.Enabled:=true;  {and (i_segp<>n_segp)}
  if i_segp<=n_segp then begin
   inc(i_segp);
   p_s:=p_s^.Next_Seg;
  end;
 end;
 Display_Seg;
end;
{--------------------------------------------------------------}
procedure TProgForm.DownButClick(Sender: TObject);
var i:integer;
    test:boolean;
begin
 test:=true;
 seg_changed:=seg_changed or chckbx;
 if seg_changed then test:=Write_Seg;
 if test then begin
  if i_segp>1 then dec(i_segp);
  if i_segp=1 then SpeedButton1.Enabled:=false;
  i:=0;
  p_s:=f_s;
  repeat
   inc(i);
   if i<i_segp then p_s:=p_s^.Next_Seg;
  until i=i_segp;
 end;
 Display_Seg;
end;
{--------------------------------------------------------------}
procedure TProgForm.EditChange(Sender: TObject);
begin
 if Edit2.Modified then seg_changed:=true;
 if Edit3.Modified then seg_changed:=true;
 if Edit4.Modified then seg_changed:=true;
 if Edit5.Modified then seg_changed:=true;
 if Edit6.Modified then seg_changed:=true;
 if Edit7.Modified then seg_changed:=true;
 if CommLine.Modified then sam_changed:=true;
 if aEdit.Modified then sam_changed:=true;
 if bEdit.Modified then sam_changed:=true;
 if cEdit.Modified then sam_changed:=true;
 if LEdit.Modified then sam_changed:=true;
 if mEdit.Modified then sam_changed:=true;
 if roEdit.Modified then sam_changed:=true;
 if IEdit.Modified then sam_changed:=true;
 if sam_changed then prog_changed:=true;
end;
{--------------------------------------------------------------}
procedure TProgForm.CheckBox1Click(Sender: TObject);
begin
 chckbx:=not chckbx;
end;
{--------------------------------------------------------------}
procedure TProgForm.Save1Click(Sender: TObject);
var pomr:real;
    test:boolean;
    kod:integer;
    retez:string;
begin
 if prog_changed and not new_file then begin
  test:=true;
  if sam_changed then begin
   val(ProgForm.aEdit.Text,pomr,kod); test:=test and (kod=0);
   if test then ap:=pomr;
   val(ProgForm.bEdit.Text,pomr,kod); test:=test and (kod=0);
   if test then bp:=pomr;
   val(ProgForm.cEdit.Text,pomr,kod); test:=test and (kod=0);
   if test then cp:=pomr;
   val(ProgForm.LEdit.Text,pomr,kod); test:=test and (kod=0);
   if test then Lnp:=pomr;
   val(ProgForm.roEdit.Text,pomr,kod); test:=test and (kod=0);
   if test then rop:=pomr;
   val(ProgForm.mEdit.Text,pomr,kod); test:=test and (kod=0);
   if test then mp:=pomr;
   val(ProgForm.IEdit.Text,pomr,kod); test:=test and (kod=0);
   if test then Ip:=pomr;
   if test then comp:=ProgForm.CommLine.Text;
  end;
  if seg_changed then test:=test and Write_Seg;
  if test then begin
   WriteProg('c:\TPCM\Program.dat');
   retez:=fnp+'.prg';
   WriteProg(retez);
   prog_changed:=false; seg_changed:=false;
   sam_changed:=false; chckbx:=false;
  end else begin
   retez:='One or more edit lines'+#13+' contain wrong values';
   retez:=retez+#13+'Program not saved';
   ShowMessage(retez);
  end;
 end;
 if new_file then SaveAs1Click(Sender);
end;
{--------------------------------------------------------------}
procedure TProgForm.Open1Click(Sender: TObject);
var test:boolean;
    retez:string;
begin
 test:=true;
 if prog_changed then begin
  retez:='The current program was altered.'+#13;
  retez:=retez+'Do you want to discard changes?';
  if MessageDlg(retez,mtConfirmation,[mbYes, mbNo],0)=mrNo then
   test:=false;
 end;
 if test then if OpenDialog1.Execute then begin
  fnp:=OpenDialog1.FileName;
  DeleteProg;
  fnq:=fnp; Delete(fnq,Length(fnq)-3,4);
  ReadProg(fnp);
  fnp:=fnq;
  WriteProg('c:\TPCM\Program.dat');
  prog_changed:=false; seg_changed:=false;
  sam_changed:=false; chckbx:=false;
  Display_SP;
  i_segp:=1; p_s:=f_s;
  SpeedButton1.Enabled:=false;
  Display_Seg;
 end;
end;
{--------------------------------------------------------------}
procedure TProgForm.DelButClick(Sender: TObject);
var retez:string;
    i:integer;
begin
 retez:='   Do you really want to'+#13;
 retez:=retez+'remove the current segment?';
 if n_segp>1 then
 if MessageDlg(retez,mtConfirmation,[mbYes, mbNo],0)=mrYes then
  begin
   repeat
    pq_s:=p_s^.Next_Seg;
    p_s^.T_Init:=pq_s^.T_Init;
    p_s^.T_Term:=pq_s^.T_Term;
    p_s^.T_Step:=pq_s^.T_Step;
    p_s^.MField_I:=pq_s^.MField_I;
    p_s^.MField_F:=pq_s^.MField_F;
    p_s^.MField_S:=pq_s^.MField_S;
    p_s^.hyst:=pq_s^.hyst;
    if pq_s<>l_s then p_s:=pq_s;
   until pq_s=l_s;
   l_s:=p_s;
   dispose(pq_s); dec(n_segp);
   p_s:=f_s;
   for i:=1 to i_segp-1 do p_s:=p_s^.Next_Seg;
   prog_changed:=true;
   Display_Seg;
  end;
end;
{--------------------------------------------------------------}
procedure TProgForm.InsButClick(Sender: TObject);
begin
 if i_segp<=n_segp then begin
  ins_mode:=true;
  ProgForm.Edit2.Text:=''; ProgForm.Edit3.Text:='';
  ProgForm.Edit4.Text:=''; ProgForm.Edit5.Text:='';
  ProgForm.Edit6.Text:=''; ProgForm.Edit7.Text:='';
  ProgForm.CheckBox1.Checked:=false;
 end;
end;
{--------------------------------------------------------------}
procedure TProgForm.SaveAs1Click(Sender: TObject);
var test:boolean;
begin
 repeat
 if SaveDialog1.Execute then begin
  test:=true;
  retez:=' File already exists'+#13;
  retez:=retez+'Should it be replaced?';
  if FileExists(SaveDialog1.FileName) then
   if MessageDlg(retez,mtConfirmation,[mbYes, mbNo],0)=mrNo then
   test:=false;
  if test then begin
   prog_changed:=true;
   fnp:=SaveDialog1.FileName;
   Delete(fnp,length(fnp)-3,4);
   if new_file then new_file:=false;
   Save1Click(Sender);
  end;
 end else test:=true;
 until test;
end;
{--------------------------------------------------------------}
procedure TProgForm.New1Click(Sender: TObject);
var retez:string;
    test:boolean;
begin
  test:=true;
  retez:='Do you want to remove'+#13;
  retez:=retez+' the current program';
  if FileExists(SaveDialog1.FileName) then
   if MessageDlg(retez,mtConfirmation,[mbYes, mbNo],0)=mrNo then
   test:=false;
  if test then begin
   DeleteProg;
   i_segp:=1; n_segp:=1;
   new(f_s); p_s:=f_s;
   new(l_s); p_s^.Next_Seg:=l_s;
   p_s^.T_Init:=0;
   p_s^.T_Term:=0;
   p_s^.T_Step:=0;
   p_s^.MField_I:=0;
   p_s^.MField_F:=0;
   p_s^.MField_S:=0;
   p_s^.hyst:=false;
   Edit1.Text:='1'; SpeedButton1.Enabled:=false;
   CommLine.Text:='';IEdit.Text:='';
   aEdit.Text:=''; bEdit.Text:=''; cEdit.Text:='';
   LEdit.Text:=''; mEdit.Text:=''; roEdit.Text:='';
   Edit2.Text:=''; Edit3.Text:=''; Edit4.Text:='';
   Edit5.Text:=''; Edit6.Text:=''; Edit7.Text:='';
   CheckBox1.Checked:=false;
   prog_changed:=false; seg_changed:=true;
   sam_changed:=false; chckbx:=false;
   new_file:=true;
  end;
end;
{--------------------------------------------------------------}

end.
