unit BarraFerramentas;

interface

uses
  Windows,  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DB, comctrls, stdCtrls;

type

  //Eventos
  TAntesAlternarDataset = procedure (var DatasetNovo: TDataset) of object;
  TDepoisAlternarDataset = procedure (var DatasetNovo: TDataset) of object;
  TAoClicarBtRelatorios = procedure (Sender: TObject) of object;
  TDepoisClicarNovo = procedure (Sender: TObject) of object;
  TDepoisClicarAlterar = procedure (Sender: TObject) of object;
  TDepoisClicarGravar = procedure (Sender: TObject) of object;
  TDepoisClicarCancelar = procedure (Sender: TObject) of object;
  TDepoisClicarExcluir = procedure (Sender: TObject) of object;
  TDepoisClicarLimpar = procedure (Sender: TObject) of object;

  TBarraBotoes = (bvPrimeiro, bvAnterior, bvProximo, bvUltimo,
    bvNovo, bvAlterar, bvGravar, bvCancelar, bvExcluir, bvRelatorios,
    bvPesquisar, bvLimpar, bvSair);
  Botoes = set of TBarraBotoes;
  TBarraFerramentas = class(TComponent)
  private
    { Private declarations }
    BarraPai: TControlBar;
    BarraFilha, BarraNaveg: TToolBar;
    FDs: TDataSet;
    DataSource: TDatasource;
    Lb: TLabel;
    SbNovo, SbAlterar, SbGravar, SbCancel, SbExcluir,
      SbRelat, SbPesq, SbLimpar, SbSair, SbPrim,
      SbAnterior, SbProx, SbUlt: TToolButton;
    FImgs: TImageList;
    FAutoB: Boolean;
    fMCapt: Boolean;
    FBotoes: Botoes;
    fCaption: String;
    fAntesAlternarDataset: TAntesAlternarDataset;
    fDepoisAlternarDataset: TDepoisAlternarDataset;
    fAoclicarBtRelats: TAoClicarBtRelatorios;
    fDepoisClicarNovo: TDepoisClicarNovo;
    fDepoisClicarAlterar: TDepoisClicarAlterar;
    fDepoisClicarGravar: TDepoisClicarGravar;
    fDepoisClicarCancelar: TDepoisClicarCancelar;
    fDepoisClicarExcluir: TDepoisClicarExcluir;
    fDepoisClicarLimpar: TDepoisClicarLimpar;
    fDsRO: Boolean;
    Fvisible: boolean;

    procedure SetDs(const Value: TDataSet);
    procedure SetImgs(const Value: TImageList);
    procedure MontarBotoes;
    procedure ProprPadroes(Botao: TToolButton; Index: Integer; Pai: TToolBar);
    procedure SetAutoB(const Value: Boolean);
    procedure HabilitarBotoes(Sender: TObject);
    procedure HabilitarSetas(Sender: TObject; Field: TField);
    procedure setMCapt(const Value: Boolean);
    procedure SetBotoes(const Value: Botoes);
    procedure SetCaption(const Value: String);

    //Procedures dos Botoes
    procedure PrimRegistro(Sender: TObject);
    procedure AntRegistro(Sender: TObject);
    procedure ProxRegistro(Sender: TObject);
    procedure UltRegistro(Sender: TObject);
    procedure PesquisarRegistros(Sender: TObject);
    procedure LimparResgistros(Sender: TObject);
    procedure FecharTela(Sender: TObject);
    procedure NovoRegistro(Sender: TObject);
    procedure AlterarRegistro(Sender: TObject);
    procedure GravarRegistro(Sender: TObject);
    procedure CancelarRegistro(Sender: TObject);
    procedure ExcluirRegistro(Sender: TObject);
    procedure RelatsRegistros(Sender: TObject);
    procedure SetDsRO(const Value: Boolean);
    procedure Setvisible(const Value: boolean);

  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(owner: TComponent); override;
    destructor Destroy; override;

  published
    { Published declarations }

    //Propriedades
    property MostrarCaptionsBotoes: Boolean read fMCapt write setMCapt;
    property Imagens: TImageList read FImgs write SetImgs;
    property DataSet: TDataSet read FDs write SetDs;
    property AutoEnabledBotoes: Boolean read FAutoB write SetAutoB;
    property BotoesInvisiveis: Botoes read FBotoes write SetBotoes;
    property Caption: String read fCaption write SetCaption;
    property visible: boolean read Fvisible write Setvisible;
    property DataSetReadOnly: Boolean read fDsRO write SetDsRO;

    //Eventos
    property AntesAlternarDataset: TAntesAlternarDataset read fAntesAlternarDataset write fAntesAlternarDataset;
    property DepoisAlternarDataset: TDepoisAlternarDataset read fDepoisAlternarDataset write fDepoisAlternarDataset;
    property AoClicarBtRelats: TAoClicarBtRelatorios read fAoclicarBtRelats write fAoclicarBtRelats;
    property DepoisClicarNovo: TDepoisClicarNovo read fDepoisClicarNovo write fDepoisClicarNovo;
    property DepoisClicarAlterar: TDepoisClicarAlterar read fDepoisClicarAlterar write fDepoisClicarAlterar;
    property DepoisClicarGravar: TDepoisClicarGravar read fDepoisClicarGravar write fDepoisClicarGravar;
    property DepoisClicarCancelar: TDepoisClicarCancelar read fDepoisClicarCancelar write fDepoisClicarCancelar;
    property DepoisClicarExcluir: TDepoisClicarExcluir read fDepoisClicarExcluir write fDepoisClicarExcluir;
    property DepoisClicarLimpar: TDepoisClicarLimpar read fDepoisClicarLimpar write fDepoisClicarLimpar;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Beleza', [TBarraFerramentas]);
end;

{ TBarraFerramentas }

procedure TBarraFerramentas.AlterarRegistro(Sender: TObject);
begin
  DataSet.Edit;
  //Evento de clicar Botao
  if assigned(fDepoisClicarAlterar) then
    DepoisClicarAlterar(sender);

end;

procedure TBarraFerramentas.AntRegistro(Sender: TObject);
begin
  Dataset.Prior;
end;

procedure TBarraFerramentas.CancelarRegistro(Sender: TObject);
begin
  DataSet.Cancel;
  //Evento de clicar Botao
  if assigned(fDepoisClicarCancelar) then
    DepoisClicarCancelar(sender);

end;

constructor TBarraFerramentas.Create(owner: TComponent);
begin
  inherited;

  //Propriedades Padroes
  BarraPai:= TControlBar.Create(owner);
  BarraPai.Align:= alTop;
  BarraPai.BevelInner:= bvNone;
  BarraPai.BevelOuter:= bvNone;
  BarraPai.BevelKind:= bkFlat;
  BarraPai.Height:= 30;
  BarraPai.Color:= clWhite;
  BarraPai.AutoSize:= True;
  BarraPai.Parent:= tWinControl(owner);

  BarraFilha:= TToolBar.Create(BarraPai);
  BarraFilha.Flat:= true;
  BarraFilha.Transparent:= true;
  BarraFilha.Parent:= BarraPai;
  BarraFilha.Width:= 250;
  BarraFilha.List:= true;
  BarraFilha.Align:= alTop;
  BarraFilha.EdgeBorders:= [];

  BarraNaveg:= TToolBar.Create(BarraPai);
  BarraNaveg.Flat:= true;
  BarraNaveg.Transparent:= true;
  BarraNaveg.Parent:= BarraPai;
  BarraNaveg.Width:= 110;
  BarraNaveg.List:= true;
  BarraNaveg.Align:= alTop;
  BarraNaveg.EdgeBorders:= [];

  DataSource:= TDataSource.Create(BarraPai);

  MontarBotoes;
  Lb:= nil;
  
  if (assigned(FDs)) and (AutoEnabledBotoes) then
    HabilitarBotoes(Dataset);
    
end;

destructor TBarraFerramentas.Destroy;
begin
  inherited;

end;

procedure TBarraFerramentas.ExcluirRegistro(Sender: TObject);
begin
  if Application.MessageBox('Deseja realmente Excluir o registro atual?','Excluir',mb_yesno+mb_iconquestion) = id_yes then
  begin
    DataSet.Delete;
    //Evento de clicar Botao
    if assigned(fDepoisClicarExcluir) then
      DepoisClicarExcluir(sender);
  end;

end;

procedure TBarraFerramentas.FecharTela(Sender: TObject);
begin

  if Owner is TForm then
  begin
    if TForm(owner).FormStyle = fsMDIForm then
    begin
      if TForm(TForm(owner).ActiveMDIChild) <> nil then
        TForm(TForm(owner).ActiveMDIChild).Close
      else TForm(owner).close;
    end
    else
      TForm(owner).close;
  end;
  
end;

procedure TBarraFerramentas.GravarRegistro(Sender: TObject);
begin
  DataSet.Post;
  //Evento de clicar Botao
  if assigned(fDepoisClicarGravar) then
    DepoisClicarGravar(sender);

end;

procedure TBarraFerramentas.HabilitarBotoes(Sender: TObject);
begin

  if (assigned(Datasource)) and (AutoEnabledBotoes) then
  begin
    SbNovo.Enabled:= DataSet.State in [dsBrowse, dsInactive];
    SbAlterar.Enabled:= DataSet.State = dsBrowse;
    SbGravar.Enabled:= DataSet.State in dsEditModes;
    SbCancel.Enabled:= DataSet.State in dsEditModes;
    SbExcluir.Enabled:= DataSet.State = dsBrowse;
    SbRelat.Enabled:= DataSet.State = dsBrowse;
    SbPesq.Enabled:= DataSet.State in [dsBrowse, dsInactive];
    SbLimpar.Enabled:= DataSet.State = dsBrowse;
    SbSair.Enabled:= DataSet.State in [dsBrowse, dsInactive];

    SbPrim.Enabled:= DataSet.State = dsBrowse;
    SbAnterior.Enabled:= DataSet.State = dsBrowse;
    SbProx.Enabled:= DataSet.State = dsBrowse;
    SbUlt.Enabled:= DataSet.State = dsBrowse;
  end;

end;

procedure TBarraFerramentas.HabilitarSetas(Sender: TObject; Field: TField);
begin

  SbPrim.Enabled:= (not Dataset.Bof) and (Dataset.State = dsBrowse);
  SbAnterior.Enabled:= (not Dataset.Bof) and (Dataset.State = dsBrowse);
  SbProx.Enabled:= (not Dataset.Eof) and (Dataset.State = dsBrowse);
  SbUlt.Enabled:= (not Dataset.Eof) and (Dataset.State = dsBrowse);

end;

procedure TBarraFerramentas.LimparResgistros(Sender: TObject);
begin
  DataSet.Close;

  //Evento de clicar Botao
  if assigned(fDepoisClicarLimpar) then
    DepoisClicarLimpar(sender);

end;

procedure TBarraFerramentas.MontarBotoes;
var i: short;
begin

  SbPrim:= TToolButton.Create(BarraNaveg);
  SbPrim.Name:= 'SbPrim';
  SbPrim.Hint:= 'Primeiro Registro';
  SbPrim.Caption:= '';
  SbPrim.OnClick:= PrimRegistro;

  SbAnterior:= TToolButton.Create(BarraNaveg);
  SbAnterior.Name:= 'SbAnterior';
  SbAnterior.Hint:= 'Registro Anterior';
  SbAnterior.Caption:= '';
  SbAnterior.OnClick:= AntRegistro;

  SbProx:= TToolButton.Create(BarraNaveg);
  SbProx.Name:= 'SbProx';
  SbProx.Hint:= 'Proximo Registro';
  SbProx.Caption:= '';
  SbProx.OnClick:= ProxRegistro;

  SbUlt:= TToolButton.Create(BarraNaveg);
  SbUlt.Name:= 'SbUlt';
  SbUlt.Hint:= 'Ultimo Registro';
  SbUlt.Caption:= '';
  SbUlt.OnClick:= UltRegistro;

  SbNovo:= TToolButton.Create(BarraFilha);
  SbNovo.Name:= 'SbNovo';
  SbNovo.Hint:= 'Novo (F5)';
  SbNovo.OnClick:= NovoRegistro;
  SbNovo.Caption:= '&Novo';

  SbAlterar:= TToolButton.Create(BarraFilha);
  SbAlterar.Name:= 'SbAlterar';
  SbAlterar.Hint:= 'Alterar (F6)';
  SbAlterar.OnClick:= AlterarRegistro;
  SbAlterar.Caption:= '&Alterar';

  SbGravar:= TToolButton.Create(BarraFilha);
  SbGravar.Name:= 'SbGravar';
  SbGravar.Hint:= 'Gravar (F4)';
  SbGravar.OnClick:= GravarRegistro;
  SbGravar.Caption:= '&Gravar';

  SbCancel:= TToolButton.Create(BarraFilha);
  SbCancel.Name:= 'SbCancel';
  SbCancel.Hint:= 'Cancelar (F3)';
  SbCancel.OnClick:= CancelarRegistro;
  SbCancel.Caption:= '&Cancelar';

  SbExcluir:= TToolButton.Create(BarraFilha);
  SbExcluir.Name:= 'SbExcluir';
  SbExcluir.Hint:= 'Excluir (F7)';
  SbExcluir.OnClick:= ExcluirRegistro;
  SbExcluir.Caption:= 'E&xcluir';

  SbRelat:= TToolButton.Create(BarraFilha);
  SbRelat.Name:= 'SbRelat';
  SbRelat.Hint:= 'Relatórios (F11)';
  SbRelat.Caption:= '&Relatórios';
  SbRelat.OnClick:= RelatsRegistros;

  SbPesq:= TToolButton.Create(BarraFilha);
  SbPesq.Name:= 'SbPesq';
  SbPesq.Hint:= 'Pesquisar (F12)';
  SbPesq.OnClick:= PesquisarRegistros;
  SbPesq.Caption:= '&Pesquisar';

  SbLimpar:= TToolButton.Create(BarraFilha);
  SbLimpar.Name:= 'SbLimpar';
  SbLimpar.Hint:= 'Limpar (F8)';
  SbLimpar.OnClick:= LimparResgistros;
  SbLimpar.Caption:= '&Limpar';

  SbSair:= TToolButton.Create(BarraFilha);
  SbSair.Name:= 'SbSair';
  SbSair.Hint:= 'Sair';
  SbSair.OnClick:= FecharTela;
  SbSair.Caption:= '&Sair';

  for i:= BarraNaveg.ComponentCount - 1 downto 0 do
    ProprPadroes(TToolButton(BarraNaveg.Components[i]), i, BarraNaveg);
  for i:= BarraFilha.ComponentCount - 1 downto 0 do
    ProprPadroes(TToolButton(BarraFilha.Components[i]), i+4, BarraFilha);

end;

procedure TBarraFerramentas.NovoRegistro(Sender: TObject);
begin

  if not Dataset.Active then Dataset.Open;
  DataSet.Append;

  //Evento de clicar Botao
  if assigned(fDepoisClicarNovo) then
    DepoisClicarNovo(sender);

end;

procedure TBarraFerramentas.PesquisarRegistros(Sender: TObject);
begin
  DataSet.Close;
  DataSet.Open;
end;

procedure TBarraFerramentas.PrimRegistro(Sender: TObject);
begin
  Dataset.First;
end;

procedure TBarraFerramentas.ProprPadroes(Botao: TToolButton; Index: Integer; Pai: TToolBar);
begin
  Botao.AutoSize:= true;
  Botao.ShowHint:= true;
  Botao.Parent:= Pai;
  Botao.ImageIndex:= Index;
end;

procedure TBarraFerramentas.ProxRegistro(Sender: TObject);
begin
  Dataset.Next;
end;

procedure TBarraFerramentas.RelatsRegistros(Sender: TObject);
begin

  //Evento de clicar Botao
  if assigned(fAoclicarBtRelats) then
    AoClicarBtRelats(sender);

end;

procedure TBarraFerramentas.SetAutoB(const Value: Boolean);
begin
  FAutoB := Value;
  if Value then
  begin
    DataSource.OnStateChange:= HabilitarBotoes;
    DataSource.OnDataChange:= HabilitarSetas;
  end;
end;

procedure TBarraFerramentas.SetBotoes(const Value: Botoes);
begin
  FBotoes := Value;

  SbPrim.Visible := not (bvPrimeiro in Value);
  SbAnterior.Visible := not (bvAnterior in Value);
  SbProx.Visible := not (bvProximo in Value);
  SbUlt.Visible := not (bvUltimo in Value);

  SbNovo.Visible := not (bvNovo in Value);
  SbAlterar.Visible := not (bvAlterar in Value);
  SbGravar.Visible := not (bvGravar in Value);
  SbCancel.Visible := not (bvCancelar in Value);
  SbExcluir.Visible := not (bvExcluir in Value);
  SbRelat.Visible := not (bvRelatorios in Value);
  SbPesq.Visible := not (bvPesquisar in Value);
  SbLimpar.Visible := not (bvLimpar in Value);
  SbSair.Visible := not (bvSair in Value);

end;

procedure TBarraFerramentas.SetCaption(const Value: String);
begin
  fCaption := Value;

  //Criar Label
  if fCaption <> '' then
  begin
    if Lb = nil then
    begin
      Lb:= TLabel.Create(BarraPai);
      Lb.Caption:= Caption+#13+'tela';
      Lb.Align:= alLeft;
      Lb.Font.Name:= 'Arial';
      Lb.Font.Size:= 12;
      Lb.Font.Style:= [fsBold];
      Lb.Parent:= BarraPai;
    end
    else Lb.Caption:= fCaption;
  end
  else if (Lb <> nil) then
  begin
    Lb.Free;
    Lb:= nil;
  end;

end;

procedure TBarraFerramentas.SetDs(const Value: TDataSet);
var i: Short;
begin

  FDs := Value;

  //verifica se tem valor assimilado ao evento
  if assigned(fAntesAlternarDataset) then
    AntesAlternarDataset(FDs);

  if assigned(FDs) then
  begin
    Datasource.Dataset:= FDs;
    HabilitarBotoes(Dataset);
  end
  else
  begin
    for i:= 0 to BarraNaveg.ButtonCount -1 do
      BarraNaveg.Buttons[i].Enabled:= false;
    for i:= 0 to BarraFilha.ButtonCount -2 do
      BarraFilha.Buttons[i].Enabled:= false;
  end;
  //verifica se tem valor assimilado ao evento
  if assigned(fDepoisAlternarDataset) then
    DepoisAlternarDataset(FDs);

end;

procedure TBarraFerramentas.SetDsRO(const Value: Boolean);
begin

  fDsRO := Value;

  if Value then
    BotoesInvisiveis:= [bvNovo, bvAlterar, bvGravar, bvCancelar, bvExcluir]
  else BotoesInvisiveis:= [];

end;

procedure TBarraFerramentas.SetImgs(const Value: TImageList);
begin

  FImgs := Value;
  if assigned(FImgs) then
  begin
    BarraFilha.Images:= Value;
    BarraNaveg.Images:= Value;
  end;
  
end;

procedure TBarraFerramentas.setMCapt(const Value: Boolean);
begin

  fMCapt := Value;
  BarraFilha.ShowCaptions:= Value;

end;

procedure TBarraFerramentas.Setvisible(const Value: boolean);
begin
  Fvisible := Value;
  barrapai.visible:= value;
end;

procedure TBarraFerramentas.UltRegistro(Sender: TObject);
begin
  DataSet.Last;
end;

Initialization
registerclass(tControlBar);

end.
