program HPIB;

uses
  Forms,
  GPIB in 'GPIB.pas' {Communicate};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TCommunicate, Communicate);
  Application.Run;
end.
