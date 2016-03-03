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
  Edit_Calendario, DBEditCalendario, Vcl.Tabs;

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
    DBEdit6: TDBEdit;
    DBEditBeleza1: TDBEditBeleza;
    DBEdit_Calendario1: TDBEdit_Calendario;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    MOVIMENTAÇÕES: TTabSheet;
    GroupBox1: TGroupBox;
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
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure DSDataChange(Sender: TObject; Field: TField);
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

procedure TF02001.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  {Fase}
  FDQuery2.ParamByName('idOrdem').Value:=(ClientDataSet1idOrdem.AsInteger);
  DataSource2.DataSet.Close;
  DataSource2.DataSet.Open;
end;

Initialization
  RegisterClass(TF02001);
Finalization
  UnRegisterClass(TF02001);
end.
