program ComTest;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'TCommPortDriver Test';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
