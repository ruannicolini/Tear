unit DBGridBeleza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBClient, Db, Menus, ComObj, ExtCtrls,
  stdctrls, uCaixaprogresso, variants, uMsg;

type
  VDirecao_Cor2 = (dg_Vertical, dg_Horiz);
  tTipoPlanilha = (Excel, OOffice);

  TDBGridBeleza = class(TDBGrid)
  private
    // Tela da ordenação
    tOrd: tForm;

    // tDBGridBeleza
    fcor_2: TColor;
    fdircor2: VDirecao_Cor2;
    FDirEnter: VDirecao_Cor2;
    FOrdenar: Boolean;
    Pop: tPopupMenu;
    PopItem: tMenuItem;
    CaixaSalvar: tSaveDialog;
    Progr: tCaixaProgresso;
    FMarcarLinhaInteira: Boolean;
    FCorLinhaMarcada: tColor;
    FBloquearExportacoes: Boolean;
    procedure setcor_2(const Value: TColor);
    procedure setdircor2(const Value: VDirecao_Cor2);
    procedure SetfDirEnter(const Value: VDirecao_Cor2);
    procedure SetOrdenar(const Value: Boolean);

    // Procedures
    procedure ClicarPop(Sender: tObject);                   // Clicar no Item do Popup
    procedure MostraPop(Sender: tObject);                   // Mostrar o Popup
    procedure ChamaTelaOrd;                                 // Chama a Tela de Ordenacao
    procedure EscTelaOrd(Sender: TObject; var Key: Word;
        Shift: TShiftState);                                // OnKeyDown da tela de Ordenação
    procedure ClickOKTelaOrd(Sender: tObject);              // Click do OK da Tela Ord
    procedure ShowTelaOrd(Sender: TObject);                 // OnShow da Tela Ord
    procedure PintarTitulosOriginal;
    procedure LocalizarPeloCampo;                           // Mostra a Caixa de Digitacao do Valor a Localizar pelo Campo

    procedure ExportarHTML(Arquivo : String);
    procedure ExportarPlanilha(tipo: tTipoPlanilha; Arquivo: String);
    procedure SetMarcarLinhaInteira(const Value: Boolean);
    procedure SetCorLinhaMarcada(const Value: tColor);
    procedure SetBloquearExportacoes(const Value: Boolean); // Exporta Grid pra Planilha

    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    Constructor Create (Owner: TComponent); override;
    Procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    Procedure DrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState); override;
    Procedure TitleClick(Column: TColumn); override;
  published
    { Published declarations }
    Property Cor_2: TColor read fcor_2 write setcor_2;
    Property Direcao_Cor2: VDirecao_Cor2 read fdircor2 Write setdircor2;
    Property Direcao_Enter: VDirecao_Cor2 read FDirEnter Write SetfDirEnter;
    Property ClickTituloOrdenar: Boolean read FOrdenar write SetOrdenar;
    Property MarcarLinhaInteira: Boolean read FMarcarLinhaInteira write SetMarcarLinhaInteira;
    Property CorLinhaMarcada: tColor read FCorLinhaMarcada write SetCorLinhaMarcada;
    Property BloquearExportacoes: Boolean read FBloquearExportacoes write SetBloquearExportacoes;
end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Beleza', [TDBGridBeleza]);
end;

{ TDBGridBeleza }

procedure TDBGridBeleza.ChamaTelaOrd;
var B         : tButton;
    lb        : tLabel;
    cb        : tCombobox;
    v, i, col : Short;
    ck        : tCheckBox;
    Sh        : tShape;
begin

  // Tela
  tOrd.Width        := 370;
  tOrd.Height       := 305;
  tOrd.Color        := clWhite;
  tOrd.Position     := poScreenCenter;
  tOrd.BorderStyle  := bsDialog;
  tOrd.BorderIcons  := [biSystemMenu];
  tOrd.Font.Name    := 'Tahoma';
  tOrd.OnShow       := ShowTelaOrd;
  tOrd.OnKeyDown    := EscTelaOrd;
  tOrd.KeyPreview   := True;

  // Botao de Confirmação
  b                 := TButton.Create(tOrd);
  b.ModalResult     := mrOK;
  b.Left            := 210;
  b.Top             := 250;
  b.Caption         := '&OK';
  b.Name            := 'btOk';
  b.OnClick         := ClickOKTelaOrd;
  b.Parent          := tOrd;
  b.Width           := 85;

  // Label Titulo da Tela
  lb                := TLabel.Create(tOrd);
  lb.Caption        := 'Ordenar as Informações da Tela';
  lb.Font.Name      := 'Trebuchet MS';
  lb.Font.Size      := 14;
  //lb.Font.Style     := [fsBold];
  lb.Top            := 10;
  lb.Left           := 15;
  lb.Parent         := tOrd;

  // Botão para Cancelar
  b                 := TButton.Create(tOrd);
  b.ModalResult     := mrCancel;
  b.Left            := 300;
  b.Top             := 250;
  b.Caption         := '&Cancelar';
  b.Name            := 'btCancel';
  b.Parent          := tOrd;
  b.Width           := 55;

  // Comboboxs de Ordenação
  v := 55;
  for i := 1 to 4 do
  begin
      lb           := TLabel.Create(tOrd);
      lb.Caption   := IntToStr(i) + 'º Campo a Ordenar:';
      lb.Top       := v;
      lb.Left      := 15;
      lb.Parent    := tOrd;

      cb           := TComboBox.Create(tOrd);
      cb.Top       := v +15;
      cb.Left      := 15;
      cb.Style     := csDropDownList;
      cb.Parent    := tOrd;
      cb.Name      := 'cb' + IntToStr(i);
      cb.BevelKind := bkFlat;
      cb.Width     := 250;

      for Col := 0 to Columns.Count - 1 do
          if Trim(Columns[Col].FieldName) <> '' then
              cb.Items.Add(Columns[Col].FieldName);

      cb.Items.Add(' ');

      inc(v, 45);
  end;

  // CheckBox d Ordenação Crescente ou Descrescente
  ck                := TCheckBox.Create(tOrd);
  ck.Parent         := tOrd;
  ck.Top            := v;
  ck.Left           := 15;
  ck.Name           := 'ckDesc';
  ck.Caption        := 'Decrescente (Z -> A)';
  ck.Width          := 150;

  Sh                := tShape.Create(tOrd);
  Sh.Align          := alClient;
  Sh.Brush.Style    := bsClear;
  Sh.Pen.Color      := clSilver;
  Sh.Parent         := tOrd;

  tOrd.ShowModal;

end;

procedure TDBGridBeleza.ClicarPop(Sender: tObject);
begin

  if tMenuItem(Sender).Tag = 0 then
  begin
      LocalizarPeloCampo;
  end
  else if tMenuItem(Sender).Tag = 1 then
  begin
      CaixaSalvar            := TSaveDialog.Create(Application);
      CaixaSalvar.Filter     := 'Arquivos Excel|*.xls';
      CaixaSalvar.DefaultExt := 'xls';
      if CaixaSalvar.Execute then
      begin
          if not FileExists(CaixaSalvar.FileName) then
              ExportarPlanilha(Excel, CaixaSalvar.FileName)
          else if Application.MessageBox('Deseja Substituir a Planilha Existente?', 'Exportação para Excel', mb_YesNo + mb_IconQuestion) = idYes then
              ExportarPlanilha(Excel, CaixaSalvar.FileName);
      end;
  end
  else if tMenuItem(Sender).Tag = 2 then
  begin
      CaixaSalvar:= TSaveDialog.Create(Application);
      CaixaSalvar.Filter:= 'Planilha OpenOffice|*.sxc';
      CaixaSalvar.DefaultExt:= 'sxc';
      if CaixaSalvar.Execute then
          ExportarPlanilha(OOffice, CaixaSalvar.FileName);
  end
  else if tMenuItem(Sender).Tag = 3 then
  begin
      CaixaSalvar            := TSaveDialog.Create(Application);
      CaixaSalvar.Filter     := 'Pagina Web (HTML)|*.html';
      CaixaSalvar.DefaultExt := 'html';
      if CaixaSalvar.Execute then
          ExportarHTML(CaixaSalvar.FileName);
  end
  else
  begin
      tOrd := tForm.Create(Self);
      ChamaTelaOrd;
  end;

end;

procedure TDBGridBeleza.ClickOKTelaOrd(Sender: tObject);
var Cb                 : tCombobox;
    NomeInd, CamposInd : String;
    i                  : Short;
begin

  {
      Qdo clicado OK, verificar se ja tem o Indice criado pelo componente
      e remover. Depois pegar os campos dos Combobox e criar um novo Indice
  }


  // Montar Nome do Indice.  Aqui somo o horario atual ao nome, pq se o
  // nome continuar o mesmo, nao reordena a partir da 2ª vez
  NomeInd       := 'indDBGridBeleza' + FormatDateTime('hhnnss', now);

  // Verificar se o Indice ja Existe
  // percorrendo os Indices e vendo qual o nome comeca com "indDBGridBeleza"
  for i := 0 to (DataSource.DataSet as tClientDataset).IndexDefs.Count - 1 do
      if Copy((DataSource.DataSet as tClientDataset).IndexDefs[i].Name, 1, 15) = 'indDBGridBeleza' then
          (DataSource.DataSet as tClientDataset).IndexDefs.Delete(i);

  // Procedure do Click do OK da Tela Ord
  // Pega o Conteudo dos Combobox e Ordena o Dataset;
  Cb            := tComboBox(tOrd.findComponent('cb1'));
  CamposInd     := Cb.Items[Cb.ItemIndex];

  Cb            := tComboBox(tOrd.findComponent('cb2'));
  if trim(Cb.Items[Cb.ItemIndex]) <> '' then
      CamposInd := CamposInd + ';' + Cb.Items[Cb.ItemIndex];

  Cb            := tComboBox(tOrd.findComponent('cb3'));
  if trim(Cb.Items[Cb.ItemIndex]) <> '' then
      CamposInd := CamposInd + ';' + Cb.Items[Cb.ItemIndex];

  Cb            := tComboBox(tOrd.findComponent('cb4'));
  if trim(Cb.Items[Cb.ItemIndex]) <> '' then
      CamposInd := CamposInd + ';' + Cb.Items[Cb.ItemIndex];


  if (tOrd.FindComponent('ckDesc') as tCheckBox).Checked then
      //(DataSource.DataSet as tClientDataset).IndexDefs[0].Options:= [ixDescending]
      (DataSource.DataSet as tClientDataset).IndexDefs.Add(NomeInd, CamposInd, [ixDescending])
  else
      //(DataSource.DataSet as tClientDataset).IndexDefs[0].Options:= [];
      (DataSource.DataSet as tClientDataset).IndexDefs.Add(NomeInd, CamposInd, []);

  //(DataSource.DataSet as tClientDataset).IndexDefs[0].Fields:= s;
  (DataSource.DataSet as tClientDataset).IndexName := NomeInd;

  PintarTitulosOriginal;

end;

constructor TDBGridBeleza.Create(Owner: TComponent);
begin
  inherited;

  Options            := Options - [dgColLines];
  FixedColor         := $00FFC64F;
  Font.Name          := 'Tahoma';
  TitleFont.Color    := clWhite;
  TitleFont.Name     := 'Tahoma';
  Cor_2              := $00FFF2D9;
  CorLinhaMarcada    := clSilver;
  BorderStyle        := BSNone;
  Direcao_Cor2       := dg_Vertical;
  Direcao_Enter      := dg_Horiz;
  ClickTituloOrdenar := true;
  Hint               := 'Clique no Titulo da Coluna para Ordenar';
  ShowHint           := True;

  // Menu de Opçoes
  Pop := TPopupMenu.Create(Application);

  PopItem         := TMenuItem.Create(Pop);
  PopItem.Caption := 'Localizar por ';
  PopItem.OnClick := ClicarPop;
  PopItem.Name    := 'popLocalizCampo';
  PopItem.Tag     := 0;
  Pop.Items.Add(PopItem);

  // Só criar Itens de Exportação
  // se não estiver Bloqueado
  if not fBloquearExportacoes then
  begin
      PopItem         := TMenuItem.Create(Pop);
      PopItem.Caption := 'Exportar Grid para Excel';
      PopItem.OnClick := ClicarPop;
      PopItem.Name    := 'popExcel';
      PopItem.Tag     := 1;
      Pop.Items.Add(PopItem);

      PopItem         := TMenuItem.Create(Pop);
      PopItem.Caption := 'Exportar Grid para Planilha OpenOffice';
      PopItem.OnClick := ClicarPop;
      PopItem.Name    := 'popOpenOffice';
      PopItem.Tag     := 2;
      Pop.Items.Add(PopItem);

      PopItem         := TMenuItem.Create(Pop);
      PopItem.Caption := 'Exportar Grid para Web (HTML)';
      PopItem.OnClick := ClicarPop;
      PopItem.Name    := 'popHTML';
      PopItem.Tag     := 3;
      Pop.Items.Add(PopItem);
  end;

  PopItem         := TMenuItem.Create(Pop);
  PopItem.Caption := 'Montar Sequencia de Ordenação';
  PopItem.OnClick := ClicarPop;
  PopItem.Name    := 'popOrdenacao';
  PopItem.Tag     := 4;
  Pop.Items.Add(PopItem);

  Pop.OnPopup     := MostraPop;
  PopupMenu       := Pop;

end;

procedure TDBGridBeleza.DrawColumnCell(const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  inherited;

  // Campos no Titulo
  // Column


  // Grid Listrado
  if cor_2 <> Color then
  begin
      if Direcao_Cor2 = dg_vertical then
      begin
          if Odd(Column.Index) then
          begin
              Canvas.Brush.Color:= Cor_2;
              Canvas.FillRect(Rect);
              DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end;
      end
      else if Odd(DataSource.Dataset.Recno) then
      begin
          Canvas.Brush.Color := Cor_2;
          Canvas.FillRect(Rect);
          DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;
  end;


  if MarcarLinhaInteira then
      if Rect.Top = TStringGrid(Self).CellRect(DataCol, TStringGrid(Self).Row).Top then
      begin
          Canvas.Brush.Color := CorLinhaMarcada;
          Canvas.FillRect(Rect);
          DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;

  // Tratar se a Cor2 é clara e entao colocar a fonte escura
  // Estava dando problema ao passar no DBGrid com a cor clara e a fonte
  // ficava Branca, deixando o texto mto ruim pra ler
  if (gdSelected in State)
      and ((cor_2 <> Color) or (MarcarLinhaInteira))
      and ((Canvas.Brush.Color = $00E1FFFF)
          or (Canvas.Brush.Color = clWhite)
          or (Canvas.Brush.Color = clWindow)
          or (Canvas.Brush.Color = clSilver)
          or (Canvas.Brush.Color = $00E2E2DE)
          or (Canvas.Brush.Color = $00BFDFFF)
          or (Canvas.Brush.Color = $00C6ECFF)
          or (Canvas.Brush.Color = $00BEC9B6)
          ) then
  begin
      Canvas.Font.Color := clBlack;
      DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  // Desenhar CheckBox Caso Seja Campo Booleano

end;

procedure TDBGridBeleza.EscTelaOrd(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = vk_escape then
        tForm(Sender).Close;
end;

procedure TDBGridBeleza.ExportarHTML(Arquivo : String);
var f               : TextFile;
    i               : Short;
    CorCol, LargCol : String;
begin

    AssignFile(f, Arquivo);
    Rewrite(f);

    WriteLn(f, '<HTML>');

    // Titulo da Pagina
    WriteLn(f, '<TITLE> Matriz Sistemas </TITLE>');

    WriteLn(f, '<BODY>');
    WriteLn(f, '<FONT FACE=''TAHOMA'' SIZE=8>');
    WriteLn(f, '<P>');

    // Iniciar Tabela
    WriteLn(f, '<TABLE COLS=' + IntToStr(Columns.Count) + ' >');

    // Titulos das Colunas
    WriteLn(f, '<TR BGCOLOR=''7C9E8B''>');
    for i := 0 to Columns.Count - 1 do
        WriteLn(f, '<TD>'
            + '<font face="Arial" style="font-size: 8pt" color="white">'
            + Columns[i].Title.Caption + '</TD>');
    WriteLn(f, '</TR>');

    // Linhas da Tabela
    DataSource.DataSet.First;
    while not DataSource.DataSet.Eof do
    begin

        WriteLn(f, '<TR>');
        for i := 0 to Columns.Count - 1 do
        begin

            if Odd(i) then CorCol := 'A9C0AD'
            else CorCol := 'WHITE';

            LargCol := IntToStr(Columns[i].Width * 2);

            if (Columns[i].Field is TFloatField)
                or (Columns[i].Field is TCurrencyField) then
                WriteLn(f, '<TD BGCOLOR="' + CorCol + '" VALIGN = "TOP" ALIGN="RIGHT" WIDTH=' + LargCol + '> <font face="Arial" style="font-size: 8pt">' + FormatFloat(',0.00', Columns[i].Field.AsFloat) + '</TD>')
            else if (Columns[i].Field is TDateTimeField) then
                WriteLn(f, '<TD BGCOLOR="' + CorCol + '" VALIGN = "TOP" WIDTH=' + LargCol + '> <font face="Arial" style="font-size: 8pt">' + FormatDateTime('dd/mm/yyyy', Columns[i].Field.AsDateTime) + '</TD>')
            else
                WriteLn(f, '<TD BGCOLOR="' + CorCol + '" VALIGN = "TOP" WIDTH=' + LargCol + '> <font face="Arial" style="font-size: 8pt">' + Columns[i].Field.AsString + '</TD>');

        end;  // Fim do For

        WriteLn(f, '</TR>');

        DataSource.DataSet.Next;
    end;
    DataSource.DataSet.First;

    WriteLn(f, '</TABLE>');
    WriteLn(f, '</BODY>');

    Closefile(f);

    ShowMessage('Exportação Concluída com Sucesso!');

end;

procedure TDBGridBeleza.ExportarPlanilha(tipo: tTipoPlanilha;
  Arquivo: String);
var
  // Excel
  Planilha : Variant;

  // OpenOffice
  OpenDesktop, Calc, Sheets, Sheet : Variant;
  Connect, OpenOffice              : Variant;

  // Gerais
  Linha, Col, i : Short;
  d             : tDataset;
begin

  if tipo = Excel then
  begin
        Planilha                                   := CreateOleObject('Excel.Application');
        Planilha.Workbooks.Add;
        Planilha.WorkBooks[1].Sheets[1].Cells[1,1] := now;
  end
  else
  begin
        // Cria o link OLE com o OpenOffice
        if VarIsEmpty(OpenOffice) then
           OpenOffice := CreateOleObject('com.sun.star.ServiceManager');
        Connect := not (VarIsEmpty(OpenOffice) or VarIsNull(OpenOffice));

        // Inicia o Calc
        OpenDesktop := OpenOffice.CreateInstance('com.sun.star.frame.Desktop');
        Calc        := OpenDesktop.LoadComponentFromURL('private:factory/scalc', '_blank', 0, VarArrayCreate([0, - 1], varVariant));
        Sheets      := Calc.Sheets;
        Sheet       := Sheets.getByIndex(0);
  end;

  d     := DataSource.DataSet;
  d.DisableControls;
  d.first;
  linha := 3;

  // Imprimir Cabecalhos
  col := 2;
  for i := 0 to Columns.Count -1 do
  begin

      Try
          if tipo = Excel then
              Try
                  Planilha.WorkBooks[1].Sheets[1].Cells[2, Col] := Columns[i].Field.DisplayLabel
              Except
              end
          else
              Sheet.getCellByPosition(Col, 2).setString(Columns[i].Field.DisplayLabel);
      Except
      end;

      inc(col);
  end;

  Progr := tCaixaProgresso.Create;
  Progr.mostrar(d.RecordCount);

  // Imprimir Campos
  while not d.Eof do
  begin
      col := 2;
      for i := 0 to Columns.Count -1 do
      begin

        if Tipo = Excel then
        begin
            if Columns[i].Field is TFloatField then
            begin
                if TFloatField(Columns[i].Field).DisplayFormat = ',0.00' then
                    Planilha.WorkBooks[1].Sheets[1].Cells[Linha, Col].NumberFormat := '#.##0,00'
                else if TFloatField(Columns[i].Field).DisplayFormat = ',0.000' then
                    Planilha.WorkBooks[1].Sheets[1].Cells[Linha, Col].NumberFormat := '#.###0,000'
                else if TFloatField(Columns[i].Field).DisplayFormat = ',0.0000' then
                    Planilha.WorkBooks[1].Sheets[1].Cells[Linha, Col].NumberFormat := '#.####0,0000';

                Planilha.WorkBooks[1].Sheets[1].Cells[Linha,Col]               := Columns[i].Field.AsFloat;
            end
            else if Columns[i].Field is TCurrencyField then
            begin
                Planilha.WorkBooks[1].Sheets[1].Cells[Linha, Col].NumberFormat := '#.##0,00';
                Planilha.WorkBooks[1].Sheets[1].Cells[Linha,Col]               := Round(Columns[i].Field.asCurrency * 100) / 100;
            end
            else if Columns[i].Field is TDateField then
            begin
                // Se a formatacao for dd/mm/yy ou dd/mm/yyyy, jogar como data.
                //IGOR ALTERADO POR CAUSA DO PROBLEMA DE INVERSAO NA DATA AO EXPORTAR EXCEL
                {if (TDateTimeField(Columns[i].Field).DisplayFormat = 'dd/mm/yy') or (TDateTimeField(Columns[i].Field).DisplayFormat = 'dd/mm/yyyy') then
                begin
                    Planilha.WorkBooks[1].Sheets[1].Cells[Linha, Col].NumberFormat := StringReplace(TDateTimeField(Columns[i].Field).DisplayFormat, 'y', 'a', [rfReplaceAll]); //'dd/mm/aa';
                    Planilha.WorkBooks[1].Sheets[1].Cells[Linha,Col]               := Columns[i].Field.AsDateTime;
                end
                // se for data + hora, deve-se jogar como texto
                else
                begin
                    Planilha.WorkBooks[1].Sheets[1].Cells[Linha,Col]               := Columns[i].Field.AsString;
                end }
                //Planilha.WorkBooks[1].Sheets[1].Cells[Linha,Col]               := Columns[i].Field.AsString;
                // FormatDateTime('yyyy/mm/dd',data);
                //ShowMessage('1-'+Columns[i].Field.AsString);
                Planilha.WorkBooks[1].Sheets[1].Cells[Linha,Col]               := FormatDateTime('dd/mm/yyyy',Columns[i].Field.AsDateTime);
            end
            else
            begin
                //ShowMessage('2-'+Columns[i].Field.AsString);
                Planilha.WorkBooks[1].Sheets[1].Cells[Linha,Col] := ' '+Columns[i].Field.AsString;
            end;
        end
        else
        begin
            {if Columns[i].Field.DataType in  [ftSmallint, ftInteger, ftLargeint, ftFloat, ftCurrency] then
                Sheet.getCellByPosition(Col, Linha).SetValue(Columns[i].Field.Value)
            else}

                Sheet.getCellByPosition(Col, Linha).SetString(Columns[i].Field.AsString);
        end;
        inc(col);

      end; //Fim do For que percorre as colunas

      inc(linha);
      Progr.Posicao := Progr.Posicao + 1;
      d.next;
  end;
  d.EnableControls;

  tJanelaMensagem.Create.Mensagem('Gravando Arquivo...');
  if Tipo = Excel then
  begin
      Planilha.WorkBooks[1].SaveAs(Arquivo);
      //Planilha.WorkBooks[1].SaveAs;
      Planilha.WorkBooks[1].Close;
  end
  else
      OpenOffice := Unassigned;

  tJanelaMensagem.Create.Mensagem('Exportado com sucesso!');
  Progr.Liberar;

end;

procedure TDBGridBeleza.KeyDown(var Key: Word; Shift: TShiftState);
var i : Short;
begin
  inherited;

  if key = vk_return then
  begin
      if (Direcao_Enter = dg_Horiz) and (SelectedIndex < Columns.Count) then
      begin
          // ir Saltando de Coluna até achar a proxima com largura > 0
          {Repeat
              keybd_event(VK_tab, 0, 0, 0)
              //SelectedIndex := SelectedIndex + 1;
          until (Columns[SelectedIndex].Width > 0) or (not Columns[SelectedIndex].ReadOnly) or (SelectedIndex = Columns.Count - 1);
          }

          // Se o Grid Estiver Read-Only, entao saltar normalmente 1 coluna
          if ReadOnly then
          begin
              SelectedIndex := SelectedIndex + 1;
              if SelectedIndex >= Columns.Count - 1 then
              begin
                  SelectedIndex := 0;
                  Datasource.Dataset.Next;
              end;
          end
          else
          begin
              i := SelectedIndex + 1;
              while ((Columns[i].ReadOnly) or (Columns[i].Width = 0)) and (i < Columns.Count - 1) do
                  Inc(i);

              // Se não achou mais coluna Disponivel, entao saltar para proxima linha
              if i < Columns.Count - 1 then
                  SelectedIndex := i
              else
              begin
                  SelectedIndex := 0;
                  Datasource.Dataset.Next;
              end;
          end;
      end
      else
      begin
          SelectedIndex := 0;
          Datasource.Dataset.Next;
      end;
  end;

end;

procedure TDBGridBeleza.LocalizarPeloCampo;
var Valor{, IndOld} : String;
begin

  // Pega Indice Antigo
  // IndOld := tClientDataset(DataSource.DataSet).IndexFieldNames;

  // Abre a Caixa de Digitacao do Valor
  Valor := InputBox('Localizar por ' + SelectedField.DisplayLabel,
      'Digite o Valor (ou Inicio do Valor) a Localizar', '');

  if trim(Valor) = '' then Exit;

  // Ordena pelo Campo a Localizar
  TitleClick(Columns.Items[SelectedIndex]);
  
  // Troca ponto por Virgula caso o Campo seja numerico
  if (SelectedField is TFloatField)
      or (SelectedField is TCurrencyField) then
      Valor := StringReplace(Valor, '.', ',', []);

  // Executa Locate
  Try
      DataSource.DataSet.Locate(SelectedField.FieldName, Valor, [loCaseInsensitive, loPartialKey]);
  Except
      Application.MessageBox('Não foi Digitado um Valor Correto para Pesquisa neste Campo!', 'Atenção!', mb_Ok + mb_IconWarning);
  end;

  // Volta ao Indice Anterior
//  tClientDataset(DataSource.DataSet).IndexFieldNames := IndOld;


end;

procedure TDBGridBeleza.MostraPop(Sender: tObject);
begin

  // Mostrar Item "Montar Sequencia de Ordenacao" somente se
  // for um CLientDataset e se nao for Filho de Outro
  PopItem.Visible :=
      (DataSource.DataSet is TClientDataSet)
      and ((DataSource.DataSet as TClientDataSet).MasterFields = '')
      and (ClickTituloOrdenar);

  // Alterar o Caption do Item "Localizar por..."
  // para Mostrar o nome da Coluna Atual
  Pop.Items[0].Visible := (DataSource.DataSet is TClientDataSet)
      and ((DataSource.DataSet as TClientDataSet).MasterFields = '')
      and (ClickTituloOrdenar);

  Pop.Items[0].Enabled := (SelectedField.FieldKind <> fkCalculated);

  if Pop.Items[0].Enabled then
      Pop.Items[0].Caption := 'Localizar por ' + SelectedField.DisplayLabel
  else
      Pop.Items[0].Caption := 'Campo não permite Localizar Valores!';

  Pop.Items[1].Visible := not BloquearExportacoes;
  Pop.Items[2].Visible := not BloquearExportacoes;
  Pop.Items[3].Visible := not BloquearExportacoes;

end;

procedure TDBGridBeleza.PintarTitulosOriginal;
var i : Short;
begin

  for i := 0 to Columns.Count -1 do
      if Columns[i].Title.Font.Color <> TitleFont.Color then
          Columns[i].Title.Font.Color := TitleFont.Color;
end;

procedure TDBGridBeleza.SetBloquearExportacoes(const Value: Boolean);
begin
  FBloquearExportacoes := Value;
end;

procedure TDBGridBeleza.SetCorLinhaMarcada(const Value: tColor);
begin
  FCorLinhaMarcada := Value;
end;

procedure TDBGridBeleza.setcor_2(const Value: TColor);
begin
  fcor_2 := Value;
end;

procedure TDBGridBeleza.setdircor2(const Value: VDirecao_Cor2);
begin
  fdircor2 := Value;
end;

procedure TDBGridBeleza.SetfDirEnter(const Value: VDirecao_Cor2);
begin
  FDirEnter := Value;
end;

procedure TDBGridBeleza.SetMarcarLinhaInteira(const Value: Boolean);
begin
  FMarcarLinhaInteira := Value;
end;

procedure TDBGridBeleza.SetOrdenar(const Value: Boolean);
begin
  FOrdenar := Value;
end;

procedure TDBGridBeleza.ShowTelaOrd(Sender: TObject);
var s, n_ind : String;
    i, n_cb  : Short;
begin

  // On Show da Tela de Ordenacao
  // Pega os campos atuais de Ordenacao e preenche no CB

  s     := (DataSource.DataSet as TClientDataSet).IndexFieldNames+';';
  n_ind := ''; // nome do campo atual retirado da strng
  n_cb  := 1;  // combobox atual

  for i := 1 to length(s) do
      if s[i] <> ';' then n_ind := n_ind + s[i]
      else
      begin
          tCombobox(tOrd.FindComponent('cb' + inttostr(n_cb))).ItemIndex :=
              tCombobox(tOrd.FindComponent('cb' + inttostr(n_cb))).Items.IndexOf(n_ind);
          inc(n_cb);
          n_ind := '';
      end;

end;

procedure TDBGridBeleza.TitleClick(Column: TColumn);
var d : TClientDataset;
begin
  inherited;

  if (DataSource.DataSet is TClientDataset) and (ClickTituloOrdenar) then
  begin
      d := TClientDataset(Datasource.DataSet);
      try
          if d.MasterFields = '' then
          begin
              d.IndexFieldNames       := Column.FieldName;
              PintarTitulosOriginal;
              Column.Title.Font.Color := clBlue;
          end;
      Except
      end;
  end;

end;

end.
