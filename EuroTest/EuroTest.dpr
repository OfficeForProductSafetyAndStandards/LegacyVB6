program EuroTest;

uses
  Forms,
  EComUnit in 'EComUnit.pas' {EComDlg},
  Connect in 'Connect.pas' {ConnectDlg},
  EuroPar in 'EuroPar.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TEComDlg, EComDlg);
  Application.CreateForm(TConnectDlg, ConnectDlg);
  Application.Run;
end.
