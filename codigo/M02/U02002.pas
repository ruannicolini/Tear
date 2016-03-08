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
    ClientDataSet1idProduto: TIntegerField;
    ClientDataSet1qtdOriginal: TIntegerField;
    ClientDataSet1dataCadastro: TDateField;
    ClientDataSet1observacao_1: TStringField;
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
    DBEdit7: TDBEdit;
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
    procedure DBEditBeleza2ButtonClick(Sender: TObject;
      var query_result: TFDQuery);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F02002: TF02002;

implementation

{$R *.dfm}

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
