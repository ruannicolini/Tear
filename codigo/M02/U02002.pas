unit U02002;

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
  DBEditCalendario, EditBeleza;

type
  TF02002 = class(TFBase)
    FDQuery1idmovimentacao: TIntegerField;
    FDQuery1idOrdem_has_fase: TIntegerField;
    FDQuery1dataMov: TDateField;
    FDQuery1responsavel: TStringField;
    FDQuery1qtd: TIntegerField;
    FDQuery1idTipoMovimentacao: TIntegerField;
    FDQuery1observacao: TStringField;
    FDQuery1idOrdem: TIntegerField;
    FDQuery1numOrdem: TIntegerField;
    FDQuery1idProduto: TIntegerField;
    FDQuery1qtdOriginal: TIntegerField;
    FDQuery1dataCadastro: TDateField;
    FDQuery1observacao_1: TStringField;
    ClientDataSet1idmovimentacao: TIntegerField;
    ClientDataSet1idOrdem_has_fase: TIntegerField;
    ClientDataSet1dataMov: TDateField;
    ClientDataSet1responsavel: TStringField;
    ClientDataSet1qtd: TIntegerField;
    ClientDataSet1idTipoMovimentacao: TIntegerField;
    ClientDataSet1observacao: TStringField;
    ClientDataSet1idOrdem: TIntegerField;
    ClientDataSet1numOrdem: TIntegerField;
    ClientDataSet1qtdOriginal: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBEditBeleza1: TDBEditBeleza;
    FDQuery1tipoMovimentacao: TStringField;
    ClientDataSet1tipoMovimentacao: TStringField;
    FDQuery1fase: TStringField;
    ClientDataSet1fase: TStringField;
    DBEditBeleza2: TDBEditBeleza;
    DBEdit_Calendario1: TDBEdit_Calendario;
    DBRichEdit1: TDBRichEdit;
    Edit1: TEdit;
    chkCodOrdem: TCheckBox;
    chkTipoMov: TCheckBox;
    EditBeleza1: TEditBeleza;
    Edit2: TEdit;
    procedure DBEditBeleza2ButtonClick(Sender: TObject;
      var query_result: TFDQuery);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure BInserirClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure BtnLimparFiltrosClick(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure DBEditBeleza1Change(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure DBEditBeleza2Change(Sender: TObject);
    procedure ClientDataSet1AfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor CreateMov(AOwner : TComponent; pParm1 : integer);
    constructor CreateOrdemFase(AOwner : TComponent; pParm1 : integer);
    procedure calculoMovimentcao();
  end;

var
  F02002: TF02002;

implementation

{$R *.dfm}

uses UDataModule;

constructor TF02002.CreateOrdemFase(AOwner: TComponent; pParm1: integer);
var
ParIdOF : integer;
begin
inherited Create(AOwner);
  ParIdOF:= pParm1;

  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select m.*, o.*, tm.descricao as tipoMovimentacao, f.descricao as fase from movimentacao m ';
  FDQuery1.SQL.add('left outer join tipo_movimentacao tm on tm.idTipo_Movimentacao = m.idTipoMovimentacao ');
  FDQuery1.SQL.add('left outer join ordem_has_fase ohf on ohf.idOrdem_has_fase = m.idORdem_has_fase ');
  FDQuery1.SQL.add('left outer join fase f on f.idfase = ohf.idfase ');
  FDQuery1.SQL.add('left outer join ordem_producao o on o.idOrdem =  ohf.idORdem ');
  FDQuery1.SQL.Add('where ohf.idOrdem_has_fase = ' + inttostr(ParIdOF));
  FDQuery1.Open;
  BPesquisar.Click;

  Width := 857;
  Height := 430;
  PageControl.ActivePageIndex := 1;
end;

constructor TF02002.CreateMov(AOwner: TComponent; pParm1: integer);
var
ParIdMov : integer;
begin
  //
  inherited Create(AOwner);
  ParIdMov:= pParm1;

  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select m.*, o.*, tm.descricao as tipoMovimentacao, f.descricao as fase from movimentacao m ';
  FDQuery1.SQL.add('left outer join tipo_movimentacao tm on tm.idTipo_Movimentacao = m.idTipoMovimentacao ');
  FDQuery1.SQL.add('left outer join ordem_has_fase ohf on ohf.idOrdem_has_fase = m.idORdem_has_fase ');
  FDQuery1.SQL.add('left outer join fase f on f.idfase = ohf.idfase ');
  FDQuery1.SQL.add('left outer join ordem_producao o on o.idOrdem =  ohf.idORdem ');
  FDQuery1.SQL.Add('where m.idmovimentacao = ' + inttostr(ParIdMov));
  FDQuery1.Open;
  BPesquisar.Click;

  Width := 957;
  Height := 610;
  PageControl.ActivePageIndex := 0;

end;



procedure TF02002.Action5Execute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
  DBEdit2.Color := $00EFEFEF;
  DBEdit6.Color := $00EFEFEF;
  DBEdit9.Color := clWindow;

  DBEditBeleza1.Enabled := true;
  DBEditBeleza2.Enabled := true;
  DBEdit5.Enabled := true;
  DBEdit8.Enabled := true;
  DBEdit2.Enabled := true;
  DBEdit6.Enabled := true;
end;

procedure TF02002.BEditarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit2.Color := CorCamposOnlyRead();
  DBEdit6.Color := CorCamposOnlyRead();
  DBEdit9.Color := $00EFEFEF;

  DBEditBeleza1.Enabled := false;
  DBEditBeleza2.Enabled := false;
  DBEdit5.Enabled := false;
  DBEdit8.Enabled := false;
  DBEdit2.Enabled := false;
  DBEdit6.Enabled := false;
end;

procedure TF02002.BExcluirClick(Sender: TObject);
begin
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from movimentacao m left outer join ordem_has_fase ohf on ohf.idOrdem_has_fase = m.idOrdem_has_fase ';
  DModule.qAux.SQL.Add('WHERE ohf.idordem =:id order by (m.idMovimentacao) desc');
  DModule.qAux.ParamByName('id').value := ClientDataSet1idOrdem.AsInteger;
  DModule.qAux.open;

  if not(DModule.qAux.IsEmpty)then
  begin
    DModule.qAux.First;
    if(DModule.qAux.FieldByName('idMovimentacao').AsInteger = ClientDataSet1idmovimentacao.AsInteger)then
    begin
      inherited;
    end else
      ShowMessage('Não é possível excluir movimentação tendo movimentações posteriores a ela.');
  end;
end;

procedure TF02002.BInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit2.Color := CorCamposOnlyRead();
  DBEdit6.Color := CorCamposOnlyRead();
  DBEdit9.Color := $00EFEFEF;

  DBEditBeleza1.Enabled := false;
  DBEditBeleza2.Enabled := false;
  DBEdit5.Enabled := false;
end;

procedure TF02002.BSalvarClick(Sender: TObject);
var
idProd, idN, NOrdem, qtd : Integer;
obs : string;
begin

  DBEdit1.Color := clWindow;
  DBEdit2.Color := $00EFEFEF;
  DBEdit6.Color := $00EFEFEF;
  DBEdit9.Color := clWindow;

  DBEditBeleza1.Enabled := true;
  DBEditBeleza2.Enabled := true;
  DBEdit5.Enabled := true;
  DBEdit8.Enabled := true;
  DBEdit2.Enabled := true;
  DBEdit6.Enabled := true;

  //
  if DS.DataSet.State=dsInsert then
  begin
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'select * from tipo_movimentacao where idtipo_Movimentacao =:id';
    DModule.qAux.ParamByName('id').AsInteger := ClientDataSet1idTipoMovimentacao.AsInteger;
    DModule.qAux.Open;

    if(DModule.qAux.FieldByName('dividirOrdem').AsBoolean = true)then
    begin
        ShowMessage('DividirOrdem');

        //Aqui vou criar outra ordem com as mesmas fases e com a quantidade indormada,
        // em observações basta informar que é uma ordem de retrabalho.

        DModule.qAux.Close;
        DModule.qAux.SQL.Text := 'select * from ordem_producao where idOrdem =:id';
        DModule.qAux.ParamByName('id').AsInteger := ClientDataSet1idOrdem.AsInteger;
        DModule.qAux.Open;

        //Obtenção dos valores das variáveis
        idProd := DModule.qAux.FieldByName('idProduto').AsInteger;
        obs := 'Retrabalho da ordem ' + inttostr(DModule.qAux.FieldByName('numOrdem').AsInteger);
        idN := DModule.buscaProximoParametro('seqOrdemProducao');
        NOrdem := ClientDataSet1numOrdem.AsInteger;
        qtd := ClientDataSet1qtd.AsInteger;


        //Inclui Nova ondem
        DModule.qAux.Close;
        DModule.qAux.SQL.Clear;
        DModule.qAux.SQL.Text := 'insert into ordem_producao(idordem,numordem,idproduto,qtdoriginal,datacadastro,observacao) ';
        DModule.qAux.SQL.Add('values( :idN , :nOrdem, :idP, :qtd, :d , :obs)');

        DModule.qAux.ParamByName('idN').Asinteger := idN;
        DModule.qAux.ParamByName('nOrdem').Asinteger := NOrdem;
        DModule.qAux.ParamByName('idP').Asinteger := idProd;
        DModule.qAux.ParamByName('qtd').Asinteger := qtd;
        DModule.qAux.ParamByName('d').AsDate := Date();
        DModule.qAux.ParamByName('obs').AsString := obs;
        DModule.qAux.ExecSQL;

        end;
  end;

  inherited;
end;

procedure TF02002.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select m.*, o.*, tm.descricao as tipoMovimentacao, f.descricao as fase from movimentacao m ';
  FDQuery1.SQL.add('left outer join tipo_movimentacao tm on tm.idTipo_Movimentacao = m.idTipoMovimentacao ');
  FDQuery1.SQL.add('left outer join ordem_has_fase ohf on ohf.idOrdem_has_fase = m.idORdem_has_fase ');
  FDQuery1.SQL.add('left outer join fase f on f.idfase = ohf.idfase ');
  FDQuery1.SQL.add('left outer join ordem_producao o on o.idOrdem = ohf.idORdem where 1=1 ');

  if(chkCodOrdem.Checked = true)then
    FDQuery1.SQL.Add(' and ohf.idOrdem like "%' + Edit1.Text +'%"');
  if(chkTipoMov.Checked = true)then
    FDQuery1.SQL.Add(' and TM.IDTIPO_MOVIMENTACAO = ' + Edit2.Text);

  FDQuery1.Open;
  BPesquisar.Click;
end;

procedure TF02002.BtnLimparFiltrosClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select m.*, o.*, tm.descricao as tipoMovimentacao, f.descricao as fase from movimentacao m ';
  FDQuery1.SQL.add('left outer join tipo_movimentacao tm on tm.idTipo_Movimentacao = m.idTipoMovimentacao ');
  FDQuery1.SQL.add('left outer join ordem_has_fase ohf on ohf.idOrdem_has_fase = m.idORdem_has_fase ');
  FDQuery1.SQL.add('left outer join fase f on f.idfase = ohf.idfase ');
  FDQuery1.SQL.add('left outer join ordem_producao o on o.idOrdem = ohf.idORdem');
  FDQuery1.Open;
  BPesquisar.Click;

end;

procedure TF02002.calculoMovimentcao;
var
contRegistros : integer;
qtdOriginal, qtdPrevisto, qtdProduzindo, qtdFinalizado : Integer;
qAux2, qAux3: TFDQuery;
begin
  // OBS: DModule.qAux = ordem_has_fase

  // OBS: qAux2 = movimentacao
  qAux2 := TFDQuery.Create(F02002);
  qAux2.Connection := DModule.FDConnection;

  // OBS: qAux3 = auxilia na divisão da ordem (Retrabalho)
  qAux3 := TFDQuery.Create(F02002);
  qAux3.Connection := DModule.FDConnection;

  //Busca fases da ordem;
  DModule.qAux.Close;
  DModule.qAux.SQL.Text :='SELECT OHF.*,ohf.idOrdem_has_fase as idO_H_S, OP.qtdOriginal AS qORI FROM ordem_has_fase OHF LEFT OUTER JOIN ordem_producao OP ON OHF.idOrdem = OP.idORDEM where OHF.idORDEM =:IDO Order by (sequencia)';
  DModule.qAux.ParamByName('idO').AsInteger:= (ClientDataSet1idOrdem.AsInteger);
  DModule.qAux.Open;
  DModule.qAux.first;

  // Seta valores na primeira fase da ordem;
  qAux2.Close;
  qAux2.SQL.Text := 'UPDATE ordem_has_fase SET qtdOriginal =:qtdO, qtdProduzindo =:qtdO, qtdPrevista = 0, qtdFinalizada = 0 WHERE idOrdem_has_fase =:IDOHS';
  qAux2.ParamByName('qtdO').value:= DModule.qAux.FieldByName('qORI').AsInteger;
  qAux2.ParamByName('IDOHS').value:= DModule.qAux.FieldByName('idO_H_S').AsInteger;
  qAux2.ExecSQL;

  //Atribuição dos valores
  qtdOriginal := DModule.qAux.FieldByName('qORI').AsInteger;
  qtdFinalizado := DModule.qAux.FieldByName('qORI').AsInteger;
  qtdProduzindo := 0;
  qtdPrevisto := 0;

  //Passa em todas as fases da ordem de produção (Ordem_has_fase)
  while not DModule.qAux.eof do
  begin
      //Atribuição dos valores
      qtdPrevisto := qtdPrevisto + qtdProduzindo; // é a soma da qtdPrevista + qtdProduzindo da fase anterior;
      qtdProduzindo := qtdFinalizado; //qtdFinalizado da fase anterior
      qtdFinalizado := 0; // Cada Fase calcula sua qtdFinalizado a seguir

      {ShowMessage('qtd Original: ' + inttostr(qtdOriginal) + #13 + 'qtd Produzindo: ' + inttostr(qtdProduzindo) + #13 +
                  'qtd Previsto: ' + inttostr(qtdPrevisto) + #13 + 'qtd Finalizado: ' + inttostr(qtdFinalizado));}

      //busca movimentações da ordem_has_fase corrente
      qAux2.Close;
      qAux2.SQL.Text := 'select ohf.*, tm.*, m.* from movimentacao m ';
      qAux2.SQL.Add('left outer join ordem_has_fase ohf on ohf.idOrdem_has_fase = m.idOrdem_has_fase ');
      qAux2.SQL.Add('left outer join tipo_movimentacao tm on tm.idTipo_movimentacao = m.idTipoMovimentacao');
      qAux2.SQL.Add('where ohf.idordem =:idOrdem and m.idOrdem_has_fase =:idOHF');
      qAux2.SQL.Add('order by (m.idOrdem_has_fase)');
      qAux2.ParamByName('idOrdem').AsInteger:= (ClientDataSet1idOrdem.AsInteger);
      qAux2.ParamByName('idOHF').AsInteger:= StrToInt(DModule.qAux.FieldByName('idO_H_S').AsString);
      qAux2.Open;
      qAux2.first;

      while not qaux2.Eof do
      begin
        //
        if(qAux2.FieldByName('finalizar').AsBoolean = true)then
        begin
          //subtrai movimentacao.qtd de qtdProduzindo
          IF(qtdProduzindo > 0)THEN
          begin
          qtdProduzindo := qtdProduzindo - qAux2.FieldByName('qtd').AsInteger;
          end;
          //Add quantidade finalizada
          qtdFinalizado := qtdFinalizado + qAux2.FieldByName('QTD').AsInteger;

          {ShowMessage('HBO' + #13+ 'qtd Original: ' + inttostr(qtdOriginal) + #13 + 'qtd Produzindo: ' + inttostr(qtdProduzindo) + #13 +
                  'qtd Previsto: ' + inttostr(qtdPrevisto) + #13 + 'qtd Finalizado: ' + inttostr(qtdFinalizado));
          }
        end;

        //
        if(qAux2.FieldByName('incrementar').AsBoolean = true)then
        begin
          //ShowMessage('incrementar fase ' + qAux2.FieldByName('idOrdem_has_fase').AsString);
          qtdProduzindo := qtdProduzindo + qAux2.FieldByName('qtd').AsInteger;
        end;

        //
        if(qAux2.FieldByName('decrementar').AsBoolean = true)then
        begin
          //ShowMessage('Decrementar fase ' + qAux2.FieldByName('idOrdem_has_fase').AsString);
          qtdProduzindo := qtdProduzindo - qAux2.FieldByName('qtd').AsInteger;
        end;

        //
        if(qAux2.FieldByName('dividirOrdem').AsBoolean = true)then
        begin
          //ShowMessage('DividirOrdem fase ' + qAux2.FieldByName('idOrdem_has_fase').AsString);

          //Esta sendo tratado ao salvar uma nova movimentcao
        end;

        qaux2.Next;
      end;

      // Repara valores recalculados
      qAux2.Close;
      qAux2.SQL.Text := 'UPDATE ordem_has_fase SET qtdOriginal =:qtdOri, qtdProduzindo =:qtdProd, qtdPrevista =:qtdPrev, qtdFinalizada =:qtdFin WHERE idOrdem_has_fase =:IDOHS';
      qAux2.ParamByName('qtdOri').value:= qtdOriginal;
      qAux2.ParamByName('qtdProd').value:= qtdProduzindo;
      qAux2.ParamByName('qtdPrev').value:= qtdPrevisto;
      qAux2.ParamByName('qtdFin').value:= qtdFinalizado;
      qAux2.ParamByName('IDOHS').value:= DModule.qAux.FieldByName('idO_H_S').AsInteger;
      qAux2.ExecSQL;

      DModule.qAux.next;
  end;

end;

procedure TF02002.ClientDataSet1AfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  inherited;
  calculoMovimentcao;
end;

procedure TF02002.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idmovimentacao.AsInteger := DModule.buscaProximoParametro('seqMovimentacao');
end;

procedure TF02002.DBEdit2Change(Sender: TObject);
begin
  inherited;
  if trim(DBEditBeleza2.Text) <> '' then
  begin
    DBEditBeleza1.Enabled := true;
  end else
    DBEditBeleza1.Enabled := false;
end;

procedure TF02002.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  if trim(DBEdit5.Text) <> '' then
  BEGIN
    IF(STRTOINT(DBEdit5.Text) > 0)THEN
    BEGIN
      DModule.qAux.Close;
      DModule.qAux.SQL.Text := 'select * from tipo_movimentacao where idtipo_movimentacao =:id';
      DModule.qAux.ParamByName('id').AsInteger:= (ClientDataSet1idTipoMovimentacao.AsInteger);
      DModule.qAux.Open;
      DModule.qAux.first;

      ShowMessage(DModule.qAux.FieldByName('incrementar').AsString);
      if (DModule.qAux.FieldByName('incrementar').AsBoolean = false) then
      begin
        DModule.qAux.Close;
        DModule.qAux.SQL.Text := 'select * from ORDEM_HAS_FASE where idordem_HAS_FASE =:id';
        DModule.qAux.ParamByName('id').AsInteger:= (ClientDataSet1idOrdem_has_fase.AsInteger);
        DModule.qAux.Open;
        DModule.qAux.first;
        IF(ClientDataSet1qtd.AsInteger > StrToInt(DModule.qAux.FieldByName('QTDPRODUZINDO').AsString))THEN
        BEGIN
          ShowMessage('INFORME UMA QUANTIDADE MENOR '+ 'QUE A QUANTIDADE PRODUZINDO (' + DModule.qAux.FieldByName('QTDPRODUZINDO').AsString+ ')');
          ClientDataSet1qtd.Clear;
        END;
      END;
    END ELSE
      BEGIN
      ShowMessage('INFORME UMA QUANTIDADE MAIOR QUE ZERO');
      ClientDataSet1qtd.Clear;
      END;
  END;

end;

procedure TF02002.DBEdit6Change(Sender: TObject);
begin
  inherited;
  //
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from ordem_producao where idordem =:id';
  DModule.qAux.ParamByName('id').AsInteger:= (ClientDataSet1idOrdem.AsInteger);
  DModule.qAux.Open;
  DModule.qAux.first;
end;

procedure TF02002.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  //
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from ordem_producao where idordem =:id';
  DModule.qAux.ParamByName('id').AsInteger:= (ClientDataSet1idOrdem.AsInteger);
  DModule.qAux.Open;
  DModule.qAux.first;

  if(DModule.qAux.IsEmpty)then
  begin
    DBEditBeleza2.Enabled := FALSE;
    DBEditBeleza2.Clear;
    DBEdit2.Clear;
    ClientDataSet1numOrdem.Clear;
    if NOT(ClientDataSet1idOrdem.IsNull)then
    begin
      ShowMessage('CÓDIGO NÃO ENCONTRADO');
    end;
  end else
  begin
    DBEditBeleza2.Enabled := TRUE;
    ClientDataSet1numOrdem.Value := StrToInt(DModule.qAux.FieldByName('numOrdem').AsString);

  end;
end;

procedure TF02002.DBEditBeleza1Change(Sender: TObject);
begin
  inherited;
  if trim(DBEdit6.Text) <> '' then
  begin
    DBEdit5.Enabled := false;
    DBEdit6.Clear;
    DBEdit5.Clear;
  end else
  begin
    DBEdit5.Enabled := true;
  end;
end;

procedure TF02002.DBEditBeleza2ButtonClick(Sender: TObject;
  var query_result: TFDQuery);
begin
  inherited;
  query_result.ParamByName('x').Value := (ClientDataSet1idOrdem.AsInteger);
end;

procedure TF02002.DBEditBeleza2Change(Sender: TObject);
begin
  inherited;
    if trim(DBEdit2.Text) <> '' then
  begin
    DBEditBeleza1.Enabled := true;
    DBEditBeleza1.Clear;
    DBEdit6.Clear;
    DBEdit2.Clear;
    DBEdit5.Clear;
  end else
  begin
    DBEditBeleza1.Enabled := false;
  end;
end;

procedure TF02002.Edit1Change(Sender: TObject);
begin
  inherited;
      if((edit1.Text = '')or (edit1.Text = ' '))then
  begin
    chkCodOrdem.Checked := false;
  end else
    chkCodOrdem.Checked := true;
end;

Initialization
  RegisterClass(TF02002);
Finalization
  UnRegisterClass(TF02002);
end.
