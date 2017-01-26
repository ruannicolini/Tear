unit U01002;

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
  TF01002 = class(TFBase)
    FDQuery1idcronometrista: TIntegerField;
    FDQuery1nome: TStringField;
    ClientDataSet1idcronometrista: TIntegerField;
    ClientDataSet1nome: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Edit1: TEdit;
    Label3: TLabel;
    procedure acInserirExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure acSalvarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure BtnLimparFiltrosClick(Sender: TObject);
    procedure bRelatorioClick(Sender: TObject);
    procedure DSStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F01002: TF01002;

implementation

{$R *.dfm}

uses
uDataModule, u_relatorios;

procedure TF01002.acCancelarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
end;

procedure TF01002.acEditarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
end;

procedure TF01002.acExcluirExecute(Sender: TObject);
begin
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from cronometragem c where c.idCronometrista =:idC';
  DModule.qAux.ParamByName('idC').AsInteger:= (ClientDataSet1idcronometrista.AsInteger);
  DModule.qAux.Open;
  if(DModule.qAux.IsEmpty)then
  begin
    inherited;
  end else
    ShowMessage('Cronometragem vinculada ao Cronometrista. Não é possível excluir.');

end;

procedure TF01002.acInserirExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
end;

procedure TF01002.acSalvarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
end;

procedure TF01002.Action5Execute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
end;

procedure TF01002.BExcluirClick(Sender: TObject);
begin
  //
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from cronometragem c where c.idCronometrista =:idC';
  DModule.qAux.ParamByName('idC').AsInteger:= (ClientDataSet1idcronometrista.AsInteger);
  DModule.qAux.Open;
  if(DModule.qAux.IsEmpty)then
  begin
    inherited;
  end else
    ShowMessage('Cronometragem vinculada ao Cronometrista. Não é possível excluir.');

end;

procedure TF01002.bRelatorioClick(Sender: TObject);
begin
  inherited;

  if NOT(Ds.DataSet.IsEmpty)then
  begin
      frelatorios := tfrelatorios.Create(self);
      with frelatorios do
      begin
          try
              visible := false;
              Assimila_Relat_q(Screen.ActiveForm.Name, 0, DS.DataSet, nil, 'idCronometrista', '');
              ShowModal;
          finally
              Relatorios_sis.close;
              relats_usur.close;
              Free;
          end;
      end;
  end else
  begin
    ShowMessage('Relatório necessita de pesquisa');
  end;
end;

procedure TF01002.BSalvarClick(Sender: TObject);
begin
  if trim(DBEdit2.Text) <> '' then
    begin
      inherited;
      DBEdit1.Color := clWindow;
    end else
      begin
       showmessage('Preencha o Campo Descrição');
       DBEdit2.SetFocus;
      end;
end;

procedure TF01002.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select * from cronometrista where nome like "%' + Edit1.Text +'%"';
  FDQuery1.Open;
  BPesquisar.Click;
end;

procedure TF01002.BtnLimparFiltrosClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select * from cronometrista';
  FDQuery1.Open;
  BPesquisar.Click;
end;

procedure TF01002.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idcronometrista.AsInteger := DModule.buscaProximoParametro('seqCronometrista');

end;

procedure TF01002.DSStateChange(Sender: TObject);
begin
  inherited;
  if (ds.DataSet.State = dsInsert) then
  begin
    DBEdit1.Color := CorCamposOnlyRead();
  end;
  if (ds.DataSet.State = dsEdit) then
  begin
    DBEdit1.Color := CorCamposOnlyRead();
  end;
end;

Initialization
  RegisterClass(TF01002);
Finalization
  UnRegisterClass(TF01002);
end.
