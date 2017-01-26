unit uTelaSelRegistros;

interface
{
    Objeto que mostra tela de Selecao de Registros
    de acordo com o Dataset Informado

}

  uses db, dbGridBeleza, stdCtrls, extCtrls, forms, classes,
    dbgrids, Controls, Graphics, dbClient, Windows, sysUtils;

  type

  tTelaSelRegistros = class(tForm)

  private
    FDataset: tDataset;
    edPesq: tEdit;
    lb, lbMultSelecao: tLabel;
    p  : tPanel;
    f  : tForm;
    d  : tDataSource;
    Sh : tShape;
    FTag: Short;
    fMultSelect: Boolean;
    fCaption: String;
    fSelecionouRegistro: Boolean;
    fFocuDescricao: boolean;
    procedure SetDataset(const Value: tDataset);
    procedure GridEnter(Sender: TObject; var Key: Word;
  Shift: TShiftState);
    procedure ClickTituloGrid(Column: TColumn);
    procedure ColEnterGrid(Sender: TObject);
    procedure EscTela(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fechar(Sender: tObject);
    procedure DigitEdPesq(Sender: tObject);
    procedure SetTag(const Value: Short);
    procedure setMultiSelect(const Value: Boolean);
    procedure setCaption(const Value: String);
    procedure ShowTela(Sender: TObject);
    procedure setFocuDescricao(const Value: boolean);
  public
    Grid: tDBGridBeleza;
    procedure Abrir;
    constructor controi;
  published
    property SelecionouRegistro: Boolean read fSelecionouRegistro;
    property Dataset: tDataset read FDataset write SetDataset;
    property Tag: Short read FTag write SetTag;
    property MultiSelect : Boolean read fMultSelect write setMultiSelect default false;
    property Caption: String read fCaption write setCaption;
    property FocuDescricao: boolean read fFocuDescricao write setFocuDescricao;

  end;

implementation

{ tTelaSelRegistros }

procedure tTelaSelRegistros.Abrir;
begin

  // Form da Seleção
  f                       := TForm.create(f);
  f.Width                 := 400;
  f.Height                := 300;
  f.Position              := poScreenCenter;

  if trim(fCaption) = '' then
      f.Caption           := 'Selecione o Registro'
  else
      f.Caption           := fCaption;

  f.KeyPreview            := True;
  f.OnkeyDown             := EscTela;
  f.OnShow                := ShowTela;
  f.Font.Name             := 'Tahoma';
  f.Tag                   := 0;
  f.BorderStyle           := bsDialog;

  d                       := tDataSource.Create(f);
  d.DataSet               := Dataset;

  // Criar DBGrid
  Grid                    := TDBGridBeleza.Create(f);
  Grid.Parent             := f;
  Grid.Ctl3D              := False;
  Grid.Align              := alClient;
  Grid.Hint               := 'Clique no Título da Coluna para Ordenar';
  Grid.ShowHint           := True;
  Grid.DataSource         := d;
  Grid.Visible            := true;
  Grid.OnDblClick         := fechar;
  Grid.OnKeyDown          := GridEnter;
  Grid.OnTitleClick       := ClickTituloGrid;
  Grid.OnColEnter         := ColEnterGrid;
  Grid.ReadOnly           := True;
  Grid.Options            := Grid.Options - [dgEditing, dgIndicator];
  Grid.MarcarLinhaInteira := True;
  Grid.CorLinhaMarcada    := $00C6ECFF;
  Grid.Cor_2              := Grid.Color;
  Grid.FixedColor         := $00BDAC91;
  Grid.ClickTituloOrdenar := True;


  if MultiSelect then
      Grid.Options := Grid.Options + [dgMultiSelect];



  // Painel com a Informação da Ordenação

  p             := tPanel.Create(f);
  //p.Height      := 23;
  p.Width       := 150;
  p.Align       := alLeft; //alTop;
  p.Color       := clWhite;
  p.Font.Color  := clBlack;
  p.Alignment   := taLeftJustify;
  p.Parent      := f;
  p.BorderStyle := bsNone;//bsSingle;
  p.BevelInner  := bvNone;
  p.BevelOuter  := bvNone;

  Lb            := TLabel.Create(f);
  Lb.Parent     := P;
  Lb.Top        := 35;
  Lb.Left       := 10;
  Lb.Caption    := 'Localizar Por';
  Lb.Font.Color := clGray;
  Lb.Name       := 'lbLc';

  if MultiSelect then
  begin
      lbMultSelecao            := tLabel.Create(f);
      lbMultSelecao.Parent     := F;
      lbMultSelecao.Align      := alBottom;
      lbMultSelecao.Caption    := ' .  Selecione Vários Registros Utilizando a Tecla CTRL';
      lbMultSelecao.Color      := clInfoBk;
  end;

  Lb               := TLabel.Create(f);
  Lb.Parent        := P;
  Lb.Top           := (p.Height div 2) - (Lb.Height div 2);
  Lb.Left          := 10;
  Lb.Top           := 250;
  Lb.Font.Color    := clSilver;
  Lb.Font.Style    := [fsBold];
  Lb.Name          := 'lbDica';
  Lb.Caption       :=
      '. Dica:' + #13 + #13 +
      'Basta digitar na própria' + #13 +
      'Grade para Localizar' + #13 +
      'pela Coluna Atual!';

  Lb               := TLabel.Create(f);
  Lb.Parent        := P;
  Lb.Top           := (p.Height div 2) - (Lb.Height div 2);
  Lb.Left          := 10;
  Lb.Top           := 55;
  Lb.Name          := 'lbCampoLocaliz';
  Lb.Caption       := '';
  if Dataset is TClientDataSet then
      Lb.Caption   := tClientDataset(Dataset).IndexFieldNames;

  // Edit Para Pesquisa
  edPesq           := tEdit.Create(f);
  edPesq.Parent    := P;
  edPesq.Top       := 1;
  edPesq.Left      := 10; //100 + lb.Width + 15;
  edPesq.Top       := 70;
  edPesq.Width     := P.Width - 15;
  edPesq.OnChange  := DigitEdPesq;
  edPesq.OnKeyDown := GridEnter;
  edPesq.Name      := 'edPesq';
  edPesq.Clear;


  if lb.Caption <> '' then
      f.ActiveControl := edPesq;

  sh               := tShape.Create(f);
  sh.Parent        := P;
  sh.Align         := alClient;
  sh.Brush.Style   := bsClear;
  sh.Pen.Color     := clSilver;

  f.ActiveControl  := Grid;
  f.ShowModal;

end;

procedure tTelaSelRegistros.ClickTituloGrid(Column: TColumn);
begin
  inherited;
  tLabel(f.FindComponent('lbCampoLocaliz')).Caption  := Column.Field.DisplayLabel;
  tLabel(f.FindComponent('lbCampoLocaliz')).Hint     := Column.FieldName;

end;

procedure tTelaSelRegistros.ColEnterGrid(Sender: TObject);
begin
  tEdit(f.FindComponent('edPesq')).Clear;
end;

constructor tTelaSelRegistros.controi;
begin
   setFocuDescricao(true);
end;

procedure tTelaSelRegistros.DigitEdPesq(Sender: tObject);
begin
  if (trim(tLabel(f.FindComponent('lbCampoLocaliz')).Hint) <> '') and (trim(tEdit(Sender).Text) <> '') then
  begin

      Dataset.Locate(tLabel(f.FindComponent('lbCampoLocaliz')).Hint, tEdit(Sender).Text, [loPartialKey,loCaseInsensitive]);
      tEdit(Sender).SelStart := Length( tEdit(Sender).Text );

  end;

end;

procedure tTelaSelRegistros.EscTela(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = vk_escape then
  begin
      tForm(Sender).Tag   := 1; // Tag 1 para n jogar valor
      fSelecionouRegistro := False;
      tForm(Sender).Close;
  end;

end;

procedure tTelaSelRegistros.fechar(Sender: tObject);
begin
  fSelecionouRegistro := True;
  tForm(f).Close;
end;

procedure tTelaSelRegistros.GridEnter(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var s : String;
begin

  if key = vk_return then
  begin
      key := vk_shift + vk_tab; //Shift + Tab pq tava Pulando 2 Componentes
      fechar(f);
  end
  else if (Grid.DataSource.DataSet is tClientDataSet)
      and (Grid.SelectedField is tStringField)
      and (Key = vk_Back) then
  begin
      s := Copy(tEdit(f.FindComponent('edPesq')).Text, 1, Length(tEdit(f.FindComponent('edPesq')).Text) - 1);
      tEdit(f.FindComponent('edPesq')).Text := s;
  end
  else if (Key = vk_Up) and (f.ActiveControl = edPesq) then
      Grid.SetFocus
  else if (Grid.DataSource.DataSet is tClientDataSet)
      and (Grid.SelectedField is tStringField)
      and (f.ActiveControl = Grid)
      and (((Key >= 65) and (Key <= 90)) or ((Key >= 97) and (Key <= 122)) or ((Key >= 48) and (Key <= 57))) then
  begin
      // Localizar pela Coluna Atual
      if tClientDataset(Grid.DataSource.DataSet).IndexFieldNames <> Grid.SelectedField.FieldName then
      begin
          tClientDataset(Grid.DataSource.DataSet).IndexFieldNames := Grid.SelectedField.FieldName;
          ClickTituloGrid(Grid.Columns[Grid.SelectedIndex]);
      end;

      tEdit(f.FindComponent('edPesq')).Text := tEdit(f.FindComponent('edPesq')).Text + chr(key);
  end;


end;

procedure tTelaSelRegistros.setCaption(const Value: String);
begin
  fCaption := Value;
end;

procedure tTelaSelRegistros.SetDataset(const Value: tDataset);
begin
  FDataset := Value;
end;

procedure tTelaSelRegistros.setFocuDescricao(const Value: boolean);
begin
  fFocuDescricao := Value;
end;

procedure tTelaSelRegistros.setMultiSelect(const Value: Boolean);
begin
  fMultSelect := Value;
end;

procedure tTelaSelRegistros.SetTag(const Value: Short);
begin
  FTag := Value;
end;

procedure tTelaSelRegistros.ShowTela(Sender: TObject);
var i : Short;
begin
    // Percorrer as Colunas do Grid Corrigindo as Larguras
    // de Colunas com campo Data
    f.Width := Screen.Width * 2 div 3;

    for i := 0 to Grid.Columns.Count - 1 do
        if Grid.Columns[i].Field is TDateTimeField then
        begin
            if Length(TDateTimeField(Grid.Columns[i].Field).DisplayFormat) <= 10 then
                Grid.Columns[i].Width := 70
            else
                Grid.Columns[i].Width := 130;
        end;
   try
     ClickTituloGrid(Grid.Columns[1]);
   except
      ClickTituloGrid(Grid.Columns[0]);
   end;
   edPesq.SetFocus;

   if not FocuDescricao then
      Grid.SetFocus;
end;

end.
