program ecdp;

uses
  Forms,
  ecdpcode in 'ecdpcode.pas' {MainWindow};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainWindow, MainWindow);
  Application.Run;
end.
