unit U02001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Datasnap.DBClient, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, DBGridBeleza,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, DBEditBeleza,
  Edit_Calendario, DBEditCalendario, Vcl.Tabs, Vcl.ToolWin, EditBeleza;

type
  TF02001 = class(TFBase)
    FDQuery1idOrdem: TIntegerField;
    FDQuery1numOrdem: TIntegerField;
    FDQuery1idProduto: TIntegerField;
    FDQuery1qtdOriginal: TIntegerField;
    FDQuery1dataCadastro: TDateField;
    FDQuery1observacao: TStringField;
    ClientDataSet1idOrdem: TIntegerField;
    ClientDataSet1numOrdem: TIntegerField;
    ClientDataSet1idProduto: TIntegerField;
    ClientDataSet1qtdOriginal: TIntegerField;
    ClientDataSet1dataCadastro: TDateField;
    ClientDataSet1observacao: TStringField;
    FDQuery1descricao: TStringField;
    ClientDataSet1descricao: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEditBeleza1: TDBEditBeleza;
    DBEdit_Calendario1: TDBEdit_Calendario;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    MOVIMENTACOES: TTabSheet;
    DBGridBeleza2: TDBGridBeleza;
    FDQuery2: TFDQuery;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    DataSource2: TDataSource;
    FDQuery2idOrdem_has_fase: TIntegerField;
    FDQuery2idOrdem: TIntegerField;
    FDQuery2idFase: TIntegerField;
    FDQuery2qtdOriginal: TIntegerField;
    FDQuery2qtdPrevista: TIntegerField;
    FDQuery2qtdProduzindo: TIntegerField;
    FDQuery2idLinhaProducao: TIntegerField;
    FDQuery2sequencia: TIntegerField;
    FDQuery2fase: TStringField;
    ClientDataSet2idOrdem_has_fase: TIntegerField;
    ClientDataSet2idOrdem: TIntegerField;
    ClientDataSet2idFase: TIntegerField;
    ClientDataSet2qtdOriginal: TIntegerField;
    ClientDataSet2qtdPrevista: TIntegerField;
    ClientDataSet2qtdProduzindo: TIntegerField;
    ClientDataSet2idLinhaProducao: TIntegerField;
    ClientDataSet2sequencia: TIntegerField;
    ClientDataSet2fase: TStringField;
    FDQuery2grupo: TStringField;
    ClientDataSet2grupo: TStringField;
    DBText1: TDBText;
    DBRichEdit1: TDBRichEdit;
    TabSet1: TTabSet;
    ToolBar1: TToolBar;
    TBtnProcessarRota: TToolButton;
    ToolButton2: TToolButton;
    TBtnLimpar: TToolButton;
    ToolButton4: TToolButton;
    TBtnExcluir: TToolButton;
    FDQuery2qtdFinalizada: TIntegerField;
    ClientDataSet2qtdFinalizada: TIntegerField;
    DBGridBeleza3: TDBGridBeleza;
    FDQuery3: TFDQuery;
    ClientDataSet3: TClientDataSet;
    DataSetProvider3: TDataSetProvider;
    DataSource3: TDataSource;
    FDQuery3idmovimentacao: TIntegerField;
    FDQuery3idOrdem_has_fase: TIntegerField;
    FDQuery3dataMov: TDateField;
    FDQuery3responsavel: TStringField;
    FDQuery3qtd: TIntegerField;
    FDQuery3idTipoMovimentacao: TIntegerField;
    FDQuery3observacao: TStringField;
    FDQuery3fase: TStringField;
    FDQuery3TipoMovimentacao: TStringField;
    ClientDataSet3idmovimentacao: TIntegerField;
    ClientDataSet3idOrdem_has_fase: TIntegerField;
    ClientDataSet3dataMov: TDateField;
    ClientDataSet3responsavel: TStringField;
    ClientDataSet3qtd: TIntegerField;
    ClientDataSet3idTipoMovimentacao: TIntegerField;
    ClientDataSet3observacao: TStringField;
    ClientDataSet3fase: TStringField;
    ClientDataSet3TipoMovimentacao: TStringField;
    Edit1: TEdit;
    chkCod: TCheckBox;
    chkProduto: TCheckBox;
    EditBeleza1: TEditBeleza;
    Edit2: TEdit;
    chkOrdem: TCheckBox;
    Edit3: TEdit;
    FDQuery2inclusao: TFMTBCDField;
    FDQuery2reducao: TFMTBCDField;
    ClientDataSet2inclusao: TFMTBCDField;
    ClientDataSet2reducao: TFMTBCDField;
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure TabSet1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TBtnProcessarRotaClick(Sender: TObject);
    procedure ClientDataSet2AfterCancel(DataSet: TDataSet);
    procedure ClientDataSet2AfterDelete(DataSet: TDataSet);
    procedure ClientDataSet2AfterPost(DataSet: TDataSet);
    procedure ClientDataSet2AfterInsert(DataSet: TDataSet);
    procedure DBGridBeleza2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TBtnExcluirClick(Sender: TObject);
    procedure TBtnLimparClick(Sender: TObject);
    procedure BInserirClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure DataSource2StateChange(Sender: TObject);
    procedure DBGridBeleza3DblClick(Sender: TObject);
    procedure DBGridBeleza2DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure BtnLimparFiltrosClick(Sender: TObject);
    procedure ClientDataSet1AfterDelete(DataSet: TDataSet);
    procedure BExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F02001: TF02001;

implementation

{$R *.dfm}

uses uDataModule, u02002;

procedure TF02001.Action5Execute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
  DBEdit3.Color := $00EFEFEF;
  DBEdit4.Enabled := true;
  DBEditBeleza1.Enabled := true;
end;

procedure TF02001.BEditarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit3.Color := CorCamposOnlyRead();
  DBEdit4.Enabled := false;
  DBEditBeleza1.Enabled := false;
end;

procedure TF02001.BExcluirClick(Sender: TObject);
begin
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from movimentacao m left outer join ordem_has_fase ohf on ohf.idOrdem_has_fase = m.idOrdem_has_fase WHERE ohf.idordem =:id';
  DModule.qAux.ParamByName('id').value := ClientDataSet1idOrdem.AsInteger;
  DModule.qAux.open;

  if (DModule.qAux.IsEmpty)then
  begin
    inherited;
  end else
    ShowMessage('Fases já possuem movimentações. Não é possivel excluir ordem');

end;

procedure TF02001.BInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit3.Color := CorCamposOnlyRead();
end;

procedure TF02001.BSalvarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
  DBEdit3.Color := $00EFEFEF;
  DBEdit4.Enabled := true;
  DBEditBeleza1.Enabled := true;
end;

procedure TF02001.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select ord.*, d.descricao from ordem_producao ord left outer join produto d on ord.idproduto = d.idproduto where 1=1 ';

  if(chkCod.Checked = true)then
    FDQuery1.SQL.Add(' and ord.idOrdem like "%' + Edit1.Text +'%"');
  if(chkOrdem.Checked = true)then
    FDQuery1.SQL.Add(' and ord.numOrdem = ' + Edit3.Text);
  if(chkProduto.Checked = true)then
    FDQuery1.SQL.Add(' and ord.idProduto = ' + Edit2.Text);

  FDQuery1.Open;
  BPesquisar.Click;
end;

procedure TF02001.BtnLimparFiltrosClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select ord.*, d.descricao from ordem_producao ord left outer join produto d on ord.idproduto = d.idproduto';
  FDQuery1.Open;
  BPesquisar.Click;
end;

procedure TF02001.ClientDataSet1AfterDelete(DataSet: TDataSet);
begin
  inherited;
  //
end;

procedure TF02001.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idOrdem.AsInteger := DModule.buscaProximoParametro('seqOrdemProducao');
end;

procedure TF02001.ClientDataSet2AfterCancel(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet2.CancelUpdates;
end;

procedure TF02001.ClientDataSet2AfterDelete(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet2.ApplyUpdates(-1);
end;

procedure TF02001.ClientDataSet2AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet2idOrdem_has_fase.AsInteger := DModule.buscaProximoParametro('seqOrdemFase');
end;

procedure TF02001.ClientDataSet2AfterPost(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet2.ApplyUpdates(-1);
end;

procedure TF02001.DataSource2StateChange(Sender: TObject);
begin
  inherited;
  if(DataSource2.DataSet.IsEmpty)then
  begin
    TBtnProcessarRota.Enabled := true;
    TBtnLimpar.Enabled := false;
    TBtnExcluir.Enabled := false;
  end else
    TBtnProcessarRota.Enabled := false;
    TBtnLimpar.Enabled := true;
    TBtnExcluir.Enabled := true;
end;

procedure TF02001.DBGridBeleza2DblClick(Sender: TObject);
begin
  inherited;
  With TF02002.CreateOrdemFase(self, ClientDataSet2idOrdem_has_fase.value) do
  Begin
    ShowModal;
    Free;
  End;
  DS.OnDataChange(NIL, NIL);
end;

procedure TF02001.DBGridBeleza2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    FillRect(Rect);
  end;

end;

procedure TF02001.DBGridBeleza3DblClick(Sender: TObject);
begin
  inherited;

  With TF02002.CreateMov(self, ClientDataSet3idmovimentacao.value) do
  Begin
    ShowModal;
    Free;
  End;
  DS.OnDataChange(NIL, NIL);
end;

procedure TF02001.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  {Fase}
  FDQuery2.ParamByName('idOrdem').Value:=(ClientDataSet1idOrdem.AsInteger);
  DataSource2.DataSet.Close;
  DataSource2.DataSet.Open;

  {MOVIMENTAÇÕES}
  FDQuery3.ParamByName('idOrdem').Value:=(ClientDataSet1idOrdem.AsInteger);
  DataSource3.DataSet.Close;
  DataSource3.DataSet.Open;
end;

procedure TF02001.Edit1Change(Sender: TObject);
begin
  inherited;
    if((edit1.Text = '')or (edit1.Text = ' '))then
  begin
    chkCod.Checked := false;
  end else
    chkCod.Checked := true;
end;

procedure TF02001.Edit3Change(Sender: TObject);
begin
  inherited;
    if((edit3.Text = '')or(edit3.Text = ' '))then
  begin
    chkOrdem.Checked := false;
  end else
    chkOrdem.Checked := true;
end;

procedure TF02001.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.Pages[0].TabVisible := FALSE;
  PageControl1.Pages[1].TabVisible := FALSE;
  PageControl1.ActivePageIndex := 0;
end;

procedure TF02001.TabSet1Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex := TabSet1.TabIndex;
end;

procedure TF02001.TBtnExcluirClick(Sender: TObject);
begin
  inherited;

  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from movimentacao WHERE idordem_has_fase =:id';
  DModule.qAux.ParamByName('id').AsString := ClientDataSet3idOrdem_has_fase.AsString;
  DModule.qAux.open;

  if(DModule.qAux.IsEmpty)then
  begin
      if datasource2.DataSet.Active then
      begin
        if not datasource2.DataSet.IsEmpty then
        begin
            if (Application.MessageBox('Deseja Deletar ?', 'Deletar', MB_YESNO + MB_ICONQUESTION) = id_yes) then
            begin
              datasource2.DataSet.Delete;
            end;
        end
        else
            ShowMessage('Não Há registros');
      end;
  end else
    ShowMessage('A Fase possui Movimentações.'+#13+' Não é possivel excluir.');

end;

procedure TF02001.TBtnLimparClick(Sender: TObject);
begin
  inherited;

  //Permite que valores Produto e quantidade sejam alterados
  DBEdit4.Enabled := true;
  DBEditBeleza1.Enabled := true;

  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from movimentacao m left outer join ordem_has_fase ohf on ohf.idOrdem_has_fase = m.idOrdem_has_fase WHERE ohf.idordem =:id';
  DModule.qAux.ParamByName('id').value := ClientDataSet1idOrdem.AsInteger;
  DModule.qAux.open;

  if(DModule.qAux.IsEmpty)then
  begin
      if datasource2.DataSet.Active then
      begin
        if not datasource2.DataSet.IsEmpty then
        begin
            if (Application.MessageBox('Deseja Apagar Rota de Produção ?', 'Deletar', MB_YESNO + MB_ICONQUESTION) = id_yes) then
            begin

              //LIMPAR ORDEM_HAS_FASE
              ClientDataSet2.Close;
              DModule.qAux.Close;
              DModule.qAux.SQL.Text := 'Delete from ordem_has_fase WHERE idordem =:od';
              DModule.qAux.ParamByName('od').AsString := ClientDataSet1idOrdem.AsString;
              DModule.qAux.execsql;
              ClientDataSet2.open;
            end;
        end
        else
            ShowMessage('Não Há registros');
      end;
  end else
    ShowMessage('Fases já possuem movimentações. Não é possível excluir.');


end;

procedure TF02001.TBtnProcessarRotaClick(Sender: TObject);
var
matriz: array of array of integer;
i : integer;
status: Boolean;
begin
  inherited;
  //Verificar se produto e quantidade já estão disponiveis
  if(DBEdit3.Text <> '') and (DBEdit4.Text <> '')then
  begin
      //Impede que valores sejam alterados
      DBEdit4.Enabled := false;
      DBEditBeleza1.Enabled := false;

      //Pega as fases do produto selecionado e trás um idGRUPO habilitado a realizar a fase sorteado aleatório
      DModule.qAux.Close;
      DModule.qAux.SQL.Text := 'select phf.*, (select idgrupo from fase_has_grupo fhg where idfase = phf.idfase ORDER BY RAND() LIMIT 1) as idGrupo from produto_has_fase phf where idProduto =:idProd order by (sequencia)';
      DModule.qAux.ParamByName('idProd').AsInteger:= (ClientDataSet1idProduto.AsInteger);
      DModule.qAux.Open;
      DModule.qAux.first;


      // é preciso verificar se alguma fase veio sem selecionar o grupo de produção
      status := true;
      while not DModule.qAux.eof do
      begin
         if(DModule.qAux.FieldByName('idGrupo').IsNull)then
         begin
            ShowMessage('Não há Grupos habilitados a fazer a fase de COD ' + DModule.qAux.FieldByName('idFase').AsString + #13+ 'Não é Possível Processar Rota');
            status := false;
         end;
         DModule.qAux.Next;
      end;
      DModule.qAux.first;

      if(status = true)then
      begin
          //Declaração do tamanho da Matriz
          SetLength(matriz, DModule.qAux.RecordCount);
          for i := 0 to (DModule.qAux.RecordCount -1) do
          begin
            SetLength(matriz[i], 7);
          end;

          //Atribui valores na matriz
          i := 0;
          while not DModule.qAux.eof do
          begin
            //idOrdem
            matriz[i][0] := ClientDataSet1idOrdem.AsInteger;

            //IdFase
            matriz[i][1] := DModule.qAux.FieldByName('idfase').AsInteger;

            //QtdOriginal
            matriz[i][2] := ClientDataSet1qtdOriginal.AsInteger;

            //qtdPrevisto
            IF(i = 0)THEN
            BEGIN
              matriz[i][3] := 0;
            END ELSE
              matriz[i][3] := ClientDataSet1qtdOriginal.AsInteger;

            //QtdFinalizado
            matriz[i][4] := 0;

            //QtdProduzindo
            IF(i = 0)THEN
            BEGIN
            matriz[i][5] := ClientDataSet1qtdOriginal.AsInteger;;
            END ELSE
            matriz[i][5] := 0;

            //Sequencia
            matriz[i][6] := DModule.qAux.FieldByName('sequencia').AsInteger;

            //Grupo Selecionado aleatoriamente para produzir
            matriz[i][7] := DModule.qAux.FieldByName('idGrupo').AsInteger;

            i := i+1;
            DModule.qAux.next;
          end;

          for i := 0 to (Length(matriz)-1) do
          begin
            // DataSource2 = ordem_has_fase
            ClientDataSet2.Open;
            ClientDataSet2.Append;
            ClientDataSet2idOrdem.Value := matriz[i][0];
            ClientDataSet2idFase.Value := matriz[i][1];
            ClientDataSet2qtdOriginal.Value := matriz[i][2];
            ClientDataSet2qtdPrevista.Value := matriz[i][3];
            ClientDataSet2qtdFinalizada.Value := matriz[i][4];
            ClientDataSet2qtdProduzindo.Value := matriz[i][5];
            ClientDataSet2sequencia.Value := matriz[i][6];
            ClientDataSet2idLinhaProducao.Value := matriz[i][7];
            ClientDataSet2.Post;
          end;

          DataSource2.DataSet.Close;
          DataSource2.DataSet.Open;
      end;

  end;

end;

Initialization
  RegisterClass(TF02001);
Finalization
  UnRegisterClass(TF02001);
end.
