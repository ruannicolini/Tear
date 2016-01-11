unit U01004;

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
  TF01004 = class(TFBase)
    FDQuery1idtipo_recurso: TIntegerField;
    FDQuery1descricao: TStringField;
    ClientDataSet1idtipo_recurso: TIntegerField;
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
    procedure BInserirClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F01004: TF01004;

implementation

{$R *.dfm}

uses
uDataModule;

procedure TF01004.acCancelarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
end;

procedure TF01004.acEditarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
end;

procedure TF01004.acExcluirExecute(Sender: TObject);
begin
  {Contole de Exclusão}
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from recurso rec where rec.idtiporecurso =:idTipoRecurso';
  DModule.qAux.ParamByName('idTipoRecurso').AsInteger:= (ClientDataSet1idtipo_recurso.AsInteger);
  DModule.qAux.Open;
  if(DModule.qAux.IsEmpty)then
  begin
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'select * from cronometragem_has_tipo_recurso x where x.idtiporecurso =:idTipoRecurso';
    DModule.qAux.ParamByName('idTipoRecurso').AsInteger:= (ClientDataSet1idtipo_recurso.AsInteger);
    DModule.qAux.Open;
    if(DModule.qAux.IsEmpty)then
    begin
        inherited;
    end else
      ShowMessage('Operador habilitado a esse tipo de Recurso. Não é possível excluir.')
  end else
    ShowMessage('Recurso vinculado a este Tipo. Não é possível excluir.');

end;

procedure TF01004.acInserirExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
end;

procedure TF01004.acSalvarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
end;

procedure TF01004.BCancelarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
end;

procedure TF01004.BEditarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
end;

procedure TF01004.BExcluirClick(Sender: TObject);
begin
  inherited;
  {Contole de Exclusão}
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from recurso rec where rec.idtiporecurso =:idTipoRecurso';
  DModule.qAux.ParamByName('idTipoRecurso').AsInteger:= (ClientDataSet1idtipo_recurso.AsInteger);
  DModule.qAux.Open;
  if(DModule.qAux.IsEmpty)then
  begin
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'select * from cronometragem_has_tipo_recurso x where x.idtiporecurso =:idTipoRecurso';
    DModule.qAux.ParamByName('idTipoRecurso').AsInteger:= (ClientDataSet1idtipo_recurso.AsInteger);
    DModule.qAux.Open;
    if(DModule.qAux.IsEmpty)then
    begin
        inherited;
    end else
      ShowMessage('Operador habilitado a esse tipo de Recurso. Não é possível excluir.')
  end else
    ShowMessage('Recurso vinculado a este Tipo. Não é possível excluir.');

end;

procedure TF01004.BInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
end;

procedure TF01004.BSalvarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
end;

procedure TF01004.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idtipo_recurso.AsInteger := DModule.buscaProximoParametro('seqTipoRecurso');

end;

Initialization
  RegisterClass(TF01004);
Finalization
  UnRegisterClass(TF01004);
end.
