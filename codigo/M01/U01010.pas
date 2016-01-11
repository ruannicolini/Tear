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
  Vcl.ExtCtrls, DBEditBeleza, Vcl.Mask, Vcl.DBCtrls, EditBeleza;

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
    FDQuery2: TFDQuery;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    DataSource1: TDataSource;
    FDQuery2idgrupo: TIntegerField;
    FDQuery2descricao: TStringField;
    ClientDataSet2idgrupo: TIntegerField;
    ClientDataSet2descricao: TStringField;
    ClientDataSet1grupo: TStringField;
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
    procedure BCancelarClick(Sender: TObject);
    procedure BPesquisarClick(Sender: TObject);
    procedure BFirstClick(Sender: TObject);
    procedure BPriorClick(Sender: TObject);
    procedure BNextClick(Sender: TObject);
    procedure BLastClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
uDataModule;

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

procedure TF01010.BCancelarClick(Sender: TObject);
begin
  inherited;
  DS_TR.DataSet.Close;
  DBEdit1.Color := clWindow;
  DBEdit3.Color := clWindow;
end;

procedure TF01010.BEditarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit3.Color := CorCamposOnlyRead();

  {DBGRID TIPO RECURSO}
  Query_TR.ParamByName('id').Value:=(ClientDataSet1idoperador.AsInteger);
  DS_TR.DataSet.Close;
  DS_TR.DataSet.Open;
end;

procedure TF01010.BExcluirClick(Sender: TObject);
begin
  inherited;
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

procedure TF01010.BFirstClick(Sender: TObject);
begin
  inherited;
  {DBGRID}
  Query_TR.ParamByName('id').Value:=(ClientDataSet1idoperador.AsInteger);
  DS_TR.DataSet.Close;
  DS_TR.DataSet.Open;
end;

procedure TF01010.BInserirClick(Sender: TObject);
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

procedure TF01010.BitBtn1Click(Sender: TObject);
begin
    inherited;
if trim(EditBeleza1.Text) <> '' then
begin
  {Coloca em Modo de Edição}
  if not DS_TR.DataSet.Active then
        DS_TR.DataSet.Open;
            DS_TR.DataSet.Append;
            CDS_TRidOperador.asInteger := ClientDataSet1idoperador.value;
            CDS_TRidTipoRecurso.AsInteger := strToInt( Edit1.Text );

           {Salva}
            DS_TR.DataSet.Post;


            {Atualiza grid}
            Query_TR.ParamByName('id').Value:=(ClientDataSet1idoperador.AsInteger);
            DS_TR.DataSet.Close;
            DS_TR.DataSet.Open;

end
else
   showmessage('preencha o campo');
end;

procedure TF01010.BLastClick(Sender: TObject);
begin
  inherited;
  {DBGRID}
  Query_TR.ParamByName('id').Value:=(ClientDataSet1idoperador.AsInteger);
  DS_TR.DataSet.Close;
  DS_TR.DataSet.Open;
end;

procedure TF01010.BNextClick(Sender: TObject);
begin
  inherited;
  {DBGRID}
  Query_TR.ParamByName('id').Value:=(ClientDataSet1idoperador.AsInteger);
  DS_TR.DataSet.Close;
  DS_TR.DataSet.Open;
end;

procedure TF01010.BPesquisarClick(Sender: TObject);
begin
  inherited;
  {DBGRID}
  Query_TR.ParamByName('id').Value:=(ClientDataSet1idoperador.AsInteger);
  DS_TR.DataSet.Close;
  DS_TR.DataSet.Open;
end;

procedure TF01010.BPriorClick(Sender: TObject);
begin
  inherited;
  {DBGRID}
  Query_TR.ParamByName('id').Value:=(ClientDataSet1idoperador.AsInteger);
  DS_TR.DataSet.Close;
  DS_TR.DataSet.Open;
end;

procedure TF01010.BSalvarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := clWindow;
  DBEdit3.Color := clWindow;

  DS_TR.DataSet.Close;
end;

procedure TF01010.BtnExcluirTipoRegistroClick(Sender: TObject);
begin
  inherited;

    if MessageDlg('Deseja Apagar Item Selecionado ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
          CDS_TR.Delete;
     end;
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

procedure TF01010.FormShow(Sender: TObject);
begin
  inherited;
  BPesquisarClick(Sender);
end;

Initialization
  RegisterClass(TF01010);
Finalization
  UnRegisterClass(TF01010);
end.
