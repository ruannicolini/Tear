unit U01010;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider, Datasnap.DBClient, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, DBGridBeleza, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBEditBeleza, Vcl.Mask, Vcl.DBCtrls, EditBeleza, System.UITypes;

type
  TF01010 = class(TFBase)
    FDQuery1idoperador: TIntegerField;
    FDQuery1nome: TStringField;
    FDQuery1idGrupo: TIntegerField;
    ClientDataSet1idoperador: TIntegerField;
    ClientDataSet1nome: TStringField;
    ClientDataSet1idGrupo: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBEditBeleza1: TDBEditBeleza;
    EditBeleza1: TEditBeleza;
    Query_TR: TFDQuery;
    CDS_TR: TClientDataSet;
    Provider_TR: TDataSetProvider;
    DS_TR: TDataSource;
    DBGridBeleza2: TDBGridBeleza;
    Query_TRidOperador: TIntegerField;
    Query_TRidTipoRecurso: TIntegerField;
    Query_TRidtipo_recurso: TIntegerField;
    Query_TRdescricao: TStringField;
    CDS_TRidtipo_recurso: TIntegerField;
    CDS_TRdescricao: TStringField;
    BitBtn1: TBitBtn;
    CDS_TRidOperador: TIntegerField;
    CDS_TRidTipoRecurso: TIntegerField;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    BtnExcluirTipoRegistro: TBitBtn;
    Edit1: TEdit;
    PageControl1: TPageControl;
    Recursos: TTabSheet;
    GroupBox1: TGroupBox;
    FDQuery1grupo: TStringField;
    ClientDataSet1grupo: TStringField;
    chkNome: TCheckBox;
    chkTipoRecurso: TCheckBox;
    chkGrupo: TCheckBox;
    EditBeleza2: TEditBeleza;
    EditBeleza3: TEditBeleza;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure acEditarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acInserirExecute(Sender: TObject);
    procedure CDS_TRAfterCancel(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnExcluirTipoRegistroClick(Sender: TObject);
    procedure CDS_TRAfterPost(DataSet: TDataSet);
    procedure CDS_TRAfterDelete(DataSet: TDataSet);
    procedure acExcluirExecute(Sender: TObject);
    procedure BInserirClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure BPesquisarClick(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure Action5Execute(Sender: TObject);
    procedure DBGridBeleza2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2Change(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure BtnLimparFiltrosClick(Sender: TObject);
    procedure bRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F01010: TF01010;

implementation

{$R *.dfm}

uses
uDataModule, u_relatorios;

procedure TF01010.acCancelarExecute(Sender: TObject);
begin
  inherited;
  DS_TR.DataSet.Close;
  DBEdit1.Color := clWindow;
  DBEdit3.Color := clWindow;
end;

procedure TF01010.acEditarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit3.Color := CorCamposOnlyRead();

  {DBGRID TIPO RECURSO}
  Query_TR.ParamByName('id').Value:=(ClientDataSet1idoperador.AsInteger);
  DS_TR.DataSet.Close;
  DS_TR.DataSet.Open;

end;

procedure TF01010.acExcluirExecute(Sender: TObject);
begin
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := ' select * from cronometragem c where c.idoperador =:idOp';
  DModule.qAux.ParamByName('idOp').AsInteger:= (ClientDataSet1idoperador.AsInteger);
  DModule.qAux.Open;
  if(DModule.qAux.IsEmpty)then
  begin
    inherited;
  end else
    ShowMessage('Cronometragem vinculada ao Operador. Não é possível excluir.');

end;

procedure TF01010.acInserirExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit3.Color := CorCamposOnlyRead();

  {DBGRID TIPO RECURSO}
  Query_TR.ParamByName('id').Value:=(ClientDataSet1idoperador.AsInteger);
  DS_TR.DataSet.Close;
  DS_TR.DataSet.Open;

  if not DS_TR.DataSet.Active then
        DS_TR.DataSet.Open;
end;

procedure TF01010.acSalvarExecute(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
  DBEdit3.Color := clWindow;

  DS_TR.DataSet.Close;
end;

procedure TF01010.Action5Execute(Sender: TObject);
begin
  if DS.DataSet.State=dsInsert then
  begin
    {ShowMessage('Inserção');}
    //DELETAR
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'Delete from operador_has_tipo_recurso where idOperador =:p';
    DModule.qAux.ParamByName('p').AsString := ClientDataSet1idoperador.AsString;
    DModule.qAux.execsql;
  end else
    if DS.DataSet.State=dsEdit then {ShowMessage('Edição')};

  //Herança
  inherited;

  DS_TR.DataSet.Close;
  DBEdit1.Color := clWindow;
  DBEdit3.Color := $00EFEFEF;
end;

procedure TF01010.BEditarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit3.Color := CorCamposOnlyRead();
  EditBeleza1.Clear;
  EditBeleza1.Outro_Edit.Text := '';
end;

procedure TF01010.BExcluirClick(Sender: TObject);
begin
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := ' select * from cronometragem c where c.idoperador =:idOp';
  DModule.qAux.ParamByName('idOp').AsInteger:= (ClientDataSet1idoperador.AsInteger);
  DModule.qAux.Open;
  if(DModule.qAux.IsEmpty)then
  begin
    inherited;
  end else
    ShowMessage('Cronometragem vinculada ao Operador. Não é possível excluir.');
end;

procedure TF01010.BInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit3.Color := CorCamposOnlyRead();
  EditBeleza1.Clear;
  EditBeleza1.Outro_Edit.Text := '';

  if not DS_TR.DataSet.Active then
        DS_TR.DataSet.Open;

end;

procedure TF01010.BitBtn1Click(Sender: TObject);
begin
    inherited;
    if trim(EditBeleza1.Text) <> '' then
    begin
      {Coloca em Modo de Edição}
      if not DS_TR.DataSet.Active then
            DS_TR.DataSet.Open;

      if(CDS_TR.Locate('idTipo_Recurso',Edit1.Text,[]) = false)then
      begin
                DS_TR.DataSet.Append;
                CDS_TRidOperador.asInteger := ClientDataSet1idoperador.value;
                CDS_TRidTipoRecurso.AsInteger := strToInt( Edit1.Text );

               {Salva}
                DS_TR.DataSet.Post;


                {Atualiza grid}
                Query_TR.ParamByName('id').Value:=(ClientDataSet1idoperador.AsInteger);
                DS_TR.DataSet.Close;
                DS_TR.DataSet.Open;
      end else
      ShowMessage('Tipo de Recurso já adicionado.');

    end else
    BEGIN
       showmessage('Preencha o Campo.');
    END;
    EditBeleza1.Clear;
    EditBeleza1.Outro_Edit.Text := '';

end;

procedure TF01010.BPesquisarClick(Sender: TObject);
begin
  inherited;
  {DBGRID}
  Query_TR.ParamByName('id').Value:=(ClientDataSet1idoperador.AsInteger);
  DS_TR.DataSet.Close;
  DS_TR.DataSet.Open;
end;

procedure TF01010.bRelatorioClick(Sender: TObject);
var
  q: TFDQuery;
begin
  inherited;

  if NOT(Ds.DataSet.IsEmpty)then
  begin
      q := TFDQuery.Create(self);
      q.Connection := DModule.FDConnection;

      q.sql.text := 'select oper.idOperador, oper.nome as operador, tr.idtipo_recurso as codTipoRecurso, tr.descricao as tipoRecurso '+
                    '  from operador oper '+
                    '  left outer join grupo g on g.idGrupo = oper.idGrupo ' +
                    '  left outer join operador_has_tipo_recurso ohtr on ohtr.idOperador = oper.idOperador '+
                    '  left outer join tipo_recurso tr on tr.idtipo_recurso = ohtr.idTipoRecurso '+
                    '  where oper.idOperador in (-1  ';

      ds.DataSet.first;
      while not ds.DataSet.Eof do
      begin
        q.sql.add(','+  ds.DataSet.FieldByName('idoperador').AsString);
        ds.DataSet.Next;
      end;
      q.sql.add(')');


      q.sql.add(' order by oper.idOperador ');
      q.open;

      showmessage(q.SQL.Text);

      frelatorios := tfrelatorios.Create(self);
      with frelatorios do
      begin
          try
              visible := false;
              Assimila_Relat_q(Screen.ActiveForm.Name, 0, DS.DataSet, q, 'idOperador', 'idOperador');
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


procedure TF01010.BSalvarClick(Sender: TObject);
begin
  if trim(DBEdit2.Text) <> '' then
  begin
    if trim(DBEdit3.Text) <> '' then
    begin
      inherited;
      DBEdit1.Color := clWindow;
      DBEdit3.Color := $00EFEFEF;
      //DS_TR.DataSet.Close;
    end else
      showmessage('Preencha o Campo Grupo');
  end else
      showmessage('Preencha o Campo Nome');


end;

procedure TF01010.BtnExcluirTipoRegistroClick(Sender: TObject);
begin
  inherited;

    if MessageDlg('Deseja Apagar Item Selecionado ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
          CDS_TR.Delete;
     end;
end;

procedure TF01010.btnFiltrarClick(Sender: TObject);
begin
  inherited;

  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select op.*, g.descricao as grupo from operador op ';
  FDQuery1.SQL.add('left outer join operador_has_tipo_recurso otr on otr.idOperador = op.idOperador ');
  FDQuery1.SQL.add('left outer join grupo g on g.idgrupo = op.idgrupo where 1=1');

  if(chkNome.Checked = true)then
    FDQuery1.SQL.Add(' and op.nome like "%' + Edit2.Text +'%"');
  if(chkTipoRecurso.Checked = true)then
    FDQuery1.SQL.Add(' and otr.idtiporecurso = ' + Edit3.Text);
  if(chkGrupo.Checked = true)then
    FDQuery1.SQL.Add(' and g.idgrupo = ' + Edit4.Text);

  FDQuery1.Open;
  BPesquisar.Click;
end;

procedure TF01010.BtnLimparFiltrosClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
    FDQuery1.SQL.Text := 'select op.*, g.descricao as grupo from operador op ';
  FDQuery1.SQL.add('left outer join grupo g on g.idgrupo = op.idgrupo');
  FDQuery1.Open;
  BPesquisar.Click;
end;

procedure TF01010.CDS_TRAfterCancel(DataSet: TDataSet);
begin
  inherited;
  CDS_TR.CancelUpdates;
end;

procedure TF01010.CDS_TRAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CDS_TR.ApplyUpdates(-1);
end;

procedure TF01010.CDS_TRAfterPost(DataSet: TDataSet);
begin
  inherited;
  CDS_TR.ApplyUpdates(-1);
end;

procedure TF01010.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idoperador.AsInteger := DModule.buscaProximoParametro('seqOperador');

end;

procedure TF01010.DBGridBeleza2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = 46) then
  //Deleta Batida
  begin
    if MessageDlg('Deseja Apagar Item Selecionado ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
          CDS_TR.Delete;
     end;
  end;
end;

procedure TF01010.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  {DBGRID}
  Query_TR.ParamByName('id').Value:=(ClientDataSet1idoperador.AsInteger);
  DS_TR.DataSet.Close;
  DS_TR.DataSet.Open;
end;

procedure TF01010.Edit2Change(Sender: TObject);
begin
  inherited;
    if((edit2.Text = '')or (edit2.Text = ' '))then
  begin
    chkNome.Checked := false;
  end else
    chkNome.Checked := true;
end;

Initialization
  RegisterClass(TF01010);
Finalization
  UnRegisterClass(TF01010);
end.
