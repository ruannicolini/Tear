unit U02004;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Datasnap.DBClient, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, DBGridBeleza,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.Mask, Vcl.DBCtrls,
  DBEditBeleza, Vcl.Imaging.pngimage, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, VCLTee.GanttCh, VCLTee.TeeProcs, VCLTee.Chart, System.Contnrs,
  GanttUnit, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxEdit, cxScheduler, cxSchedulerStorage, cxSchedulerCustomControls,
  cxSchedulerCustomResourceView, cxSchedulerDayView, cxSchedulerDateNavigator,
  cxSchedulerHolidays, cxSchedulerTimeGridView, cxSchedulerUtils,
  cxSchedulerWeekView, cxSchedulerYearView, cxSchedulerGanttView,
  cxSchedulerRecurrence, cxSchedulerRibbonStyleEventEditor,
  cxSchedulerTreeListBrowser, cxClasses, cxSchedulerDBStorage, IdBaseComponent,
  IdScheduler, IdSchedulerOfThread, IdSchedulerOfThreadDefault, cxContainer,
  cxDBEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxSpinEdit,
  DBEditCalendario, Vcl.Tabs, Vcl.ButtonGroup, dxGalleryControl, dxColorGallery,
  dxDBColorGallery, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;

{Declações do Layout}

type TOperacao =  class(TPanel)     //vai sair
   public
   IdLayOutOperacoes   : integer;
   idTipoRecurso       : integer;
   idCronometragem     : integer;
   Cota                : real;
   CotaPendente        : real;
   tipoRecurso         : string;
   Operacao            : string;
   GCotaPendente       : TProgressBar;
   LbCotaPendente      : tlabel;
   LbCota              : tlabel;
   LbOperacao          : tlabel;
   LbRecurso           : tlabel;
   constructor Create(AOwner: TComponent); override;
end;

{********** Declarações da estrutura passada para a unit de Sequenciamento e Balanceamento **********}

//JOBS
type TOperacaoProduto = record
  codCronometragem : integer;
  tempoPadraoFinal : real;
  codTipoMaquina : integer; // Maquina utilizada para realizar a operação
  precedencia : array of integer;
  constructor create(codCro:integer;tpf:Real;cdM:integer);
end;

type TFaseDaOrdem =  record
  codFaseDaOrdem : integer;  // cod gerado na criação da ordem para cada fase
  sequencia : integer;
  qtdOriginal : integer;
  codFaseProduto :integer; // id da fase original nas fases do produto
  descricaoFaseProduto : string;
  operacoes : array of TOperacaoProduto;
  constructor create(codOHF: integer; seq:integer;qtdT:integer;codF,codProd:integer;desFase:string);
end;

type TOrdem =  record
  codOrdem : integer;
  numOrdem : integer;
  dataOrdem : TDate;
  codProduto : integer;
  descricaoProduto : string;
  fasesDaOrdem : array of TFaseDaOrdem;
  constructor Create(cod:integer;num:integer;dat:Tdate; codp:integer; desProd:string);
end;

//CELULAS
type TRecursoMaquina =  record
    codMaquina : integer;
    descricaoMaquina : string;
    patrimonio : integer;
    codTipoMaquina : integer;
    descricaoTipoMaquina : string;
    constructor Create(codM, pat, codTM:integer; descM, descTM:String);
end;

type TLinhaProducao =  record
    codLinhaProducao : integer;
    descricaoLinhaProducao : string;
    qtdOperadores : integer;
    maquinas : array of TRecursoMaquina;
    fasesHabilitadas : array of integer; // Fases de produtos que a linha de produção pode executar;
    dataUltimoAgendamento : String;
    HoraUltimoAgendamento: String;
    constructor Create(codLP,qtdO:integer;descLP :String);
end;

{********** Declarações da estrutura DE RETORNO da unit de Sequenciamento e Balanceamento **********}

type TTarefa = record
  CodTarefa     : Integer;
  TempoInicio   : Double;
  TempoTermino  : Double;
end;

type TOperador = record
  CodOperador   : Integer;
  Tarefas       : array of TTarefa;
end;

type TLProducao = record
  CodLProducao    : Integer;
  Lotes           : array of Integer; //nº Ordem de produção
  Operadores      : array of TOperador;
end;


type
  TcxSchedulerTimeGridViewAccess = class(TcxSchedulerTimeGridView);

{********************  TELA  ********************}
type
  TF02004 = class(TFBase)
    PanelInformacoes: TPanel;
    ScrollBoxOperacoes: TScrollBox;
    SpeedButton1: TSpeedButton;
    Scroll_Layout: TScrollBox;
    FDQuery2: TFDQuery;
    DataSetProvider2: TDataSetProvider;
    mTarefas: TClientDataSet;
    img: TImage;
    FDQuery1idSequenciamento: TIntegerField;
    FDQuery1dataSeq: TDateField;
    FDQuery1responstavel: TStringField;
    ClientDataSet1idSequenciamento: TIntegerField;
    ClientDataSet1dataSeq: TDateField;
    ClientDataSet1responstavel: TStringField;
    Label1: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    PanelBusca: TPanel;
    TabSet1: TTabSet;
    FDQuery2idTarefaSequenciada: TIntegerField;
    FDQuery2idCronometragem: TIntegerField;
    FDQuery2operacao: TStringField;
    FDQuery2idOrdem: TIntegerField;
    FDQuery2numOrdem: TIntegerField;
    FDQuery2idRecurso: TIntegerField;
    FDQuery2tipoRecurso: TStringField;
    FDQuery2IdLinha_producao: TIntegerField;
    FDQuery2linhaProducao: TStringField;
    FDQuery2tempoInicio: TDateTimeField;
    FDQuery2TempoFim: TDateTimeField;
    mTarefasidTarefaSequenciada: TIntegerField;
    mTarefasidCronometragem: TIntegerField;
    mTarefasoperacao: TStringField;
    mTarefasidOrdem: TIntegerField;
    mTarefasnumOrdem: TIntegerField;
    mTarefasidRecurso: TIntegerField;
    mTarefastipoRecurso: TStringField;
    mTarefasIdLinha_producao: TIntegerField;
    mTarefaslinhaProducao: TStringField;
    mTarefastempoInicio: TDateTimeField;
    mTarefasTempoFim: TDateTimeField;
    BGIndex: TButtonGroup;
    Panel4: TPanel;
    ActionMostrarPainelInformacoes: TAction;
    PanelNome: TPanel;
    cxScheduler1: TcxScheduler;
    cxSchedulerDBStorage1: TcxSchedulerDBStorage;
    DSChart: TDataSource;
    DataSetProviderChart: TDataSetProvider;
    ClientDataSetChart: TClientDataSet;
    FDQueryChart: TFDQuery;
    FDQueryChartidTarefaSequenciada: TIntegerField;
    FDQueryChartidCronometragem: TIntegerField;
    FDQueryChartoperacao: TStringField;
    FDQueryChartidOrdem: TIntegerField;
    FDQueryChartnumOrdem: TIntegerField;
    FDQueryChartidRecurso: TIntegerField;
    FDQueryCharttipoRecurso: TStringField;
    FDQueryChartIdLinha_producao: TIntegerField;
    FDQueryChartlinhaProducao: TStringField;
    FDQueryCharttempoInicio: TDateTimeField;
    FDQueryChartTempoFim: TDateTimeField;
    ClientDataSetChartidTarefaSequenciada: TIntegerField;
    ClientDataSetChartidCronometragem: TIntegerField;
    ClientDataSetChartoperacao: TStringField;
    ClientDataSetChartidOrdem: TIntegerField;
    ClientDataSetChartnumOrdem: TIntegerField;
    ClientDataSetChartidRecurso: TIntegerField;
    ClientDataSetCharttipoRecurso: TStringField;
    ClientDataSetChartIdLinha_producao: TIntegerField;
    ClientDataSetChartlinhaProducao: TStringField;
    ClientDataSetCharttempoInicio: TDateTimeField;
    ClientDataSetChartTempoFim: TDateTimeField;
    FDQueryChartnumOperador: TIntegerField;
    ClientDataSetChartnumOperador: TIntegerField;
    DSTarefas: TDataSource;
    FDQueryChartidsequenciamento: TIntegerField;
    ClientDataSetChartidsequenciamento: TIntegerField;
    DBGrid1: TDBGrid;
    FDQueryCharteventType: TIntegerField;
    FDQueryChartoptions: TIntegerField;
    ClientDataSetCharteventType: TIntegerField;
    ClientDataSetChartoptions: TIntegerField;
    FDQueryChartmensagem: TStringField;
    ClientDataSetChartmensagem: TStringField;
    FDQuery2idSequenciamento: TIntegerField;
    mTarefasidSequenciamento: TIntegerField;
    FDQuery2numOperador: TIntegerField;
    mTarefasnumOperador: TIntegerField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BInserirClick(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure mTarefasAfterDelete(DataSet: TDataSet);
    procedure mTarefasAfterPost(DataSet: TDataSet);
    procedure mTarefasAfterCancel(DataSet: TDataSet);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure mTarefasAfterInsert(DataSet: TDataSet);
    procedure TabSet1Click(Sender: TObject);
    procedure BPesquisarClick(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure BGIndexButtonClicked(Sender: TObject; Index: Integer);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure ActionMostrarPainelInformacoesExecute(Sender: TObject);
    procedure ClientDataSetChartAfterInsert(DataSet: TDataSet);
    procedure ClientDataSetChartAfterPost(DataSet: TDataSet);
    procedure cxScheduler1ScaleScroll(Sender: TcxCustomScheduler;
      AStartDateTime, AFinishDateTime: TDateTime);
    procedure cxScheduler1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxScheduler1CustomDrawEvent(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxSchedulerEventCellViewInfo; var ADone: Boolean);
    procedure cxSchedulerDBStorage1GetEventGeneratedID(
      Sender: TcxSchedulerDBStorage; AEvent: TcxSchedulerEvent;
      var EventID: Variant);
    procedure bRelatorioClick(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure ClientDataSet1BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Panel : TPANEL;
    ProgressBar : TProgressBar;
    procedure CalculaMetaHora();
    procedure montaJobs(var jobs: TArray<TOrdem>);
    procedure montaCelulas(var celulas: TArray<TLinhaProducao>);
    procedure montaLayoutOperacoes(telaOP: TScrollBox; dados: TClientDataSet);

    procedure montaBGIndexOrdem(dados: TClientDataSet);
    procedure montaBGIndexLinhaP(dados: TClientDataSet);
    procedure montaScrollBox_Layout(tipoComportamento, idPesquisado : integer);
  end;

var
  F02004: TF02004;
  TempoTotal : real;
  MetaHora   : integer;
  LP: integer; //Linha de Produção visivel no momento

implementation

//{$APPTYPE CONSOLE}

{$R *.dfm}
uses u_relatorios, UDataModule, Math, System.Generics.Collections;

procedure TF02004.Action5Execute(Sender: TObject);
begin
  inherited;
  PanelInformacoes.Enabled := false;
end;

procedure TF02004.ActionMostrarPainelInformacoesExecute(Sender: TObject);
begin
  inherited;
  //
  if(PanelInformacoes.Visible = true) then
  begin
       PanelInformacoes.Visible := false;
       BtnLimparFiltros.Click;
  end else
  begin
    PanelInformacoes.Visible := true;
  end;
end;

procedure TF02004.BEditarClick(Sender: TObject);
begin
  inherited;
  PanelInformacoes.Enabled := true;
  grdados.Enabled := true;
end;

procedure TF02004.BExcluirClick(Sender: TObject);
begin
  inherited;
  grdados.Enabled := true;
end;

procedure TF02004.BInserirClick(Sender: TObject);
begin
  inherited;
  PanelInformacoes.Enabled := true;
end;

procedure TF02004.BPesquisarClick(Sender: TObject);
begin
  inherited;
  //
  grdados.Enabled := true;
end;

procedure TF02004.bRelatorioClick(Sender: TObject);
var
  q: TFDQuery;
begin

  if NOT(Ds.DataSet.IsEmpty)then
  begin
      // Mosta query com tarefas dos Sequenciamentos selecionados
      q := TFDQuery.Create(self);
      q.Connection := DModule.FDConnection;
      q.sql.text :=
      'select ts.idTarefaSequenciada, ts.idCronometragem, o.descricao as operacao,'+
      'ts.idOrdem, Op.numOrdem,ts.numOperador, ts.idsequenciamento,                '+
      'ts.idRecurso, tr.descricao as tipoRecurso,                                  '+
      'ts.IdLinha_producao, lp.descricao as linhaProducao,                         '+
      'ts.tempoInicio, ts.TempoFim                                                 '+
      'from tarefa_sequenciada ts                                                  '+
      'left outer join cronometragem c on c.idCronometragem = ts.idCronometragem   '+
      'left outer join operacao o on o.idOperacao = c.idOperacao                   '+
      'left outer join ordem_producao op on op.idOrdem = ts.idOrdem                '+
      'left outer join tipo_recurso tr on tr.idTipo_recurso = ts.idrecurso         '+
      'left outer join grupo lp on lp.idGrupo = ts.idLinha_Producao                '+
      'and ts.idsequenciamento in (-1  ';
      ds.DataSet.first;
      while not ds.DataSet.Eof do
      begin
        q.sql.add(','+  ds.DataSet.FieldByName('idSequenciamento').AsString);
        ds.DataSet.Next;
      end;
      q.sql.add(')');
      q.sql.add(' Order by ts.IdLinha_producao, ts.numOperador,ts.tempoInicio ');
      q.open;

      //chama tela relatórios
      ds.DataSet.first;
      frelatorios := tfrelatorios.Create(Application);
      with frelatorios do
      begin
          try
              visible := false;
              Frelatorios.Assimila_Relat_q(Screen.ActiveForm.Name, 0,fdquery1, q, 'idSequenciamento', 'idSequenciamento');
              Frelatorios.ShowModal;
          finally
              Relatorios_sis.close;
              relats_usur.close;
              Free;
          end;
      end;
      q.Free;
  end else
  begin
    ShowMessage('Relatório necessita de pesquisa');
  end;

end;


procedure TF02004.BSalvarClick(Sender: TObject);
begin
  inherited;
  PanelInformacoes.Enabled := false;
  grdados.Enabled := true;
end;

procedure TF02004.BGIndexButtonClicked(Sender: TObject; Index: Integer);
begin
  //Comportamento onClick de todos os Botões de BGIndex
  inherited;

  cxSchedulerDBStorage1.Resources.Items.Clear;
  PanelNome.caption := (sender as TButtonGroup).Items[index].Caption;
  // (tipo 0= lp, tipo 1 = OP) / (idLinhadeProdução)
  montaScrollBox_Layout(TabSet1.TabIndex, strtoint((sender as TButtonGroup).Items[index].Hint));

end;


procedure TF02004.CalculaMetaHora;
begin
  TempoTotal := 0;
{  Dmodule.QAux.sql.Text := 'select sum(tempoOperacao) from LayOutOperacao where IdLayoutFase =:IdLF ';
  Dmodule.QAux.ParamByName('IdLF').AsInteger := ClientDataSet1idLayoutFase.AsInteger;
  Dmodule.QAux.open;

  //showmessage(FloatToStr(Dmodule.qaux.Fields[0].AsFloat));
  TempoTotal := (Dmodule.qaux.Fields[0].AsFloat)/1000; //converte de milesegundos para segundos

  //calculando a cota por operacao
  MOperacoes.close;
  fdquery2.Params[0].AsInteger := ClientDataSet1idLayoutFase.AsInteger;
  MOperacoes.Open;


  if TempoTotal > 0 then
  begin
      //meta hora calculo
      MetaHora := trunc((60/TempoTotal)* ClientDataSet1numOperadores.AsInteger);
      //showmessage('Tempo total '+floattostr(TempoTotal)+' meta hora '+inttostr(MetaHora));

      //showmessage('Montou pro layout  '+inttostr(MLayoutIdLayout.AsInteger));
      //calculando a cota por operacao
      MOperacoes.close;
      fdquery2.Params[0].AsInteger := ClientDataSet1idLayoutFase.AsInteger;
      MOperacoes.Open;

      MOperacoes.First;
      while not(moperacoes.Eof) do
      begin
          moperacoes.Edit;
          MOperacoesCota.AsFloat         := (MetaHora/(60/ (moperacoestempoOperacao.AsFloat/1000)))*100; // OBS: tempo operação é dividido por 1000 para passar de milesegundos para segundos
          MOperacoesCotaPendente.AsFloat := MOperacoesCota.AsFloat;
          MOperacoes.Next;
      end;
  end;

  ed_metaHora.text := Integer.ToString(MetaHora);
  Ed_tempo.text    := Double.ToString(TempoTotal);
}
end;


procedure TF02004.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idSequenciamento.AsInteger := DModule.buscaProximoParametro('seqSequenciamento');
end;

procedure TF02004.ClientDataSetChartAfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSetChartidTarefaSequenciada.AsInteger := DModule.buscaProximoParametro('seqTarefaSequenciada');
end;

procedure TF02004.ClientDataSetChartAfterPost(DataSet: TDataSet);
begin
  inherited;
  ClientDataSetChart.ApplyUpdates(-1);
end;

procedure TF02004.cxSchedulerDBStorage1GetEventGeneratedID(
  Sender: TcxSchedulerDBStorage; AEvent: TcxSchedulerEvent;
  var EventID: Variant);
begin
  inherited;
  ShowMessage('entrou');
  EventID := DModule.buscaProximoParametro('seqTarefaSequenciada');
end;

procedure TF02004.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  //Aciona o click em Tabset e mostra as informações no TButtonGroup BDIndex
  // A pesquisa pode ser por Linha de produção ou por Ordem sequenciada de acordo com o TabSet selecionado
  TabSet1Click(sender);
end;

procedure TF02004.montaCelulas(var celulas: TArray<TLinhaProducao>);
var
i : integer;
begin
  //
  Dmodule.qAux.Close;
  Dmodule.qAux.SQL.Text := 'select lp.*, (select count(*) from operador where idGrupo = lp.idGrupo) as qtdOperadores ' +
  'from grupo lp where lp.idGrupo';
  Dmodule.qAux.open;
  Dmodule.qAux.First;
  SetLength(celulas, DModule.qAux.RecordCount);
  for i := 0 to (DModule.qAux.RecordCount -1) do
  begin
    celulas[i] := TLinhaProducao.create(
    DModule.qAux.FieldByName('idGrupo').AsInteger,
    DModule.qAux.FieldByName('qtdOperadores').AsInteger,
    DModule.qAux.FieldByName('descricao').AsString
    );
    Dmodule.qAux.Next;
  end;

end;

procedure TF02004.montaJobs( var jobs: TArray<TOrdem>);
var
i: integer;
begin
  //Busca ordens ainda não sequenciadas
  DModule.qAux.Close;
  DModule.qAux.sql.Text := 'select op.*, p.descricao as produto from ordem_producao op ' +
  'left outer join produto p on p.idProduto = op.idProduto where op.sequenciado =:idSequenciado';
  DModule.qAux.ParamByName('idSequenciado').AsBoolean := false;
  DModule.qAux.open;
  DModule.qAux.First;
  SetLength(jobs, DModule.qAux.RecordCount);
  for i := 0 to (DModule.qAux.RecordCount -1) do
  begin
     //
     jobs[i] := TOrdem.create(
     DModule.qAux.FieldByName('idOrdem').AsInteger,
     DModule.qAux.FieldByName('numOrdem').AsInteger,
     (DModule.qAux.FieldByName('dataCadastro').AsDateTime),
     DModule.qAux.FieldByName('idProduto').AsInteger,
     DModule.qAux.FieldByName('produto').AsString
     );
     DModule.qAux.Next;
  end;
end;

procedure TF02004.montaLayoutOperacoes(telaOP: TScrollBox;
  dados: TClientDataSet);
var
vertical, NOperacoes :integer;
Operacoes  : array [1..40] of TOperacao;
begin
//

  telaOp.DestroyComponents;   // Limpa tela

  vertical := 10;
  NOperacoes := 0;

  dados.First;
  while not(dados.eof) do
  begin
       inc(NOperacoes);
       Operacoes[NOperacoes]                        := TOperacao.Create(telaop);
       Operacoes[NOperacoes].Parent                 := telaOP;
       Operacoes[NOperacoes].IdLayOutOperacoes      := dados.fieldbyname('IdLayOutOperacao').AsInteger;
       Operacoes[NOperacoes].idTipoRecurso          := dados.fieldbyname('idTipo_Recurso').AsInteger;
       Operacoes[NOperacoes].idCronometragem        := dados.fieldbyname('idCronometragem').AsInteger;
       Operacoes[NOperacoes].Cota                   := dados.fieldbyname('Cota').AsInteger;
       Operacoes[NOperacoes].CotaPendente           := dados.fieldbyname('CotaPendente').AsInteger;
       Operacoes[NOperacoes].tipoRecurso            := dados.fieldbyname('tipo_Recurso').AsString;
       Operacoes[NOperacoes].Operacao               := dados.fieldbyname('Operacao').AsString;
       Operacoes[NOperacoes].LbOperacao.Caption     := dados.fieldbyname('Operacao').AsString;
       Operacoes[NOperacoes].LbCota.Caption         := 'Cota: '+Floattostr(Operacoes[NOperacoes].Cota);
       Operacoes[NOperacoes].LbCotaPendente.Caption := 'Cota Pendente: '+ Floattostr(Operacoes[NOperacoes].CotaPendente);
       Operacoes[NOperacoes].LbRecurso.Caption      := dados.fieldbyname('tipo_Recurso').AsString ;
       Operacoes[NOperacoes].GCotaPendente.Max :=  round(Operacoes[NOperacoes].CotaPendente) ;
       Operacoes[NOperacoes].Top                    := vertical;
       Operacoes[NOperacoes].Left                   := 5;
       vertical := vertical + Operacoes[NOperacoes].Height + 5;
       dados.Next;
  end;
end;

procedure TF02004.montaBGIndexLinhaP(dados: TClientDataSet);
var
listaLP : TList<Integer>;
gbi          : TGrpButtonItem;
begin
  listaLP := TList<Integer>.Create;
  // Limpa tela
  BGIndex.items.Clear;
  //Popula ButtonGroup1
  dados.First;
  while not(dados.eof) do
  begin
        if(   NOT(listaLP.Contains(dados.FieldByName('idLinha_producao').AsInteger))    )then
        begin
           gbi := TGrpButtonItem.Create(BGIndex.Items);
           gbi.Caption := (dados.fieldbyname('Linhaproducao').AsString);
           gbi.Hint := dados.fieldbyname('idLinha_Producao').AsString;
           listaLP.add(dados.FieldByName('idLinha_producao').AsInteger);
        end;
        dados.Next;
  end;
  listaLP.Free;

end;


procedure TF02004.montaBGIndexOrdem(dados: TClientDataSet);
var
listaOP : TList<Integer>;
gbi          : TGrpButtonItem;
begin
  listaOP := TList<Integer>.Create;
  // Limpa tela
  BGIndex.items.Clear;
  //Popula TButtonGroup  BGIndex
  dados.First;
  while not(dados.eof) do
  begin
        if(   NOT(listaOP.Contains(dados.FieldByName('idOrdem').AsInteger))    )then
        begin
           gbi := TGrpButtonItem.Create(BGIndex.Items);
           gbi.Caption := (dados.fieldbyname('NumOrdem').AsString);
           gbi.Hint := dados.fieldbyname('idOrdem').AsString;
           listaOP.add(dados.FieldByName('idOrdem').AsInteger);
        end;
        dados.Next;
  end;
  listaOP.Free;
end;

procedure TF02004.montaScrollBox_Layout(tipoComportamento,
  idPesquisado: integer);
var
dataini :Tdatetime;
i: integer;
begin
  //ShowMessage( 'hint:'+ inttostr(idPesquisado) + '||  indexTab: ' + inttostr(tipoComportamento) );
  if(tipoComportamento = 0)then //tipoComportamento = 0 -> LinhaProdução
  begin
        //Cria os Resources dinamicamente sem vincular em tabela
        cxSchedulerDBStorage1.Resources.Items.Clear;
        DModule.qAux.Close;
        DModule.qAux.SQL.Text := 'select max(ts.NumOperador) as numResources from tarefa_sequenciada ts ' +
                                 'where ts.idSequenciamento =:idSeq and ts.IdLinha_producao =:idLP';
        DModule.qAux.ParamByName('idSeq').Value :=(ClientDataSet1idSequenciamento.AsInteger);
        DModule.qAux.ParamByName('idLP').Value:= (idPesquisado);
        DModule.qAux.open;

        for I := 0 to (DModule.qAux.FieldByName('numResources').AsInteger -1) do
        begin
        cxSchedulerDBStorage1.Resources.Items.Items[i] := TcxSchedulerStorageResourceItem.Create(cxSchedulerDBStorage1.Resources.Items);
        cxSchedulerDBStorage1.Resources.Items.Items[i].ResourceID := i +1;
        cxSchedulerDBStorage1.Resources.Items.Items[i].Name := 'OPER ' + inttostr(i+1);
        end;

        //Adiciona os eventos aos resources
        FDQueryChart.ParamByName('idSeq').Value:=(ClientDataSet1idSequenciamento.AsInteger);
        FDQueryChart.ParamByName('idLP').Value:= (idPesquisado);
        DSChart.DataSet.Close;
        DSChart.DataSet.Open;
        if not(ClientDataSetChart.IsEmpty)then
        begin
          DModule.qAux.Close;
          DModule.qAux.open;
          DModule.qAux.sql.Text := 'select min(ts.tempoInicio) as inicio, max(ts.tempoFim) as fim from tarefa_sequenciada ts '+
                                    'where ts.idSequenciamento =:IDSEQ and ts.idLinha_Producao =:IDLP';
          DModule.qAux.ParamByName('IDSEQ').AsInteger := ClientDataSet1idSequenciamento.AsInteger;
          DModule.qAux.ParamByName('IDLP').AsInteger := idPesquisado;
          DModule.qAux.Open;

          dataIni := DModule.qAux.FieldByName('Inicio').AsDateTime; //first;;
          cxScheduler1.GoToDate(dataini);
          //Faz com que o Scroll seja direcionado para o local exato do inicio da primeira tarefa
          cxScheduler1.OnScaleScroll(cxScheduler1, DModule.qAux.FieldByName('Inicio').AsDateTime, DModule.qAux.FieldByName('Inicio').AsDateTime);
        end;



  end else
  if(tipoComportamento = 1)then //tipoComportamento = 1 -> OrdemProdução
  begin

  end;
end;

procedure TF02004.mTarefasAfterCancel(DataSet: TDataSet);
begin
  inherited;
  mTarefas.CancelUpdates;
end;

procedure TF02004.mTarefasAfterDelete(DataSet: TDataSet);
begin
  inherited;
  mTarefas.ApplyUpdates(-1);
end;

procedure TF02004.mTarefasAfterInsert(DataSet: TDataSet);
begin
  inherited;
  mTarefasidTarefaSequenciada.AsInteger := DModule.buscaProximoParametro('seqTarefaSequenciada');
end;

procedure TF02004.mTarefasAfterPost(DataSet: TDataSet);
begin
  inherited;
  mTarefas.ApplyUpdates(-1);
end;

procedure TF02004.SpeedButton1Click(Sender: TObject);
var
jobs: TArray<TOrdem>;
celulas: TArray<TLinhaProducao>;
begin
  inherited;

  //Salva registro principal
  if not(Ds.DataSet.State = dsEdit)then
  begin
  DS.DataSet.Post;
  DS.DataSet.edit;
  end;

  {************************* CALCULA META HORA *************************}
  CalculaMetaHora;

  {************************* MONTA Array Jobs e Celulas *************************}
  montaJobs(jobs);
  montaCelulas(celulas);

  {************************* CHAMA UNIT DE BALANCEAMENTO E SEQUENCIAMENTO *************************}
  //retorno := unitMykel(jobs, celulas);

  // salva em mtarefas

  // comando popular scrollboxLinhaP ou ScrollboxOrdem e mostrar scrollbox_layout
  TabSet1Click(Sender);

  {************************* MONTA SCROLLBOX_OPERAÇÕES *************************}
  if not(mTarefas.IsEmpty) then
  begin
    montaLayoutOperacoes(ScrollboxOperacoes, mTarefas);    //vai sair
  end;


end;

procedure TF02004.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  //
  if Application.MessageBox('Confirma Processar LayOut?','Processamento',mb_yesno+mb_iconquestion) = id_yes then
  begin

  end;
end;

procedure TF02004.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  inherited;
  if Panel.Index = 0 then
    begin
      StatusBar.Canvas.Brush.Color := clBlack;
      StatusBar.Canvas.FillRect(Rect);
    end
end;

procedure TF02004.TabSet1Click(Sender: TObject);
begin
//
  if(TabSet1.TabIndex = 0)then
  begin
    cxScheduler1.Visible := true;
    //LP
    FDQuery2.Close;
    mTarefas.Close;
    FDQuery2.SQL.Text :=
      'select ts.idTarefaSequenciada, ts.idCronometragem, o.descricao as operacao,'+
      'ts.idOrdem, Op.numOrdem,ts.numOperador, ts.idsequenciamento,                '+
      'ts.idRecurso, tr.descricao as tipoRecurso,                                  '+
      'ts.IdLinha_producao, lp.descricao as linhaProducao,                         '+
      'ts.tempoInicio, ts.TempoFim                                                 '+
      'from tarefa_sequenciada ts                                                  '+
      'left outer join cronometragem c on c.idCronometragem = ts.idCronometragem   '+
      'left outer join operacao o on o.idOperacao = c.idOperacao                   '+
      'left outer join ordem_producao op on op.idOrdem = ts.idOrdem                '+
      'left outer join tipo_recurso tr on tr.idTipo_recurso = ts.idrecurso         '+
      'left outer join grupo lp on lp.idGrupo = ts.idLinha_Producao                '+
      'where ts.idSequenciamento =:idSeq                                          '+
      'Order by ts.IdLinha_producao, ts.numOperador';

      FDQuery2.ParamByName('idSeq').AsInteger := ClientDataSet1idSequenciamento.AsInteger;
      FDQuery2.Open;
      mTarefas.open;

      if not(mTarefas.IsEmpty)then
      begin
          montaBGIndexLinhaP(mtarefas);
          PanelNome.caption := BGIndex.Items[0].Caption;
          montaScrollBox_Layout(0, strtoint(BGIndex.Items[0].hint));  // (tipo 0= lp, tipo 1 = OP) / (idLinhadeProdução)

      end else
      begin
        // LIMPA BOTOES LP E cxScheduler1
        BGIndex.items.Clear;
        ClientDataSetChart.EmptyDataSet;
        cxSchedulerDBStorage1.Resources.Items.Clear;
      end;

  end else
  if(TabSet1.TabIndex = 1)then
  begin
    cxScheduler1.Visible := false;

    //OP
    FDQuery2.Close;
    mTarefas.Close;
    FDQuery2.SQL.Text :=
      'select ts.idTarefaSequenciada, ts.idCronometragem, o.descricao as operacao,'+
      'ts.idOrdem, Op.numOrdem,ts.numOperador, ts.idsequenciamento,                '+
      'ts.idRecurso, tr.descricao as tipoRecurso,                                  '+
      'ts.IdLinha_producao, lp.descricao as linhaProducao,                         '+
      'ts.tempoInicio, ts.TempoFim                                                 '+
      'from tarefa_sequenciada ts                                                  '+
      'left outer join cronometragem c on c.idCronometragem = ts.idCronometragem   '+
      'left outer join operacao o on o.idOperacao = c.idOperacao                   '+
      'left outer join ordem_producao op on op.idOrdem = ts.idOrdem                '+
      'left outer join tipo_recurso tr on tr.idTipo_recurso = ts.idrecurso         '+
      'left outer join grupo lp on lp.idGrupo = ts.idLinha_Producao                '+
      'where ts.idSequenciamento =:idSeq                                          '+
      'Order by ts.IdOrdem, ts.idCronometragem, ts.tempoInicio';

      FDQuery2.ParamByName('idSeq').AsInteger := ClientDataSet1idSequenciamento.AsInteger;
      FDQuery2.Open;
      mTarefas.open;

      if not(mTarefas.IsEmpty)then
      begin
          montaBGIndexOrdem(mtarefas);
          montaScrollBox_Layout(1, strtoint(BGIndex.Items[0].hint)); // (tipo 0= lp, tipo 2 = OP) / (idOrdem deProdução)
      end else
      begin
        BGIndex.items.Clear;
      end;
  end;

end;

{TOperacao }

constructor TOperacao.Create(AOwner: TComponent);
begin
    inherited;

    //Panel
    Align := alTop;
    Height :=  80;
    AlignWithMargins := true;
    Margins.Top := 5;
    Margins.Bottom := 0;
    Color := $00EAE9E8;
    BevelInner := bvLowered;
    ParentBackground := false;
    DragMode                := dmAutomatic;
    hint                    := 'Executado Por:';
    Cursor                  := crHandPoint;

    //ProgressBar do Panel
    GCotaPendente := TProgressBar.Create(self);
    GCotaPendente.Parent := self;
    GCotaPendente.Align := alBottom;
    GCotaPendente.Smooth := true;
    GCotaPendente.Position := 60;
    GCotaPendente.Height    := 8;
    GCotaPendente.Max  := round(cotapendente);

    LbRecurso               := TLabel.Create(self);
    LbRecurso.Parent        := self;
    LbRecurso.Font.Style    := [fsbold];
    LbRecurso.Left          := 5;
    LbRecurso.Top           := 3;

    LbOperacao              := TLabel.Create(self);
    LbOperacao.Parent       := self;
    LbOperacao.Font.Name    := 'tahoma';
    LbOperacao.Font.Size    := 7;
    LbOperacao.Left         := 5;
    LbOperacao.Top          := 19;

    LbCota                  := TLabel.Create(self);
    LbCota.Parent           := self;
    LbCota.Left             := 5;
    LbCota.Top              := 35;

    LbCotaPendente          := TLabel.Create(self);
    LbCotaPendente.Parent   := self;
    LbCotaPendente.Left     := 5;
    LbCotaPendente.Top      := 51;
end;

{ TOrdem }
constructor TOrdem.Create(cod, num: integer; dat: Tdate; codp: integer;
  desProd: string);
var
j : integer;
qAux2 : TFDQuery;
begin
  inherited;
  //
  codOrdem := cod;
  numOrdem := num;
  dataOrdem := dat;
  codProduto := codp;
  descricaoProduto := desProd;

  //Busca das Fases da ordem
  qAux2 := TFDQuery.Create(Application);
  qAux2.Connection := DModule.FDConnection;
  qAux2.Close;
  qAux2.sql.Text := 'select ohf.*, f.descricao as fase from ordem_has_fase ohf ' +
  'left outer join fase f on f.idfase = ohf.idfase where ohf.idordem =:idOrdem';
  qAux2.ParamByName('idOrdem').AsInteger := codOrdem;
  qAux2.open;
  qAux2.First;
  SetLength(fasesDaOrdem , qAux2.RecordCount);
  for j := 0 to (qAux2.RecordCount -1) do
  begin
      fasesDaOrdem[j] := TFaseDaOrdem.create(
      qAux2.FieldByName('idOrdem_has_fase').AsInteger,
      qAux2.FieldByName('sequencia').AsInteger,
      qAux2.FieldByName('qtdOriginal').Asinteger,
      qAux2.FieldByName('idFase').AsInteger,
      codProduto,
      qAux2.FieldByName('fase').AsString
      );
      qAux2.Next;
  end;
  FreeAndNil(qAux2);
end;

{ TFaseDaOrdem }

constructor TFaseDaOrdem.create(codOHF, seq, qtdT, codF, codProd: integer;
  desFase: string);
var
qAux2 : TFDQuery;
k : integer;
begin
  //
  codFaseDaOrdem := codOHF;
  sequencia := seq;
  qtdOriginal := qtdT;
  codFaseProduto := codF;
  descricaoFaseProduto := desFase;

  //
  qAux2 := TFDQuery.Create(Application);
  qAux2.Connection := DModule.FDConnection;
  qAux2.Close;
  qAux2.sql.Text := 'select c.idCronometragem, c.tempoPadraoFinal, o.descricao as operacao, chtr.idTipoRecurso as TipoRecurso, tr.descricao as descricaoTipoRecurso from cronometragem c ' +
      'left outer join operacao o on o.idOperacao = c.idOperacao ' +
      'left outer join cronometragem_has_tipo_recurso chtr on chtr.idCronometragem = c.idCronometragem ' +
      'left outer join tipo_recurso tr on tr.idTipo_Recurso = chtr.idTipoRecurso ' +
      'where c.idProduto =:idProd and o.idFase =:idFase ';
  qAux2.ParamByName('idProd').AsInteger := codProd;
  qAux2.ParamByName('idFase').AsInteger := codFaseProduto;
  qAux2.open;
  qAux2.First;
  SetLength(operacoes ,qAux2.RecordCount);
  for k := 0 to (qAux2.RecordCount -1) do
  begin
    operacoes[k] := TOperacaoProduto.Create(
    qAux2.FieldByName('idCronometragem').AsInteger,
    qAux2.FieldByName('tempoPadraoFinal').AsInteger,
    qAux2.FieldByName('tipoRecurso').AsInteger
    );
    qAux2.Next;
  end;
  FreeAndNil(qAux2);

end;

{ TOperacaoProduto }

constructor TOperacaoProduto.create(codCro: integer; tpf: Real; cdM: integer);
var
qAux2 : TFDQuery;
I : integer;
begin
  codCronometragem := codCro;
  tempoPadraoFinal := tpf;
  codTipoMaquina := cdM;

  // Preenchimento do vetor precedencia;
  qAux2 := TFDQuery.Create(Application);
  qAux2.Connection := DModule.FDConnection;
  qAux2.SQL.Text := 'select * from dependencia d where d.idCronometragem =:idC';
  qAux2.ParamByName('idC').AsInteger := codCro;
  qAux2.open;

  SetLength(precedencia, qAux2.RecordCount);
  for I := 0 to (qAux2.RecordCount - 1) do
  begin
      precedencia[i] := qaux2.FieldByName('idCronometragemDependencia').AsInteger;
      qAux2.Next;
  end;
  FreeAndNil(qAux2);
end;

{ TLinhaProducao }

constructor TLinhaProducao.Create(codLP, qtdO: integer; descLP: String);
var
qAux2 : TFDQuery;
I : integer;
begin
  //
  codLinhaProducao := codLP;
  descricaoLinhaProducao := descLP;
  qtdOperadores := qtdO;

  //Array fasesHabilitadas, é um array de integer
  qAux2 := TFDQuery.Create(Application);
  qAux2.Connection := DModule.FDConnection;
  qAux2.SQL.Text := 'SELECT * FROM fase_has_grupo fhg where fhg.idGrupo =:IDG';
  qAux2.ParamByName('IDG').AsInteger := codLinhaProducao;
  qAux2.Open;

  SetLength(fasesHabilitadas,qAux2.RecordCount);
  for I := 0 to (qAux2.RecordCount - 1) do
  begin
      fasesHabilitadas[i] := qAux2.FieldByName('idFase').AsInteger;
  end;

  // Array TRecursoMaquinas
  qAux2.Close;
  qAux2.SQL.Text := 'SELECT rec.idRecurso, rec.descricao, rec.patrimonio, ' +
  'tr.idTipo_Recurso, tr.descricao as descricaoTipoMaquina ' +
  'FROM recurso rec ' +
  'left outer join tipo_recurso tr on tr.idTipo_Recurso = rec.idTipoRecurso ' +
  'where rec.idGrupo =:IDG ';
  qAux2.ParamByName('IDG').AsInteger := codLinhaProducao;
  qAux2.Open;

  SetLength(maquinas,qAux2.RecordCount);
  for I := 0 to (qAux2.RecordCount - 1) do
  begin
      maquinas[i] := TRecursoMaquina.Create(
      qAux2.FieldByName('idRecurso').AsInteger,
      qAux2.FieldByName('patrimonio').AsInteger,
      qAux2.FieldByName('idTipo_recurso').AsInteger,
      qAux2.FieldByName('descricao').AsString,
      qAux2.FieldByName('descricaoTipoMaquina').AsString
      );
      qAux2.Next;
  end;
  FreeAndNil(qAux2);
end;

{ TRecursoMaquina }

constructor TRecursoMaquina.Create(codM, pat, codTM: integer; descM, descTM: String);
begin
  //
  codMaquina := codM;
  patrimonio := pat;
  descricaoMaquina := descM;
  codTipoMaquina := codTM;
  descricaoTipoMaquina := descTM;
end;

procedure TF02004.cxScheduler1CustomDrawEvent(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxSchedulerEventCellViewInfo;
  var ADone: Boolean);
begin
  inherited;

  // Atribui numero da Ordem a Tarefa apresentada
  if(cxSchedulerDBStorage1.GetEventByID(AViewInfo.Event.ID).Message = '')then
  begin
        //ShowMessage('reformulação de mensagem');
        DModule.qAux.Close;
        DModule.qAux.SQL.Text := 'select ts.idOrdem, op.numOrdem from tarefa_sequenciada ts ' +
        'left outer join ordem_producao op on op.idOrdem = ts.idOrdem ' +
        'where ts.idTarefasequenciada =:ID';
        DModule.qAux.ParamByName('ID').value := AViewInfo.Event.ID;
        DModule.qAux.Open;
        cxSchedulerDBStorage1.GetEventByID(AViewInfo.Event.ID).Location := 'Ordem' + DModule.qAux.FieldByName('numOrdem').AsString;

        cxSchedulerDBStorage1.GetEventByID(AViewInfo.Event.ID).Message := 'Recurso: ' + ClientDataSetCharttipoRecurso.AsString +
                  #13 + 'Qtd: ' + inttostr(45);
        //
        cxSchedulerDBStorage1.GetEventByID(AViewInfo.Event.ID).LabelColor := 13952740;

  end;

end;

procedure TF02004.cxScheduler1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  AScheduler: TcxScheduler;
  ATimeGridView: TcxSchedulerTimeGridViewAccess;
  dataIni ,dataFim : TDateTime;
begin

     if not(ClientDataSetChart.IsEmpty)then
     begin
            DModule.qAux.Close;
            DModule.qAux.open;
            DModule.qAux.sql.Text := 'select min(ts.tempoInicio) as inicio, max(ts.tempoFim) as fim from tarefa_sequenciada ts '+
                                      'where ts.idSequenciamento =:IDSEQ and ts.idLinha_Producao =:IDLP';
            DModule.qAux.ParamByName('IDSEQ').AsInteger := ClientDataSet1idSequenciamento.AsInteger;
            DModule.qAux.ParamByName('IDLP').AsInteger := ClientDataSetChartIdLinha_producao.AsInteger;
            DModule.qAux.Open;
            dataIni := DModule.qAux.FieldByName('Inicio').AsDateTime; //first;;
            dataFim := DModule.qAux.FieldByName('fim').AsDateTime;
     end else
     begin
       dataIni := Date;
       dataFim := Date;
     end;

     AScheduler := TcxScheduler(Sender);
     if AScheduler.CurrentView is TcxSchedulerTimeGridView then
     begin
        ATimeGridView := TcxSchedulerTimeGridViewAccess(AScheduler.CurrentView);
        if (Key = VK_LEFT) and (AScheduler.SelStart <= dataIni) then
        begin
            Key := 0
        end else
        begin
            if (Key = VK_RIGHT) and (AScheduler.SelFinish > dataFim + 1) then
            begin
              Key := 0;
            end;
        end;
     end;
end;

procedure TF02004.cxScheduler1ScaleScroll(Sender: TcxCustomScheduler;
  AStartDateTime, AFinishDateTime: TDateTime);
var
  AScheduler: TcxScheduler;
  ATimeGridView: TcxSchedulerTimeGridViewAccess;
  aDelta, dataIni, dataFim: TDateTime;
begin
  if not(ClientDataSetChart.IsEmpty)then
  begin
      DModule.qAux.Close;
      DModule.qAux.open;
      DModule.qAux.sql.Text := 'select min(ts.tempoInicio) as inicio, max(ts.tempoFim) as fim from tarefa_sequenciada ts '+
                                'where ts.idSequenciamento =:IDSEQ and ts.idLinha_Producao =:IDLP';
      DModule.qAux.ParamByName('IDSEQ').AsInteger := ClientDataSet1idSequenciamento.AsInteger;
      DModule.qAux.ParamByName('IDLP').AsInteger := ClientDataSetChartIdLinha_producao.AsInteger;
      DModule.qAux.Open;
      dataIni := DModule.qAux.FieldByName('Inicio').AsDateTime; //first;;
      dataFim := DModule.qAux.FieldByName('fim').AsDateTime;
  end else
  begin
      dataIni := Date;
      dataFim := Date;
  end;

  //Esse codigo cuida para que o usuário só possa trafegar por um intervalo de tempo no cxScheduler1
  AScheduler := TcxScheduler(Sender);
  if AScheduler.CurrentView is TcxSchedulerTimeGridView then
  begin
      ATimeGridView := TcxSchedulerTimeGridViewAccess(AScheduler.CurrentView);
      if (ATimeGridView.VisibleStart < dataIni) then
          ATimeGridView.VisibleStart := dataIni
      else
      begin
          if (ATimeGridView.VisibleFinish > dataFim + 1) then
          begin
              ADelta := ATimeGridView.VisibleFinish - ATimeGridView.VisibleStart;
              ATimeGridView.VisibleStart := dataFim + 1 - ADelta;
          end;
      end;
  end;

end;


procedure TF02004.ClientDataSet1BeforeInsert(DataSet: TDataSet);
begin
  inherited;
  //
end;

Initialization
  RegisterClass(TF02004);
Finalization
  UnRegisterClass(TF02004);
end.
