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
    FDQuery1SEQUENCIA: TIntegerField;
    ClientDataSet1SEQUENCIA: TIntegerField;
    Edit3: TEdit;
    EditBeleza2: TEditBeleza;
    Label10: TLabel;
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
    procedure DBEditBeleza2DepoisPesquisa(Sender: TObject;
      var query_result: TDataSet);
    procedure EditBeleza2ButtonClick(Sender: TObject;
      var query_result: TFDQuery);
    procedure Edit3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor CreateMov(AOwner : TComponent; pParm1 : integer);
    constructor CreateOrdemFase(AOwner : TComponent; pParm1 : integer);
    //procedure calculoMovimentcao(idOrd: integer);
    public sequenciaRetrabalho : integer;
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
  FDQuery1.SQL.Text := 'select m.*, OHF.SEQUENCIA, o.* , tm.descricao as tipoMovimentacao, f.descricao as fase from movimentacao m ';
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
matriz: array of array of integer;
idProd, idN, NOrdem, qtd, idOrdem : Integer;
qtdInsereMatriz : integer;
QTD_PRODUZINDO, QTD_PREVISTA, QTD_FINALIZADA, QTD_Original, I, IDFASE, IDGRUPO, SEQUENCIA: INTEGER;
obs : string;
QAUX2: TFDQUERY;
status,dividirAvancar, dividirRetrabalho : boolean;
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

    dividirAvancar := DModule.qAux.FieldByName('dividirOrdemAvancar').AsBoolean;
    dividirRetrabalho := DModule.qAux.FieldByName('dividirOrdemRetrabalho').AsBoolean;

    if(dividirAvancar = true)or(dividirRetrabalho = true)then
    begin
        //ShowMessage('DividirOrdem');
        QAUX2 := TFDQuery.Create(SELF);
        QAUX2.Connection := DModule.FDConnection;
        QTD_Original := strtoint(dbedit5.Text);

        //Aqui vou criar outra ordem com as mesmas fases e com a quantidade indormada,
        // em observações basta informar que é uma ordem de Finalização parcial.
        DModule.qAux.Close;
        DModule.qAux.SQL.Text := 'select * from ordem_producao where idOrdem =:id';
        DModule.qAux.ParamByName('id').AsInteger := ClientDataSet1idOrdem.AsInteger;
        DModule.qAux.Open;

        //Obtenção dos valores das variáveis
        idProd := DModule.qAux.FieldByName('idProduto').AsInteger;
        IF(dividirAvancar = TRUE)THEN
        BEGIN
          obs := 'Finalização Parcial da Ordem ' + inttostr(DModule.qAux.FieldByName('numOrdem').AsInteger);
        END ELSE
          obs := 'Retrabalho da Ordem ' + inttostr(DModule.qAux.FieldByName('numOrdem').AsInteger);

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
        ShowMessage('Ordem de produção criada com sucesso!');

        //Pega as fases do produto selecionado e trás um idGRUPO habilitado a realizar a fase sorteado aleatório
        DModule.qAux.Close;
        DModule.qAux.SQL.Text := 'select phf.*, (select idgrupo from fase_has_grupo fhg where idfase = phf.idfase ORDER BY RAND() LIMIT 1) as idGrupo from produto_has_fase phf where idProduto =:idProd order by (sequencia)';
        DModule.qAux.ParamByName('idProd').AsInteger:= (idprod);
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
            qtdInsereMatriz := 0;
            //Declaração do tamanho da Matriz
            for i := 0 to (DModule.qAux.RecordCount -1) do
            begin
              //DIVIDIR ORDEM AVANCAR
              if(dividirAvancar = true)then
              begin
                  if(DModule.qAux.FieldByName('sequencia').AsInteger > ClientDataSet1SEQUENCIA.AsInteger)then
                  begin
                    qtdInsereMatriz := qtdInsereMatriz +1;
                  end;
              end else
              begin
                //DIVIDIR ORDEM RETRABALHO
                if(dividirRetrabalho = true)then
                begin
                    if(DModule.qAux.FieldByName('sequencia').AsInteger >= sequenciaRetrabalho )then
                    begin
                      qtdInsereMatriz := qtdInsereMatriz +1;
                    end;
                end;
              end;
              DModule.qAux.Next;
            end;
            DModule.qAux.first;

            SetLength(matriz, qtdInsereMatriz);
            for i := 0 to (qtdInsereMatriz -1) do
            begin
              SetLength(matriz[i], 8);
            end;

            //Atribui valores na matriz
            i := 0;
            while not DModule.qAux.eof do
            begin
                if(dividirAvancar = true)then
                begin
                    if(DModule.qAux.FieldByName('sequencia').AsInteger > ClientDataSet1SEQUENCIA.AsInteger)then
                    begin
                        //idOrdem
                        matriz[i][0] := idn;

                        //IdFase
                        matriz[i][1] := DModule.qAux.FieldByName('idfase').AsInteger;

                        //QtdOriginal
                        matriz[i][2] := ClientDataSet1qtd.AsInteger;

                        //qtdPrevisto
                        IF(i = 0)THEN
                        BEGIN
                          matriz[i][3] := 0;
                        END ELSE
                          matriz[i][3] := ClientDataSet1qtd.AsInteger;

                        //QtdFinalizado
                        matriz[i][4] := 0;

                        //QtdProduzindo
                        IF(i = 0)THEN
                        BEGIN
                        matriz[i][5] := ClientDataSet1qtd.AsInteger;;
                        END ELSE
                        matriz[i][5] := 0;

                        //Sequencia
                        matriz[i][6] := DModule.qAux.FieldByName('sequencia').AsInteger;

                        //Grupo Selecionado aleatoriamente para produzir
                        matriz[i][7] := DModule.qAux.FieldByName('idGrupo').AsInteger;
                        i := i+1;
                    end;
                end else
                begin
                  if(dividirRetrabalho = true)then
                  begin
                      if(DModule.qAux.FieldByName('sequencia').AsInteger >= sequenciaRetrabalho)then
                      begin
                        //idOrdem
                        matriz[i][0] := idn;

                        //IdFase
                        matriz[i][1] := DModule.qAux.FieldByName('idfase').AsInteger;

                        //QtdOriginal
                        matriz[i][2] := ClientDataSet1qtd.AsInteger;

                        //qtdPrevisto
                        IF(i = 0)THEN
                        BEGIN
                          matriz[i][3] := 0;
                        END ELSE
                          matriz[i][3] := ClientDataSet1qtd.AsInteger;

                        //QtdFinalizado
                        matriz[i][4] := 0;

                        //QtdProduzindo
                        IF(i = 0)THEN
                        BEGIN
                        matriz[i][5] := ClientDataSet1qtd.AsInteger;;
                        END ELSE
                        matriz[i][5] := 0;

                        //Sequencia
                        matriz[i][6] := DModule.qAux.FieldByName('sequencia').AsInteger;

                        //Grupo Selecionado aleatoriamente para produzir
                        matriz[i][7] := DModule.qAux.FieldByName('idGrupo').AsInteger;
                        i := i+1;
                      end;
                  end;
                end;
                DModule.qAux.next;
            end;

            //Cria Registro de Ordem_has_fase da nova fase.
            for i := 0 to (Length(matriz)-1) do
            begin
              //sql inseri ordem_has_fase
              QAUX2.Close;
              QAUX2.SQL.Text := 'INSERT INTO ordem_has_fase(idOrdem_has_fase, idOrdem,idfase,qtdOriginal,qtdPrevista,qtdProduzindo,idLinhaProducao,SEQUENCIA,qtdFinalizada)VALUES( ' +
              INTTOSTR(DModule.buscaProximoParametro('seqOrdemFase')) +', ' +
              INTTOSTR(matriz[i][0]) + ', ' + //idOrdem
              INTTOSTR(matriz[i][1]) + ', ' + //IdFase
              inttostr(matriz[i][2]) + ', ' + //qtdOriginal
              INTTOSTR(matriz[i][3]) + ', ' + //QTDPREVISTA
              INTTOSTR(matriz[i][5]) + ', ' + //QTDPRODUZINDO
              INTTOSTR(matriz[i][7]) + ', ' + //IDLINHApRODUÇAO
              INTTOSTR(matriz[i][6]) + ', ' + //SEQUENCIA
              INTTOSTR(matriz[i][4]) + //QTDFINALIZADA
              ')';
              QAUX2.ExecSQL;
            end;
        end;
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
{
procedure TF02002.calculoMovimentcao(idOrd: integer);
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
  DModule.qAux.ParamByName('idO').AsInteger:= idOrd;
  DModule.qAux.Open;
  DModule.qAux.first;

  // Seta valores na primeira fase da ordem;
  qAux2.Close;
  qAux2.SQL.Text := 'UPDATE ordem_has_fase SET qtdOriginal =:qtdO, qtdProduzindo =:qtdO, qtdPrevista = 0, qtdFinalizada = 0 WHERE idOrdem_has_fase =:IDOHS';
  qAux2.ParamByName('qtdO').value:= DModule.qAux.FieldByName('qORI').AsInteger;
  qAux2.ParamByName('IDOHS').value:= DModule.qAux.FieldByName('idO_H_S').AsInteger;
  qAux2.ExecSQL;

  ShowMessage('Ok calculo MOV');

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
{      qAux2.Close;
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
        if(qAux2.FieldByName('dividirOrdemAvancar').AsBoolean = true)then
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
}

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
var
qaux2 : TFDQuery;
begin
  inherited;
  IF TRIM(DBEDIT6.Text) <> '' THEN
  BEGIN
      if DS.DataSet.State=dsInsert then
      begin
        DModule.qAux.Close;
        DModule.qAux.SQL.Text := 'select * from TIPO_MOVIMENTACAO where idTIPO_MOVIMENTACAO =:id';
        DModule.qAux.ParamByName('id').AsInteger:= (ClientDataSet1idTipoMovimentacao.AsInteger);
        DModule.qAux.Open;
        DModule.qAux.first;
        IF(DModule.qAux.FieldByName('dividirOrdemRetrabalho').AsBoolean = TRUE)THEN
        begin
              //verifica se existem fases anteriores para fazer o retrabalho
             qaux2 := TFDQuery.Create(self);
             qaux2.Connection := DModule.FDConnection;
             qaux2.sql.Text := 'select ohf.idOrdem_has_fase, f.descricao from ordem_has_fase ohf ';
             qaux2.sql.Add('left outer join fase f on ohf.idfase =  f.idfase ');
             qaux2.sql.Add('where ');
             qaux2.sql.Add('ohf.idOrdem_has_fase in (select distinct idOrdem_has_fase from ordem_has_fase where idOrdem =:x) ');
             qaux2.sql.Add('and ohf.idOrdem_has_fase < :idordF');
             qaux2.ParamByName('x').AsInteger :=  (ClientDataSet1idOrdem.AsInteger);
             qaux2.ParamByName('idordF').AsInteger := (ClientDataSet1idOrdem_has_fase.AsInteger);
             qaux2.open;

             if not(qaux2.IsEmpty)then
             begin
                Edit3.Clear;
                EditBeleza2.enabled := true;
             end else
                begin
                DBEdit6.Clear;
                DBEditBeleza1.Clear;
                ShowMessage('Não há fases anteriores habilitadas para Retrabalho');
                DBEditBeleza1.SetFocus;
                end;
        END else
        begin
            Edit3.Clear;
            EditBeleza2.Clear;
            EditBeleza2.enabled := false;
        end;


        if (DModule.qAux.FieldByName('finalizarTotal').AsBoolean = true) then
        begin
            DModule.qAux.Close;
            DModule.qAux.SQL.Text := 'select * from ORDEM_HAS_FASE where idordem_HAS_FASE =:id';
            DModule.qAux.ParamByName('id').AsInteger:= (ClientDataSet1idOrdem_has_fase.AsInteger);
            DModule.qAux.Open;
            ShowMessage('oi');
            DBEdit5.Text := DModule.qAux.FieldByName('qtdProduzindo').AsString;
            ClientDataSet1qtd.AsInteger := DModule.qAux.FieldByName('qtdProduzindo').AsInteger;
            DBEdit5.Enabled := false;
        end else
          DBEdit5.Enabled := true;
      end;

  END else
  begin
        Edit3.Clear;
        EditBeleza2.Clear;
        EditBeleza2.enabled := false;
  end;

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
      DBEdit8.SetFocus;
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

procedure TF02002.DBEditBeleza2DepoisPesquisa(Sender: TObject;
  var query_result: TDataSet);
begin
  inherited;
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'SELECT SEQUENCIA FROM ORDEM_HAS_FASE WHERE IDORDEM_HAS_FASE =:IDOHF';
  DModule.qAux.ParamByName('IDOHF').AsInteger := ClientDataSet1idOrdem_has_fase.AsInteger;
  DModule.qAux.Open;
  ClientDataSet1SEQUENCIA.Value := DModule.qAux.FieldByName('SEQUENCIA').AsInteger;
end;

Procedure TF02002.Edit1Change(Sender: TObject);
begin
  inherited;
      if((edit1.Text = '')or (edit1.Text = ' '))then
  begin
    chkCodOrdem.Checked := false;
  end else
    chkCodOrdem.Checked := true;
end;

procedure TF02002.Edit3Change(Sender: TObject);
begin
  inherited;
  //
  if Trim(EDIT3.Text) <> '' then
  begin
    DModule.qAux.Close;
    DModule.qAux.sql.Text := 'select sequencia from ordem_has_fase where idOrdem_has_fase = :idOHF';
    DModule.qAux.ParamByName('idOHF').AsInteger := STRTOINT(EDIT3.Text);
    DModule.qAux.Open();
    sequenciaRetrabalho := DModule.qAux.FieldByName('sequencia').AsInteger;
  end else
    sequenciaRetrabalho := 0;
end;

procedure TF02002.EditBeleza2ButtonClick(Sender: TObject;
  var query_result: TFDQuery);
begin
  inherited;
  query_result.ParamByName('x').Value := (ClientDataSet1idOrdem.AsInteger);
  query_result.ParamByName('idordF').Value := (ClientDataSet1idOrdem_has_fase.AsInteger);
end;

Initialization
  RegisterClass(TF02002);
Finalization
  UnRegisterClass(TF02002);
end.
