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
  DBEditBeleza, Vcl.Imaging.pngimage;

{Declações do Layout}
type TOperacao =  class(TPanel)
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
   procedure   RetiraOperacao(Per:real);
end;

type TOperacaoMaquina =  record
   Operacao           : Toperacao;
   Porcentagem        : real;
end;

type TMaquina = class(TPanel)
    public
    Ocupacao     : real;
    GOcupacao    : TProgressBar;
    Operacoes    : array [1..20] of TOperacaoMaquina;
    NumOperacoes : integer;
    idrecurso    : integer;
    constructor Create(AOwner: TComponent); override;
    procedure   SetaRecurso(codigoRecurso:integer;Recurso:string);
    procedure   AdicionaOperacao(Operacao : toperacao;PerMaxOperador : real);
end;

type TOperador =  class(TPanel)
   public
   Ocupacao     : real;
   Gocupacao    : TProgressbar;
   lbOcupacao   : tlabel;
   LbPosicao    : tlabel;
   Posicao      : Integer;
   Imagem       : TImage;
   Maquina1     : TMaquina;
   Maquina2     : TMaquina;
   constructor Create(AOwner: TComponent); override;
   procedure   SetaRecurso(Maquina:integer;codigoRecurso:integer;Recurso:string);
   procedure   AdicionaOperacao(Operacao:TOperacao);

end;

type TLayout = class
    Tela       : TScrollBox;
    TelaOp     : TScrollBox;
    idlayout   : integer;
    q          : TFDQuery;
    Operadores : array [1..40] of TOperador;
    NOperadores: integer;
    Operacoes  : array [1..40] of TOperacao;
    NOperacoes : integer;
    TempoTotal : real;
    MetaHora   : integer;
    Referencia : string;
    Responsavel: string;
    NumFilas   : integer;
    data       : tdatetime;
    idProduto : integer;
    constructor Create(Local:TScrollBox;Dados:TClientDataSet;NumerodeOperadores : integer;Tempo:real;MetaPorHora:integer;
    img : TPicture;Query : TFDQuery;CodigoLayOut: integer;CodigoProduto: integer;Resp: String;dt: Tdatetime;
    ref :string;nfila : integer;LocalOP:TScrollBox);
    Procedure   Imprime(var ImpLayOut: tclientdataset;var ImpOperacao: tclientdataset;var ImpOperadores: tclientdataset);
    Procedure   BuscaDados;
    procedure   GravaDados;
end;

{Declarações da estrutura passada para a unit de Sequenciamento e Balanceamento}

//JOBS
type TOperacaoProduto = record
  codCronometragem : integer;
  tempoPadraoFinal : real;
  codMaquina : integer; // Maquina utilizada para realizar a operação
  precedencia : array of TOperacaoProduto;
end;

type TFaseDaOrdem =  record
  codFaseDaOrdem : integer;  // cod gerado na criação da ordem para cada fase
  sequencia : integer;
  qtdOriginal : integer;
  codFaseProduto :integer; // id da fase original nas fases do produto
  descricaoFaseProduto : string;
  operacoes : array of TOperacaoProduto;
  constructor create(codOHF: integer; seq:integer;qtdT:integer;codF:integer;desFase:string);
end;

type TOrdem =  record
  codOrdem : integer;
  numOrdem : integer;
  dataOrdem : TDate;
  codProduto : integer;
  descricaoProduto : string;
  fasesDaOrdem : array of TFaseDaOrdem;
  constructor Create(cod: integer;num:integer;dat:Tdate; codp:integer; desProd:string);
end;

//CELULAS
type TRecursoMaquina =  record
    codMaquina : integer;
    descricaoMaquina : string;
    patrimonio : integer;
    idTipoMaquina : integer;
    descricaoTipoMaquina : string;
end;

type TLinhaProducao =  record
    codLinhaProducao : integer;
    descricaoLinhaProducao : string;
    qtdOperadores : integer;
    maquinas : array of TRecursoMaquina;
    fasesHabilitadas : array of integer; // Fases de produtos que a linha de produção pode executar;
end;


{ ********** Declarações do Algoritmo Genético ********** }
type TOperacaoAG = class
  IdLayOutOperacoes   : integer;
  idCronmetragem       : integer;
  idTipoRecurso       : integer;
  Cota                : real;
  vatorIDCronometragemPrecedencia : array of integer;
  constructor Create();
end;

type TIndividuo = class
  //Obs: o índice representa as operações
  vetorOperador: array of integer;
  vetorSequencia: array of integer;
  fo: Double;
  constructor Create(tam: integer; qtdOperadores :integer);
end;

//TELA
type
  TF02004 = class(TFBase)
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    SpeedButton1: TSpeedButton;
    ScrollLinhadeProducao: TScrollBox;
    FDQuery1idLayoutFase: TIntegerField;
    FDQuery1idOrdem_has_fase: TIntegerField;
    FDQuery1numOperadores: TIntegerField;
    FDQuery1numFilas: TIntegerField;
    FDQuery1dataLayout: TDateField;
    FDQuery1responsavel: TStringField;
    FDQuery1fase: TStringField;
    FDQuery1grupo: TStringField;
    ClientDataSet1idLayoutFase: TIntegerField;
    ClientDataSet1idOrdem_has_fase: TIntegerField;
    ClientDataSet1numOperadores: TIntegerField;
    ClientDataSet1numFilas: TIntegerField;
    ClientDataSet1dataLayout: TDateField;
    ClientDataSet1responsavel: TStringField;
    ClientDataSet1fase: TStringField;
    ClientDataSet1grupo: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    FDQuery1idordem: TIntegerField;
    ClientDataSet1idordem: TIntegerField;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBEditBeleza1: TDBEditBeleza;
    FDQuery1numOrdem: TIntegerField;
    ClientDataSet1numOrdem: TIntegerField;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    FDQuery2: TFDQuery;
    DataSetProvider2: TDataSetProvider;
    moperacoes: TClientDataSet;
    FDQuery1produto: TStringField;
    ClientDataSet1produto: TStringField;
    img: TImage;
    moperacoescota: TFloatField;
    moperacoescotaPendente: TFloatField;
    ed_metaHora: TEdit;
    Ed_tempo: TEdit;
    FDQuery2idLayoutOperacao: TIntegerField;
    FDQuery2idLayoutFase: TIntegerField;
    FDQuery2tempoOperacao: TSingleField;
    FDQuery2idCronometragem: TIntegerField;
    FDQuery2idTipo_Recurso: TIntegerField;
    FDQuery2tipo_Recurso: TStringField;
    FDQuery2operacao: TStringField;
    moperacoesidLayoutOperacao: TIntegerField;
    moperacoesidLayoutFase: TIntegerField;
    moperacoestempoOperacao: TSingleField;
    moperacoesidCronometragem: TIntegerField;
    moperacoesidTipo_Recurso: TIntegerField;
    moperacoestipo_Recurso: TStringField;
    moperacoesoperacao: TStringField;
    FDQuery1idgrupo: TIntegerField;
    ClientDataSet1idgrupo: TIntegerField;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Memo1: TMemo;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BInserirClick(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure DBEditBeleza1ButtonClick(Sender: TObject;
      var query_result: TFDQuery);
    procedure DBEdit6Exit(Sender: TObject);
    procedure moperacoesAfterDelete(DataSet: TDataSet);
    procedure moperacoesAfterPost(DataSet: TDataSet);
    procedure moperacoesAfterCancel(DataSet: TDataSet);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure moperacoesAfterInsert(DataSet: TDataSet);
    procedure DBEdit2Change(Sender: TObject);
    procedure DBEdit8Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Panel : TPANEL;
    ProgressBar : TProgressBar;
    procedure CalculaMetaHora();
    procedure atribuiPrecedencia();
    procedure montaJobs(var jobs: TArray<TOrdem>);
  end;

var
  F02004: TF02004;
  Layout: TLayout;
  TempoTotal : real;
  MetaHora   : integer;
  vetOperacaoAG : array of TOperacaoAG;

implementation

{$APPTYPE CONSOLE}

{$R *.dfm}
uses UDataModule, Math, System.Generics.Collections;



procedure TF02004.Action5Execute(Sender: TObject);
begin
  inherited;
  panel3.Enabled := false;
end;

procedure TF02004.atribuiPrecedencia;
var
  I, j: Integer;
populacao: TList;
indiv: TIndividuo;
begin
  //
  for I := 0 to Length(vetOperacaoAG)-1 do
  begin
    DModule.qAux.Close;
    DModule.qAux.sql.Text := 'Select * from dependencia where idCronometragem =:idC';
    DModule.qAux.ParamByName('idC').Value := vetOperacaoAG[i].idCronmetragem;
    DModule.qAux.open;

    SetLength(vetOperacaoAG[i].vatorIDCronometragemPrecedencia, DModule.qAux.RecordCount);
    j:= 0;
    while not(DModule.qAux.eof) do
    begin
      vetOperacaoAG[i].vatorIDCronometragemPrecedencia[j] := DModule.qAux.FieldByName('idCronometragemDependencia').AsInteger;
      j := j+1;
      DModule.qAux.Next;
    end;
  end;


end;

procedure TF02004.BEditarClick(Sender: TObject);
begin
  inherited;
  Panel3.Enabled := true;
end;

procedure TF02004.BInserirClick(Sender: TObject);
begin
  inherited;
  Panel3.Enabled := true;
  ClientDataSet1numFilas.Value := 2;
end;

procedure TF02004.BSalvarClick(Sender: TObject);
begin
  inherited;
  Panel3.Enabled := false;
end;

procedure TF02004.CalculaMetaHora;
begin
  //
  TempoTotal := 0;
  Dmodule.QAux.sql.Text := 'select sum(tempoOperacao) from LayOutOperacao where IdLayoutFase =:IdLF ';
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

end;

procedure TF02004.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idLayoutFase.AsInteger := DModule.buscaProximoParametro('seqLayoutFase');
end;

procedure TF02004.DBEdit2Change(Sender: TObject);
begin
  inherited;
  //
  if (DS.DataSet.State=dsInsert) or (dS.DataSet.State = dsEdit)then
  begin
    DModule.qAux.CLOSE;
    DModule.qAux.SQL.Text := 'select idLinhaProducao from ordem_has_fase ohf where ohf.idOrdem_has_fase =:idOHF';
    DModule.qAux.ParamByName('idOHF').Value := ClientDataSet1idOrdem_has_fase.AsInteger;
    DModule.qAux.OPEN;

    if not(DModule.qAux.IsEmpty)then
    begin
      ClientDataSet1idGrupo.asinteger := DModule.qAux.FieldByName('idLinhaProducao').AsInteger;
      ShowMessage('ok');
    end else
      ClientDataSet1idGrupo.Clear;

  end;
end;

procedure TF02004.DBEdit6Exit(Sender: TObject);
begin
  inherited;
  DModule.qAux.Close;
  DModule.qAux.SQL.Text := 'select * from ordem_producao where idordem =:id';
  DModule.qAux.ParamByName('id').AsInteger:= (ClientDataSet1idOrdem.AsInteger);
  DModule.qAux.Open;
  DModule.qAux.first;

  if(DModule.qAux.IsEmpty)then
  begin
    DBEditBeleza1.Enabled := FALSE;
    DBEditBeleza1.Clear;
    DBEdit2.Clear;
    if NOT(ClientDataSet1idOrdem.IsNull)then
    begin
      ShowMessage('CÓDIGO NÃO ENCONTRADO');
      DBEdit6.SetFocus;
    end;
  end else
  begin
    DBEditBeleza1.Enabled := TRUE;
    ClientDataSet1numOrdem.Value := StrToInt(DModule.qAux.FieldByName('numOrdem').AsString);

  end;

end;

procedure TF02004.DBEdit8Change(Sender: TObject);
begin
  inherited;
  //
  if (DS.DataSet.State=dsInsert) or (dS.DataSet.State = dsEdit)then
  begin
    DModule.qAux.CLOSE;
    DModule.qAux.SQL.Text := 'select * from operador where idGrupo =:idG';
    DModule.qAux.ParamByName('idG').Value := ClientDataSet1idGrupo.AsInteger;
    DModule.qAux.OPEN;

    if not(DModule.qAux.IsEmpty)then
    begin
      ClientDataSet1numOperadores.asinteger := DModule.qAux.RecordCount;
      //ShowMessage('ok num grupo');
    end else
      ClientDataSet1numOperadores.Clear;
  end;
end;

procedure TF02004.DBEditBeleza1ButtonClick(Sender: TObject;
  var query_result: TFDQuery);
begin
  inherited;
  query_result.ParamByName('x').Value := (ClientDataSet1idOrdem.AsInteger);
end;

procedure TF02004.montaJobs( var jobs: TArray<TOrdem>);
var
i, j : integer;
begin
  //Busca ordens ainda não sequenciadas
  DModule.qAux.Close;
  DModule.qAux.open;
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

  //Busca Fases das ordens ainda não sequenciadas
  for i := 0 to (Length(jobs) -1) do
  begin
      DModule.qAux.Close;
      DModule.qAux.open;
      DModule.qAux.sql.Text := 'select ohf.*, f.descricao as fase from ordem_has_fase ohf ' +
      'left outer join fase f on f.idfase = ohf.idfase where ohf.idordem =:idOrdem';
      DModule.qAux.ParamByName('idOrdem').AsInteger := jobs[i].codOrdem;
      DModule.qAux.open;
      DModule.qAux.First;

      SetLength(jobs[i].fasesDaOrdem ,DModule.qAux.RecordCount);
      for j := 0 to (DModule.qAux.RecordCount -1) do
      begin
          jobs[i].fasesDaOrdem[j] := TFaseDaOrdem.create(
          DModule.qAux.FieldByName('idOrdem_has_fase').AsInteger,
          DModule.qAux.FieldByName('sequencia').AsInteger,
          DModule.qAux.FieldByName('qtdOriginal').Asinteger,
          DModule.qAux.FieldByName('idFase').AsInteger,
          DModule.qAux.FieldByName('fase').AsString
          );
          DModule.qAux.Next;
      end;
  end;

end;

procedure TF02004.moperacoesAfterCancel(DataSet: TDataSet);
begin
  inherited;
  moperacoes.CancelUpdates;
end;

procedure TF02004.moperacoesAfterDelete(DataSet: TDataSet);
begin
  inherited;
  moperacoes.ApplyUpdates(-1);
end;

procedure TF02004.moperacoesAfterInsert(DataSet: TDataSet);
begin
  inherited;
  moperacoesidLayoutOperacao.AsInteger := DModule.buscaProximoParametro('seqLayoutOperacao');
end;

procedure TF02004.moperacoesAfterPost(DataSet: TDataSet);
begin
  inherited;
  moperacoes.ApplyUpdates(-1);
end;

procedure TF02004.SpeedButton1Click(Sender: TObject);
var
i,j : integer;
teste : string;
matriz: array of array of integer; //matriz de atribuição de valores, problema no query e clientdataset
vetorTPF: array of double; //vetor de tempo Padrao final das operações
//melhor: TIndividuo;
jobs: TArray<TOrdem>;
begin
  inherited;

  montaJobs(jobs);
  for i := 0 to (Length(jobs)-1) do
  begin
    teste := '';
    for j := 0 to (Length(jobs[i].fasesDaOrdem)-1) do
    begin
      teste := teste + ' ' + inttostr(jobs[i].fasesDaOrdem[j].codFaseDaOrdem);
    end;

    ShowMessage('cod ordem: ' + inttostr(jobs[i].codOrdem) + #13 +
    teste);
  end;

  //Salva registro principal
  if not(Ds.DataSet.State = dsEdit)then
  begin
  DS.DataSet.Post;
  DS.DataSet.edit;
  end;

  {************************* Apaga registros LayoutOperaçoes existentes *************************}
  fdquery2.Params[0].AsInteger := ClientDataSet1idLayoutFase.AsInteger;
  moperacoes.Open;
  MOperacoes.First;
  while not(MOperacoes.Eof) do
  begin
     moperacoes.delete;
     moperacoes.First;
  end;

  {************************* Apaga registros LayoutMaquina existentes *************************}

  // ...

  {************************* Cria Layout das Operações *************************}
  DModule.qAux.close;//Consulta operações da fase
  DModule.qAux.SQL.Text := 'select c.* from operacao o ';
  DModule.qAux.SQL.add('left outer join cronometragem c on c.idOperacao = o.idOperacao ');
  DModule.qAux.SQL.add('left outer join produto p on p.idproduto = c.idProduto ');
  DModule.qAux.SQL.add('left outer join ordem_producao op on op.idproduto = p.idproduto ');
  DModule.qAux.SQL.add('left outer join ordem_has_fase ohf on ohf.idordem = op.idOrdem and ohf.idfase = o.idfase ');
  DModule.qAux.SQL.add('where ohf.idOrdem_has_fase =:idOHF ');
  DModule.qAux.ParamByName('idOHF').AsInteger := ClientDataSet1idOrdem_has_fase.AsInteger;
  DModule.qAux.open;

  SetLength(matriz, DModule.qAux.RecordCount);   //Declaração do tamanho da Matriz
  SetLength(vetorTPF, DModule.qAux.RecordCount);
  for i := 0 to (DModule.qAux.RecordCount -1) do
  begin
     SetLength(matriz[i], 2);
  end;

  i := 0;
  WHILE NOT(DModule.qAux.EOF) DO //INSERI EM LAYOUTOPERAÇÕES
  BEGIN
    matriz[i][0] := ClientDataSet1idLayoutFase.AsInteger;
    matriz[i][1] := DModule.qAux.FieldByName('idCronometragem').AsInteger;
    vetorTPF[i] := DModule.qAux.FieldByName('tempopadraofinal').AsInteger;
    i := i+1;
    DModule.qAux.next;
  END;

  for I := 0 to (Length(matriz)-1) do
  begin
    moperacoes.Insert;
    moperacoesidLayoutFase.Value := matriz[i][0];
    moperacoesidCronometragem.Value := matriz[i][1];
    moperacoestempoOperacao.Value := vetorTPF[i];
    moperacoes.Post;
  END;

  {************************* CALCULA META HORA *************************}
  CalculaMetaHora;

  {************************* MONTA Array Jobs e Celulas *************************}


  {************************* MONTA LAYOUT *************************}
  if not(MOperacoes.IsEmpty) then
  begin
    //apaga os paineis dentro do scrollbox
    ScrollBox1.DestroyComponents;
    ScrollLinhadeProducao.DestroyComponents;
    //cria o Layout                                                                                                                                            // MLayoutidCronometragem.AsInteger
    Layout := TLayout.Create(ScrollLinhadeProducao,moperacoes,ClientDataSet1numOperadores.AsInteger, TempoTotal,MetaHora,Img.Picture,DMODULE.qaux, ClientDataset1idLayoutFase.AsInteger, ClientDataSet1idOrdem_has_fase.AsInteger,Clientdataset1Responsavel.AsString,ClientDataset1dataLayout.asdatetime,ClientDataset1produto.AsString, clientdataset1numfilas.AsInteger,Scrollbox1);

    atribuiPrecedencia(); // Atribui a precedencia de cada índice em vetOperaçoesAG
    ShowMessage('fim');

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

{ TOperacao }

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
    //GCotaPendente.Height := 7;
    GCotaPendente.Position := 60;
    //Original
    GCotaPendente.Height    := 8;
    //GCotaPendente.ForeColor := $004AA5FF;
    //GCotaPendente.ShowText  := false;
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

procedure TOperacao.RetiraOperacao(Per: real);
begin

end;

{ TMaquina }

procedure TMaquina.AdicionaOperacao(Operacao: toperacao; PerMaxOperador: real);
begin
  //
end;

constructor TMaquina.Create(AOwner: TComponent);
begin
  inherited;
  GOcupacao          := TProgressBar.create(Self);
  GOcupacao.Parent   := self;
  GOcupacao.Align    := alBottom;
  GOcupacao.Height   := 8;
    //GOcupacao.ForeColor:= $004AA5FF;
    //GOcupacao.ShowText := false;
  NumOperacoes       := 0;

  DragMode           := dmAutomatic;

  Width              :=95;
  Height             :=60;
  Color              := clSilver; //$00A7F8BF;
  ParentBackground   := false;
  Ocupacao           := 0;
  hint               := 'Operações:';

end;

procedure TMaquina.SetaRecurso(codigoRecurso: integer; Recurso: string);
begin

end;

{ TOperador }

procedure TOperador.AdicionaOperacao(Operacao: TOperacao);
begin
  //
end;

constructor TOperador.Create(AOwner: TComponent);
var
    p : TPopupMenu;
    i : TMenuItem;
begin
  inherited;
  //cria popupmenu
  p := TPopupMenu.Create(Self);


  i := TMenuItem.Create(Self);
  i.Caption := 'Remove Operações';
  //i.OnClick   := RemoveOperacoes;
  p.Items.Add(i);
  TOperador(Self).PopupMenu := p;

  Height                := 190;
  Width                 := 128;
  color                 :=  clMenu;; //$00C6E2FF;
  ParentBackground      := false;
  Caption               := '';
  DragMode              := dmAutomatic;
  //OnDragDrop            := dragDropx;
  //OnDragOver            := dragOverx;
  Ocupacao              := 0;
  Cursor                := crHandPoint;

  Maquina1              := TMaquina.create(Self);
  Maquina1.Parent       := self;
  //Maquina1.Left         := 27;
  Maquina1.Align := alTop;
  Maquina2              := TMaquina.create(Self);
  Maquina2.Parent       := self;
  //Maquina2.Left         := 27;
  Maquina2.Align := alBottom;


  Imagem                := TImage.Create(self);
  Imagem.Parent         := self;
  imagem.Width          := 73;
  imagem.Height         := 50;
  imagem.Top            := 69;
  imagem.Left           := 38;
  imagem.Proportional   := true;
  imagem.Stretch        := true;
  imagem.AutoSize       := false;

  lbOcupacao             := TLabel.Create(self);
  lbOcupacao.Parent      := self;
  lbOcupacao.Font.Name   := 'Tahoma';
  lbOcupacao.Font.Size   := 7;
  lbOcupacao.Width       := 10;
  lbOcupacao.Top         := 67;
  lbOcupacao.Left        := 110;
  lbOcupacao.Caption     := '0';

  LbPosicao             := TLabel.Create(self);
  LbPosicao.Parent      := self;
  LbPosicao.Font.Name   := 'Tahoma';
  LbPosicao.Font.Size   := 12;
  LbPosicao.Font.Style  := [fsbold];
  LbPosicao.Top         := round(Height /2) - 5;
  LbPosicao.Left        := 5;
  LbPosicao.Color       := $00C7FEFB;
  lbposicao.AutoSize    := false;
  lbposicao.Width       := LbPosicao.Height;
  lbposicao.Alignment   := taCenter;


  Gocupacao             := TProgressBar.Create(self);
  Gocupacao.Parent      := self;
  //Gocupacao.ForeColor   := $004AA5FF;
  Gocupacao.Orientation := pbVertical;
  Gocupacao.Height      := 45;
  Gocupacao.Width       := 9;
  Gocupacao.Top         := 77;
  Gocupacao.Left        := 113;
  //Gocupacao.ShowText    := false;

end;

procedure TOperador.SetaRecurso(Maquina, codigoRecurso: integer;
  Recurso: string);
begin

end;

{ TLayout }

procedure TLayout.BuscaDados;
begin
  //
end;

constructor TLayout.Create(Local: TScrollBox; Dados: TClientDataSet;
  NumerodeOperadores: integer; Tempo: real; MetaPorHora: integer; img: TPicture;
  Query: TFDQuery; CodigoLayOut, CodigoProduto: integer; Resp: String;
  dt: Tdatetime; ref: string; nfila: integer; LocalOP: TScrollBox);
var
vertical,i, horizontal, PorFila, NumNaFila, countFilas, contaPosicoes :integer;
Direcao : boolean;
Caminho  : TShape;
valorT : real;
begin
   q                     := Query;
   Tela                  := local;
   TelaOp                := LocalOP;
   NOperadores           := NumerodeOperadores;
   NumFilas              := nfila;
   TempoTotal            := tempo;
   MetaHora              := MetaPorHora;
   idlayout              := CodigoLayOut;
   idProduto             := CodigoProduto;
   Responsavel           := Resp;
   data                  := dt;
   Referencia            := ref;

   contaPosicoes := 0;
   NOperacoes            := 0;
   vertical              := 10;
   dados.First;
   while not(dados.eof) do
   begin
       inc(NOperacoes);
       Operacoes[NOperacoes]                        := TOperacao.Create(telaop);
       Operacoes[NOperacoes].Parent                 := LocalOP;
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

       //cria vetor de OperaçaoAG e quebra ob tempos das operações em <= 100
       valorT := Operacoes[NOperacoes].Cota;
       if(valort > 100)then
       begin
           while( valort > 0 )do
           begin
            contaPosicoes := contaPosicoes +1;
            SetLength( vetOperacaoAG ,contaPosicoes);
            vetOperacaoAG[contaPosicoes-1] := TOperacaoAG.create;

            vetOperacaoAG[contaPosicoes-1].IdLayOutOperacoes := Operacoes[NOperacoes].IdLayOutOperacoes;
            vetOperacaoAG[contaPosicoes-1].idTipoRecurso := Operacoes[NOperacoes].idTipoRecurso ;
            vetOperacaoAG[contaPosicoes-1].idCronmetragem := Operacoes[NOperacoes].idCronometragem;
            if(valorT > 100)then
            begin
            vetOperacaoAG[contaPosicoes-1].cota := 100;
            end else
            begin
              vetOperacaoAG[contaPosicoes-1].cota := valort;
            end;
            valort := valort - 100;

           end;
       end else
       begin
        contaPosicoes := contaPosicoes +1;
       end;

       vertical := vertical + Operacoes[NOperacoes].Height + 5;
       dados.Next;
   end;

   //adiciona operadores
   horizontal := 10;
   Vertical   := 10;
   PorFila    := round(noperadores/NumFilas);
   NumNaFila  := 0;
   direcao    := true;
   countFilas := 0;
   for i := 1 to NOperadores do
   begin
       Operadores[i]                      := TOperador.Create(tela);
       Operadores[i].Parent               := tela;
       Operadores[i].Left                 := horizontal;
       Operadores[i].Top                  := vertical;
       Operadores[i].Posicao              := i;
       operadores[i].Imagem.Picture       := img;
       operadores[i].LbPosicao.Caption    := inttostr(i);

       inc(NumNaFila);

       if NumNaFila >= PorFila then
       begin
           inc(countFilas);
           //testa se tem mais filas ainda antes de colocar o caminho
           if NumFilas > countFilas then
           begin
               caminho                      := tshape.Create(tela);
               caminho.Parent               := tela;
               caminho.Left                 := horizontal  + round(Operadores[i].Width / 2 ) - 10 ;
               caminho.Top                  := vertical + Operadores[i].Height - 10 ;
               caminho.Height               := 40;
               caminho.Width                := 25;
               Caminho.Brush.Color          := $008080FF;
           end;

           if not direcao then
              horizontal := 10;

           vertical   := vertical + Operadores[i].Height + 20;
           NumNaFila  := 0;
           direcao := not direcao;

       end
       else
       begin
           if direcao then
              horizontal  := horizontal +  Operadores[i].Width + 10
           else
              horizontal  := horizontal - (Operadores[i].Width + 10);


           caminho            := tshape.Create(tela);
           caminho.Parent     := tela;
           if direcao then
               caminho.Left   := horizontal - 20
           else
               caminho.Left   := horizontal + Operadores[i].Width - 20;
           caminho.Top        := vertical + round(Operadores[i].Height / 2 ) - 10 ;
           caminho.Height     := 25;
           caminho.Width      := 40;
           Caminho.Brush.Color := $008080FF;
       end;


   end;
   BuscaDados;
end;


procedure TLayout.GravaDados;
begin

end;

procedure TLayout.Imprime(var ImpLayOut, ImpOperacao,
  ImpOperadores: tclientdataset);
begin

end;

{ TIndividuo }

constructor TIndividuo.Create(tam: integer; qtdOperadores :integer);
var
 rand :integer;
  I: Integer;
begin

  //inicializa indiv.vetorOperador
  SetLength(vetorOperador,tam);
  Randomize;
  //seta valores no vetorOperador
  for I := 0 to (Length(vetorOperador)-1) do
  begin
    //Random gera um num aleatorio > 0
    Rand:= Random(qtdOperadores) + 1;
    vetorOperador[i] := rand;
  end;

  //indiv.vetorSequencia
  SetLength(vetorSequencia,tam);
  Randomize;
  for I := 0 to (Length(vetorSequencia)-1) do
  begin
    Rand:= Random(1000)+1;
    vetorSequencia[i] := rand;
  end;

end;

{ TOperacaoAG }

constructor TOperacaoAG.Create;
begin
  IdLayOutOperacoes := 0;
  idTipoRecurso := 0;
  cota := 0;
  idCronmetragem := 0;
end;

{ TOrdem }
constructor TOrdem.Create(cod, num: integer; dat: Tdate; codp: integer;
  desProd: string);
begin
  inherited;
  //
  codOrdem := cod;
  numOrdem := num;
  dataOrdem := dat;
  codProduto := codp;
  descricaoProduto := desProd;

  // Falta Busca das Fases da ordem
end;

{ TFaseDaOrdem }

constructor TFaseDaOrdem.create(codOHF, seq, qtdT, codF: integer;
  desFase: string);
begin
  //
  codFaseDaOrdem := codOHF;
  sequencia := seq;
  qtdOriginal := qtdT;
  codFaseProduto := codF;
  descricaoFaseProduto := desFase;
end;

Initialization
  RegisterClass(TF02004);
Finalization
  UnRegisterClass(TF02004);
end.
