program Login;

uses
  Vcl.Forms,
  uFrmLogin in 'uFrmLogin.pas' {frmLogin},
  dataModule in 'dataModule.pas' {dmPadrao: TDataModule},
  uFuncao in 'uFuncao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TdmPadrao, dmPadrao);
  Application.Run;
end.
