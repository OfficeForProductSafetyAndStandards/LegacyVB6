program gpibdemo;

uses
  Forms,
  Sample in 'SAMPLE.PAS' {Form1};
  
{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
