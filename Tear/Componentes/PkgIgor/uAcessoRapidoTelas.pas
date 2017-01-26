unit uAcessoRapidoTelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uTelaDialogSimplesBase, XiButton, ExtCtrls, XiPanel, StdCtrls,
  EditDinheiro, ComCtrls;

type
  TfAcesRapid = class(TfTelaSimplesBase)
    Label2: TLabel;
    edTela: TEditDinheiro;
    TreeView1: TTreeView;
    Label3: TLabel;
    procedure btOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure edTelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAcesRapid: TfAcesRapid;

implementation

uses u_principal, uDM_Dados;

{$R *.dfm}

procedure TfAcesRapid.btOkClick(Sender: TObject);
begin
  inherited;
  Tag := 1;
  Close;
end;

procedure TfAcesRapid.FormActivate(Sender: TObject);
begin
  inherited;
  Tag := 0;
  edTela.SetFocus;
end;

procedure TfAcesRapid.TreeView1Click(Sender: TObject);
begin
  inherited;
  if TreeView1.Selected.Level > 0 then
      edTela.Text := Copy(TreeView1.Selected.Text, 2, 6)
  else
      edTela.Clear;
end;

procedure TfAcesRapid.TreeView1DblClick(Sender: TObject);
begin
  inherited;
  TreeView1Click(TreeView1);
  btOkClick(btOk);
end;

procedure TfAcesRapid.edTelaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_Return then btOkClick(btOk);
end;

procedure TfAcesRapid.FormShow(Sender: TObject);
var s : String;
begin
  inherited;

  if TreeView1.Items.Count > 0 then Exit;

  // Carregar Telas para a Arvore de Selecao da Tela de Acesso Rápido
  dm_dados.mTelasUsurAtual.Filter := '';
  s                               := '';

  TreeView1.Items.Clear;
  dm_dados.mTelasUsurAtual.DisableControls;
  dm_dados.mTelasUsurAtual.First;
  while not dm_dados.mTelasUsurAtual.Eof do
  begin
      if s <> dm_dados.mTelasUsurAtualmodulo.AsString then
      begin
          TreeView1.Items.Add(nil, dm_dados.mTelasUsurAtualmodulo.AsString);
          TreeView1.Selected := TreeView1.Items[TreeView1.Items.Count - 1];
      end;

      TreeView1.Items.AddChild(TreeView1.Selected,
          LowerCase(dm_dados.mTelasUsurAtualtela.AsString) + ' - ' +
          dm_dados.mTelasUsurAtualbotao1.AsString + ' ' +
          dm_dados.mTelasUsurAtualbotao2.AsString);

      s := dm_dados.mTelasUsurAtualmodulo.AsString;
      dm_dados.mTelasUsurAtual.Next;
  end;
  dm_dados.mTelasUsurAtual.EnableControls;

end;

procedure TfAcesRapid.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_Escape then Close;
end;

end.
