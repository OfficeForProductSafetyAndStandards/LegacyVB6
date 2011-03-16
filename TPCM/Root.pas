unit Root;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, Meas, Inp, StdCtrls, ExtCtrls;

type
  TRootForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RootForm: TRootForm;

implementation

{$R *.DFM}

procedure TRootForm.Button1Click(Sender: TObject);
begin
 MeasForm.Show;
end;

procedure TRootForm.Button2Click(Sender: TObject);
begin
 ProgForm.Show;
end;

end.
