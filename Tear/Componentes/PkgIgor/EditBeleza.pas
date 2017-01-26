unit EditBeleza;

interface

uses
  Windows, Messages, SysUtils, Dialogs, Controls,
  StdCtrls, FireDAC.Comp.Client, extctrls, Db, Classes, dbCtrls,
  DBClient, Provider, uTelaSelRegistros, dbGrids, Graphics;

type
   TDepoisPesquisa = procedure (Sender: TObject; var query_result: TDataset) of object;
   TOnButtonClick = procedure (Sender: TObject; var query_result: TFDQuery) of object;

   TEditBeleza = class(TEdit)
  private
    { Private declarations }
    FDepoisPesquisa: TDepoisPesquisa;
    Botao: TButton;
    q: TFDQuery;
    tTela: tTelaSelRegistros;
    ClientDB: TClientDataset;
    Prov: TProvider;
    Fsql: tStrings;
    Fdatabase: string;
    Fcampo: string;
    fOnButtonClick: TOnButtonClick;
    fmostrar: boolean;
    fmostrar_botao: boolean;
    fcheck: TCheckBox;
    f_outroedit: TCustomEdit;
    f_outrocampo: string;
    fsqlquery: String;
    f_ativar: boolean;
    fMultSelec: boolean;
    fCorBorda: tColor;
    fLayPadrao: Boolean;
    fNovoLay: Boolean;
    Procedure Clicar(sender: TObject);
    procedure Setsql(const Value: tstrings);
    procedure Setdatabase(const Value: string);
    procedure Setcampo(const Value: string);
    procedure setmostrar(const Value: boolean);
    procedure setmostrar_botao(const Value: boolean);
    procedure setcheck(const Value: TCheckBox);
    procedure set_outroedit(const Value: TCustomEdit);
    procedure set_outrocampo(const Value: string);
    procedure set_sqlquery(const Value: String);
    procedure set_ativar(const Value: boolean);

    procedure JogarTextoMultSelect(dbGrid : tdbGrid);
    procedure setMultSelec(const Value: boolean);
    procedure EliminaPopupEdit(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure setCorBorda(const Value: tColor);
    procedure setNovoLay(const Value: Boolean);
    procedure setLayPadrao(const Value: Boolean);
  protected
    { Protected declarations }
    procedure WMNCPaint(var Message: TWMNCPaint); message WM_NCPAINT;

  public
    { Public declarations }
    RealizouMultPesquisa : Boolean;  // Variavel que Guarda se foi feita a MultPesquisa

    constructor create (dono: tcomponent); override;
    procedure resize; override;
    procedure RePaint; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure doExit; override;
    procedure doEnter; override;
  published
    { Published declarations }

    //Propriedades
    Property Ativar_Pesquisa: boolean read f_ativar write set_ativar;
    Property Ativar_MultiSelecao: boolean read fMultSelec write setMultSelec;
    property mostrar_Botao: boolean read fmostrar_botao write setmostrar_botao;
    property sql : tstrings read Fsql write Setsql;
    property database : string read Fdatabase write Setdatabase;
    property campo : string read Fcampo write Setcampo;
    property Sempre_Mostrar_Janela: boolean read fmostrar write setmostrar;
    property Marcar_CheckBox: TCheckBox read fcheck write setcheck;
    property Outro_Edit: TCustomEdit read f_outroedit write set_outroedit;
    property campo_outro_edit: string read f_outrocampo write set_outrocampo;
    property Sql_botao_Pesquisa: String read fsqlquery write set_sqlquery;
    property Text;
    property CorBorda: tColor read fCorBorda write setCorBorda;
    property NovoLayout: Boolean read fNovoLay write setNovoLay;

    //Eventos
    property OnButtonClick: TOnButtonClick read fOnButtonClick write fOnButtonClick;
    Property DepoisPesquisa: TDepoisPesquisa read fDepoisPesquisa write FDepoisPesquisa;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Beleza', [TEditBeleza]);
end;

{ TEditBeleza }

procedure TEditBeleza.Clicar(sender: TObject);
begin

  if not Ativar_Pesquisa then exit;

  RealizouMultPesquisa := False;

  // verifica se tem texto para executar o procedimento
  if trim(sql.text) = '' then
  begin
      ShowMessage('Falta Comando para Pesquisa');
      Exit;
  end;

  // query da Pesquisa
  q                 := TFDQuery.Create(self);
  q.ConnectionName  := Database;
  q.sql.text        := sql.Text;

  // verifica se tem valor assimilado ao evento
  if assigned(fonbuttonclick) then
      OnButtonClick(self, q);

  // Criar Provider
  Prov         := TProvider.Create(self);
  Prov.DataSet := q;

  // Criar ClientDataset
  ClientDB                 := TClientDataset.Create(self);
  ClientDB.SetProvider(prov);
  ClientDB.ReadOnly        := true;
  ClientDB.IndexFieldNames := campo;

  if q.ParamCount = 0 then
      ShowMessage('Falta Parâmetro para Pesquisa')
  else
      { Modificado para Buscar o Parametro pelo Nome e ñ pelo ID,
        assim posso colocar pra buscar 2 campos de uma unica vez (ex.: Buscar pelo Codigo e Nome usando o texto do Edit)
        Rafael  -  22/09/09}
      // q.Params[0].AsString := Text;
      q.ParamByName(q.Params[0].Name).AsString := Text;

  if Trim(Text) = '' then
      q.Params[0].AsString := '%';

  ClientDB.Open;
  ClientDB.last;

  if (ClientDB.RecordCount > 1) or (fMostrar) then
  begin
      tTela             := tTelaSelRegistros.CreateNew(self);
      tTela.Dataset     := ClientDB;
      tTela.MultiSelect := Ativar_MultiSelecao;
      tTela.Abrir;

      if not tTela.SelecionouRegistro then
      begin
          Try
              if Assigned(fCheck) then
                  fCheck.Checked := False;
          Except
          end;

          Clear;
          Exit;
      end;

      RealizouMultPesquisa := Ativar_MultiSelecao;

      if Ativar_MultiSelecao then
          JogarTextoMultSelect(tTela.Grid)
      else
          Text := ClientDB.FieldByName(campo).AsString;
  end
  else
      Text := ClientDB.FieldByName(campo).AsString;

  // verifica se tem q preencher o outro edit
  try
      if Assigned(f_outroedit) then
          if f_outroedit is TDBEdit then
              TDBEdit(f_outroedit).DataSource.DataSet.fieldbyname(TDBEdit(f_outroedit).DataField).Value:= ClientDB.fieldbyname(f_outrocampo).Value
          else
              f_outroedit.Text := ClientDB.FieldByName(f_outrocampo).AsString;
  except
  end;

  // marcar o Checkbox (se tiver associado)
  try
      if Assigned(fcheck) then
          fcheck.Checked := true;
  except
  end;

  // testa se o programador digitou alguma
  // coisa no evento do DepoisPesquisa
  if Assigned(DepoisPesquisa) then
      DepoisPesquisa(self, TDataset(ClientDB));

end;

constructor TEditBeleza.create(dono: tcomponent);
begin
  inherited;

  RealizouMultPesquisa := False;

  fSql            := tStringList.create;
  fSqlQuery       := '';
  fMostrar        := False;

  Color       := $00E0DFD1;
      
  Width           := 200;
  Font.Name       := 'Tahoma';
  Text            := '';
  Ativar_Pesquisa := True;
  OnContextPopup  := EliminaPopupEdit;
  CorBorda        := clGray;

  Botao           := tButton.Create(self);
  Botao.Width     := 22;
  Botao.Left      := Width - 26;
  Botao.Height    := Height - 4;
  Botao.Caption   := '...';
  Botao.OnClick   := Clicar;
  Botao.Hint      := 'Clique aqui para Pesquisar';
  Botao.ShowHint  := True;

  Botao.Parent    := self;
  Botao.Visible   := false;
  
end;

procedure TEditBeleza.doEnter;
begin
  inherited;
  SelectAll;
end;

procedure TEditBeleza.doExit;
begin
  inherited;

  if trim(Text) = '' then
      try
          if Assigned(f_outroedit) then
              f_outroedit.Clear
      except
      end;

end;

procedure TEditBeleza.EliminaPopupEdit(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
    Handled := True;
end;

procedure TEditBeleza.JogarTextoMultSelect(dbGrid : tdbGrid);
var i : Integer;
    s : String;
begin

  Text := '';
  s := '';
  if dbGrid.SelectedRows.Count > 0 then
  begin
      with dbGrid.DataSource.DataSet do
          for i := 0 to DBGrid.SelectedRows.Count - 1 do
          begin
            GotoBookmark(pointer(DBGrid.SelectedRows.Items[i]));
            s := s + '"' + ClientDB.FieldByName(campo).AsString + '",';
          end;
      Delete(s, Length(s), 1);
      Text := s;
      if dbGrid.SelectedRows.Count = 1 then
          Text := StringReplace(s, '"', '', [rfReplaceAll]);
  end;

end;

procedure TEditBeleza.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;

  if key = vk_return then
      botao.Click;
end;

procedure TEditBeleza.KeyPress(var Key: Char);
begin
  inherited;
  if key = '%' then
      RealizouMultPesquisa := False;

end;

procedure TEditBeleza.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;

     if button = mbright then
     begin
         setfocus;
         Botao.Click;
     end;
end;

procedure TEditBeleza.RePaint;
begin
  inherited;
  Botao.Repaint;
end;

procedure TEditBeleza.resize;
begin
  inherited;
  Botao.Width  := 22;
  Botao.Left   := Width - 26;
  Botao.Height := Height - 4;
  Botao.Update;
end;

procedure TEditBeleza.Setcampo(const Value: string);
begin
  Fcampo := Value;
end;

procedure TEditBeleza.setcheck(const Value: TCheckBox);
begin
  fcheck := Value;
end;

procedure TEditBeleza.setCorBorda(const Value: tColor);
begin
  fCorBorda := Value;
end;

procedure TEditBeleza.Setdatabase(const Value: string);
begin
  Fdatabase := Value;
end;


procedure TEditBeleza.setLayPadrao(const Value: Boolean);
begin
  fLayPadrao := Value;



end;

procedure TEditBeleza.setmostrar(const Value: boolean);
begin
  fmostrar := Value;
end;

procedure TEditBeleza.setmostrar_botao(const Value: boolean);
begin
  fmostrar_botao := Value;

  Botao.Visible:= fmostrar_botao;

end;

procedure TEditBeleza.setMultSelec(const Value: boolean);
begin
  fMultSelec := Value;
end;

procedure TEditBeleza.setNovoLay(const Value: Boolean);
begin
  fNovoLay := Value;
end;

procedure TEditBeleza.Setsql(const Value: tstrings);
begin
  Fsql.Assign(Value);
end;

procedure TEditBeleza.set_ativar(const Value: boolean);
begin
  f_ativar := Value;
end;

procedure TEditBeleza.set_outrocampo(const Value: string);
begin
  f_outrocampo := Value;
end;

procedure TEditBeleza.set_outroedit(const Value: TCustomEdit);
begin
  f_outroedit := Value;
end;

procedure TEditBeleza.set_sqlquery(const Value: String);
begin
  fsqlquery:= Value;
end;

procedure TEditBeleza.WMNCPaint(var Message: TWMNCPaint);
var
  DC     : HDC;
  Rect   : TRect;
  Canvas : TCanvas;
begin

  if not NovoLayout then
  begin
      inherited; //WMNCPaint(Message);
      Exit;
  end;

  DC := GetWindowDC(Handle);

  try
      Windows.GetClientRect(Handle, Rect);

      // Limpa o fundo edit, pintando tudo da cor definida em Color (original) :)
      InflateRect(Rect, 4, 4);
      Brush.Color := Color;
      Windows.FillRect(DC, Rect, Brush.Handle);

      // Desenha a borda!
      Canvas := TCanvas.Create;
      try
          Canvas.Handle      := DC;
          Canvas.Pen.Style   := psSolid;
          Canvas.Pen.Color   := CorBorda; // Cor da borda!

          Canvas.Brush.Style := bsClear;
          Canvas.Rectangle(0, 0, Width, Height);
      finally
          Canvas.Free;
      end;

  finally
      ReleaseDC(Handle, DC);
  end;

end;

end.
