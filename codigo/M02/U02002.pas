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
  DBEditCalendario;

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
    procedure DBEditBeleza2ButtonClick(Sender: TObject;
      var query_result: TFDQuery);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure BInserirClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor CreateMov(AOwner : TComponent; pParm1 : integer);
    constructor CreateOrdemFase(AOwner : TComponent; pParm1 : integer);
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
end;

procedure TF02002.BEditarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit2.Color := CorCamposOnlyRead();
  DBEdit6.Color := CorCamposOnlyRead();
  DBEdit9.Color := $00EFEFEF;
end;

procedure TF02002.BInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit2.Color := CorCamposOnlyRead();
  DBEdit6.Color := CorCamposOnlyRead();
  DBEdit9.Color := $00EFEFEF;
end;

procedure TF02002.BSalvarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
  DBEdit2.Color := $00EFEFEF;
  DBEdit6.Color := $00EFEFEF;
  DBEdit9.Color := clWindow;
end;

procedure TF02002.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idmovimentacao.AsInteger := DModule.buscaProximoParametro('seqMovimentacao');
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
    ClientDataSet1numOrdem.Value := StrToInt(DModule.qAux.FieldByName('numOrdem').AsString);;

  end;
end;

procedure TF02002.DBEditBeleza2ButtonClick(Sender: TObject;
  var query_result: TFDQuery);
begin
  inherited;
  query_result.ParamByName('x').Value := (ClientDataSet1idOrdem.AsInteger);
end;

Initialization
  RegisterClass(TF02002);
Finalization
  UnRegisterClass(TF02002);
end.
