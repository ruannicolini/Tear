unit uFiltroFaixaValores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, EditDinheiro, stdctrls;

type

  tOpcaoSelecionada = (opEntre, opIgual, opMaior, opMenor, opDiferente);
  tFiltroFaixaValores = class(TPanel)
  private
    { Private declarations }
    EdValor : TEditDinheiro;
    Check  : tCheckBox;
    fCaptionCheck: String;
    fChecked: Boolean;
    fsqlquery: String;
    FValor1: Real;
    FValor2: Real;
    FFormatoValor: String;
    cbOperacao: tCombobox;
    FOpcaoSelecionada: tOpcaoSelecionada;

    procedure CriarCBOperacao;
    procedure CarregarItensCBOperacao;
    procedure OnEnterCbOperacao(Sender: tObject);
    procedure OnCloseUpCbOperacao(Sender: tObject);
    procedure CriarEdValor(Ordem : Smallint);
    procedure CriarCheck;
    procedure setCaptionCheck(const Value: String);
    procedure setChecked(const Value: Boolean);
    procedure set_sqlquery(const Value: String);
    procedure ClickCheck(Sender: tObject);
    procedure SetFormatoValor(const Value: String);
    procedure edValorKeyDownEnter(Sender: TObject; var Key: Word;
        Shift: TShiftState);
    procedure edValorExit(Sender: tObject);
    procedure ComponenteExit(Sender: tObject);
    procedure SetValor1(const Value: Real);
    procedure SetValor2(const Value: Real);
    procedure MarcarCheck;
    procedure SetOpcaoSelecionada(const Value: tOpcaoSelecionada);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor create(Owner : tComponent); override;
  published
    { Published declarations }
    Property CaptionCheck : String read fCaptionCheck write setCaptionCheck;
    Property Checked : Boolean read fChecked write setChecked;
    Property FormatoValor : String read FFormatoValor write SetFormatoValor;
    Property Sql_botao_Pesquisa : String read fsqlquery write set_sqlquery;
    property Valor1 : Real read FValor1 write SetValor1;
    property Valor2 : Real read FValor2 write SetValor2;
    property OpcaoSelecionada: tOpcaoSelecionada read FOpcaoSelecionada write SetOpcaoSelecionada;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Beleza', [tFiltroFaixaValores]);
end;

{ tFiltroFaixaValores }

procedure tFiltroFaixaValores.CarregarItensCBOperacao;
begin
    cbOperacao.Items.Add('Entre');
    cbOperacao.Items.Add('=');
    cbOperacao.Items.Add('>');
    cbOperacao.Items.Add('<');
    cbOperacao.Items.Add('<>');

    OpcaoSelecionada := opEntre;

end;

procedure tFiltroFaixaValores.ClickCheck(Sender: tObject);
begin
    Checked := Check.Checked;
    tag     := 0;
end;

procedure tFiltroFaixaValores.ComponenteExit(Sender: tObject);
begin
    if Tag = 1 then MarcarCheck;
end;

constructor tFiltroFaixaValores.create(Owner: tComponent);
begin
  inherited;

    Height                := 40;
    BorderStyle           := bsNone;
    BevelInner            := bvNone;
    BevelOuter            := bvNone;
    Caption               := '';
    CaptionCheck          := 'Valor Entre';
    Constraints.MaxHeight := 40;
    Constraints.MinHeight := 40;
    OnExit                := ComponenteExit;
    ParentColor           := True;

    CriarCheck;
    CriarCBOperacao;
    CriarEdValor(0);
    CriarEdValor(1);

    Width                 :=
        TComboBox(FindComponent('cbOperacao')).Width +
        TEditDinheiro(FindComponent('Valor0')).Width +
        TEditDinheiro(FindComponent('Valor1')).Width +
        5;
    FormatoValor          := '0';
    Caption               := ' ';
    Constraints.MaxWidth  := Width;
    Constraints.MinWidth  := Width;

end;

procedure tFiltroFaixaValores.CriarCBOperacao;
begin

    cbOperacao           := TComboBox.Create(Self);
    cbOperacao.Parent    := Self;
    cbOperacao.Top       := 17;
    cbOperacao.Left      := 3;
    cbOperacao.Name      := 'cbOperacao';
    cbOperacao.Width     := 50;
    cbOperacao.Style     := csDropDownList;
    cbOperacao.OnEnter   := OnEnterCbOperacao;
    cbOperacao.OnCloseUp := OnCloseUpCbOperacao;
    cbOperacao.OnKeyDown := edValorKeyDownEnter;
    cbOperacao.OnExit    := OnCloseUpCbOperacao;
    cbOperacao.TabOrder  := 1;

   { cbOperacao.Items.Add('Entre');
    cbOperacao.Items.Add('=');
    cbOperacao.Items.Add('>');
    cbOperacao.Items.Add('<');
     }
   // cbOperacao.ItemIndex := 0;

end;

procedure tFiltroFaixaValores.CriarCheck;
begin

    Check           := TCheckBox.Create(Self);
    Check.Parent    := Self;
    Check.Top       := 1;
    Check.Left      := 3;
    Check.Caption   := CaptionCheck;
    Check.Name      := 'Check';
    Check.OnClick   := ClickCheck;
    Check.Width     := Width - 10;
    Check.OnKeyDown := edValorKeyDownEnter;
    Check.TabOrder  := 0;

end;

procedure tFiltroFaixaValores.CriarEdValor(Ordem: Smallint);
begin

    EdValor                := TEditDinheiro.Create(Self);
    EdValor.Parent         := Self;
    EdValor.Top            := 17;
    EdValor.Width          := 70;
    EdValor.Left           := (Ordem * 71) + TComboBox(FindComponent('cbOperacao')).Width + 3;
    EdValor.Name           := 'Valor' + intToStr(Ordem);
    EdValor.Formato        := FormatoValor;
    EdValor.OnExit         := edValorExit;
    edValor.OnEnter        := OnEnterCbOperacao;

    if Ordem = 0 then
        EdValor.OnKeyDown  := edValorKeyDownEnter;

end;

procedure tFiltroFaixaValores.edValorExit(Sender: tObject);
begin

    if TEditDinheiro(Sender).Name = 'Valor1' then
    begin
        Valor2 := tEditDinheiro(Sender).Valor;
        Tag    := 1;
        MarcarCheck;
    end
    else if TEditDinheiro(Sender).Name = 'Valor0' then
    begin
        Valor1                                       := tEditDinheiro(Sender).Valor;
        TEditDinheiro(FindComponent('Valor1')).Valor := tEditDinheiro(FindComponent('Valor0')).Valor;

        // Preencher Operacao "Entre" caso nao esteja preenchida
        if (TEditDinheiro(FindComponent('Valor1')).Visible) and (cbOperacao.ItemIndex = -1) then
        begin
            if cbOperacao.Items.Count = 0 then
                CarregarItensCBOperacao;
//            OpcaoSelecionada := opEntre;
//            cbOperacao.ItemIndex := 0;
        end;
    end;

end;

procedure tFiltroFaixaValores.edValorKeyDownEnter(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_Return) and (Sender = FindComponent('Valor0')) and (tEditDinheiro(FindComponent('Valor1')).CanFocus) then
      tEditDinheiro(FindComponent('Valor1')).SetFocus
  else if (Key = vk_Return) and (Sender = FindComponent('Check')) then
      TComboBox(FindComponent('cbOperacao')).SetFocus
  else if (Key = vk_Return) and (Sender = FindComponent('cbOperacao')) and (tEditDinheiro(FindComponent('Valor0')).CanFocus) then
      tEditDinheiro(FindComponent('Valor0')).SetFocus;
end;

procedure tFiltroFaixaValores.MarcarCheck;
begin
    if (Valor1 > 0) and (Valor2 > 0) and (Tag = 1) then
        TCheckBox(FindComponent('Check')).Checked := True;
end;

procedure tFiltroFaixaValores.OnCloseUpCbOperacao(Sender: tObject);
begin

  tEditDinheiro(FindComponent('Valor1')).Visible := cbOperacao.Items[cbOperacao.ItemIndex] = 'Entre';

  // Limpar o Caption do Panel (pq o mesmo nao esta limpando no Create);
  Caption          := ' ';

  case cbOperacao.ItemIndex of
  0: OpcaoSelecionada := opEntre;
  1: OpcaoSelecionada := opIgual;
  2: OpcaoSelecionada := opMaior;
  3: OpcaoSelecionada := opMenor;
  4: OpcaoSelecionada := opDiferente;
  end;

end;

procedure tFiltroFaixaValores.OnEnterCbOperacao(Sender: tObject);
begin

  // Adicionar os Itens se nao tiver
  // Esta rotina esta aqui, e nao no OnCreate pq la davam problemas de perda do "parent"
  if cbOperacao.Items.Count = 0 then
      CarregarItensCBOperacao;

end;

procedure tFiltroFaixaValores.setCaptionCheck(const Value: String);
begin
  fCaptionCheck                             := Value;
  TCheckBox(FindComponent('Check')).Caption := fCaptionCheck;
end;

procedure tFiltroFaixaValores.setChecked(const Value: Boolean);
begin
  fChecked                                  := Value;
  TCheckBox(FindComponent('Check')).Checked := Value;
end;

procedure tFiltroFaixaValores.SetFormatoValor(const Value: String);
begin
  FFormatoValor                                  := Value;
  TEditDinheiro(FindComponent('Valor0')).Formato := FFormatoValor;
  TEditDinheiro(FindComponent('Valor1')).Formato := FFormatoValor;
end;

procedure tFiltroFaixaValores.SetOpcaoSelecionada(const Value: tOpcaoSelecionada);
begin

  FOpcaoSelecionada := Value;

  if cbOperacao.Items.Count = 0 then
      CarregarItensCBOperacao;  

  //if cbOperacao.ItemIndex = -1 then
      case OpcaoSelecionada of
      opEntre     : cbOperacao.ItemIndex := 0;
      opIgual     : cbOperacao.ItemIndex := 1;
      opMaior     : cbOperacao.ItemIndex := 2;
      opMenor     : cbOperacao.ItemIndex := 3;
      opDiferente : cbOperacao.ItemIndex := 4;
      end;
  cbOperacao.Update;

  tEditDinheiro(FindComponent('Valor1')).Visible := cbOperacao.Items[cbOperacao.ItemIndex] = 'Entre';

end;

procedure tFiltroFaixaValores.SetValor1(const Value: Real);
begin
  FValor1                                      := Value;
  TEditDinheiro(FindComponent('Valor0')).Valor := FValor1;
end;

procedure tFiltroFaixaValores.SetValor2(const Value: Real);
begin
  FValor2                                      := Value;
  TEditDinheiro(FindComponent('Valor1')).Valor := FValor2;
end;

procedure tFiltroFaixaValores.set_sqlquery(const Value: String);
begin
  fsqlquery := Value;
end;

end.
