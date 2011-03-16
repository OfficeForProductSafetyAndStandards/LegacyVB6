unit GPIB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ieeedel;
  
type
  TCommunicate = class(TForm)
    GPIB_Init: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    AGSent: TEdit;
    Label5: TLabel;
    AGRec: TEdit;
    Label3: TLabel;
    KTSent: TEdit;
    KTRec: TEdit;
    AGSentBut: TButton;
    KTSentBut: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure AGSentButClick(Sender: TObject);
    procedure GPIB_InitClick(Sender: TObject);
    procedure KTSentButClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Communicate: TCommunicate;

implementation

{$R *.DFM}

procedure TCommunicate.GPIB_InitClick(Sender: TObject);
begin
 initialize(21,0);
end;

procedure TCommunicate.AGSentButClick(Sender: TObject);
var retez:string;
 status:integer;
 l:word;
begin
 retez:=AGSent.Text;
 send(9,retez,status);
 if status=0 then begin
  if CheckBox1.Checked then begin
   enter(retez,80,l,9,status);
   if status=0 then AGRec.Text:=retez
   else ShowMessage('Transfer Failed');
  end;
 end else ShowMessage('Transfer Failed');
end;

procedure TCommunicate.KTSentButClick(Sender: TObject);
var  retez:string;
 status:integer;
 l:word;
begin
 retez:=KTSent.Text;
 send(12,retez,status);
 if status=0 then begin
  if CheckBox2.Checked then begin
   enter(retez,80,l,12,status);
   if status=0 then KTRec.Text:=retez
   else ShowMessage('Transfer Failed');
  end;
 end else ShowMessage('Transfer Failed');
end;

end.
