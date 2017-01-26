unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, iniFiles, DateUtils,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Zlib;

  procedure configurarDB(Arquivo : TIniFile);
  procedure executarAplicacao(Arquivo : TIniFile);
  procedure AtualizarExecutavel;

type
  TfrmLogin = class(TForm)
    edtSenha: TEdit;
    btnEntrar: TBitBtn;
    edtLogin: TEdit;
    Image1: TImage;
    procedure btnEntrarClick(Sender: TObject);

  private
  public
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses dataModule, uFuncao, uFrmAtualizacao, uFrmAtualizar;


procedure TfrmLogin.btnEntrarClick(Sender: TObject);
var
  Usuario, Senha : TCaption;
  Arquivo: TIniFile;
begin

  Usuario := edtLogin.Text;
  Senha:= edtSenha.Text;

  if Usuario = '' then
  begin
    Application.MessageBox('Informe seu usuário.','Atenção',0+48);
    edtLogin.SetFocus;
    Abort;
  end;

  if Senha = '' then
  begin
    Application.MessageBox('Informe sua senha.', 'Atenção', 0+48);
    edtSenha.SetFocus;
    Abort;
  end;

  Arquivo := TIniFile.Create(GetCurrentDir+'\Config.ini');

  // Usar quando colocar opção de configuração na tela de login: ip, user e senha de acesso ao BD.
  ConfigurarDB(Arquivo);

  dmPadrao.ClientDataSet.Close;
  dmPadrao.ClientDataSet.Params[0].AsString := Usuario;
  dmPadrao.ClientDataSet.Params[1].AsString := MD5(Senha);
  dmPadrao.ClientDataSet.Open;

  if dmPadrao.ClientDataSet.IsEmpty then
  begin
    Application.MessageBox('Usuário ou senha inválido.', 'Atenção', MB_OK+MB_ICONERROR);
    Abort;
  end
  else
  begin
    ExecutarAplicacao(Arquivo);
    Close;
  end;
end;

procedure ConfigurarDB(Arquivo : TIniFile);
var
  Caminho, Login, Senha : String;
begin

  Caminho := Arquivo.ReadString('Config', Crip('Caminho'), Caminho);
  Login := Arquivo.ReadString('Config', Crip('Login'), Login);
  Senha := Arquivo.ReadString('Config', Crip('Senha'), Senha);

  dmPadrao.FDConnection.Params.Add('Server=' + Crip(Caminho));
  dmPadrao.FDConnection.Params.UserName := Crip(Login);
  dmPadrao.FDConnection.Params.Password := Crip(Senha);

end;

procedure ExecutarAplicacao(Arquivo : TIniFile);
var
  Hora: Integer;
  Data : TDateTime;
  Hash, Serial : String;
begin

    Hora := HourOf(Now);
    Data := Date();
    //Serial := SerialHD(Serial);

    Hash := IntToStr(Hora) + DateToStr(Data) + Serial;

    Arquivo.WriteString('Login', 'Numero', MD5(Hash));

    AtualizarExecutavel;

    try
      //WinExec('Loading.exe', SW_NORMAL);
      WinExec('C:\Users\Ruan\Documents\TEAR\Tear\codigo\Win32\Release\Tear.exe', SW_NORMAL);
    finally
      //Arquivo.EraseSection('Login');
      Arquivo.Free;
    end;

end;

procedure AtualizarExecutavel;
var
  VersionLocal, VersionServidor : String;
  ExeLocal, ExeServidor : String;
begin
  VersionLocal := GetFileVersion('C:\Delphi\Atual\Loading.exe');
  VersionServidor := GetFileVersion('C:\Delphi\Novo\Loading.exe');

  if VersionLocal < VersionServidor then
  begin

    ExeServidor := 'C:\Delphi\Novo\Loading.zlib';
    ExeLocal :=  'C:\Delphi\Atual\Loading.zlib';

    if not CopyFile(PChar(ExeServidor), PChar(ExeLocal), false) then
      Application.MessageBox('Erro ao atualizar o executável.', 'Erro', MB_OK+MB_ICONWARNING);

  end;

end;

end.

