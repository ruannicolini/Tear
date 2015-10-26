unit U01011;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider, Datasnap.DBClient, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, DBGridBeleza, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TF01011 = class(TFBase)
    FDQuery1idfase: TIntegerField;
    FDQuery1descricao: TStringField;
    ClientDataSet1idfase: TIntegerField;
    ClientDataSet1descricao: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure acInserirExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure acSalvarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F01011: TF01011;

implementation

{$R *.dfm}

uses
uDataModule;

procedure TF01011.acCancelarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
end;

procedure TF01011.acEditarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
end;

procedure TF01011.acExcluirExecute(Sender: TObject);
begin
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from operacao op where op.idfase =:idFase';
  DModule.qAux.ParamByName('idFase').AsInteger:= (ClientDataSet1idfase.AsInteger);
  DModule.qAux.Open;
  if(DModule.qAux.IsEmpty)then
  begin
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'select * from fase_has_grupo fhg where fhg.idFase =:idFase';
    DModule.qAux.ParamByName('idFase').AsInteger:= (ClientDataSet1idfase.AsInteger);
    DModule.qAux.Open;
    if(DModule.qAux.IsEmpty)then
    begin
      inherited;
    end else
      ShowMessage('Grupo de Operadores vinculado a esta Fase. Não é possível excluir.');
  end else
    ShowMessage('Operação vinculada a esta Fase. Não é possível excluir.');

end;

procedure TF01011.acInserirExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
end;

procedure TF01011.acSalvarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
end;

procedure TF01011.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idfase.AsInteger := DModule.buscaProximoParametro('seqFase');

end;

Initialization
  RegisterClass(TF01011);
Finalization
  UnRegisterClass(TF01011);
end.
