unit uFrmAtualizar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmAtualizar = class(TForm)
    Label1: TLabel;
    Animate1: TAnimate;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Atualizar;
  end;

var
  frmAtualizar: TfrmAtualizar;

implementation

{$R *.dfm}

procedure TfrmAtualizar.FormShow(Sender: TObject);
begin
  Atualizar;
  //PostMessage(frmAtualizar.Handle,WM_CLOSE, 0, 0);
end;

procedure TfrmAtualizar.Atualizar;
var
  ExeServidor, ExeLocal : String;
begin


end;

end.
