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
  Edit_Calendario, DBEditCalendario, Vcl.Tabs, Vcl.ToolWin;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F02001: TF02001;

implementation

{$R *.dfm}

uses uDataModule;

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

procedure TF02001.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  {Fase}
  FDQuery2.ParamByName('idOrdem').Value:=(ClientDataSet1idOrdem.AsInteger);
  DataSource2.DataSet.Close;
  DataSource2.DataSet.Open;
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

end;

procedure TF02001.TBtnLimparClick(Sender: TObject);
begin
  inherited;

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


end;

procedure TF02001.TBtnProcessarRotaClick(Sender: TObject);
var
matriz: array of array of integer;
i : integer;
begin
  inherited;
  //Pega as fases do produto selecionado
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from produto_has_fase where idProduto =:idProd order by (sequencia)';
  DModule.qAux.ParamByName('idProd').AsInteger:= (ClientDataSet1idProduto.AsInteger);
  DModule.qAux.Open;
  DModule.qAux.first;

  //Declaração do tamanho da Matriz
  SetLength(matriz, DModule.qAux.RecordCount);
  for i := 0 to (DModule.qAux.RecordCount -1) do
  begin
    SetLength(matriz[i], 6);
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
    ClientDataSet2.Post;

  end;

  DataSource2.DataSet.Close;
  DataSource2.DataSet.Open;

end;

Initialization
  RegisterClass(TF02001);
Finalization
  UnRegisterClass(TF02001);
end.
