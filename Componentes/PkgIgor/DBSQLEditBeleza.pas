unit DBSQLEditBeleza;

interface

uses
  Windows, Messages, SysUtils, Dialogs, Controls,
  StdCtrls, extctrls, Classes, SQLExpr, DB, dbClient,
  Provider, uTelaSelRegistros, dbCtrls, Graphics;

type
   TDepoisPesquisa = procedure (Sender: TObject; var query_result: TDataset) of object;
   TOnButtonClick = procedure (Sender: TObject; var query_result: TSqlQuery) of object;

   TDBSQLEditBeleza = class(tDBEdit)
  private
    { Private declarations }
    FDepoisPesquisa: TDepoisPesquisa;
    Botao: TButton;
    q: TSqlQuery;
    tTela: tTelaSelRegistros;
    ClientDB: TClientDataset;
    Prov: TProvider;
    Fsql: tstrings;
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
  protected
    { Protected declarations }
    procedure WMNCPaint(var Message: TWMNCPaint); message WM_NCPAINT;

  public
    { Public declarations }
    constructor create (dono: tcomponent); override;
    procedure resize; override;
    procedure RePaint; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  published
    { Published declarations }

    //Propriedades
    Property Ativar_Pesquisa: boolean read f_ativar write set_ativar;
    property mostrar_Botao: boolean read fmostrar_botao write setmostrar_botao;
    property sql : tstrings read Fsql write Setsql;
    property database : tSQLConnection read Fdatabase write Setdatabase;
    property campo : string read Fcampo write Setcampo;
    property Sempre_Mostrar_Janela: boolean read fmostrar write setmostrar;
    property Marcar_CheckBox: TCheckBox read fcheck write setcheck;
    property Outro_Edit: TCustomEdit read f_outroedit write set_outroedit;
    property campo_outro_edit: string read f_outrocampo write set_outrocampo;
    property Sql_botao_Pesquisa: String read fsqlquery write set_sqlquery;
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
    RegisterComponents('Beleza', [TDBSQLEditBeleza]);
end;

{ TDBSQLEditBeleza }

procedure TDBSQLEditBeleza.Clicar(sender: TObject);
begin

  if not Ativar_Pesquisa then exit;

  //verifica se tem texto para executar o procedimento
  if trim(sql.text) = '' then
  begin
      showmessage('Falta Comando para Pesquisa');
      exit;
  end;

  //query da Pesquisa
  q               := tSqlQuery.create(self);
  q.SQLConnection := Database;
  q.sql.text      := sql.Text;

  //Criar Provider
  Prov         := TProvider.Create(self);
  Prov.DataSet := q;

  //Criar ClientDataset
  ClientDB          := TClientDataset.Create(self);
  ClientDB.SetProvider(prov);
  ClientDB.ReadOnly := true;

  if q.Params.Count = 0 then
      showmessage('Falta Parâmetro para Pesquisa')
  else
      q.Params[0].AsString:= Text;

  if trim(text) = '' then q.Params[0].AsString := '%';

  //verifica se tem valor assimilado ao evento
  if assigned(fonbuttonclick) then
      OnButtonClick(self, q);

  ClientDB.Open;
  ClientDB.Next;
  ClientDB.First;

  if (ClientDB.RecordCount > 1) or (fmostrar) then
  begin
      tTela         := tTelaSelRegistros.Create(self);
      tTela.Dataset := ClientDB;
      tTela.Abrir;
      if tTela.Tag = 1 then exit;
  end;

  Text := ClientDB.fieldbyname(campo).AsString;
  DataSource.DataSet.FieldbyName(DataField).AsString := Text;

  //verifica se tem q preencher o outro edit
  try
      if Assigned(f_outroedit) then
          if f_outroedit is TDBEdit then
              TDBEdit(f_outroedit).DataSource.DataSet.fieldbyname(TDBEdit(f_outroedit).DataField).Value:= ClientDB.fieldbyname(f_outrocampo).Value
          else
              f_outroedit.text := ClientDB.fieldbyname(f_outrocampo).AsString;
  except
  end;

  //marcar o Checkbox (se tiver associado)
  try
      if Assigned(fcheck) then
          fcheck.Checked:= true;
  except
  end;

  //testa se o programador digitou alguma
  //coisa no evento do DepoisPesquisa
  if assigned(DepoisPesquisa) then
      DepoisPesquisa(self, TDataset(ClientDB));

end;

constructor TDBSQLEditBeleza.create(dono: tcomponent);
begin
  inherited;
  fsql      := tstringlist.create;
  fsqlquery := '';
  fmostrar  := false;

  color           := $00E0DFD1;
  Width           := 200;
  font.name       := 'Tahoma';
  Text            := '';
  Ativar_Pesquisa := true;
  CorBorda        := clGray;
  
  Botao           := TButton.Create(self);
  Botao.Width     := 22;
  Botao.Left      := Width - 26;
  Botao.Height    := Height - 4;
  Botao.Caption   := '...';
  botao.OnClick   := Clicar;
  botao.hint      := 'Clique aqui para Pesquisar';
  botao.ShowHint  := true;
  Botao.parent    := self;
  Botao.Visible   := false;

end;

procedure TDBSQLEditBeleza.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
      botao.Click;
end;

procedure TDBSQLEditBeleza.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;

  if button = mbright then
  begin
      setfocus;
      Botao.Click;
  end;

end;

procedure TDBSQLEditBeleza.RePaint;
begin
  inherited;
  Botao.Repaint;
end;

procedure TDBSQLEditBeleza.resize;
begin
  inherited;
  Botao.Width  := 22;
  Botao.Left   := Width - 26;
  Botao.Height := Height - 4;
  Botao.Update;
end;

procedure TDBSQLEditBeleza.Setcampo(const Value: string);
begin
  Fcampo := Value;
end;

procedure TDBSQLEditBeleza.setcheck(const Value: TCheckBox);
begin
  fcheck := Value;
end;

procedure TDBSQLEditBeleza.setCorBorda(const Value: tColor);
begin
  fCorBorda := Value;
end;

procedure TDBSQLEditBeleza.Setdatabase(const Value: tSQLConnection);
begin
  Fdatabase := Value;
end;


procedure TDBSQLEditBeleza.setmostrar(const Value: boolean);
begin
  fmostrar := Value;
end;

procedure TDBSQLEditBeleza.setmostrar_botao(const Value: boolean);
begin
  fmostrar_botao := Value;

  Botao.Visible := fmostrar_botao;

end;

procedure TDBSQLEditBeleza.setNovoLay(const Value: Boolean);
begin
  fNovoLay := Value;
end;

procedure TDBSQLEditBeleza.Setsql(const Value: tstrings);
begin
  Fsql.Assign(Value);
end;

procedure TDBSQLEditBeleza.set_ativar(const Value: boolean);
begin
  f_ativar := Value;
end;

procedure TDBSQLEditBeleza.set_outrocampo(const Value: string);
begin
  f_outrocampo := Value;
end;

procedure TDBSQLEditBeleza.set_outroedit(const Value: TCustomEdit);
begin
  f_outroedit := Value;
end;

procedure TDBSQLEditBeleza.set_sqlquery(const Value: String);
begin
  fsqlquery:= Value;
end;

procedure TDBSQLEditBeleza.WMNCPaint(var Message: TWMNCPaint);
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
