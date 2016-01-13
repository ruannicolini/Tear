unit U01013;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider, Datasnap.DBClient, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, DBGridBeleza, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask, DBEditBeleza;

type
  TF01013 = class(TFBase)
    FDQuery1idcronometragem: TIntegerField;
    FDQuery1tempo_original: TBooleanField;
    FDQuery1tempo_ideal: TBooleanField;
    FDQuery1ritmo: TIntegerField;
    FDQuery1num_pecas: TIntegerField;
    FDQuery1tolerancia: TIntegerField;
    FDQuery1comprimento_prod: TSingleField;
    FDQuery1num_ocorrencia: TIntegerField;
    FDQuery1idProduto: TIntegerField;
    FDQuery1idCronometrista: TIntegerField;
    FDQuery1idTecido: TIntegerField;
    FDQuery1idOperacao: TIntegerField;
    FDQuery1idOperador: TIntegerField;
    ClientDataSet1idcronometragem: TIntegerField;
    ClientDataSet1tempo_original: TBooleanField;
    ClientDataSet1tempo_ideal: TBooleanField;
    ClientDataSet1ritmo: TIntegerField;
    ClientDataSet1num_pecas: TIntegerField;
    ClientDataSet1tolerancia: TIntegerField;
    ClientDataSet1comprimento_prod: TSingleField;
    ClientDataSet1num_ocorrencia: TIntegerField;
    ClientDataSet1idProduto: TIntegerField;
    ClientDataSet1idCronometrista: TIntegerField;
    ClientDataSet1idTecido: TIntegerField;
    ClientDataSet1idOperacao: TIntegerField;
    ClientDataSet1idOperador: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
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
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DataSource2: TDataSource;
    ClientDataSet2: TClientDataSet;
    DataSetProvider2: TDataSetProvider;
    FDQuery2: TFDQuery;
    FDQuery2idProduto: TIntegerField;
    FDQuery2descricao: TStringField;
    FDQuery2data: TDateField;
    FDQuery2idGrupo: TIntegerField;
    ClientDataSet2idProduto: TIntegerField;
    ClientDataSet2descricao: TStringField;
    ClientDataSet2data: TDateField;
    ClientDataSet2idGrupo: TIntegerField;
    ClientDataSet1produto: TStringField;
    DBEditBeleza1: TDBEditBeleza;
    DataSource3: TDataSource;
    ClientDataSet3: TClientDataSet;
    DataSetProvider3: TDataSetProvider;
    FDQuery3: TFDQuery;
    DBEditBeleza2: TDBEditBeleza;
    ClientDataSet1operacao: TStringField;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
    ClientDataSet4: TClientDataSet;
    ClientDataSet5: TClientDataSet;
    ClientDataSet6: TClientDataSet;
    DataSetProvider4: TDataSetProvider;
    DataSetProvider5: TDataSetProvider;
    DataSetProvider6: TDataSetProvider;
    FDQuery4: TFDQuery;
    FDQuery5: TFDQuery;
    FDQuery6: TFDQuery;
    DBEditBeleza3: TDBEditBeleza;
    FDQuery4idtecido: TIntegerField;
    FDQuery4descricao: TStringField;
    ClientDataSet4idtecido: TIntegerField;
    ClientDataSet4descricao: TStringField;
    ClientDataSet1tecido: TStringField;
    FDQuery5idoperador: TIntegerField;
    FDQuery5nome: TStringField;
    FDQuery5idGrupo: TIntegerField;
    FDQuery6idcronometrista: TIntegerField;
    FDQuery6nome: TStringField;
    ClientDataSet5idoperador: TIntegerField;
    ClientDataSet5nome: TStringField;
    ClientDataSet5idGrupo: TIntegerField;
    ClientDataSet6idcronometrista: TIntegerField;
    ClientDataSet6nome: TStringField;
    ClientDataSet1operador: TStringField;
    DBEditBeleza4: TDBEditBeleza;
    DBEditBeleza5: TDBEditBeleza;
    ClientDataSet1cronometrista: TStringField;
    Panel3: TPanel;
    DBCheckBox2: TDBCheckBox;
    Panel4: TPanel;
    DBCheckBox3: TDBCheckBox;
    procedure DBEditBeleza1Click(Sender: TObject);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F01013: TF01013;

implementation

{$R *.dfm}

uses
uDataModule;

procedure TF01013.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idcronometragem.AsInteger := DModule.buscaProximoParametro('seqCronometragem');
end;

procedure TF01013.DBEditBeleza1Click(Sender: TObject);
begin
  inherited;
  DBEdit7.Text := '';
  DBEditBeleza1.Text := '';
end;

Initialization
  RegisterClass(TF01013);
Finalization
  UnRegisterClass(TF01013);
end.