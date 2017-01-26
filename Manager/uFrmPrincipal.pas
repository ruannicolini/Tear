unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, iniFiles;

type
  TfrmPrincipal = class(TForm)
    edtCaminho: TEdit;
    Label1: TLabel;
    btnSalvar: TButton;
    btnFechar: TButton;
    Label4: TLabel;
    Label2: TLabel;
    edtLogin: TEdit;
    Label3: TLabel;

    edtSenha: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uFrmLogin, uFuncao;


procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
var
  Arquivo : TIniFile;
  Caminho, Login, Senha : TCaption;
begin

  Arquivo := TIniFile.Create(GetCurrentDir+'\Config.ini');

  Caminho := edtCaminho.Text;
  Login := edtLogin.Text;
  Senha := edtSenha.Text;

  Caminho := Crip(Caminho);
  Login := Crip(Login);
  Senha := Crip(Senha);

  Arquivo.WriteString('Config', Crip('Caminho'), Caminho );
  Arquivo.WriteString('Config', Crip('Login'), Login);
  Arquivo.WriteString('Config', Crip('Senha'), Senha);

  FileSetAttr(GetCurrentDir+'\Config.ini', FileGetAttr(GetCurrentDir+'\Config.ini') or 2);
  Arquivo.Free;

  Application.MessageBox('Alterações salvas com sucesso.', 'Sucesso', MB_OK+64);

end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  Arquivo : TIniFile;
  Caminho, Login, Senha : String;
begin

  Arquivo := TIniFile.Create(GetCurrentDir+'\Config.ini');

  Caminho := Arquivo.ReadString('Config', Crip('Caminho'), Caminho);
  Login := Arquivo.ReadString('Config', Crip('Login'), Login);
  Senha := Arquivo.ReadString('Config', Crip('Senha'), Senha);

  Caminho := Crip(Caminho);
  Login := Crip(Login);
  Senha := Crip(Senha);

  edtCaminho.Text := Caminho;
  edtLogin.Text := Login;
  edtSenha.Text := Senha;

  Arquivo.Free;

end;

end.
