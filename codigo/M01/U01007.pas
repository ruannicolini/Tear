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
    GroupBoxOperacoes: TGroupBox;
    GroupBoxDependencias: TGroupBox;
    GroupBox2: TGroupBox;
    DBGridBeleza3: TDBGridBeleza;
    Button4: TButton;
    btnExcluirDependencia: TButton;
    EditBeleza2: TEditBeleza;
    FDQuery2: TFDQuery;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    DataSource2: TDataSource;
    Edit2: TEdit;
    FDQuery3idcronometragem: TIntegerField;
    FDQuery3tempo_original: TBooleanField;
    FDQuery3tempo_ideal: TBooleanField;
    FDQuery3ritmo: TIntegerField;
    FDQuery3num_pecas: TIntegerField;
    FDQuery3tolerancia: TIntegerField;
    FDQuery3comprimento_prod: TSingleField;
    FDQuery3num_ocorrencia: TIntegerField;
    FDQuery3idProduto: TIntegerField;
    FDQuery3idCronometrista: TIntegerField;
    FDQuery3idTecido: TIntegerField;
    FDQuery3idOperacao: TIntegerField;
    FDQuery3idOperador: TIntegerField;
    FDQuery3prioridade: TIntegerField;
    FDQuery3descricao: TStringField;
    ClientDataSet3idcronometragem: TIntegerField;
    ClientDataSet3tempo_original: TBooleanField;
    ClientDataSet3tempo_ideal: TBooleanField;
    ClientDataSet3ritmo: TIntegerField;
    ClientDataSet3num_pecas: TIntegerField;
    ClientDataSet3tolerancia: TIntegerField;
    ClientDataSet3comprimento_prod: TSingleField;
    ClientDataSet3num_ocorrencia: TIntegerField;
    ClientDataSet3idProduto: TIntegerField;
    ClientDataSet3idCronometrista: TIntegerField;
    ClientDataSet3idTecido: TIntegerField;
    ClientDataSet3idOperacao: TIntegerField;
    ClientDataSet3idOperador: TIntegerField;
    ClientDataSet3prioridade: TIntegerField;
    ClientDataSet3descricao: TStringField;
    FDQuery2idCronometragem: TIntegerField;
    FDQuery2idCronometragemDependencia: TIntegerField;
    FDQuery2idOperacao: TIntegerField;
    FDQuery2descricao: TStringField;
    ClientDataSet2idCronometragem: TIntegerField;
    ClientDataSet2idCronometragemDependencia: TIntegerField;
    ClientDataSet2idOperacao: TIntegerField;
    ClientDataSet2descricao: TStringField;
    FDQuery3tempoPadraoFinal: TSingleField;
    ClientDataSet3tempoPadraoFinal: TSingleField;
    chkDescricao: TCheckBox;
    ChkGrupo: TCheckBox;
    Edit3: TEdit;
    EditBeleza3: TEditBeleza;
    Edit4: TEdit;
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
    procedure btnExcluirDependenciaClick(Sender: TObject);
    procedure EditBeleza2ButtonClick(Sender: TObject;
      var query_result: TFDQuery);
    procedure ClientDataSet3AfterInsert(DataSet: TDataSet);
    procedure DBGridBeleza3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3Change(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
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
  DataSource2.DataSet.Close;
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

      {Atualiza DBGRID Operacao}
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
     DModule.qAux.Close;
     DModule.qAux.SQL.Text := 'select d.*, cron.idOperacao, op.descricao from dependencia d left outer join Cronometragem cron on cron.idCronometragem = d.idCronometragem left outer join operacao op on op.idOperacao = cron.idOperacao where d.idcronometragemDependencia =:idCD;';
     DModule.qAux.ParamByName('idCD').AsInteger:= (ClientDataSet3idcronometragem.AsInteger);
     DModule.qAux.Open;
     if(DModule.qAux.IsEmpty)then
     begin
         if MessageDlg('Deseja Apagar Item '+ IntToStr(ClientDataSet3idOperacao.AsInteger)+ ' - ' + ClientDataSet3descricao.AsString + '?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin
            if(DataSource3.DataSet.RecNo = ClientDataSet3.RecordCount) then
            //Faz se for o ultimo registro do dataSet
            begin
              ClientDataSet3.Delete;
            end else
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

     end else
       ShowMessage('Não é possível excluir.' +#13+'Esta Operação vinculada a outra Operação (' +
       DModule.qAux.FieldByName('idOperacao').AsString + ' '+ DModule.qAux.FieldByName('descricao').AsString + ') como dependência.');

end;

procedure TF01007.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select prod.*, gp.descricao as grupo from produto prod ';
  FDQuery1.SQL.add('left outer join grupo_produto gp on prod.idgrupo = gp.idgrupo_produto where 1=1 ');

  if(chkDescricao.Checked = true)then
    FDQuery1.SQL.Add(' and descricao like "%' + Edit3.Text +'%"');
  if(ChkGrupo.Checked = true)then
    FDQuery1.SQL.Add(' and idgrupo_produto = ' + Edit4.Text);

  FDQuery1.Open;
  BPesquisar.Click;
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

    if(ClientDataSet2.Locate('idCronometragemDependencia',Edit2.Text,[]) = false)then
    begin
      {Modo de inserção}
      DataSource2.DataSet.Append;

      {Atribuição dos dados}
      //
      DModule.qAux.Close;
      DModule.qAux.SQL.Text := 'select * from cronometragem where idproduto =:idProd and idOperacao =:idOp';
      DModule.qAux.ParamByName('idProd').AsInteger:= (ClientDataSet1idProduto.AsInteger);
      DModule.qAux.ParamByName('idOp').AsInteger:= StrToInt(Edit2.Text);
      DModule.qAux.Open;
      DModule.qAux.first;

      ClientDataSet2idCronometragem.Value := ClientDataSet3idcronometragem.AsInteger;
      ClientDataSet2idCronometragemDependencia.Value := DModule.qAux.FieldByName('idCronometragem').AsInteger;

      {Salva}
      DataSource2.DataSet.Post;

      {Atualiza DBGRID Dependencia}
      FDQuery2.ParamByName('idOp').Value:=(ClientDataSet3idOperacao.AsInteger);
      FDQuery2.ParamByName('idProd').Value:=(ClientDataSet1idProduto.AsInteger);
      DataSource2.DataSet.Close;
      DataSource2.DataSet.Open;

      Edit2.Text :='';
    end else
      ShowMessage('Operação já adicionada');
  end else
    ShowMessage('Selecione uma Operação.');

end;

procedure TF01007.btnExcluirDependenciaClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja Apagar Dependência '+ IntToStr(ClientDataSet2idOperacao.AsInteger)+ ' - ' + ClientDataSet2descricao.AsString + '?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
      ClientDataSet2.Delete;
     end;

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

procedure TF01007.ClientDataSet3AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet3idcronometragem.AsInteger := DModule.buscaProximoParametro('seqCronometragem');
end;

procedure TF01007.ClientDataSet3AfterPost(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet3.ApplyUpdates(-1);
end;

procedure TF01007.DataSource3DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  //Atualiza DBGRID Dependencia}
  FDQuery2.ParamByName('idOp').Value:=(ClientDataSet3idOperacao.AsInteger);
  FDQuery2.ParamByName('idProd').Value:=(ClientDataSet1idProduto.AsInteger);
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
    //Deleta
    BtnExcluirOperacao.Click;

end;

procedure TF01007.DBGridBeleza3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if (key = 46) then
    //Deleta
    btnExcluirDependencia.Click;
end;

procedure TF01007.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  {DBGRID Operações}
  FDQuery3.ParamByName('id').Value:=(ClientDataSet1idProduto.AsInteger);
  DataSource3.DataSet.Close;
  DataSource3.DataSet.Open;

end;

procedure TF01007.Edit3Change(Sender: TObject);
begin
  inherited;
  if((edit3.Text = '')or (edit3.Text = ' '))then
  begin
    chkDescricao.Checked := false;
  end else
    chkDescricao.Checked := true;
end;

procedure TF01007.EditBeleza2ButtonClick(Sender: TObject;
  var query_result: TFDQuery);
begin
  inherited;
  //
  query_result.ParamByName('x').Value := (ClientDataSet1idProduto.AsInteger);
end;

Initialization
  RegisterClass(TF01007);
Finalization
  UnRegisterClass(TF01007);
end.
