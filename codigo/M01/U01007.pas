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
    ImageList2: TImageList;
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
    GroupBoxFases: TGroupBox;
    GroupBox3: TGroupBox;
    DBGridBeleza4: TDBGridBeleza;
    EditBeleza4: TEditBeleza;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    FDQuery4: TFDQuery;
    ClientDataSet4: TClientDataSet;
    DataSetProvider4: TDataSetProvider;
    DataSource4: TDataSource;
    Edit5: TEdit;
    FDQuery4idProduto: TIntegerField;
    FDQuery4idFase: TIntegerField;
    FDQuery4sequencia: TIntegerField;
    FDQuery4descricao: TStringField;
    ClientDataSet4idProduto: TIntegerField;
    ClientDataSet4idFase: TIntegerField;
    ClientDataSet4sequencia: TIntegerField;
    ClientDataSet4descricao: TStringField;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
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
    procedure BtnLimparFiltrosClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ClientDataSet4AfterCancel(DataSet: TDataSet);
    procedure ClientDataSet4AfterDelete(DataSet: TDataSet);
    procedure ClientDataSet4AfterPost(DataSet: TDataSet);
    procedure EditBeleza1ButtonClick(Sender: TObject;
      var query_result: TFDQuery);
    procedure DataSource4DataChange(Sender: TObject; Field: TField);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btnRelatoriosClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure bRelatorioClick(Sender: TObject);
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
uDataModule, U01013, U01015, u_relatorios;

procedure TF01007.Action5Execute(Sender: TObject);
begin
  if DS.DataSet.State=dsInsert then
  begin
    {ShowMessage('Inserção');}
    //DELETAR
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'Delete from cronometragem WHERE idProduto =:p';
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
end;

procedure TF01007.BExcluirClick(Sender: TObject);
begin
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from ordem_producao c where c.idProduto =:idProd';
  DModule.qAux.ParamByName('idProd').AsInteger:= (ClientDataSet1idProduto.AsInteger);
  DModule.qAux.Open;
  if(DModule.qAux.IsEmpty)then
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
  end else
    ShowMessage('Ordem de produção vinculada a este Produto. Não é possível excluir.');


end;

procedure TF01007.BInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit4.Color := CorCamposOnlyRead();
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
      {Atribuição dos dados}
      ClientDataSet3idProduto.Value := ClientDataSet1idProduto.AsInteger;
      ClientDataSet3idOperacao.Value := StrToInt(Edit1.Text);
      ClientDataSet3tempo_original.Value := false;
      ClientDataSet3tempo_ideal.Value := false;
      ClientDataSet3num_pecas.Value := 1;
      ClientDataSet3num_ocorrencia.Value :=1;

      {Salva}
      DataSource3.DataSet.Post;

      {Atualiza DBGRID Operacao}
      FDQuery3.ParamByName('id').Value:=(ClientDataSet1idProduto.AsInteger);
      DataSource3.DataSet.Close;
      DataSource3.DataSet.Open;

      Edit1.Text :='';
    end else
      ShowMessage('Operação já adicionada');
  end else
    ShowMessage('Selecione uma fase.');
end;

procedure TF01007.BitBtn2Click(Sender: TObject);
begin
  inherited;
  //
  if trim(EditBeleza4.Text) <> '' then
  begin
    if not DataSource4.DataSet.Active then
          DataSource4.DataSet.Open;

    if(ClientDataSet4.Locate('idFase',Edit5.Text,[]) = false)then
    begin

      {Modo de inserção}
      DataSource4.DataSet.Append;
      {Stribuição dos dados}
      ClientDataSet4sequencia.Value := DataSource4.DataSet.RecordCount + 1;
      ClientDataSet4idProduto.Value := ClientDataSet1idProduto.AsInteger;
      ClientDataSet4idFase.Value := StrToInt(Edit5.Text);

      {Salva}
      DataSource4.DataSet.Post;

      {Atualiza DBGRID FASE}
      FDQuery4.ParamByName('id').Value:=(ClientDataSet1idProduto.AsInteger);
      DataSource4.DataSet.Close;
      DataSource4.DataSet.Open;

      Edit5.Clear;
    end else
      ShowMessage('Fase já adicionada');
  end else
    ShowMessage('Selecione uma fase.');
end;

procedure TF01007.BitBtn3Click(Sender: TObject);
begin
  inherited;
  //
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select phf.*, op.descricao as oper, f.descricao from cronometragem phf left outer join operacao op on op.idOperacao = phf.idOperacao left outer join fase f on f.idfase = op.idfase where phf.idProduto =:idProd and f.idfase =:idFas';
  DModule.qAux.ParamByName('idProd').AsInteger:= (ClientDataSet1idProduto.AsInteger);
  DModule.qAux.ParamByName('idFas').AsInteger:= (ClientDataSet4idFase.AsInteger);
  DModule.qAux.Open;
  if(DModule.qAux.IsEmpty)then
  begin
    if MessageDlg('Deseja Apagar Item '+ IntToStr(ClientDataSet4idFase.AsInteger)+ ' - ' + ClientDataSet4descricao.AsString + '?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
       if(DataSource4.DataSet.RecNo = ClientDataSet4.RecordCount) then
       //Faz se for o ultimo registro do dataSet
        begin
              ClientDataSet4.Delete;
        end else
        begin
          ClientDataSet4.Delete;
          while not ClientDataSet4.Eof do //enquanto existir registros dentro do dataset..
          begin
            DataSource4.DataSet.Edit;
            ClientDataSet4sequencia.Value := ClientDataSet4sequencia.AsInteger -1;
            DataSource4.DataSet.Post;
            ClientDataSet4.Next;  //vai para o próximo registro
          end;
        end;
    end;

  end else
       ShowMessage('Este produto possui operações dentro desta fase.' +#13+'(' +
       DModule.qAux.FieldByName('idOperacao').AsString + ' '+ DModule.qAux.FieldByName('oper').AsString + ')');

end;

procedure TF01007.BitBtn4Click(Sender: TObject);
begin
  inherited;
  With TF01015.Create(self, ClientDataSet1idProduto.AsInteger) do
  Begin
    ShowModal;
    Free;
    DataSource3.DataSet.Refresh;

  End;
end;

procedure TF01007.BitBtn5Click(Sender: TObject);
var
  nomeTela: String;
  q: TFDQuery;
begin
  q := TFDQuery.Create(self);
  q.Connection := DModule.FDConnection;

  //OBS : sec_to_time(c.tempopadraofinal/1000) - converte de milesegundos para segundos e retorna tempo
  q.sql.text := 'select  p.idProduto, p.descricao as produto, f.idFase, f.descricao as fase, '+
                '  op.idoperacao, op.descricao as operacao, '+
                '  c.idCronometragem, c.ritmo, sec_to_time(c.tempopadraofinal/1000) as tempoPadraoFinal, c.tolerancia, phf.sequencia '+
                '  from produto p '+
                '  left outer join produto_has_fase phf on phf.idproduto = p.idProduto '+
                '  left outer join fase f on f.idFase = phf.idfase '+
                '  left outer join operacao op on op.idfase = f.idfase '+
                '  left outer join cronometragem c on c.idproduto = p.idproduto and c.idoperacao = op.idoperacao and p.idproduto in (-1  ';

  ds.DataSet.first;
  while not ds.DataSet.Eof do
  begin
    q.sql.add(','+  ds.DataSet.FieldByName('idproduto').AsString);
    ds.DataSet.Next;
  end;
  q.sql.add(')');


  q.sql.add(' order by p.idproduto, phf.sequencia ');
  q.open;

  showmessage(q.SQL.Text);
  if ds.DataSet.IsEmpty then
  begin
    ds.DataSet.Open;
  end;

  frelatorios := tfrelatorios.Create(self);
  with frelatorios do
  begin
      try
          visible := false;
          Assimila_Relat_q(Screen.ActiveForm.Name, 0, DS.DataSet, q, 'idProduto', 'idProduto');
          ShowModal;
      finally
          Relatorios_sis.close;
          relats_usur.close;
          Free;
      end;
   end;
end;

procedure TF01007.BPesquisarClick(Sender: TObject);
begin
  inherited;
  {Fase}
  FDQuery4.ParamByName('id').Value:=(ClientDataSet1idProduto.AsInteger);
  DataSource4.DataSet.Close;
  DataSource4.DataSet.Open;
end;

procedure TF01007.bRelatorioClick(Sender: TObject);
var
  nomeTela: String;
  q: TFDQuery;
begin
  inherited;

  if NOT(Ds.DataSet.IsEmpty)then
  begin
      q := TFDQuery.Create(self);
      q.Connection := DModule.FDConnection;

      //OBS : sec_to_time(c.tempopadraofinal/1000) - converte de milesegundos para segundos e retorna tempo
      q.sql.text := 'select  p.idProduto, p.descricao as produto, f.idFase, f.descricao as fase, '+
                    '  op.idoperacao, op.descricao as operacao, '+
                    '  c.idCronometragem, c.ritmo, sec_to_time(c.tempopadraofinal/1000) as tempoPadraoFinal, c.tolerancia, phf.sequencia '+
                    '  from produto p '+
                    '  left outer join produto_has_fase phf on phf.idproduto = p.idProduto '+
                    '  left outer join fase f on f.idFase = phf.idfase '+
                    '  left outer join operacao op on op.idfase = f.idfase '+
                    '  left outer join cronometragem c on c.idproduto = p.idproduto and '+
                    '  c.idoperacao = op.idoperacao and p.idproduto in (-1  ';

      ds.DataSet.first;
      while not ds.DataSet.Eof do
      begin
        q.sql.add(','+  ds.DataSet.FieldByName('idproduto').AsString);
        ds.DataSet.Next;
      end;
      q.sql.add(')');


      q.sql.add(' order by p.idproduto, phf.sequencia ');
      q.open;

      //showmessage(q.SQL.Text);

      frelatorios := tfrelatorios.Create(self);
      with frelatorios do
      begin
          try
              visible := false;
              Assimila_Relat_q(Screen.ActiveForm.Name, 0, DS.DataSet, q, 'idProduto', 'idProduto');
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
              ClientDataSet3.Delete;
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
    FDQuery1.SQL.Add(' and prod.descricao like "%' + Edit3.Text +'%"');
  if(ChkGrupo.Checked = true)then
    FDQuery1.SQL.Add(' and idgrupo_produto = ' + Edit4.Text);

  FDQuery1.Open;
  BPesquisar.Click;
end;

procedure TF01007.BtnLimparFiltrosClick(Sender: TObject);
begin
  inherited;
  //
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select prod.*, gp.descricao as grupo from produto prod left outer join grupo_produto gp on prod.idgrupo = gp.idgrupo_produto';
  FDQuery1.Open;
  BPesquisar.Click;
end;

procedure TF01007.btnRelatoriosClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TF01007.Button4Click(Sender: TObject);
var
  CronAUX : integer;
begin
  inherited;

  //Verificação pra não formar loop de dependência
  CronAUX := 0;
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from cronometragem where idProduto =:idProd and idOperacao =:idOP';
  DModule.qAux.ParamByName('idProd').Value := ClientDataSet1idProduto.AsInteger;
  DModule.qAux.ParamByName('idOP').Value := strtoint(edit2.Text);
  DModule.qAux.open;
  if not(DModule.qAux.IsEmpty)then
      CronAUX := DModule.qAux.FieldByName('idCronometragem').AsInteger;
  if(CronAUX <> 0)then
  begin
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from dependencia where idcronometragem =:idCr and idCronometragemDependencia =:idDep';
  DModule.qAux.ParamByName('idCr').Value := CronAUX;
  DModule.qAux.ParamByName('idDep').Value := ClientDataSet3idcronometragem.AsInteger;
  DModule.qAux.open;
  end;

  //id cronometragem e id dependencia não podem ser iguais
    //Não pode haver loop de dependencia. Ex: A depende de B e B depende de A;
    if ((ClientDataSet3idOperacao.AsInteger <> strtoint(edit2.Text)))  and (DModule.qAux.IsEmpty) then
    begin
      if trim(EditBeleza2.Text) <> '' then
      begin
        if not DataSource2.DataSet.Active then
              DataSource2.DataSet.Open;

        if(ClientDataSet2.Locate('idCronometragemDependencia',CronAUX,[]) = false)then
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

    end else
      ShowMessage('Depedência não permitida');

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

procedure TF01007.ClientDataSet4AfterCancel(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet4.CancelUpdates;
end;

procedure TF01007.ClientDataSet4AfterDelete(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet4.ApplyUpdates(-1);
end;

procedure TF01007.ClientDataSet4AfterPost(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet4.ApplyUpdates(-1);
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

procedure TF01007.DataSource4DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  {DBGRID Operacao}
  FDQuery3.ParamByName('id').Value:=(ClientDataSet1idProduto.AsInteger);
  FDQuery3.ParamByName('idFas').Value:=(ClientDataSet4idFase.AsInteger);
  DataSource3.DataSet.Close;
  DataSource3.DataSet.Open;
end;

procedure TF01007.DBGridBeleza2DblClick(Sender: TObject);
begin
  inherited;
  // Chama a Tela de Cronometragem e mostra os tempo Referentes as operação selecionada
  With TF01013.Create(self, ClientDataSet1idProduto.asinteger, ClientDataSet3idOperacao.value) do
  Begin
    ShowModal;
    Free;
    DataSource3.DataSet.Refresh;
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
  {Fase}
  FDQuery4.ParamByName('id').Value:=(ClientDataSet1idProduto.AsInteger);
  DataSource4.DataSet.Close;
  DataSource4.DataSet.Open;

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

procedure TF01007.EditBeleza1ButtonClick(Sender: TObject;
  var query_result: TFDQuery);
begin
  inherited;
  query_result.ParamByName('idProd').Value := (ClientDataSet1idProduto.AsInteger);
  query_result.ParamByName('idFas').Value := (ClientDataSet4idFase.AsInteger);
end;

procedure TF01007.EditBeleza2ButtonClick(Sender: TObject;
  var query_result: TFDQuery);
begin
  inherited;
  //
  query_result.ParamByName('x').Value := (ClientDataSet1idProduto.AsInteger);
  query_result.ParamByName('y').Value := (ClientDataSet4idFase.AsInteger);
end;

procedure TF01007.PageControlChange(Sender: TObject);
begin
  inherited;
  //
end;

Initialization
  RegisterClass(TF01007);
Finalization
  UnRegisterClass(TF01007);
end.
