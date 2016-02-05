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
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, DBEditBeleza, DBEditCalendario,
  EditBeleza;

type
  TF01007 = class(TFBase)
    FDQuery1idProduto: TIntegerField;
    FDQuery1descricao: TStringField;
    FDQuery1data: TDateField;
    FDQuery1idGrupo: TIntegerField;
    ClientDataSet1idProduto: TIntegerField;
    ClientDataSet1descricao: TStringField;
    ClientDataSet1data: TDateField;
    ClientDataSet1idGrupo: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEditBeleza1: TDBEditBeleza;
    DBEdit_Calendario1: TDBEdit_Calendario;
    GroupBox1: TGroupBox;
    DBGridBeleza2: TDBGridBeleza;
    DataSource3: TDataSource;
    ClientDataSet3: TClientDataSet;
    DataSetProvider3: TDataSetProvider;
    FDQuery3: TFDQuery;
    EditBeleza1: TEditBeleza;
    BitBtn1: TBitBtn;
    BtnExcluirOperacao: TBitBtn;
    Edit1: TEdit;
    Button1: TButton;
    ImageList2: TImageList;
    Button2: TButton;
    FDQuery1grupo: TStringField;
    ClientDataSet1grupo: TStringField;
    FDQuery3idProduto: TIntegerField;
    FDQuery3idOperacao: TIntegerField;
    FDQuery3prioridade: TIntegerField;
    FDQuery3descricao: TStringField;
    ClientDataSet3idProduto: TIntegerField;
    ClientDataSet3idOperacao: TIntegerField;
    ClientDataSet3prioridade: TIntegerField;
    ClientDataSet3descricao: TStringField;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    GroupBoxOperacoes: TGroupBox;
    GroupBoxDependencias: TGroupBox;
    GroupBox2: TGroupBox;
    DBGridBeleza3: TDBGridBeleza;
    Button4: TButton;
    Button5: TButton;
    EditBeleza2: TEditBeleza;
    FDQuery2: TFDQuery;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    DataSource2: TDataSource;
    Edit2: TEdit;
    FDQuery2idProdutoOperacao: TIntegerField;
    FDQuery2idOperacaoOperacao: TIntegerField;
    FDQuery2idProdutoDependencia: TIntegerField;
    FDQuery2idOperacaoDependencia: TIntegerField;
    FDQuery2descricao: TStringField;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    ClientDataSet2idProdutoOperacao: TIntegerField;
    ClientDataSet2idOperacaoOperacao: TIntegerField;
    ClientDataSet2idProdutoDependencia: TIntegerField;
    ClientDataSet2idOperacaoDependencia: TIntegerField;
    ClientDataSet2descricao: TStringField;
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure ClientDataSet3AfterCancel(DataSet: TDataSet);
    procedure ClientDataSet3AfterDelete(DataSet: TDataSet);
    procedure ClientDataSet3AfterPost(DataSet: TDataSet);
    procedure BtnExcluirOperacaoClick(Sender: TObject);
    procedure BInserirClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure BPesquisarClick(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure Action5Execute(Sender: TObject);
    procedure DBGridBeleza2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGridBeleza2DblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ClientDataSet2AfterCancel(DataSet: TDataSet);
    procedure ClientDataSet2AfterDelete(DataSet: TDataSet);
    procedure ClientDataSet2AfterPost(DataSet: TDataSet);
    procedure DataSource3DataChange(Sender: TObject; Field: TField);
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
uDataModule, U01013;

procedure TF01007.Action5Execute(Sender: TObject);
begin
  if DS.DataSet.State=dsInsert then
  begin
    {ShowMessage('Inserção');}
    //DELETAR
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'Delete from produto_has_OPERACAO WHERE idProduto =:p';
    DModule.qAux.ParamByName('p').AsString := ClientDataSet1idProduto.AsString;
    DModule.qAux.execsql;
  end else
    if DS.DataSet.State=dsEdit then {ShowMessage('Edição')};

  //Herança
  inherited;

  //Campos ReadyOnly
  DBEdit1.Color := clWindow;
  DBEdit4.Color := $00EFEFEF;
end;

procedure TF01007.BEditarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit4.Color := CorCamposOnlyRead();

  Button1.Enabled := true;
  Button2.Enabled := true;
end;

procedure TF01007.BExcluirClick(Sender: TObject);
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

procedure TF01007.BInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit4.Color := CorCamposOnlyRead();
  Button1.Enabled := true;
  Button2.Enabled := true;
  DataSource3.DataSet.Close;
end;

procedure TF01007.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if trim(EditBeleza1.Text) <> '' then
  begin
    if not DataSource3.DataSet.Active then
          DataSource3.DataSet.Open;

    if(ClientDataSet3.Locate('idOperacao',Edit1.Text,[]) = false)then
    begin

      {Modo de inserção}
      DataSource3.DataSet.Append;
      {Stribuição dos dados}
      ClientDataSet3prioridade.Value := DataSource3.DataSet.RecordCount + 1;
      ClientDataSet3idProduto.Value := ClientDataSet1idProduto.AsInteger;
      ClientDataSet3idOperacao.Value := StrToInt(Edit1.Text);

      {Salva}
      DataSource3.DataSet.Post;

      {Atualiza DBGRID FASE}
      FDQuery3.ParamByName('id').Value:=(ClientDataSet1idProduto.AsInteger);
      DataSource3.DataSet.Close;
      DataSource3.DataSet.Open;

      Edit1.Text :='';
    end else
      ShowMessage('Fase já adicionada');
  end else
    ShowMessage('Selecione uma fase.');
end;

procedure TF01007.BPesquisarClick(Sender: TObject);
begin
  inherited;
  {DBGRID FASE}
  FDQuery3.ParamByName('id').Value:=(ClientDataSet1idProduto.AsInteger);
  DataSource3.DataSet.Close;
  DataSource3.DataSet.Open;
end;

procedure TF01007.BSalvarClick(Sender: TObject);
begin
  if trim(DBEdit4.Text) <> '' then
    begin
    if trim(DBEdit2.Text) <> '' then
      begin
        inherited;
        DBEdit1.Color := clWindow;
        DBEdit4.Color := $00EFEFEF;
      end else
         showmessage('Preencha o Campo Descrição');

    end else
       showmessage('Preencha o Campo Grupo');
end;

procedure TF01007.BtnExcluirOperacaoClick(Sender: TObject);
var
x: integer;
begin
  inherited;
  if MessageDlg('Deseja Apagar Item '+ IntToStr(ClientDataSet3idOperacao.AsInteger)+ ' - ' + ClientDataSet3descricao.AsString + '?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      ClientDataSet3.Delete;
      while not ClientDataSet3.Eof do //enquanto existir registros dentro do dataset..
      begin
          DataSource3.DataSet.Edit;
          if ClientDataSet3prioridade.Value <> 1 then
            ClientDataSet3prioridade.Value := ClientDataSet3prioridade.AsInteger -1;
          DataSource3.DataSet.Post;
          ClientDataSet3.Next;  //vai para o próximo registro
      end;

     end;
end;

procedure TF01007.Button1Click(Sender: TObject);
begin
  inherited;
  if(ClientDataSet3prioridade.Value > 1)then
  begin
    DataSource3.DataSet.Edit;
    ClientDataSet3prioridade.Value := ClientDataSet3prioridade.AsInteger -1;
    DataSource3.DataSet.Post;
    ClientDataSet3.Prior;
    DataSource3.DataSet.Edit;
    ClientDataSet3prioridade.Value := ClientDataSet3prioridade.AsInteger +1;
    DataSource3.DataSet.Post;
    DataSource3.DataSet.Refresh;
  end;
end;

procedure TF01007.Button2Click(Sender: TObject);
begin
  inherited;
    if(ClientDataSet3prioridade.Value < DataSource3.DataSet.RecordCount)then
  begin
    DataSource3.DataSet.Edit;
    ClientDataSet3prioridade.Value := ClientDataSet3prioridade.AsInteger +1;
    DataSource3.DataSet.Post;
    ClientDataSet3.Next;
    DataSource3.DataSet.Edit;
    ClientDataSet3prioridade.Value := ClientDataSet3prioridade.AsInteger -1;
    DataSource3.DataSet.Post;
    DataSource3.DataSet.Refresh;
  end;
end;

procedure TF01007.Button4Click(Sender: TObject);
begin
  inherited;

  if trim(EditBeleza2.Text) <> '' then
  begin
    if not DataSource2.DataSet.Active then
          DataSource2.DataSet.Open;

    if(ClientDataSet2.Locate('idOperacaoDependencia',Edit2.Text,[]) = false)then
    begin
      {Modo de inserção}
      DataSource2.DataSet.Append;

      {Atribuição dos dados}
      ClientDataSet2idProdutoDependencia.Value := ClientDataSet1idProduto.AsInteger;
      ClientDataSet2idProdutoOperacao.Value := ClientDataSet1idProduto.AsInteger;

      ClientDataSet2idOperacaoDependencia.Value := StrToInt(Edit2.Text);
      ClientDataSet2idOperacaoOperacao.Value := ClientDataSet3idOperacao.AsInteger;

      {Salva}
      DataSource2.DataSet.Post;

      {Atualiza DBGRID Dependencia}
      FDQuery2.ParamByName('id').Value:=(ClientDataSet3idOperacao.AsInteger);
      DataSource2.DataSet.Close;
      DataSource2.DataSet.Open;

      Edit2.Text :='';
    end else
      ShowMessage('Operação já adicionada');
  end else
    ShowMessage('Selecione uma Operação.');

end;

procedure TF01007.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idProduto.AsInteger := DModule.buscaProximoParametro('seqProduto');

end;

procedure TF01007.ClientDataSet2AfterCancel(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet2.CancelUpdates;
end;

procedure TF01007.ClientDataSet2AfterDelete(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet2.ApplyUpdates(-1);
end;

procedure TF01007.ClientDataSet2AfterPost(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet2.ApplyUpdates(-1);
end;

procedure TF01007.ClientDataSet3AfterCancel(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet3.CancelUpdates;

end;

procedure TF01007.ClientDataSet3AfterDelete(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet3.ApplyUpdates(-1);
end;

procedure TF01007.ClientDataSet3AfterPost(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet3.ApplyUpdates(-1);
end;

procedure TF01007.DataSource3DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  {Atualiza DBGRID Dependencia}
  FDQuery2.ParamByName('idoo').Value:=(ClientDataSet3idOperacao.AsInteger);
  FDQuery2.ParamByName('idpo').Value:=(ClientDataSet1idProduto.AsInteger);
  DataSource2.DataSet.Close;
  DataSource2.DataSet.Open;
end;

procedure TF01007.DBGridBeleza2DblClick(Sender: TObject);
begin
  inherited;
  // Chama a Tela de Cronometragem e mostra os tempo Referentes as operação selecionada
  With TF01013.Create(self, ClientDataSet1idProduto.asinteger, ClientDataSet3idOperacao.value) do
  Begin
    ShowModal;
    Free;
  End;

end;

procedure TF01007.DBGridBeleza2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = 46) then
  //Deleta Batida
  begin
    if MessageDlg('Deseja Apagar Item '+ IntToStr(ClientDataSet3idOperacao.AsInteger)+ ' - ' + ClientDataSet3descricao.AsString + '?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
        ClientDataSet3.Delete;
        while not ClientDataSet3.Eof do //enquanto existir registros dentro do dataset..
        begin
          DataSource3.DataSet.Edit;
          ClientDataSet3prioridade.Value := ClientDataSet3prioridade.AsInteger -1;
          DataSource3.DataSet.Post;
          ClientDataSet3.Next;  //vai para o próximo registro
        end;

     end;
  end;
end;

procedure TF01007.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  {DBGRID Operações}
  FDQuery3.ParamByName('id').Value:=(ClientDataSet1idProduto.AsInteger);
  DataSource3.DataSet.Close;
  DataSource3.DataSet.Open;

end;

Initialization
  RegisterClass(TF01007);
Finalization
  UnRegisterClass(TF01007);
end.
