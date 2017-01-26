unit DBEditCalendario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask, DBCtrls, Buttons;

type

  tValidarData = procedure (Sender: tObject) of Object;
  tErroValidar = procedure (Sender: tObject) of Object;

  TDBEdit_Calendario = class(TDBEdit)
  private
    { Private declarations }
    Botao: TBitBtn;
    Calend: TMonthCalendar;
    Tela: TForm;
    FFormat: String;
    FValidarData: tValidarData;
    FAoErroValidar: tErroValidar;
    procedure Clicar(sender: TObject);
    procedure DblClicar(sender: TObject);
    procedure Clicar_Calend(sender: TObject);
    procedure setformato(const Value: String);
    procedure Fechar_Tela_Calendar(Sender: TObject; var Action: TCloseAction);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor create (dono: tcomponent); override;
    procedure Resize; override;
    procedure RePaint; override;
    procedure KeyPress (var Key: char); override;
    procedure DoExit; override;
    procedure Change; override;
  published
    { Published declarations }
    Property Formato_Data: String read FFormat write Setformato;

    //Eventos
    property AoValidarData: tValidarData read fValidarData write fValidarData;
    property AoErroValidar: tErroValidar read fAoErroValidar write fAoErroValidar;

    Property Font;
    Property TabOrder;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Beleza', [TDBEdit_Calendario]);
end;

{ TDBEdit_Calendario }

procedure TDBEdit_Calendario.Clicar(Sender: TObject);
begin

  if Tela <> nil then exit;

  Tela        := TForm.Create(Self);
  Tela.Width  := 230;
  Tela.Height := 171;
  Tela.Parent := Self.Parent;

  Tela.Show;

  Tela.Left := (TButton(Sender).Parent).Left;
  Tela.Top := (TButton(Sender).Parent).Top + (TButton(Sender).Parent).Height + 2;

  Tela.BorderStyle    := bsDialog;
  Tela.FormStyle      := fsStayOnTop;
  Tela.OnClose        := Fechar_Tela_Calendar;

  Calend              := TMonthCalendar.Create(self);
  Calend.OnDBlClick   := Clicar_Calend;
  Calend.Hint         := 'Duplo clique para selecionar a data';
  Calend.ShowHint     := true;
  Calend.Font.Name    := 'Arial';
  Calend.Font.Size    := 7;
  Calend.CalColors.BackColor        := clwindow;
  Calend.CalColors.MonthBackColor   := $00E1FFFF;
  Calend.CalColors.TextColor        := clWindowText;
  Calend.CalColors.TitleBackColor   := $00BF8200;
  Calend.CalColors.TitleTextColor   := clWhite;
  Calend.CalColors.TrailingTextColor:= clGray;
  Calend.ShowToday                  := False;
  Calend.AutoSize                   := True;
  Calend.Parent                     := Tela;
  Calend.Show;

end;

constructor TDBEdit_Calendario.Create(Dono: TComponent);
begin
  inherited;

  Botao           := TBitbtn.Create(self);
  Botao.Width     := 22;
  Botao.Left      := Width - 26;
  Botao.Height    := Height - 4;
  Botao.OnClick   := Clicar;
  Botao.Font.Name := 'Arial';
  Botao.Font.Size := 7;
  Botao.Caption   := '15';
  Botao.hint      := 'Clique aqui para Calendario';
  Botao.ShowHint  := true;
  Botao.TabStop   := False;
  Botao.parent    := self;

  Text            := '';
  formato_data    := 'dd/mm/yy';
  EditMask        := '##/##/##';
  MaxLength       := length(Formato_Data);
  Width           := 110;
  OnDblClick      := DblClicar;
  Hint            := 'Duplo Clique para Buscar a data de hoje!';
  ShowHint        := True;

end;

procedure TDBEdit_Calendario.Clicar_Calend(sender: TObject);
begin

  // Verifica se deu 2 cliques na barra superior do calendario
  if mouse.CursorPos.y > tform(Calend.parent).Top + 30 then
  begin
      Text                                                 := FormatDateTime(formato_data, Calend.Date);
      DataSource.DataSet.FieldByName(DataField).AsDateTime := Calend.Date;
      TForm(Calend.parent).Close;
      Setfocus;
  end;

end;

procedure TDBEdit_Calendario.RePaint;
begin
  inherited;
  Botao.Update;
end;

procedure TDBEdit_Calendario.resize;
begin
  inherited;

  Botao.Width  := 22;
  Botao.Left   := Width - 26;
  Botao.Height := Height - 4;
  Botao.Update;

end;

procedure TDBEdit_Calendario.setformato(const Value: String);
begin
  FFormat   := Value;
  MaxLength := Length(Formato_Data);
end;

procedure TDBEdit_Calendario.KeyPress(var Key: char);
begin
  inherited;

end;

procedure TDBEdit_Calendario.Fechar_Tela_Calendar(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Tela   := nil;
end;

procedure TDBEdit_Calendario.DoExit;
begin
  inherited;

  // Validar Data
  if (Trim(Text) = '/  /') or (Trim(Text) = '') then
      Exit;

  try
      // Verificar Evento AoValidarData
      if Assigned(fValidarData) then
          AoValidarData(self);

      StrToDate(Text);
  Except
      Setfocus;
      // Verificar Evento AoErroValidar
      if Assigned(fAoErroValidar) then
          AoErroValidar(self);

      ShowMessage('Data inserida é Inválida!');
  end;

  if Tela <> nil then
      Tela.Close;

end;

procedure TDBEdit_Calendario.Change;
begin
  inherited;
  Botao.Repaint;
end;

procedure TDBEdit_Calendario.DblClicar(sender: TObject);
begin
  Text                                                 := FormatDateTime(Formato_Data, Date);
  DataSource.DataSet.FieldByName(DataField).AsDateTime := Date;

  if Tela <> Nil then Tela.Close;
end;

end.
