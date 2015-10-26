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
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, DBEditBeleza;

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
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
    FDQuery4: TFDQuery;
    DataSetProvider2: TDataSetProvider;
    DataSetProvider3: TDataSetProvider;
    DataSetProvider4: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    ClientDataSet4: TClientDataSet;
    DS_ACAO: TDataSource;
    DS_PARTE: TDataSource;
    DS_FASE: TDataSource;
    GroupBox1: TGroupBox;
    FDQuery2idacao: TIntegerField;
    FDQuery2descricao: TStringField;
    FDQuery3idparte: TIntegerField;
    FDQuery3descricao: TStringField;
    FDQuery4idfase: TIntegerField;
    FDQuery4descricao: TStringField;
    ClientDataSet2idacao: TIntegerField;
    ClientDataSet2descricao: TStringField;
    ClientDataSet4idfase: TIntegerField;
    ClientDataSet4descricao: TStringField;
    ClientDataSet3idparte: TIntegerField;
    ClientDataSet3descricao: TStringField;
    ClientDataSet1acao: TStringField;
    ClientDataSet1parte: TStringField;
    ClientDataSet1fase: TStringField;
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
    procedure acInserirExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure acExcluirExecute(Sender: TObject);
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
uDataModule;

procedure TF01008.acCancelarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;

  DBEdit3.Color := clWindow;
  DBEdit4.Color := clWindow;
  DBEdit5.Color := clWindow;
end;

procedure TF01008.acEditarExecute(Sender: TObject);
begin
  inherited;
  PageControl.ActivePageIndex := 0;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit3.Color := CorCamposOnlyRead();
  DBEdit4.Color := CorCamposOnlyRead();
  DBEdit5.Color := CorCamposOnlyRead();
end;

procedure TF01008.acExcluirExecute(Sender: TObject);
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

procedure TF01008.acInserirExecute(Sender: TObject);
begin
  inherited;
  PageControl.ActivePageIndex := 0;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit3.Color := CorCamposOnlyRead();
  DBEdit4.Color := CorCamposOnlyRead();
  DBEdit5.Color := CorCamposOnlyRead();
end;

procedure TF01008.acSalvarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;

  DBEdit3.Color := clWindow;
  DBEdit4.Color := clWindow;
  DBEdit5.Color := clWindow;
end;

procedure TF01008.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idoperacao.AsInteger := DModule.buscaProximoParametro('seqOperacao');

end;

Initialization
  RegisterClass(TF01008);
Finalization
  UnRegisterClass(TF01008);
end.
