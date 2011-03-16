program Magnet;

uses
  Forms,
  EComUnit in 'EComUnit.pas' {EComDlg},
  Connect in 'Connect.pas' {ConnectDlg},
  EuroPar in 'EuroPar.pas',
  Measure in 'Measure.pas' {Hall};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TEComDlg, EComDlg);
  Application.CreateForm(TConnectDlg, ConnectDlg);
  Application.CreateForm(THall, Hall);
  Application.Run;
end.
