unit DBEditBeleza;

interface

uses
  uTelaSelRegistros, Windows, Messages, SysUtils, Classes, Controls, Dialogs,
  StdCtrls, FireDAC.Comp.Client, DB, extctrls, Graphics,
  DBClient, Provider, DBCtrls, Forms;

type
   TDepoisPesquisa = procedure (Sender: TObject; var query_result: TDataset) of object;
   TOnButtonClick = procedure (Sender: TObject; var query_result: TFDQuery) of object;


   TDBEditBeleza = class(TDBEdit)
  private
    { Private declarations }
    FDepoisPesquisa: TDepoisPesquisa;
    Botao: TButton;
    q: TFDQuery;
    tTela: tTelaSelRegistros;
    ClientDB: TClientDataset;
    Prov: TProvider;
    Fsql: tstrings;
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
    fNovoLay: Boolean;
    fCorBorda: tColor;
    Procedure Clicar(Sender: TObject);
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
    procedure setCorBorda(const Value: tColor);
    procedure setNovoLay(const Value: Boolean);
  protected
    { Protected declarations }
    procedure WMNCPaint(var Message: TWMNCPaint); message WM_NCPAINT;

  public
    { Public declarations }
    constructor Create (Dono: tComponent); Override;
    procedure Resize; override;
    procedure doExit; override;
    procedure RePaint; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  published
    { Published declarations }

    // Propriedades
    Property Ativar_Pesquisa: boolean read f_ativar write set_ativar;
    property mostrar_Botao: boolean read fmostrar_botao write setmostrar_botao;
    property sql : tstrings read Fsql write Setsql;
    property database   : string read Fdatabase write Setdatabase;
    property campo : string read Fcampo write Setcampo;
    property Sempre_Mostrar_Janela: boolean read fmostrar write setmostrar;
    property Marcar_CheckBox: TCheckBox read fcheck write setcheck;
    property Outro_Edit: TCustomEdit read f_outroedit write set_outroedit;
    property campo_outro_edit: string read f_outrocampo write set_outrocampo;
    property Sql_botao_Pesquisa: String read fsqlquery write set_sqlquery;
    property CorBorda: tColor read fCorBorda write setCorBorda;
    property NovoLayout: Boolean read fNovoLay write setNovoLay;

    // Eventos
    property OnButtonClick: TOnButtonClick read fOnButtonClick write fOnButtonClick;
    Property DepoisPesquisa: TDepoisPesquisa read fDepoisPesquisa write FDepoisPesquisa;
  end;

procedure Register;

implementation

uses Mask;

procedure Register;
begin
  RegisterComponents('Beleza', [TDBEditBeleza]);
end;

{ TDBEditBeleza }

procedure TDBEditBeleza.Clicar(Sender: TObject);
begin
  if not Ativar_Pesquisa then exit;

  // verifica se tem texto para executar o procedimento
  if trim(sql.text) = '' then
  begin
      ShowMessage('Falta Comando para Pesquisa');
      Exit;
  end;

  // Criar Provider
  Prov         := TProvider.Create(self);


  // query da Pesquisa
  q                 := TFDQuery.Create(self);
  q.ConnectionName  := Database;
  q.sql.text        := Sql.Text;
  Prov.DataSet      := q;

  if q.ParamCount = 0 then
      ShowMessage('Falta Parâmetro para Pesquisa')
  else
      q.ParamByName(q.Params[0].Name).AsString := Text;

  // Criar ClientDataset
  ClientDB          := TClientDataset.Create(self);
  ClientDB.SetProvider(prov);
  ClientDB.ReadOnly := true;



  if trim(Text) = '' then
      q.Params[0].AsString := '%';

  //verifica se tem valor assimilado ao evento
  if Assigned(fOnButtonClick) then
      OnButtonClick(Self, q);

  ClientDB.Open;
  ClientDB.Next;
  ClientDB.First;

  if (ClientDB.RecordCount > 1) or (FMostrar) then
  begin
      tTela := tTelaSelRegistros.CreateNew(Self); // PROBLEMA AQUI
      tTela.Dataset := ClientDB;
      tTela.Abrir;
      if tTela.Tag = 1 then exit;
  end;
  Text := ClientDB.FieldbyName(Campo).AsString;
  DataSource.DataSet.FieldbyName(DataField).AsString := Text;

  //verifica se tem q preencher o outro edit
  try
      if Assigned(f_outroedit) then
      begin
          if ClientDB.IsEmpty then
          begin
             if f_outroedit is TDBEdit then
                 TDBEdit(f_outroedit).DataSource.DataSet.fieldbyname(TDBEdit(f_outroedit).DataField).Clear
             else
                 f_outroedit.Clear;
          end
          else
          begin
             if f_outroedit is TDBEdit then
                 TDBEdit(f_outroedit).DataSource.DataSet.fieldbyname(TDBEdit(f_outroedit).DataField).Value:= ClientDB.fieldbyname(f_outrocampo).Value
             else
                 f_outroedit.text := ClientDB.fieldbyname(f_outrocampo).AsString;
          end
      end;
  except
  end;
  //marcar o Checkbox (se tiver associado)
  try
      if Assigned(fcheck) then
          fcheck.Checked:= True;
  except
  end;
  //testa se o programador digitou alguma
  //coisa no evento do DepoisPesquisa
  if assigned(DepoisPesquisa) then
      DepoisPesquisa(self, TDataset(ClientDB));
end;

constructor TDBEditBeleza.Create(Dono: TComponent);
begin
  inherited;
  fsql      := tstringlist.Create;
  fsqlquery := '';
  fmostrar  := false;

  color           := $00E0DFD1;
  Width           := 200;
  font.name       := 'Tahoma';
  Text            := '';
  Ativar_Pesquisa := True;
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

procedure TDBEditBeleza.doExit;
begin
  inherited;
  if trim(Text) = '' then
  begin
      if Assigned(f_outroedit) then
      begin
          if f_outroedit is TDBEdit then
          begin
// VERIFICAR ESSA FUNÇÃO
              TDBEdit(f_outroedit).DataSource.DataSet.fieldbyname(TDBEdit(f_outroedit).DataField).Clear;
              if TDBEdit(f_outroedit).DataSource.State in dsEditModes then
                TDBEdit(f_outroedit).DataSource.DataSet.fieldbyname(TDBEdit(f_outroedit).DataField).Clear
          end
          else
              f_outroedit.Clear;
      end;

//           (f_outroedit as TCustomEdit).Clear;
  end;
end;

procedure TDBEditBeleza.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
      botao.Click;
end;

procedure TDBEditBeleza.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;

  if button = mbright then
  begin
      Setfocus;
      Botao.Click;
  end;

end;

procedure TDBEditBeleza.RePaint;
begin
  inherited;
  Botao.Repaint;
end;

procedure TDBEditBeleza.Resize;
begin
  inherited;
  Botao.Width  := 22;
  Botao.Left   := Width - 26;
  Botao.Height := Height - 4;
  Botao.Update;
end;

procedure TDBEditBeleza.Setcampo(const Value: string);
begin
  Fcampo := Value;
end;

procedure TDBEditBeleza.Setcheck(const Value: TCheckBox);
begin
  fcheck := Value;
end;


procedure TDBEditBeleza.setCorBorda(const Value: tColor);
begin
  fCorBorda := Value;
end;

procedure TDBEditBeleza.Setdatabase(const Value: string);
begin
  Fdatabase := Value;
end;


procedure TDBEditBeleza.setmostrar(const Value: boolean);
begin
  fmostrar := Value;
end;

procedure TDBEditBeleza.setmostrar_botao(const Value: boolean);
begin
  fmostrar_botao := Value;

  Botao.Visible := fmostrar_botao;

end;

procedure TDBEditBeleza.setNovoLay(const Value: Boolean);
begin
  fNovoLay := Value;
end;

procedure TDBEditBeleza.Setsql(const Value: tstrings);
begin
  Fsql.Assign(Value);
end;


procedure TDBEditBeleza.set_ativar(const Value: boolean);
begin
  f_ativar := Value;
end;

procedure TDBEditBeleza.set_outrocampo(const Value: string);
begin
  f_outrocampo := Value;
end;

procedure TDBEditBeleza.set_outroedit(const Value: TCustomEdit);
begin
  f_outroedit := Value;
end;

procedure TDBEditBeleza.set_sqlquery(const Value: String);
begin
  fsqlquery:= Value;
end;

procedure TDBEditBeleza.WMNCPaint(var Message: TWMNCPaint);
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
