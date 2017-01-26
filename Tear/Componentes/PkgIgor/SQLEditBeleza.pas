unit SQLEditBeleza;

interface

uses
  Windows, Messages, SysUtils, Dialogs, Controls, dbGrids,
  StdCtrls, extctrls, Classes, SQLExpr, DB, dbClient,
  Provider, uTelaSelRegistros, dbCtrls, Graphics;

type
   TDepoisPesquisa = procedure (Sender: TObject; var query_result: TDataset) of object;
   TOnButtonClick = procedure (Sender: TObject; var query_result: TSQLQuery) of object;

   TSQLEditBeleza = class(TEdit)
  private
    { Private declarations }
    FDepoisPesquisa: TDepoisPesquisa;
    Botao: TButton;
    q: TSQLQuery;
    tTela: tTelaSelRegistros;
    ClientDB: TClientDataset;
    Prov: TProvider;
    Fsql: tStrings;
    Fdatabase: tSQLConnection;
    Fcampo: string;
    fOnButtonClick: TOnButtonClick;
    fmostrar: boolean;
    fmostrar_botao: boolean;
    fcheck: TCheckBox;
    f_outroedit: TCustomEdit;
    f_outrocampo: string;
    fsqlquery: String;
    f_ativar: boolean;
    fNovoLay: Boolean;
    fCorBorda: tColor;
    fMultSelec: boolean;
    Procedure Clicar(sender: TObject);
    procedure Setsql(const Value: tstrings);
    procedure Setdatabase(const Value: tSQLConnection);
    procedure Setcampo(const Value: string);
    procedure setmostrar(const Value: boolean);
    procedure setmostrar_botao(const Value: boolean);
    procedure setcheck(const Value: TCheckBox);
    procedure set_outroedit(const Value: TCustomEdit);
    procedure set_outrocampo(const Value: string);
    procedure set_sqlquery(const Value: String);
    procedure set_ativar(const Value: boolean);
    procedure setCorBorda(const Value: tColor);
    procedure setNovoLay(const Value: Boolean);
    procedure setMultSelec(const Value: boolean);
    procedure JogarTextoMultSelect(dbGrid : tdbGrid);
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
    property database : tSQLConnection read Fdatabase write Setdatabase;
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
  RegisterComponents('Beleza', [TSQLEditBeleza]);
end;

{ TEditBeleza }

procedure TSQLEditBeleza.Clicar(sender: TObject);
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
  q               := tSQLQuery.Create(self);
  q.SQLConnection := Database;
  q.sql.text      := sql.Text;

  // verifica se tem valor assimilado ao evento
  if Assigned(fOnButtonClick) then
      OnButtonClick(self, q);

  // Criar Provider
  Prov                     := TProvider.Create(self);
  Prov.DataSet             := q;

  //Criar ClientDataset
  ClientDB                 := TClientDataset.Create(self);
  ClientDB.SetProvider(prov);
  ClientDB.ReadOnly        := true;
  ClientDB.IndexFieldNames := campo;

  if q.Params.Count = 0 then
      ShowMessage('Falta Parâmetro para Pesquisa')
  else
      q.Params[0].AsString := Text;

  if Trim(Text) = '' then q.Params[0].AsString := '%';

  ClientDB.Open;
  ClientDB.Last;

  if (ClientDB.RecordCount > 1) or (fmostrar) then
  begin
      tTela             := tTelaSelRegistros.CreateNew(self);
      tTela.Dataset     := ClientDB;
      tTela.MultiSelect := Ativar_MultiSelecao;
      tTela.Abrir;

      if tTela.Tag = 1 then exit;

      RealizouMultPesquisa := Ativar_MultiSelecao;

      if Ativar_MultiSelecao then
          JogarTextoMultSelect(tTela.Grid)
      else
          Text := ClientDB.FieldByName(campo).AsString;
  end
  else
      Text := ClientDB.FieldByName(campo).AsString;


  // verifica se tem q preencher o outro edit
  Try
      if Assigned(f_outroedit) then
          if f_outroedit is tDBEdit then
              tDBEdit(f_outroedit).DataSource.DataSet.FieldByName(TDBEdit(f_outroedit).DataField).Value:= ClientDB.fieldbyname(f_outrocampo).Value
          else
              f_outroedit.Text := ClientDB.FieldByName(f_outrocampo).AsString;
  Except
  end;


  // Marcar o Checkbox (se tiver associado)
  Try
      if (Assigned(fCheck)) and (trim(Text) <> '') then
          fcheck.Checked := True;
  Except
  end;


  // Testar se o programador digitou alguma
  // coisa no evento do DepoisPesquisa
  if Assigned(DepoisPesquisa) then
      DepoisPesquisa(Self, tDataset(ClientDB));

end;

constructor TSQLEditBeleza.create(dono: tcomponent);
begin
  inherited;

  RealizouMultPesquisa := False;
    
  fsql      := tstringlist.create;
  fsqlquery := '';
  fmostrar  := false;

  color           := $00E0DFD1;
  Width           := 200;
  font.name       := 'Tahoma';
  Text            := '';
  Ativar_Pesquisa := true;
  CorBorda        := clGray;
  
  Botao          := TButton.Create(self);
  Botao.Width    := 22;
  Botao.Left     := Width - 26;
  Botao.Height   := Height - 4;
  Botao.Caption  := '...';
  botao.OnClick  := Clicar;
  botao.hint     := 'Clique aqui para Pesquisar';
  botao.ShowHint := true;

  Botao.parent  := self;
  Botao.Visible := false;

end;

procedure TSQLEditBeleza.doEnter;
begin
  inherited;
  SelectAll;
end;

procedure TSQLEditBeleza.doExit;
begin
  inherited;

  if Text = '' then
      Try
          if assigned(f_outroedit) then
              f_outroedit.Clear
      except
      end;

end;

procedure TSQLEditBeleza.JogarTextoMultSelect(dbGrid: tdbGrid);
var i : Integer;
    s : String;
begin

  Text := '';
  s    := '';

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

procedure TSQLEditBeleza.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
      botao.Click;
end;

procedure TSQLEditBeleza.KeyPress(var Key: Char);
begin
  inherited;
  if key = '%' then
      RealizouMultPesquisa := False;

end;

procedure TSQLEditBeleza.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;

     if button = mbright then
     begin
        setfocus;
        Botao.Click;
     end;

end;

procedure TSQLEditBeleza.RePaint;
begin
  inherited;
  Botao.Repaint;
end;

procedure TSQLEditBeleza.resize;
begin
  inherited;
  Botao.Width:= 22;
  Botao.Left:= Width - 26;
  Botao.Height:= Height - 4;
  Botao.Update;
end;

procedure TSQLEditBeleza.Setcampo(const Value: string);
begin
  Fcampo := Value;
end;

procedure TSQLEditBeleza.setcheck(const Value: TCheckBox);
begin
  fcheck := Value;
end;

procedure TSQLEditBeleza.setCorBorda(const Value: tColor);
begin
  fCorBorda := Value;
end;

procedure TSQLEditBeleza.Setdatabase(const Value: tSQLConnection);
begin
  Fdatabase := Value;
end;


procedure TSQLEditBeleza.setmostrar(const Value: boolean);
begin
  fmostrar := Value;
end;

procedure TSQLEditBeleza.setmostrar_botao(const Value: boolean);
begin
  fmostrar_botao := Value;

  Botao.Visible:= fmostrar_botao;

end;

procedure TSQLEditBeleza.setMultSelec(const Value: boolean);
begin
  fMultSelec := Value;
end;

procedure TSQLEditBeleza.setNovoLay(const Value: Boolean);
begin
  fNovoLay := Value;
end;

procedure TSQLEditBeleza.Setsql(const Value: tstrings);
begin
  Fsql.Assign(Value);
end;

procedure TSQLEditBeleza.set_ativar(const Value: boolean);
begin
  f_ativar := Value;
end;

procedure TSQLEditBeleza.set_outrocampo(const Value: string);
begin
  f_outrocampo := Value;
end;

procedure TSQLEditBeleza.set_outroedit(const Value: TCustomEdit);
begin
  f_outroedit := Value;
end;

procedure TSQLEditBeleza.set_sqlquery(const Value: String);
begin
  fsqlquery:= Value;
end;

procedure TSQLEditBeleza.WMNCPaint(var Message: TWMNCPaint);
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
          Canvas.Handle    := DC;
          Canvas.Pen.Style := psSolid;
          Canvas.Pen.Color := CorBorda; // Cor da borda!

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
