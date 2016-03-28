unit U02004;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Datasnap.DBClient, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, DBGridBeleza,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;


type TOperacao =  class(TPanel)
   public
   IdLayOutOperacoes   : integer;
   idTipoRecurso       : integer;
   idOperacaoTempo     : integer;
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

   //procedure   dragDropx(Sender, Source: TObject; X, Y: Integer);
   //procedure   dragOverx(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
   //Procedure   RemoveOperacoes(sender: TObject);

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
    idcronometragem : integer;

    constructor Create(Local:TScrollBox;Dados:TClientDataSet;NumerodeOperadores : integer;Tempo:real;MetaPorHora:integer;img : TPicture;Query : TFDQuery;CodigoLayOut: integer;CodigoCronometragem: integer;Resp: String;dt: Tdatetime;ref :string;nfila : integer;LocalOP:TScrollBox);
    Procedure   Imprime(var ImpLayOut: tclientdataset;var ImpOperacao: tclientdataset;var ImpOperadores: tclientdataset);
    Procedure   BuscaDados;
    procedure   GravaDados;
end;


type
  TF02004 = class(TFBase)
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    SpeedButton1: TSpeedButton;
    Panel5: TPanel;
    PanelLinhadeProducao: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    Panel8: TPanel;
    ProgressBar1: TProgressBar;
    Image1: TImage;
    Panel9: TPanel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Panel : TPANEL;
    ProgressBar : TProgressBar;
    procedure montaPanelLinhaDeProducao();
  end;

var
  F02004: TF02004;

implementation

{$R *.dfm}

procedure TF02004.montaPanelLinhaDeProducao;
var
numOperacoes, numOperadores, numFilas, quebraFila :integer;
begin
  //
  Panel := TPanel.Create(PanelLinhadeProducao);
  Panel.Parent := (PanelLinhadeProducao);
  panel.Width := 134;
  panel.Height := 193;
  panel.Color := clMenu;
  panel.BevelInner := bvLowered;
  Panel.ParentBackground := false;

end;

procedure TF02004.SpeedButton1Click(Sender: TObject);
var
i : integer;
begin
  inherited;

  //apaga os paineis dentro do scrollbox
  ScrollBox1.DestroyComponents;

  i:= 0;
  while i<10 do
  begin
    //cria painel de operações
    //OBS: O SCROLLBOX SEMPRE ADD O NOVO PANEL EM CIMA
    panel := TPanel.Create(ScrollBox1);
    panel.Parent := ScrollBox1;
    panel.Align := alTop;
    panel.Tag := i;
    panel.Caption := inttostr(i);
    panel.Height := 60;
    panel.AlignWithMargins := true;
    panel.Margins.Top := 5;
    panel.Margins.Bottom := 0;
    panel.Color := $00EAE9E8;
    panel.BevelInner := bvLowered;
    panel.ParentBackground := false;

    //ProgressBar do Panel
    ProgressBar := TProgressBar.Create(panel);
    ProgressBar.Parent := Panel;
    ProgressBar.Align := alBottom;
    ProgressBar.Smooth := true;
    ProgressBar.Height := 7;
    ProgressBar.Position := i * 10;

    i := i+1;
  end;

  //Monta PanelLinhadeProducao
  montaPanelLinhaDeProducao;
end;

{ TOperacao }

constructor TOperacao.Create(AOwner: TComponent);
begin
  inherited;
  //
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
begin
  inherited;

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
  Query: TFDQuery; CodigoLayOut, CodigoCronometragem: integer; Resp: String;
  dt: Tdatetime; ref: string; nfila: integer; LocalOP: TScrollBox);
begin

end;

procedure TLayout.GravaDados;
begin

end;

procedure TLayout.Imprime(var ImpLayOut, ImpOperacao,
  ImpOperadores: tclientdataset);
begin

end;

Initialization
  RegisterClass(TF02004);
Finalization
  UnRegisterClass(TF02004);
end.
