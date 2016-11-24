unit U01003;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider, Datasnap.DBClient, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, DBGridBeleza, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, EditBeleza, System.UITypes;

type
  TF01003 = class(TFBase)
    FDQuery1idgrupo: TIntegerField;
    FDQuery1descricao: TStringField;
    ClientDataSet1idgrupo: TIntegerField;
    ClientDataSet1descricao: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBGridBeleza2: TDBGridBeleza;
    FDQuery2: TFDQuery;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    DS_OPERADORES: TDataSource;
    FDQuery2idoperador: TIntegerField;
    FDQuery2nome: TStringField;
    FDQuery2idGrupo: TIntegerField;
    ClientDataSet2idoperador: TIntegerField;
    ClientDataSet2nome: TStringField;
    ClientDataSet2idGrupo: TIntegerField;
    DBGridBeleza3: TDBGridBeleza;
    FDQuery3: TFDQuery;
    DataSetProvider3: TDataSetProvider;
    ClientDataSet3: TClientDataSet;
    DS_FASE_HAS_GRUPO: TDataSource;
    FDQuery3idGrupo: TIntegerField;
    FDQuery3idfase: TIntegerField;
    FDQuery3descricao: TStringField;
    ClientDataSet3idGrupo: TIntegerField;
    ClientDataSet3idfase: TIntegerField;
    ClientDataSet3descricao: TStringField;
    EditBeleza1: TEditBeleza;
    BitBtn1: TBitBtn;
    //Panel2: TPanel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    Operadores: TTabSheet;
    Fases: TTabSheet;
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    Label3: TLabel;
    recursos: TTabSheet;
    DBGridBeleza4: TDBGridBeleza;
    FDQuery4: TFDQuery;
    DataSetProvider4: TDataSetProvider;
    ClientDataSet4: TClientDataSet;
    DS_GRUPO_HAS_RECURSO: TDataSource;
    FDQuery4idRecurso: TIntegerField;
    FDQuery4patrimonio: TIntegerField;
    FDQuery4descricao: TStringField;
    FDQuery4idTipoRecurso: TIntegerField;
    FDQuery4idGrupo: TIntegerField;
    FDQuery4TIPO: TStringField;
    ClientDataSet4idRecurso: TIntegerField;
    ClientDataSet4patrimonio: TIntegerField;
    ClientDataSet4descricao: TStringField;
    ClientDataSet4idTipoRecurso: TIntegerField;
    ClientDataSet4idGrupo: TIntegerField;
    ClientDataSet4TIPO: TStringField;
    procedure acEditarExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ClientDataSet3AfterCancel(DataSet: TDataSet);
    procedure ClientDataSet3AfterDelete(DataSet: TDataSet);
    procedure ClientDataSet3AfterPost(DataSet: TDataSet);
    procedure acExcluirExecute(Sender: TObject);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure acPesquisarExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure acInserirExecute(Sender: TObject);
    procedure BInserirClick(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure BPesquisarClick(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure BEditarClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure DBGridBeleza3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnLimparFiltrosClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure bRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F01003: TF01003;

implementation

{$R *.dfm}

uses
uDataModule, u_relatorios;

procedure TF01003.acEditarExecute(Sender: TObject);
begin
  inherited;

  FDQuery2.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_OPERADORES.DataSet.Close;
  DS_OPERADORES.DataSet.Open;

  {DBGRID Fase}

  FDQuery3.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_FASE_HAS_GRUPO.DataSet.Close;
  DS_FASE_HAS_GRUPO.DataSet.Open;
end;

procedure TF01003.acExcluirExecute(Sender: TObject);
begin

  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from operador op where op.idGrupo =:idGrupo';
  DModule.qAux.ParamByName('idGrupo').AsInteger:= (ClientDataSet1idgrupo.AsInteger);
  DModule.qAux.Open;
  if(DModule.qAux.IsEmpty)then
  begin
    inherited;
  end else
    ShowMessage('Operadores vinculados a esse grupo. Não é possível excluir.');
end;

procedure TF01003.acInserirExecute(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
  inherited;

end;

procedure TF01003.acPesquisarExecute(Sender: TObject);
begin
  inherited;
  FDQuery2.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_OPERADORES.DataSet.Close;
  DS_OPERADORES.DataSet.Open;

  FDQuery3.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_FASE_HAS_GRUPO.DataSet.Close;
  DS_FASE_HAS_GRUPO.DataSet.Open;
end;


procedure TF01003.Action1Execute(Sender: TObject);
begin
  inherited;
  FDQuery2.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_OPERADORES.DataSet.Close;
  DS_OPERADORES.DataSet.Open;

  FDQuery3.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_FASE_HAS_GRUPO.DataSet.Close;
  DS_FASE_HAS_GRUPO.DataSet.Open;
end;

procedure TF01003.Action2Execute(Sender: TObject);
begin
  inherited;
  FDQuery2.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_OPERADORES.DataSet.Close;
  DS_OPERADORES.DataSet.Open;

  FDQuery3.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_FASE_HAS_GRUPO.DataSet.Close;
  DS_FASE_HAS_GRUPO.DataSet.Open;
end;

procedure TF01003.Action3Execute(Sender: TObject);
begin
  inherited;
  FDQuery2.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_OPERADORES.DataSet.Close;
  DS_OPERADORES.DataSet.Open;

  FDQuery3.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_FASE_HAS_GRUPO.DataSet.Close;
  DS_FASE_HAS_GRUPO.DataSet.Open;
end;

procedure TF01003.Action4Execute(Sender: TObject);
begin
  inherited;
  FDQuery2.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_OPERADORES.DataSet.Close;
  DS_OPERADORES.DataSet.Open;

  FDQuery3.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_FASE_HAS_GRUPO.DataSet.Close;
  DS_FASE_HAS_GRUPO.DataSet.Open;
end;

procedure TF01003.Action5Execute(Sender: TObject);
begin
  if DS.DataSet.State=dsInsert then
  begin
    {ShowMessage('Inserção');}
    //DELETAR
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'Delete from fase_has_grupo WHERE idgrupo =:p';
    DModule.qAux.ParamByName('p').AsString := ClientDataSet1idgrupo.AsString;
    DModule.qAux.execsql;
  end else
    if DS.DataSet.State=dsEdit then {ShowMessage('Edição')};

  //Herança
  inherited;

  //Campos ReadyOnly
  DBEdit1.Color := clWindow;
  Edit1.Color := clWindow;
end;

procedure TF01003.BEditarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  Edit1.Color := CorCamposOnlyRead();
end;

procedure TF01003.BExcluirClick(Sender: TObject);
begin
  //
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from operador op where op.idGrupo =:idGrupo';
  DModule.qAux.ParamByName('idGrupo').AsInteger:= (ClientDataSet1idgrupo.AsInteger);
  DModule.qAux.Open;
  if(DModule.qAux.IsEmpty)then
  begin
    inherited;
  end else
    ShowMessage('Operadores vinculados a esse grupo. Não é possível excluir.');
end;

procedure TF01003.BInserirClick(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
  ClientDataSet3.Close;
  ClientDataSet2.Close;
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  Edit1.Color := CorCamposOnlyRead();

end;

procedure TF01003.BitBtn1Click(Sender: TObject);
begin
  inherited;
  {Coloca em Modo de Edição}
  if not DS_FASE_HAS_GRUPO.DataSet.Active then
        DS_FASE_HAS_GRUPO.DataSet.Open;

  if trim(Edit1.Text) <> '' then
  begin
    if(ClientDataSet3.Locate('idfase',Edit1.Text,[]) = false)then
    begin
          DS_FASE_HAS_GRUPO.DataSet.Append;
          ClientDataSet3idGrupo.asInteger := ClientDataSet1idgrupo.value;
          ClientDataSet3idfase.AsInteger := strToInt( Edit1.Text );

         {Salva}
          DS_FASE_HAS_GRUPO.DataSet.Post;

          {Atualiza grid}
          FDQuery3.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
          DS_FASE_HAS_GRUPO.DataSet.Close;
          DS_FASE_HAS_GRUPO.DataSet.Open;
    end else
      ShowMessage('Fase já adicionada');

  end else
    ShowMessage('Selecione Um Tipo de Recurso');

  Edit1.Text := '';
  EditBeleza1.Clear;

end;

procedure TF01003.BitBtn2Click(Sender: TObject);
begin
  inherited;
    if MessageDlg('Deseja Apagar Item Selecionado ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
          ClientDataSet3.Delete;
     end;
end;

procedure TF01003.BPesquisarClick(Sender: TObject);
begin
  inherited;
  FDQuery2.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_OPERADORES.DataSet.Close;
  DS_OPERADORES.DataSet.Open;

  FDQuery3.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_FASE_HAS_GRUPO.DataSet.Close;
  DS_FASE_HAS_GRUPO.DataSet.Open;

  FDQuery4.ParamByName('idG').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_GRUPO_HAS_RECURSO.DataSet.Close;
  DS_GRUPO_HAS_RECURSO.DataSet.Open;
end;

procedure TF01003.bRelatorioClick(Sender: TObject);
var
  q: TFDQuery;
begin
  inherited;

  if NOT(Ds.DataSet.IsEmpty)then
  begin
      q := TFDQuery.Create(self);
      q.Connection := DModule.FDConnection;
      q.sql.text := 'select g.idGrupo,rec.idRecurso, rec.descricao as recurso, rec.patrimonio, tr.descricao as tipoRecurso from grupo g '+
                    '  left outer join fase_has_grupo fhg on fhg.idGrupo = g.idGrupo '+
                    '  left outer join recurso rec on rec.idGrupo = g.idGrupo ' +
                    ' left outer join tipo_recurso tr on tr.idTipo_Recurso = rec.idTipoRecurso '+
                    'where g.idGrupo in (-1  ';

      ds.DataSet.first;
      while not ds.DataSet.Eof do
      begin
        q.sql.add(','+  ds.DataSet.FieldByName('idGrupo').AsString);
        ds.DataSet.Next;
      end;
      q.sql.add(')');

      q.sql.add(' order by g.idGrupo, rec.idRecurso ');
      q.open;

      frelatorios := tfrelatorios.Create(self);
      with frelatorios do
      begin
          try
              visible := false;
              Assimila_Relat_q(Screen.ActiveForm.Name, 0, DS.DataSet, q, 'idGrupo', 'idGrupo');
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

procedure TF01003.BSalvarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
  Edit1.Color := clWindow;
end;

procedure TF01003.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select * from grupo where descricao like "%' + Edit2.Text +'%"';
  FDQuery1.Open;
  BPesquisar.Click;
end;

procedure TF01003.BtnLimparFiltrosClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select * from grupo';
  FDQuery1.Open;
  BPesquisar.Click;
end;

Procedure TF01003.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idgrupo.AsInteger := DModule.buscaProximoParametro('seqCelula');

end;

procedure TF01003.ClientDataSet3AfterCancel(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet3.CancelUpdates;
end;

procedure TF01003.ClientDataSet3AfterDelete(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet3.ApplyUpdates(-1);
end;

procedure TF01003.ClientDataSet3AfterPost(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet3.ApplyUpdates(-1);
end;

procedure TF01003.DBGridBeleza3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = 46) then
  //Deleta Batida
  begin
    if MessageDlg('Deseja Apagar Item Selecionado ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
          ClientDataSet3.Delete;
     end;
  end;

end;

procedure TF01003.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  FDQuery2.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_OPERADORES.DataSet.Close;
  DS_OPERADORES.DataSet.Open;

  FDQuery3.ParamByName('id').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_FASE_HAS_GRUPO.DataSet.Close;
  DS_FASE_HAS_GRUPO.DataSet.Open;

  FDQuery4.ParamByName('idG').Value:=(ClientDataSet1idgrupo.AsInteger);
  DS_GRUPO_HAS_RECURSO.DataSet.Close;
  DS_GRUPO_HAS_RECURSO.DataSet.Open;

end;

Initialization
  RegisterClass(TF01003);
Finalization
  UnRegisterClass(TF01003);
end.
