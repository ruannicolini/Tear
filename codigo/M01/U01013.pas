unit U01013;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider, Datasnap.DBClient, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, DBGridBeleza, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask, DBEditBeleza, EditBeleza, DATEUTILS,
  DBSQLEditBeleza, system.UITypes;

type
  TF01013 = class(TFBase)
    FDQuery1idcronometragem: TIntegerField;
    FDQuery1tempo_original: TBooleanField;
    FDQuery1tempo_ideal: TBooleanField;
    FDQuery1ritmo: TIntegerField;
    FDQuery1num_pecas: TIntegerField;
    FDQuery1tolerancia: TIntegerField;
    FDQuery1comprimento_prod: TSingleField;
    FDQuery1num_ocorrencia: TIntegerField;
    FDQuery1idProduto: TIntegerField;
    FDQuery1idCronometrista: TIntegerField;
    FDQuery1idTecido: TIntegerField;
    FDQuery1idOperacao: TIntegerField;
    FDQuery1idOperador: TIntegerField;
    ClientDataSet1idcronometragem: TIntegerField;
    ClientDataSet1tempo_original: TBooleanField;
    ClientDataSet1tempo_ideal: TBooleanField;
    ClientDataSet1ritmo: TIntegerField;
    ClientDataSet1num_pecas: TIntegerField;
    ClientDataSet1tolerancia: TIntegerField;
    ClientDataSet1comprimento_prod: TSingleField;
    ClientDataSet1num_ocorrencia: TIntegerField;
    ClientDataSet1idProduto: TIntegerField;
    ClientDataSet1idCronometrista: TIntegerField;
    ClientDataSet1idTecido: TIntegerField;
    ClientDataSet1idOperacao: TIntegerField;
    ClientDataSet1idOperador: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBEditBeleza2: TDBEditBeleza;
    DBEditBeleza3: TDBEditBeleza;
    DBEditBeleza4: TDBEditBeleza;
    DBEditBeleza5: TDBEditBeleza;
    Panel3: TPanel;
    DBCheckBox2: TDBCheckBox;
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGridBeleza2: TDBGridBeleza;
    DS_Recurso: TDataSource;
    DSP_Recurso: TDataSetProvider;
    CDS_Recurso: TClientDataSet;
    FDQ_Recurso: TFDQuery;
    FDQ_Recursoidcronometragem: TIntegerField;
    FDQ_RecursoidTipoRecurso: TIntegerField;
    FDQ_Recursoidtipo_recurso: TIntegerField;
    FDQ_Recursodescricao: TStringField;
    CDS_Recursoidcronometragem: TIntegerField;
    CDS_RecursoidTipoRecurso: TIntegerField;
    CDS_Recursoidtipo_recurso: TIntegerField;
    CDS_Recursodescricao: TStringField;
    EditBeleza1: TEditBeleza;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    crono: TTimer;
    Edit2: TEdit;
    btnINICIAR: TBitBtn;
    btnLap: TBitBtn;
    Edit3: TEdit;
    DS_Batida: TDataSource;
    DSP_Batida: TDataSetProvider;
    CDS_Batida: TClientDataSet;
    FDQ_Batida: TFDQuery;
    DBGridBatida: TDBGridBeleza;
    DBCheckBox3: TDBCheckBox;
    FDQ_Batidaidbatida: TIntegerField;
    FDQ_Batidaminutos: TIntegerField;
    FDQ_Batidasegundos: TIntegerField;
    FDQ_Batidamilesimos: TIntegerField;
    FDQ_Batidautilizar: TBooleanField;
    FDQ_BatidaidCronometragem: TIntegerField;
    CDS_Batidaidbatida: TIntegerField;
    CDS_Batidaminutos: TIntegerField;
    CDS_Batidasegundos: TIntegerField;
    CDS_Batidamilesimos: TIntegerField;
    CDS_Batidautilizar: TBooleanField;
    CDS_BatidaidCronometragem: TIntegerField;
    DBEditBeleza1: TDBEditBeleza;
    FDQuery1operacao: TStringField;
    ClientDataSet1operacao: TStringField;
    FDQuery1produto: TStringField;
    ClientDataSet1produto: TStringField;
    FDQuery1tecido: TStringField;
    ClientDataSet1tecido: TStringField;
    FDQuery1operador: TStringField;
    ClientDataSet1operador: TStringField;
    FDQuery1cronometrista: TStringField;
    ClientDataSet1cronometrista: TStringField;
    BReutilizar: TSpeedButton;
    Edit4: TEdit;
    chkProduto: TCheckBox;
    ChkOperacao: TCheckBox;
    Edit5: TEdit;
    EditBeleza2: TEditBeleza;
    EditBeleza3: TEditBeleza;
    FDQuery1tempoPadraoFinal: TSingleField;
    ClientDataSet1tempoPadraoFinal: TSingleField;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Edit6: TEdit;
    chkTempoOriginal: TCheckBox;
    chkTempoIdeal: TCheckBox;
    CDS_BatidaUTI: TStringField;
    procedure DBEditBeleza1Click(Sender: TObject);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure CDS_RecursoAfterCancel(DataSet: TDataSet);
    procedure CDS_RecursoAfterDelete(DataSet: TDataSet);
    procedure CDS_RecursoAfterPost(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure cronoTimer(Sender: TObject);
    procedure btnINICIARClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLapClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure CDS_BatidaAfterCancel(DataSet: TDataSet);
    procedure CDS_BatidaAfterDelete(DataSet: TDataSet);
    procedure CDS_BatidaAfterPost(DataSet: TDataSet);
    procedure CDS_BatidaAfterInsert(DataSet: TDataSet);
    procedure DBGridBatidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure DBGridBeleza2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BEditarClick(Sender: TObject);
    procedure BInserirClick(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure btnLapKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BReutilizarClick(Sender: TObject);
    procedure BtnLimparFiltrosClick(Sender: TObject);
    procedure DBEdit16Change(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure ActionMostrarFiltrosExecute(Sender: TObject);
    procedure DBEdit2Click(Sender: TObject);
    procedure DBEdit3Click(Sender: TObject);
    procedure DBEdit4Click(Sender: TObject);
    procedure ClientDataSet1ritmoChange(Sender: TField);
    procedure ClientDataSet1num_pecasChange(Sender: TField);
    procedure ClientDataSet1toleranciaChange(Sender: TField);
    procedure DBEdit7Change(Sender: TObject);
    procedure DBEdit10Change(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure DBEdit17Click(Sender: TObject);
    procedure bRelatorioClick(Sender: TObject);
    procedure DBGridBatidaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridBatidaDblClick(Sender: TObject);
    procedure DBGridBeleza1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    fTempo: Ttime;  //Tempo corrido do cronometro
    fTempoParada: Ttime; //Tempo que o cronometro fica pausado
    fMomento: integer; // "Hora" em que o cronometro iniciou
    fMomentoParada: integer; // "Hora" em que a Parada do cronometro iniciou
    fMomentoUltimoLap: integer;
    status: boolean; //controle do botoes de Iniciar/Parar e Lap/Continuar
    statusParada: boolean; //controle de Parada, quando contar o tempo parado.
    milissegundoAUX: integer; // milessegundos parados
    ParIdProduto : integer;
    ParIdOperacao : integer;
    procedure CalculaTempoPadraoFinal();

  public
    { Public declarations }
    constructor Create(AOwner : TComponent; pParm1, pParm2 : integer);
  end;

var
  F01013: TF01013;

implementation

{$R *.dfm}

uses
uDataModule, u_relatorios;

constructor TF01013.Create(AOwner: TComponent; pParm1, pParm2: integer);
begin
  // No cado do Form ser chamado do cadastro de Produto, ele recebe o IdProduto e o Id Operacao
  inherited Create(AOwner);
  ParIdProduto := pParm1;
  ParIdOperacao := pParm2;

  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select cr.*, o.descricao as operacao, p.descricao as produto, t.descricao as tecido,  op.nome as operador, cron.nome as cronometrista';
  FDQuery1.SQL.add(' from cronometragem cr');
  FDQuery1.SQL.add(' left outer join operacao o on o.idoperacao = cr.idoperacao');
  FDQuery1.SQL.add(' left outer join produto p on p.idProduto = cr.idproduto');
  FDQuery1.SQL.add(' left outer join tecido t on t.idTecido = cr.idtecido');
  FDQuery1.SQL.add(' left outer join operador op on op.idOperador = cr.idOperador');
  FDQuery1.SQL.add(' left outer join cronometrista cron on cron.idCronometrista = cr.idCronometrista where 1=1');
  FDQuery1.SQL.Add(' and cr.idProduto = ' + inttostr(ParIdProduto));
  FDQuery1.SQL.Add(' and cr.idOperacao = ' + inttostr(ParIdOperacao));
  FDQuery1.Open;
  BPesquisar.Click;


  Width := 957;
  Height := 610;
  PageControl.ActivePageIndex := 0;
end;

procedure TF01013.Action5Execute(Sender: TObject);
begin
  if DS.DataSet.State=dsInsert then
  begin
    {ShowMessage('Inserção');}
    //DELETAR BATIDA
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'Delete from batida where idCronometragem =:p';
    DModule.qAux.ParamByName('p').AsString := ClientDataSet1idcronometragem.AsString;
    DModule.qAux.execsql;

    //DELETAR TipoRecurso
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'Delete from cronometragem_has_tipo_recurso where idCronometragem =:p';
    DModule.qAux.ParamByName('p').AsString := ClientDataSet1idcronometragem.AsString;
    DModule.qAux.execsql;
  end else
    if DS.DataSet.State=dsEdit then {ShowMessage('Edição')};

  //Herança
  inherited;

  //
  crono.Enabled := false;
  status := false;
  btnINICIAR.Caption := 'INICIAR';
  btnLap.Caption := 'LAP';
  btnLap.Enabled := false;
  BReutilizar.Enabled := true;

  DBEdit1.Color := clWindow;
  DBEdit7.Color := $00EFEFEF;
  DBEdit8.Color := $00EFEFEF;
  DBEdit9.Color := $00EFEFEF;
  DBEdit10.Color := $00EFEFEF;
  DBEdit11.Color := $00EFEFEF;
  Edit6.Color := clWindow;
  DBEditBeleza1.Enabled := true;
  DBEdit7.Enabled := true;
end;

procedure TF01013.ActionMostrarFiltrosExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TF01013.BEditarClick(Sender: TObject);
begin
  inherited;
  BReutilizar.Enabled := false;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit7.Color := CorCamposOnlyRead();
  DBEdit8.Color := CorCamposOnlyRead();
  DBEdit9.Color := CorCamposOnlyRead();
  DBEdit10.Color := CorCamposOnlyRead();
  DBEdit11.Color := CorCamposOnlyRead();
  Edit6.Color := CorCamposOnlyRead();

  DBEditBeleza1.Enabled := false;
  DBEdit7.Enabled := false;
end;

procedure TF01013.BExcluirClick(Sender: TObject);
begin

  //
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select d.*, cron.idOperacao, op.descricao from dependencia d';
  DModule.qAux.SQL.Add(' left outer join Cronometragem cron on cron.idCronometragem = d.idCronometragem');
  DModule.qAux.SQL.Add(' left outer join operacao op on op.idOperacao = cron.idOperacao');
  DModule.qAux.SQL.Add(' where d.idcronometragemDependencia =:idCD');
  DModule.qAux.ParamByName('idCD').AsInteger:= ClientDataSet1idcronometragem.AsInteger;
  DModule.qAux.Open;

  if ds.DataSet.Active then
  begin
      if (not(DS.DataSet.IsEmpty)) then
      begin

          if(DModule.qAux.IsEmpty)then
          begin
              inherited;
          end else
               ShowMessage('Não é possível excluir.' +#13+'A Operação desta cronometragem está vinculada a outra Operação (' +
               DModule.qAux.FieldByName('idOperacao').AsString + ' '+ DModule.qAux.FieldByName('descricao').AsString + ') como dependência.');
      end else
          ShowMessage('Não Há registros');
  end;

end;

procedure TF01013.BInserirClick(Sender: TObject);
begin
  edit2.Text := formatdatetime('hh:nn:ss.zzz',  0);
  CDS_Batida.Close;
  BReutilizar.Enabled := false;
  inherited;
  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit7.Color := CorCamposOnlyRead();
  DBEdit8.Color := CorCamposOnlyRead();
  DBEdit9.Color := CorCamposOnlyRead();
  DBEdit10.Color := CorCamposOnlyRead();
  DBEdit11.Color := CorCamposOnlyRead();
  Edit6.Color := CorCamposOnlyRead();
  DBCheckBox1.Checked := false;
  DBCheckBox2.Checked := false;

end;

procedure TF01013.BitBtn1Click(Sender: TObject);
begin
  inherited;

  if(DS_Recurso.DataSet.RecordCount > 0)then
  begin
    ShowMessage('Não é possível dicionar novo recurso'+ #13+
                'Para efetuar o balanceamento de linha' +#13+
                'será considerado apenas 1 recurso.');
  end else
  begin
    if trim(EditBeleza1.Text) <> '' then
    begin
      {Coloca em Modo de Edição}
      if not DS_Recurso.DataSet.Active then
            DS_Recurso.DataSet.Open;

      if(CDS_Recurso.Locate('idtipo_recurso',Edit1.Text,[]) = false)then
      begin
        DS_Recurso.DataSet.Append;
        CDS_Recursoidcronometragem.asInteger := ClientDataSet1idcronometragem.value;
        CDS_RecursoidTipoRecurso.AsInteger := strToInt( Edit1.Text );

        {Salva}
        DS_Recurso.DataSet.Post;

        {Atualiza grid}
        FDQ_Recurso.ParamByName('id').Value:=(ClientDataSet1idcronometragem.AsInteger);
        DS_Recurso.DataSet.Close;
        DS_Recurso.DataSet.Open;
      end else
      ShowMessage('Fase já adicionada');

    end else
       showmessage('Preencha o Campo');
  end;
end;

procedure TF01013.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if not(CDS_Recurso.IsEmpty)then
  begin
      if MessageDlg('Deseja Apagar Item Selecionado ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        CDS_Recurso.Delete;
      end;
  end else
  begin
      ShowMessage('Não exitem recursos adicionados');
  end;
end;

procedure TF01013.bRelatorioClick(Sender: TObject);
begin
  inherited;

  if NOT(Ds.DataSet.IsEmpty)then
  begin
      frelatorios := tfrelatorios.Create(self);
      with frelatorios do
      begin
          try
              visible := false;
              Assimila_Relat_q(Screen.ActiveForm.Name, 0, DS.DataSet, nil, 'idcronometragem', '');
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

procedure TF01013.BReutilizarClick(Sender: TObject);
var
matriz: array of array of integer;
i : integer;
begin
  inherited;

  //Pega as Batidas da cronometragem selecionada
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from batida where idCronometragem =:idCro';
  DModule.qAux.ParamByName('idCro').AsInteger:= (ClientDataSet1idcronometragem.AsInteger);
  DModule.qAux.Open;
  DModule.qAux.first;

  //Declaração do tamanho da Matriz de tempo
  SetLength(matriz, DModule.qAux.RecordCount);
  for i := 0 to (DModule.qAux.RecordCount -1) do
  begin
    SetLength(matriz[i], 3);
  end;

  //Atribuição dos valores na matriz
  i := 0;
  while not DModule.qAux.eof do
  begin
    matriz[i][0] := StrToInt(DModule.qAux.FieldByName('minutos').AsString);
    matriz[i][1] := StrToInt(DModule.qAux.FieldByName('segundos').AsString);
    matriz[i][2] := StrToInt(DModule.qAux.FieldByName('milesimos').AsString);
    i := i +1;
    DModule.qAux.next;
  end;

  // Salva Batidas no novo Registro da Cronometragem
  BInserirClick(Sender);
  for i := 0 to (Length(matriz)-1) do
  begin
    // DataSource Batida
    CDS_Batida.Open;
    CDS_Batida.Append;
    CDS_Batidaminutos.AsInteger := matriz[i][0];
    CDS_Batidasegundos.AsInteger := matriz[i][1];
    CDS_Batidamilesimos.AsInteger := matriz[i][2];
    CDS_Batidautilizar.AsBoolean := true;
    CDS_BatidaidCronometragem.AsInteger := ClientDataSet1idcronometragem.AsInteger;
    CDS_Batida.Post;

  end;

  //DBGrid Batida
  FDQ_Batida.ParamByName('id').Value:=(ClientDataSet1idcronometragem.AsInteger);
  DS_Batida.DataSet.Close;
  DS_Batida.DataSet.Open;

  //Mostra tempo certo no cronometro
  DS.OnDataChange(Sender, nil);

end;

procedure TF01013.BSalvarClick(Sender: TObject);
begin
  if trim(DBEdit7.Text) <> '' then
    begin
    if trim(DBEdit10.Text) <> '' then
    begin
        if trim(DBEdit2.Text) <> '' then
        begin
            if trim(DBEdit4.Text) <> '' then
            begin
                if trim(DBEdit3.Text) <> '' then
                begin
                    if trim(DBEdit6.Text) <> '' then
                    begin

                        //Pesquisa as Batidas da cronometragem em foco
                        DModule.qAux.Close;
                        DModule.qAux.SQL.Text := 'select * from batida where idCronometragem =:idCro';
                        DModule.qAux.ParamByName('idCro').AsInteger:= (ClientDataSet1idcronometragem.AsInteger);
                        DModule.qAux.Open;
                        if not(DModule.qAux.IsEmpty) then
                        begin

                            //Pesquisa os Recursos usados na cronometragem em foco
                            DModule.qAux.Close;
                            DModule.qAux.SQL.Text := 'select * from cronometragem_has_tipo_recurso otr where otr.idCronometragem =:id';
                            DModule.qAux.ParamByName('id').AsInteger:= (ClientDataSet1idcronometragem.AsInteger);
                            DModule.qAux.Open;
                            if not(DModule.qAux.IsEmpty) then
                            begin
                                //ShowMessage('TPF: ' + ClientDataSet1tempoPadraoFinal.AsString);
                                //

                                inherited;
                                //ShowMessage('teste 1');
                                crono.Enabled := false;
                                status := false;
                                btnINICIAR.Caption := 'NOVO';
                                btnLap.Caption := 'LAP';
                                btnLap.Enabled := false;
                                BReutilizar.Enabled := true;

                                //ShowMessage('teste 2');
                                DBEdit1.Color := clWindow;
                                DBEdit7.Color := $00EFEFEF;
                                DBEdit8.Color := $00EFEFEF;
                                DBEdit9.Color := $00EFEFEF;
                                DBEdit10.Color := $00EFEFEF;
                                DBEdit11.Color := $00EFEFEF;
                                Edit6.Color := clWindow;

                                //ShowMessage('teste 3');
                                DBEditBeleza1.Enabled := true;
                                DBEdit7.Enabled := true;
                                //ShowMessage('teste 4');
                            end else
                                 showmessage('O Registro não pode ser finalizado. Nenhum Recurso adicionado.');
                        end else
                             showmessage('O Registro não pode ser finalizado. Nenhum Tempo Registrado. ');
                    end else
                         showmessage('Informe o Numero de Ocorrência');
                end else
                     showmessage('Informe o Numero de Peças');
            end else
                 showmessage('Informe a Porcentagem de Tolerância');
        end else
             showmessage('Informe a Porcentagem de Ritmo');
    end else
         showmessage('Informe o Operação');
  end else
    showmessage('Informe o Produto');

end;

procedure TF01013.btnLapClick(Sender: TObject);
var
Hora, Min, Seg, MSeg: Word;
begin
  inherited;
  if(status = false)then
  begin
    //Continuar
    btnLap.Caption := 'LAP';
    statusParada := false;

    status := true;
    btnINICIAR.Caption := 'PARAR';
    btnLap.Caption := 'LAP';
    btnLap.Enabled := true;

    //Parte do calculo do Tempo Parcial
    fMomentoUltimoLap := GetTickCount;

  end else
    if(status = true)then
    begin
    //LAP Tempo total do cronometro
    //DecodeTime(((GetTickCount - fmomento) * OneMillisecond), Hora, Min, Seg, MSeg);

    //LAP Tempo Parcial
    DecodeTime(((GetTickCount - fMomentoUltimoLap) * OneMillisecond), Hora, Min, Seg, MSeg);
    //Parte do calculo do Tempo Parcial
    fMomentoUltimoLap := GetTickCount;

    {ShowMessage(' Tempo -> Hora: ' + inttostr(hora) + #13
    + 'Min: ' + inttostr(min) + #13
    + 'Seg: ' + inttostr(seg) + #13
    + 'Milessimos: ' + inttostr(Mseg) + #13);
    }

    // DataSource Batida
    if not DS_Batida.DataSet.Active then
        DS_Batida.DataSet.Open;

    DS_Batida.DataSet.Append;
    CDS_Batidaminutos.AsInteger := min;
    CDS_Batidasegundos.AsInteger := seg;
    CDS_Batidamilesimos.AsInteger := MSeg;
    CDS_Batidautilizar.AsBoolean := true;
    CDS_BatidaidCronometragem.AsInteger := ClientDataSet1idcronometragem.AsInteger;

    DS_Batida.DataSet.Post;

    //DBGrid Batida
    FDQ_Batida.ParamByName('id').Value:=(ClientDataSet1idcronometragem.AsInteger);
    DS_Batida.DataSet.Close;
    DS_Batida.DataSet.Open;

    //Recalcula o TPF
     CalculaTempoPadraoFinal();

    end;
end;

procedure TF01013.btnLapKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  //
  if (key = 13) then
  //click
  begin
    btnLap.Click;
  end;
end;

procedure TF01013.BtnLimparFiltrosClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'select cr.*, o.descricao as operacao, p.descricao as produto, t.descricao as tecido,  op.nome as operador, cron.nome as cronometrista';
  FDQuery1.SQL.add(' from cronometragem cr');
  FDQuery1.SQL.add(' left outer join operacao o on o.idoperacao = cr.idoperacao');
  FDQuery1.SQL.add(' left outer join produto p on p.idProduto = cr.idproduto');
  FDQuery1.SQL.add(' left outer join tecido t on t.idTecido = cr.idtecido');
  FDQuery1.SQL.add(' left outer join operador op on op.idOperador = cr.idOperador');
  FDQuery1.SQL.add(' left outer join cronometrista cron on cron.idCronometrista = cr.idCronometrista');
  FDQuery1.Open;
  BPesquisar.Click;

end;

procedure TF01013.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  FDQuery1.Close;

  FDQuery1.SQL.Text := 'select cr.*, o.descricao as operacao, p.descricao as produto, t.descricao as tecido,  op.nome as operador, cron.nome as cronometrista';
  FDQuery1.SQL.add(' from cronometragem cr');
  FDQuery1.SQL.add(' left outer join operacao o on o.idoperacao = cr.idoperacao');
  FDQuery1.SQL.add(' left outer join produto p on p.idProduto = cr.idproduto');
  FDQuery1.SQL.add(' left outer join tecido t on t.idTecido = cr.idtecido');
  FDQuery1.SQL.add(' left outer join operador op on op.idOperador = cr.idOperador');
  FDQuery1.SQL.add(' left outer join cronometrista cron on cron.idCronometrista = cr.idCronometrista where 1=1');

  if(chkProduto.Checked = true)then
    FDQuery1.SQL.Add(' and cr.idProduto = ' + Edit4.Text);
  if(ChkOperacao.Checked = true)then
    FDQuery1.SQL.Add(' and cr.idOperacao = ' + Edit5.Text);
  if(chkTempoOriginal.Checked = true)then
    FDQuery1.SQL.Add(' and tempo_original = true');
  if(chkTempoIdeal.Checked = true)then
    FDQuery1.SQL.Add(' and tempo_ideal = true' + Edit3.Text);

  FDQuery1.Open;
  BPesquisar.Click;
end;

procedure TF01013.btnINICIARClick(Sender: TObject);
begin
  inherited;
  if(status = false)then
  begin
      if(btnINICIAR.Caption = 'NOVO')then
      begin
        //Exclui Batidas anteriores
         while( not(CDS_Batida.IsEmpty)) do
         begin
            CDS_Batida.Delete;
         end;
         btnINICIAR.Caption := 'INICIAR';
         edit2.Text := '00:00:00.000';
      end else
      begin
          // CRONOMETRO RODANDO
          milissegundoAUX := 0;
          fTempo := 0;
          edit2.Text := formatdatetime('hh:nn:ss.zzz', fTempo);

          status := true;
          statusParada := false;
          fmomento := GetTickCount;
          crono.Enabled := false; //Timer
          crono.Enabled := true;

          btnINICIAR.Caption := 'PARAR';
          btnLap.Caption := 'LAP';
          btnLap.Enabled := true;

          ///Parte do calculo do Tempo Parcial
            fMomentoUltimoLap := GetTickCount;
            btnLap.SetFocus;
      end;

  end else
  begin
    if(status = true)then
    begin
    //CRONOMETRO PARADO
      status := false;
      statusParada := true;

      fMomentoParada :=  GetTickCount;

      btnINICIAR.Caption := 'NOVO';
      btnLap.Caption := 'CONTINUAR';
      btnLap.Enabled := true;

      ///Parte do calculo do Tempo Parcial
      fMomentoUltimoLap := GetTickCount;

      btnLap.SetFocus;

    end;
  end;

end;

procedure TF01013.cronoTimer(Sender: TObject);
var
Hora, Min, Seg, MSeg: Word;
begin
  inherited;
  if(statusParada = true)then
  begin
    fTempoParada := ((GetTickCount - fMomentoParada) * OneMillisecond);
    DecodeTime(fTempoParada, Hora, Min, Seg, MSeg);
    milissegundoAUX := mseg + (seg * 1000) + (min * 60000) + (hora * 3600000);
    edit3.Text := formatdatetime('hh:nn:ss.zzz', fTempoParada);
  end else
    if(milissegundoAUX > 0)then
    begin
      edit3.Text := 'ENTROU';

      //aumenta o tempo em que o cronometro começou para se ter o tempo fiel
      fmomento := fmomento + milissegundoAUX;

      ftempo := ((GetTickCount - fmomento) * OneMillisecond);
      edit2.Text := formatdatetime('hh:nn:ss.zzz', fTempo);
      milissegundoAUX := 0;
    end else
      if(milissegundoAUX = 0)then
      begin
        ftempo := ((GetTickCount - fmomento) * OneMillisecond);
        edit2.Text := formatdatetime('hh:nn:ss.zzz', fTempo);
      end;
end;


procedure TF01013.CalculaTempoPadraoFinal();
var
i, min, seg, mil, soma : integer;
tempoMedio, tempoPadrao, tempoPadraoFinal: double;
begin
  //idcronometragem
  //num_pecas
  //ritmo
  //tolerancia

  //Obtenção dos dados
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'select * from batida where idCronometragem =:idCro and utilizar = true';
    DModule.qAux.ParamByName('idCro').AsInteger:= (ClientDataSet1idcronometragem.AsInteger);
    DModule.qAux.Open;
    DModule.qAux.first;
    //Contagem dos valores
    i := 0;
    min := 0;
    seg := 0;
    mil := 0;
    soma := 0;

    if(DModule.qAux.RecordCount > 0)then
    begin
        while not DModule.qAux.eof do
        begin
          min := min + DModule.qAux.FieldByName('minutos').AsInteger;
          seg := seg + StrToInt(DModule.qAux.FieldByName('segundos').AsString);
          mil := mil + StrToInt(DModule.qAux.FieldByName('milesimos').AsString);
          i := i +1;
          DModule.qAux.next;
        end;

        soma := (min* 60000) + seg * 1000 + mil;

        if((i > 0) and ( ClientDataSet1num_pecas.AsInteger > 0))then
        begin
          //TempoMedio = (SomatórioTempo/NumeroBatidas)/NumerodePeças
            tempoMedio := (soma/i)/ClientDataSet1num_pecas.AsInteger;

          //TempoPadrao = TempoMedio * (1+(1-(ritmo/100)))
            tempoPadrao := tempoMedio * (ClientDataSet1ritmo.AsInteger/100);

          //TempoPadraoFinal = TempoPadrao * (1+(Tolerancia/100))
            tempoPadraoFinal := tempoPadrao * (1+(ClientDataSet1tolerancia.AsInteger/100));

            ClientDataSet1tempoPadraoFinal.Value := tempoPadraoFinal;
            DBEdit16.Text := FloatToStr(tempoPadraoFinal);
        end;
    end else
    begin
        //Caso nenhum tempo seja utilizado
        ClientDataSet1tempoPadraoFinal.Value := 0;
        DBEdit16.Text := ClientDataSet1tempoPadraoFinal.AsString;
    end;
end;

procedure TF01013.CDS_BatidaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  CDS_Batida.CancelUpdates;
end;

procedure TF01013.CDS_BatidaAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CDS_Batida.ApplyUpdates(-1);

  CalculaTempoPadraoFinal();
end;

procedure TF01013.CDS_BatidaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CDS_Batidaidbatida.AsInteger := DModule.buscaProximoParametro('seqBatida');

end;

procedure TF01013.CDS_BatidaAfterPost(DataSet: TDataSet);
begin
  inherited;
  CDS_Batida.ApplyUpdates(-1);
  //CalculaTempoPadraoFinal;
end;

Procedure TF01013.CDS_RecursoAfterCancel(DataSet: TDataSet);
begin
  inherited;
  CDS_Recurso.CancelUpdates;
end;

procedure TF01013.CDS_RecursoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CDS_Recurso.ApplyUpdates(-1);
end;

procedure TF01013.CDS_RecursoAfterPost(DataSet: TDataSet);
begin
  inherited;
  CDS_Recurso.ApplyUpdates(-1);
end;

procedure TF01013.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idcronometragem.AsInteger := DModule.buscaProximoParametro('seqCronometragem');
end;

procedure TF01013.ClientDataSet1ritmoChange(Sender: TField);
begin
  inherited;

  CalculaTempoPadraoFinal();
end;

procedure TF01013.DBEdit10Change(Sender: TObject);
begin
  inherited;
  if DS.DataSet.State=dsInsert then
  begin
    if ((trim(DBEdit10.Text) <> '') and (trim(DBEdit7.Text) <> '')) then
    begin
         DModule.qAux.Close;
         DModule.qAux.SQL.Text := 'select * from cronometragem where idproduto =:idProd and idOperacao =:idOp';
         DModule.qAux.ParamByName('idProd').AsInteger := ClientDataSet1idProduto.AsInteger;
         DModule.qAux.ParamByName('idOp').AsInteger := ClientDataSet1idOperacao.AsInteger;
         DModule.qAux.open;
         DModule.qAux.First;

         //Verifica se Cronometragem já existe
         if not(DModule.qAux.IsEmpty)then
         begin
              ShowMessage('Cronometragem Já Existe.');
              DBEdit10.Text := '';
              DBEditBeleza2.Text := '';
          end;
    end;
  end;
end;

procedure TF01013.DBEdit16Change(Sender: TObject);
var
fTPF: TTime;
begin
  inherited;
  fTPF := ClientDataSet1tempoPadraoFinal.AsFloat * OneMillisecond;
  //ShowMessage('fTPF: ' + TimeToStr(fTPF));
  Edit6.Text := formatdatetime('hh:nn:ss.zzz',  fTPF);
end;

procedure TF01013.DBEdit17Click(Sender: TObject);
begin
  inherited;
  //ShowMessage(FloatToStr(ClientDataSet1tempoPadraoFinal.AsFloat));
end;

procedure TF01013.DBEdit2Click(Sender: TObject);
begin
  inherited;

  CalculaTempoPadraoFinal();
end;

procedure TF01013.DBEdit3Click(Sender: TObject);
begin
  inherited;

  CalculaTempoPadraoFinal();
end;

procedure TF01013.DBEdit4Click(Sender: TObject);
begin
  inherited;

  CalculaTempoPadraoFinal();
end;

procedure TF01013.DBEdit7Change(Sender: TObject);
begin
  inherited;
  //se mudar o produto, deve mudar tbm a prioridade;
  if trim(DBEdit7.Text) <> '' then
  begin
    DBEdit10.Enabled := true;
    DBEditBeleza2.Enabled := true;

  end else
  begin
    DBEdit10.Text := '';
    DBEditBeleza2.Text := '';
    DBEdit10.Enabled := false;
    DBEditBeleza2.Enabled := false;
  end;
end;

procedure TF01013.DBEditBeleza1Click(Sender: TObject);
begin
  inherited;
  DBEdit7.Text := '';
  DBEditBeleza1.Text := '';
end;

Procedure TF01013.DBGridBatidaDblClick(Sender: TObject);
begin
  inherited;
  IF NOT(CDS_Batida.IsEmpty)THEN
  BEGIN
      CDS_Batida.Edit;
      CDS_Batidautilizar.AsBoolean := not CDS_Batidautilizar.AsBoolean;
      CDS_Batida.Post;
      CalculaTempoPadraoFinal();
  END;
end;

procedure TF01013.DBGridBatidaDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
Check: Integer;
R: TRect;
begin
    //Desenha um checkbox no dbgrid
    if Column.FieldName = 'UTI' then
    begin
      DBGridBatida.Canvas.FillRect(Rect);
      Check := 0;
      if CDS_Batidautilizar.AsBoolean = TRUE then
        Check := DFCS_CHECKED
    else
    BEGIN
      Check := 0;
    END;
    R:=Rect;
    InflateRect(R,-2,-2); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGridBatida.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
    end;
end;


procedure TF01013.DBGridBatidaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = 46) then
  //Deleta Batida
  begin
    if MessageDlg('Deseja Apagar Item Selecionado ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
        CDS_Batida.Delete;
        DS.OnDataChange(Sender, nil);
        CalculaTempoPadraoFinal();
     end;
  end;

end;

procedure TF01013.DBGridBeleza1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
Check: Integer;
R: TRect;
begin
    //Desenha um checkbox no dbgrid
    if Column.FieldName = 'tempo_original' then
    begin
      if ClientDataSet1tempo_original.AsBoolean = TRUE then
      begin
        //

      end else
      BEGIN
        //

      END;
    end;
    inherited;
end;


procedure TF01013.DBGridBeleza2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = 46) then
  //Deleta Batida
  begin
    if MessageDlg('Deseja Apagar Item Selecionado ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
        CDS_Recurso.Delete;
     end;
  end;
end;

procedure TF01013.DSDataChange(Sender: TObject; Field: TField);
var
min, seg, mil : integer;
fTempoCronometr: TTime;
begin
  inherited;
  //DBGRID TIPO RECURSO
  FDQ_Recurso.ParamByName('id').Value:=(ClientDataSet1idcronometragem.AsInteger);
  DS_Recurso.DataSet.Close;
  DS_Recurso.DataSet.Open;

  //Pega as Batidas da cronometragem selecionada
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from batida where idCronometragem =:idCro';
  DModule.qAux.ParamByName('idCro').AsInteger:= (ClientDataSet1idcronometragem.AsInteger);
  DModule.qAux.Open;
  DModule.qAux.first;

  //Contagem dos valores
  while not DModule.qAux.eof do
  begin
    //Converte Todos para milésimos
    min := StrToInt(DModule.qAux.FieldByName('minutos').AsString) * 60000;
    seg := StrToInt(DModule.qAux.FieldByName('segundos').AsString) * 1000;
    mil := StrToInt(DModule.qAux.FieldByName('milesimos').AsString);
    fTempoCronometr := fTempoCronometr + ((mil + seg + min) * OneMillisecond);
    DModule.qAux.next;
  end;
  edit2.Text := formatdatetime('hh:nn:ss.zzz',  fTempoCronometr);


  //DBGrid Batida
  FDQ_Batida.ParamByName('id').Value:=(ClientDataSet1idcronometragem.AsInteger);
  DS_Batida.DataSet.Close;
  DS_Batida.DataSet.Open;

end;

procedure TF01013.FormCreate(Sender: TObject);
begin
  inherited;
  status := false;
  self.DouBleBuffered := True; //evitar o flick do relógio.
end;

procedure TF01013.ClientDataSet1num_pecasChange(Sender: TField);
begin
  inherited;

  CalculaTempoPadraoFinal();
end;

procedure TF01013.ClientDataSet1toleranciaChange(Sender: TField);
begin
  inherited;

  CalculaTempoPadraoFinal();
end;

Initialization
  RegisterClass(TF01013);
Finalization
  UnRegisterClass(TF01013);
end.
