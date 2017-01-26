unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfrmLogin = class(TForm)
    edtLogin: TEdit;
    edtSenha: TEdit;
    btnEntrar: TButton;
    Image1: TImage;
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uFrmPrincipal;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
var
  Login, Senha : TCaption;
begin

  Login := edtLogin.Text;
  Senha := edtSenha.Text;

  if Login = '' then
  begin
    Application.MessageBox('Informe seu login.', 'Atenção', MB_OK+MB_ICONWARNING);
    edtLogin.SetFocus;
  end;

  if Senha = '' then
  begin
    Application.MessageBox('Informe sua senha.', 'Atenção', MB_OK+MB_ICONWARNING);
    edtSenha.SetFocus;
  end;

  if (Login = 'admin') and (Senha = 'admin') then
  begin
    frmPrincipal := TfrmPrincipal.Create(nil);
    frmLogin.Visible := False;
    frmPrincipal.ShowModal;
  end
  else
  begin
    Application.MessageBox('Usuário e/ou senha inválido.', 'Atenção', MB_OK+MB_ICONWARNING);
    Abort;
  end;

end;

end.
