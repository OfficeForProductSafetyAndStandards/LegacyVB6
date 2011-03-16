program PPMS;

uses
  Forms,
  Root in 'Root.pas' {RootForm},
  Meas in 'Meas.pas' {MeasForm},
  Num2Str in 'Num2str.pas',
  ieeedel in 'ieeedel.pas',
  K182U in 'K182u.pas',
  K236U in 'K236u.pas',
  P6000 in 'P6000.pas',
  HP3457 in 'Hp3457.pas',
  Inp in 'Inp.pas' {ProgForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TRootForm, RootForm);
  Application.CreateForm(TMeasForm, MeasForm);
  Application.CreateForm(TProgForm, ProgForm);
  Application.Run;
end.
