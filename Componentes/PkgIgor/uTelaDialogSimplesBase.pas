unit uTelaDialogSimplesBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XiButton, ExtCtrls, XiPanel, StdCtrls, dbGridBeleza;

type
  TfTelaSimplesBase = class(TForm)
    XiPanel1: TXiPanel;
    btOk: TXiButton;
    btCancelar: TXiButton;
    lbTituloTela: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTelaSimplesBase: TfTelaSimplesBase;

implementation

{$R *.dfm}

procedure TfTelaSimplesBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_Return)
      and not (ActiveControl is tMemo)
      and not (ActiveControl is tDBGridBeleza) then
    perform(wm_nextdlgctl,0,0);
end;

procedure TfTelaSimplesBase.btCancelarClick(Sender: TObject);
begin
    Close;
end;

procedure TfTelaSimplesBase.FormCreate(Sender: TObject);
begin
  tForm(Sender) := Self;
end;

end.
