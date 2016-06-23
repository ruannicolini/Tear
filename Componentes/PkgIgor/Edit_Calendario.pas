unit Edit_Calendario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask, Buttons;

type

  tValidarData = procedure (Sender: tObject) of Object;
  tErroValidar = procedure (Sender: tObject) of Object;

  TEdit_Calendario = class(TCustomMaskEdit)
  private
    { Private declarations }
    Botao: TBitBtn;
    Calend: TMonthCalendar;
    Tela: TForm;
    fformat: String;
    fdata: TDatetime;
    fValidarData: tValidarData;
    fAoErroValidar: tErroValidar;
    procedure Clicar(sender: TObject);
    procedure DblClicar(Sender: TObject);
    procedure Clicar_Calend(Sender: TObject);
    procedure setformato(const Value: String);
    procedure fechar_tela_calendar(Sender: TObject; var Action: TCloseAction);
    procedure setdata(const Value: TDatetime);
    procedure EscTela(Sender: TObject; var Key: Word; Shift: TShiftState);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor create (dono: tcomponent); override;
    procedure resize; override;
    procedure RePaint; override;
    procedure KeyPress (var Key: char); override;
    procedure DoExit; override;
    procedure Change; override;
  published
    { Published declarations }

    //Propriedades
    Property Formato_Data: String read fformat write setformato;
    Property Data: TDatetime read fdata write setdata;

    //Eventos
    property AoValidarData: tValidarData read fValidarData write fValidarData;
    property AoErroValidar: tErroValidar read fAoErroValidar write fAoErroValidar;

    Property Anchors;
    Property AutoSize;
    Property BorderStyle;
    Property Color;
    Property Ctl3D;
    Property EditMask;
    Property Font;
    Property TabOrder;
    Property Visible;
    Property ReadOnly;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Beleza', [TEdit_Calendario]);
end;

{ TEdit_Calendario }

procedure TEdit_Calendario.Clicar(sender: TObject);
begin

  // Abrir form com Calendario
  if Tela <> nil then exit;

  Tela        := Tform.Create(self.GetParentComponent);
  Tela.Parent := tform(self.GetParentComponent);

  //showmessage(inttostr((tela.GetParentComponent).Left));
  Tela.Width  := 149;
  Tela.Height := 127;

  // Verificar se cabe na tela abrir o
  // relatorio a direita do mouse
  if mouse.Cursorpos.x + Tela.Width > Screen.Width then
  begin
    Tela.Left := (mouse.Cursorpos.x - Tela.Width);
  end
  else
  begin
    Tela.Left := mouse.Cursorpos.x;
  end;

  // Verificar se cabe na tela abrir o
  // relatorio abaixo do mouse
  if mouse.Cursorpos.y + Tela.Height > Screen.Height then
  begin
    Tela.Top := (mouse.Cursorpos.y - Tela.Height);
  end
  else
  begin
    Tela.Top := mouse.Cursorpos.y;
  end;




  Tela.BorderStyle                  := bsNone;
  Tela.Color                        := clWhite;
  Tela.Ctl3D                        := False;
  Tela.FormStyle                    := fsStayOnTop;
  Tela.OnClose                      := fechar_tela_calendar;
  Tela.OnKeyDown                    := EscTela;
  Tela.KeyPreview                   := True;



  Calend                            := TMonthCalendar.Create(GetParentComponent);
  Calend.OnDBlClick                 := Clicar_Calend;
  Calend.Hint                       := 'Duplo clique para selecionar a data.';
  Calend.ShowHint                   := True;
  Calend.Font.Name                  := 'Arial';
  Calend.Font.Size                  := 7;

  Calend.CalColors.BackColor        := clWindow;
  Calend.CalColors.MonthBackColor   := $00E1FFFF;
  Calend.CalColors.TextColor        := clWindowText;
  Calend.CalColors.TitleBackColor   := $00BF8200;
  Calend.CalColors.TitleTextColor   := clWhite;
  Calend.CalColors.TrailingTextColor:= clGray;
  Calend.ShowToday                  := False;
  Calend.AutoSize                   := True;
  Calend.Parent                     := Tela;
  Calend.OnKeyDown                  := EscTela;
  Calend.Show;

  Tela.AutoSize := True;
    Tela.Left := 500;
  Tela.Top  := 500;


  Tela.Show;

end;

constructor TEdit_Calendario.create(dono: tcomponent);
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
  Botao.Hint      := 'Clique aqui para abrir o calendario.';
  Botao.ShowHint  := true;
  Botao.TabStop   := False;
  Botao.Parent    := self;

  Text            := '';
  Formato_Data    := 'dd/mm/yy';
  EditMask        := '##/##/##';
  MaxLength       := length(Formato_Data);
  OnDblClick      := DblClicar;
  Hint            := 'Duplo clique para buscar a data de hoje.';
  ShowHint        := True;

end;

procedure TEdit_Calendario.Clicar_Calend(Sender: TObject);
begin
  //Verifica se deu 2 cliques na barra superior do calendario
  if mouse.CursorPos.y > tform(Calend.parent).Top + 30 then
  begin
    Text:= formatdatetime(formato_data, Calend.Date);
    Data:= Calend.Date;
    Tform(Calend.parent).Close;
    Setfocus;
  end;
end;

procedure TEdit_Calendario.RePaint;
begin
  inherited;
  Botao.Update;
end;

procedure TEdit_Calendario.resize;
begin
  inherited;
  Botao.Width:= 22;
  Botao.Left:= Width - 26;
  Botao.Height:= Height - 4;
  Botao.Update;
end;

procedure TEdit_Calendario.setformato(const Value: String);
begin
  Fformat := Value;
  MaxLength:= length(Formato_Data);
end;

procedure TEdit_Calendario.KeyPress(var Key: char);
begin
  inherited;
  if key = chr(27) then Tela.close;

end;

procedure TEdit_Calendario.fechar_tela_calendar(Sender: TObject;
  var Action: TCloseAction);
begin
  action:= cafree;
  tela:= nil;
end;

procedure TEdit_Calendario.setdata(const Value: TDatetime);
begin
  fdata := Value;
  Text:= formatdatetime(Formato_Data, fData);
end;

procedure TEdit_Calendario.DoExit;
begin
  inherited;

  if Tela <> nil then
      Tela.Close;

  // Validar Data
  if (Trim(Text) = '/  /') or (Trim(Text) = '') then
      Exit;

  try
      // Verificar Evento AoValidarData
      if Assigned(fValidarData) then
          AoValidarData(Self);

      Data := StrToDate(Text);
  Except
      //Setfocus;

      // Verificar Evento AoErroValidar
      if Assigned(fAoErroValidar) then
          AoErroValidar(Self);

      Clear;
      ShowMessage('Data inserida é inválida!');
  end;

end;

procedure TEdit_Calendario.Change;
begin
  inherited;
  botao.Repaint;
end;

procedure TEdit_Calendario.DblClicar(Sender: TObject);
begin

{  //if ssRight in Shift then
  if ssDouble in Shift then
  begin}
    Text:= formatdatetime(formato_data, date);
    Data:= Date;
  //end;
  if tela <> Nil then Tela.Close;
  
end;

procedure TEdit_Calendario.EscTela(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then Tela.Close;
end;

end.
