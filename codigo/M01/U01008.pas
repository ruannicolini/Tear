unit U01008;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider, Datasnap.DBClient, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, DBGridBeleza, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, DBEditBeleza, EditBeleza;

type
  TF01008 = class(TFBase)
    FDQuery1idoperacao: TIntegerField;
    FDQuery1descricao: TStringField;
    FDQuery1idAcao: TIntegerField;
    FDQuery1idParte: TIntegerField;
    FDQuery1idFase: TIntegerField;
    ClientDataSet1idoperacao: TIntegerField;
    ClientDataSet1descricao: TStringField;
    ClientDataSet1idAcao: TIntegerField;
    ClientDataSet1idParte: TIntegerField;
    ClientDataSet1idFase: TIntegerField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBEditBeleza3: TDBEditBeleza;
    DBEditBeleza2: TDBEditBeleza;
    DBEditBeleza1: TDBEditBeleza;
    FDQuery1parte: TStringField;
    FDQuery1fase: TStringField;
    FDQuery1acao: TStringField;
    ClientDataSet1parte: TStringField;
    ClientDataSet1fase: TStringField;
    ClientDataSet1acao: TStringField;
    chkAcao: TCheckBox;
    chkParte: TCheckBox;
    chkFase: TCheckBox;
    EditBeleza1: TEditBeleza;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    EditBeleza2: TEditBeleza;
    EditBeleza3: TEditBeleza;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    FDQuery1complemento: TStringField;
    ClientDataSet1complemento: TStringField;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure BEditarClick(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure BtnLimparFiltrosClick(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure bRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F01008: TF01008;

implementation

{$R *.dfm}

uses
uDataModule, u_relatorios;


procedure TF01008.Action5Execute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;

  DBEdit3.Color := clWindow;
  DBEdit4.Color := clWindow;
  DBEdit5.Color := clWindow;
end;

procedure TF01008.BCancelarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TF01008.BEditarClick(Sender: TObject);
begin
  inherited;
  PageControl.ActivePageIndex := 0;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit3.Color := CorCamposOnlyRead();
  DBEdit4.Color := CorCamposOnlyRead();
  DBEdit5.Color := CorCamposOnlyRead();
end;

procedure TF01008.BExcluirClick(Sender: TObject);
begin
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from cronometragem c where c.idOperacao =:idCrono';
  DModule.qAux.ParamByName('idCrono').AsInteger:= (ClientDataSet1idoperacao.AsInteger);
  DModule.qAux.Open;
  if(DModule.qAux.IsEmpty)then
  begin
     inherited;
  end else
    ShowMessage('Cronometragem vinculada a esta Operação. Não é possível excluir.');

end;

procedure TF01008.bRelatorioClick(Sender: TObject);
begin
  inherited;

  if NOT(Ds.DataSet.IsEmpty)then
  begin
      frelatorios := tfrelatorios.Create(self);
      with frelatorios do
      begin
          try
              visible := false;
              Assimila_Relat_q(Screen.ActiveForm.Name, 0, DS.DataSet, nil, 'idOperacao', '');
              ShowModal;
          finally
              Relatorios_sis.close;
              relats_usur.close;
              Free;
          end;
      end;
  end else
  begin
    ShowMessage('Relatório necessita de pesquisa');
  end;
end;

procedure TF01008.BSalvarClick(Sender: TObject);
begin
  DBEdit1.Color := clWindow;
  DBEdit3.Color := clWindow;
  DBEdit4.Color := clWindow;
  DBEdit5.Color := clWindow;

  if trim(DBEdit3.Text) <> '' then
    begin
    if trim(DBEdit4.Text) <> '' then
      begin
        if trim(DBEdit5.Text) <> '' then
        begin
          inherited;
          DBEdit1.Color := clWindow;
          DBEdit4.Color := clWindow;
          grDados.Enabled := false;
        end else
           showmessage('Preencha o Campo Ação');
      end else
         showmessage('Preencha o Campo Parte');

    end else
       showmessage('Preencha o Campo Fase');
end;

procedure TF01008.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select op.*, p.descricao as parte, f.descricao as fase, a.descricao as acao from operacao op ';
  FDQuery1.SQL.add(' left outer join parte p on p.idparte = op.idparte');
  FDQuery1.SQL.add(' left outer join fase f on f.idfase = op.idfase');
  FDQuery1.SQL.add(' left outer join acao a on a.idAcao = op.idAcao where 1=1');

  if(chkAcao.Checked = true)then
    FDQuery1.SQL.Add(' and op.idacao = ' + Edit1.Text);
  if(chkParte.Checked = true)then
    FDQuery1.SQL.Add(' and op.idparte = ' + Edit2.Text);
  if(chkFase.Checked = true)then
    FDQuery1.SQL.Add(' and op.idfase = ' + Edit3.Text);

  FDQuery1.Open;
  BPesquisar.Click;
end;

procedure TF01008.BtnLimparFiltrosClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select op.*, p.descricao as parte, f.descricao as fase, a.descricao as acao from operacao op ';
  FDQuery1.SQL.add(' left outer join parte p on p.idparte = op.idparte');
  FDQuery1.SQL.add(' left outer join fase f on f.idfase = op.idfase');
  FDQuery1.SQL.add(' left outer join acao a on a.idAcao = op.idAcao');
  FDQuery1.Open;
  BPesquisar.Click;
end;

procedure TF01008.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idoperacao.AsInteger := DModule.buscaProximoParametro('seqOperacao');

end;

procedure TF01008.DBEdit3Change(Sender: TObject);
begin
  inherited;
  //
  if (DS.DataSet.State=dsInsert) or (DS.DataSet.State=dsEdit) then
  begin
      if (trim(DBEdit3.Text) <>'') and (trim(DBEdit4.Text) <>'') then
      begin
      ClientDataSet1descricao.Value := DBEditBeleza1.Text + ' ' + DBEditBeleza2.Text + ' ' + DBEdit6.Text
      end else
        ClientDataSet1descricao.Clear;
  end;

end;

initialization
  RegisterClass(TF01008);
Finalization
  UnRegisterClass(TF01008);
end.
