unit uFrmAtualizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, ShellAnimations;

type
  TfrmAtualizacao = class(TForm)
    Label1: TLabel;
    Animate1: TAnimate;

  public
    procedure Atualizar;

end;

var
  frmAtualizacao: TfrmAtualizacao;

implementation

{$R *.dfm}

procedure TfrmAtualizacao.Atualizar;
var
  ExeServidor, ExeLocal : String;
begin
  {ExeServidor := 'C:\Delphi\Novo\Loading.exe';
  ExeLocal :=  'C:\Delphi\Atual\Loading.exe';

  //if not CopyFile(PChar(ExeServidor), PChar(ExeLocal), false) then
    //Application.MessageBox('Erro ao atualizar o executável.', 'Erro', MB_OK+MB_ICONWARNING);
  }
end;



end.
