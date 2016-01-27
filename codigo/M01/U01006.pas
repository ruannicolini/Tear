unit U01006;

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
  TF01006 = class(TFBase)
    FDQuery1idRecurso: TIntegerField;
    FDQuery1patrimonio: TIntegerField;
    FDQuery1descricao: TStringField;
    FDQuery1idTipoRecurso: TIntegerField;
    ClientDataSet1idRecurso: TIntegerField;
    ClientDataSet1patrimonio: TIntegerField;
    ClientDataSet1descricao: TStringField;
    ClientDataSet1idTipoRecurso: TIntegerField;
    FDQuery2: TFDQuery;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    DataSource1: TDataSource;
    FDQuery2idtipo_recurso: TIntegerField;
    FDQuery2descricao: TStringField;
    ClientDataSet2idtipo_recurso: TIntegerField;
    ClientDataSet2descricao: TStringField;
    ClientDataSet1recurso: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEditBeleza1: TDBEditBeleza;
    procedure acInserirExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure BInserirClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F01006: TF01006;

implementation

{$R *.dfm}

uses
uDataModule;

procedure TF01006.acCancelarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
  DBEdit4.Color := clWindow;
end;

procedure TF01006.acEditarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit4.Color := CorCamposOnlyRead();
end;


procedure TF01006.acInserirExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit4.Color := CorCamposOnlyRead();
end;

procedure TF01006.acSalvarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
  DBEdit4.Color := clWindow;
end;

procedure TF01006.Action5Execute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
  DBEdit4.Color := clWindow;
end;

procedure TF01006.BEditarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit4.Color := CorCamposOnlyRead();
end;

procedure TF01006.BInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit4.Color := CorCamposOnlyRead();
end;

procedure TF01006.BSalvarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
  DBEdit4.Color := clWindow;
end;

procedure TF01006.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idRecurso.AsInteger :=DModule.buscaProximoParametro('seqRecurso');

end;

Initialization
  RegisterClass(TF01006);
Finalization
  UnRegisterClass(TF01006);
end.
