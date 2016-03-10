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
    qAux2: TFDQuery;
    BitBtn1: TBitBtn;
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
    procedure BitBtn1Click(Sender: TObject);
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

procedure TF02002.BInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit2.Color := CorCamposOnlyRead();
  DBEdit6.Color := CorCamposOnlyRead();
  DBEdit9.Color := $00EFEFEF;

  DBEditBeleza1.Enabled := true;
  DBEditBeleza2.Enabled := true;
  DBEdit5.Enabled := true;
end;

procedure TF02002.BitBtn1Click(Sender: TObject);
begin
  inherited;
  calculoMovimentcao;
end;

procedure TF02002.BSalvarClick(Sender: TObject);
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

  //
  calculoMovimentcao;
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
begin

  //Busca fases da ordem;
  DModule.qAux.Close;
  DModule.qAux.SQL.Text :='SELECT OHF.*,ohf.idOrdem_has_fase as idO_H_S, OP.qtdOriginal AS qORI FROM ordem_has_fase OHF LEFT OUTER JOIN ordem_producao OP ON OHF.idOrdem = OP.idORDEM where OHF.idORDEM =:IDO Order by (sequencia)';
  DModule.qAux.ParamByName('idO').AsInteger:= (ClientDataSet1idOrdem.AsInteger);
  DModule.qAux.Open;
  DModule.qAux.first;

  // Seta valores na primeira fase da ordem;
  qAux2.Close;
  qAux2.SQL.Text := 'uPDATE ordem_has_fase SET qtdOriginal =:qtdO, qtdProduzindo =:qtdO, qtdPrevista = 0, qtdFinalizada = 0 WHERE idOrdem_has_fase =:IDOHS';
  qAux2.ParamByName('qtdO').value:= DModule.qAux.FieldByName('qORI').AsInteger;
  qAux2.ParamByName('IDOHS').value:= DModule.qAux.FieldByName('idO_H_S').AsInteger;
  qAux2.ExecSQL;

  //
  while not DModule.qAux.eof do
  begin
      {
      //busca movimentações da ordem_has_fase
      qAux2.Close;
      qAux2.SQL.Text := 'select m.*, ohf.* from movimentacao m ';
      qAux2.SQL.Add('left outer join ordem_has_fase ohf on ohf.idOrdem_has_fase = m.idOrdem_has_fase ');
      qAux2.SQL.Add('where ohf.idordem =:idOrdem and M.idOrdem_has_fase =: idOrdemFase');
      qAux2.SQL.Add('order by (M.idOrdem_has_fase)');
      qAux2.ParamByName('idOrdem').AsInteger:= (ClientDataSet1idOrdem.AsInteger);
      qAux2.ParamByName('idOrdemFase').AsInteger:= StrToInt(DModule.qAux.FieldByName('idOrdem_has_fase').AsString);
      qAux2.Open;
      qAux2.first;

      }

      DModule.qAux.next;
  end;



  //Manipulação dos dados da movimentação
  {qAux2.Close;
  qAux2.SQL.Text := 'select m.*, ohf.* from movimentacao m ';
  qAux2.SQL.Add('left outer join ordem_has_fase ohf on ohf.idOrdem_has_fase = m.idOrdem_has_fase ');
  qAux2.SQL.Add('where ohf.idordem =:idOrdem ');
  qAux2.SQL.Add('order by (M.idOrdem_has_fase)');
  qAux2.ParamByName('idOrdem').AsInteger:= (ClientDataSet1idOrdem.AsInteger);
  qAux2.Open;
  qAux2.first;
  }

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
      if NOT(ClientDataSet1idTipoMovimentacao.AsInteger = 1) then
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
  if trim(DBEditBeleza1.Text) <> '' then
  begin
    DBEdit5.Enabled := true;
  end else
    DBEdit5.Enabled := false;
end;

procedure TF02002.DBEditBeleza2ButtonClick(Sender: TObject;
  var query_result: TFDQuery);
begin
  inherited;
  query_result.ParamByName('x').Value := (ClientDataSet1idOrdem.AsInteger);
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
