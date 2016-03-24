unit U02003;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Datasnap.DBClient, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, DBGridBeleza,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TF02003 = class(TFBase)
    FDQuery1idtipo_Movimentacao: TIntegerField;
    FDQuery1descricao: TStringField;
    ClientDataSet1idtipo_Movimentacao: TIntegerField;
    ClientDataSet1descricao: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    CHKINCREMENTAR: TDBCheckBox;
    CHKDECREMENTAR: TDBCheckBox;
    CHKFINALIZAR: TDBCheckBox;
    CHKDIVIDIR: TDBCheckBox;
    FDQuery1incrementar: TBooleanField;
    FDQuery1decrementar: TBooleanField;
    FDQuery1finalizar: TBooleanField;
    ClientDataSet1incrementar: TBooleanField;
    ClientDataSet1decrementar: TBooleanField;
    ClientDataSet1finalizar: TBooleanField;
    FDQuery1dividirOrdemAvancar: TBooleanField;
    FDQuery1dividirOrdemRetrabalho: TBooleanField;
    ClientDataSet1dividirOrdemAvancar: TBooleanField;
    ClientDataSet1dividirOrdemRetrabalho: TBooleanField;
    DBCheckBox1: TDBCheckBox;
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
  F02003: TF02003;

implementation

{$R *.dfm}

uses
UDataModule;

procedure TF02003.Action5Execute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
end;

procedure TF02003.BEditarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
end;

procedure TF02003.BInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  CHKINCREMENTAR.Checked := FALSE;
  CHKDECREMENTAR.Checked := FALSE;
  CHKFINALIZAR.Checked := FALSE;
  CHKDIVIDIR.Checked := FALSE;
end;

procedure TF02003.BSalvarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
end;

procedure TF02003.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idtipo_Movimentacao.AsInteger := DModule.buscaProximoParametro('seqTipoMovimentacao');

end;

Initialization
  RegisterClass(TF02003);
Finalization
  UnRegisterClass(TF02003);
end.
