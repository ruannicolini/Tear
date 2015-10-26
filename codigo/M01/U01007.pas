unit U01007;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider, Datasnap.DBClient, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, DBGridBeleza, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, DBEditBeleza, DBEditCalendario;

type
  TF01007 = class(TFBase)
    FDQuery2: TFDQuery;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    DataSource1: TDataSource;
    FDQuery2idgrupo_Produto: TIntegerField;
    FDQuery2descricao: TStringField;
    ClientDataSet2idgrupo_Produto: TIntegerField;
    ClientDataSet2descricao: TStringField;
    FDQuery1idProduto: TIntegerField;
    FDQuery1descricao: TStringField;
    FDQuery1data: TDateField;
    FDQuery1idGrupo: TIntegerField;
    ClientDataSet1idProduto: TIntegerField;
    ClientDataSet1descricao: TStringField;
    ClientDataSet1data: TDateField;
    ClientDataSet1idGrupo: TIntegerField;
    ClientDataSet1grupo: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEditBeleza1: TDBEditBeleza;
    DBEdit_Calendario1: TDBEdit_Calendario;
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
  F01007: TF01007;

implementation

{$R *.dfm}

uses
uDataModule;

procedure TF01007.acCancelarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
  DBEdit4.Color := clWindow;
end;

procedure TF01007.acEditarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit4.Color := CorCamposOnlyRead();
end;

procedure TF01007.acExcluirExecute(Sender: TObject);
begin
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from cronometragem c where c.idProduto =:idProd';
  DModule.qAux.ParamByName('idProd').AsInteger:= (ClientDataSet1idProduto.AsInteger);
  DModule.qAux.Open;
  if(DModule.qAux.IsEmpty)then
  begin
    inherited;
  end else
    ShowMessage('Cronometragem vinculada a este Produto. Não é possível excluir.');


end;

procedure TF01007.acInserirExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit4.Color := CorCamposOnlyRead();
end;

procedure TF01007.acSalvarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
  DBEdit4.Color := clWindow;
end;

procedure TF01007.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idProduto.AsInteger := DModule.buscaProximoParametro('seqProduto');

end;

Initialization
  RegisterClass(TF01007);
Finalization
  UnRegisterClass(TF01007);
end.
