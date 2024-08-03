program Project1;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uModal in 'uModal.pas' {frmModal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
