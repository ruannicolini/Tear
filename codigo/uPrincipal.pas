unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Imaging.jpeg, IdHashMessageDigest, iniFiles, DateUtils,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, System.Actions, Vcl.ActnList,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus,
  Vcl.PlatformDefaultStyleActnCtrls, VCLTee.TeCanvas, Vcl.Buttons;

type
  TFPrincipal = class(TForm)
    ImageList64: TImageList;
    Background: TImage;
    ImageList32: TImageList;
    Panel: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    PageScroller: TPageScroller;
    ImageList32Selected: TImageList;
    procedure FormShow(Sender: TObject);
    procedure MouseEnterComponente(Sender: TObject);
    procedure MouseLeaveComponente(Sender: TObject);
    procedure MouseClickComponente(Sender: TObject);
    procedure MontarMenu(Sender: TObject);
    procedure AbrirTela(Sender: TObject);
    procedure CriarForm(Tela, Desc : String);
    procedure ArredondarComponente(Componente: TWinControl; const Radius: SmallInt);
    procedure AumentarBotao(Sender: TObject);
    procedure DiminuirBotao(Sender: TObject);
    function fncAlturaBarraTarefas: Integer;
  private
    { Private declarations }
    function validacaoModulo(idModulo : integer):Boolean;
    function validacaoInterface(idInterface : integer):Boolean;
  public
    Button : TButton;
    Lab : TLabel;
    NomeForm : String;
    //idTipoUsuario : integer;
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses uDataModule, UBase;

procedure TFPrincipal.AbrirTela(Sender: TObject);
var
  Tela, Desc : String;
  X,Y: Integer;
  MyImage: TImage;
begin
  DModule.qAux.SQL.Text := 'SELECT * FROM INTERFACE WHERE IDINTERFACE = :ID';
  DModule.qAux.ParamByName('ID').AsInteger := TButton(Sender).Tag;
  DModule.qAux.Open;

  AumentarBotao(Sender);
  TButton(Sender).Images := ImageList32Selected;

  Tela := 'F' + DModule.qAux.Fields[5].AsString;
  Desc := DModule.qAux.Fields[3].AsString;
  CriarForm(Tela, Desc);

  DiminuirBotao(Sender);
  TButton(Sender).Images := ImageList32;
  TButton(Sender).Enabled := True;
end;

procedure TFPrincipal.ArredondarComponente(Componente: TWinControl; const Radius: SmallInt);
var
  R : TRect;
  Rgn : HRGN;
begin
  with Componente do
  begin
    R := ClientRect;
    //Rgn := CreateRoundRectRgn(R.Left +2, R.Top+2, R.Right-2, R.Bottom-2, Radius, Radius);
    Rgn := CreateRoundRectRgn(R.Left +3, R.Top+3, R.Right-2, R.Bottom-2, Radius, Radius);
    //Perform(EM_GETRECT, 0, lParam(@R));
    //InflateRect(R, -5, -5);
    //Perform(EM_SETRECTNP, 0, lParam(@R));
    SetWindowRgn(Handle, Rgn, True);
    Invalidate;
  end;

end;

procedure TFPrincipal.AumentarBotao(Sender: TObject);
begin
  {TButton(sender).Height := TButton(sender).Height + 10;
  TButton(sender).Width := TButton(sender).Width + 10;
  TButton(sender).Left := TButton(sender).Left - 5;
  TButton(sender).Top := TButton(sender).Top - 5;
  }
end;

procedure TFPrincipal.CriarForm(Tela, Desc : String);
var
  PClass : TPersistentClass;
begin
  PClass := GetClass('T' + trim(Tela));
  if (PCLass <> nil) then
  begin
    with tFormClass(PClass).Create(Application) do
      try
        Name := Tela;
        Caption := Tela + ' - ' + Desc;

        //Oculta a Barra de Titulo
        SetWindowLong(Handle,
                  GWL_STYLE,
                  GetWindowLong(Handle,GWL_STYLE) and not WS_CAPTION);

        //Laugura
        Width := (Screen.Width);

        //Altura = altura da tela - Altura do Panel Menu - Altura Barra de Tarefas - Altura barra de tituto do formPrincipal
        //*Frame Com panel da FPrincipal a mostra
        Height := (Screen.Height) - (FPrincipal.Panel.Height) - fncAlturaBarraTarefas - GetSystemMetrics(SM_CYCAPTION) - 2;
        //*Altura Frame Completo
        //Height := Screen.Height - fncAlturaBarraTarefas - GetSystemMetrics(SM_CYCAPTION) - 2;

        //Alinha o Frame no final da tela
        Align := alBottom;

        //Frame Meio Transparente
        //AlphaBlend := true;
        //AlphaBlendValue := 200;

        //Mostra
        ShowModal;
      finally
        Free;
        tFormClass(PClass) := nil;
      end;
   end;
end;

procedure TFPrincipal.DiminuirBotao(Sender: TObject);
begin
  {TButton(sender).Height := TButton(sender).Height - 10;
  TButton(sender).Width := TButton(sender).Width - 10;
  TButton(sender).Left := TButton(sender).Left + 5;
  TButton(sender).Top := TButton(sender).Top + 5;
  }
end;

function TFPrincipal.fncAlturaBarraTarefas: Integer;
var
  rRect: TRect;
  rBarraTarefas: HWND;
begin
  //Localiza o Handle da barra de tarefas
  rBarraTarefas := FindWindow('Shell_TrayWnd', nil);

  //Pega o "retângulo" que envolve a barra e sua altura
  GetWindowRect(rBarraTarefas, rRect);

  //Retorna a altura da barra
  Result := rRect.Bottom - rRect.Top;
end;

procedure TFPrincipal.FormShow(Sender: TObject);
var
iduser : string;
idInterface : integer;
ArqIni: TIniFile;
nomeInterface : string;
begin
  //Definição de acesso do usuário
  ArqIni := TIniFile.Create( ExtractFilePath(Application.ExeName) + '\user.ini' );
  try
    iduser := ArqIni.ReadString('usuario', 'iduser', iduser);

    //Obtem id tipo de usuário
    Dmodule.idTipoUsuario := 0;
    Dmodule.qAux.close;
    Dmodule.qAux.SQL.Text := 'select * from usuario where idusuario =:idU';
    Dmodule.qAux.ParamByName('idU').Value := strtoint(idUser);
    Dmodule.qAux.open;
    Dmodule.idTipoUsuario := Dmodule.qAux.FieldByName('idTipoUsuario').AsInteger;

    //Obtem id interface
    {idInterface := 0;
    Dmodule.qAux.close;
    Dmodule.qAux.SQL.Text := 'select idinterface from interface where tela =:idT';
    nomeInterface := self.Name;
    Delete(nomeInterface,1,1);  //Tira o F do nome da interface
    Dmodule.qAux.ParamByName('idT').Value := nomeInterface;
    Dmodule.qAux.open;
    idInterface := Dmodule.qAux.FieldByName('idinterface').AsInteger;
    }

    //Pesquisa as permissões
    {Dmodule.qAux.close;
    Dmodule.qAux.SQL.Text := 'select * from seguranca where idinterface = ' + inttostr(idInterface)+
    ' and idTipo_usuario = '+ inttostr(idTipoUsuario);
    ShowMessage( Dmodule.qAux.SQL.Text);
    Dmodule.qAux.open;

    ShowMessage('ID Tipo_usuario: ' + Dmodule.qAux.FieldByName('idTipo_usuario').AsString);
    adicionar := Dmodule.qAux.FieldByName('adicionar').AsBoolean;
    editar := Dmodule.qAux.FieldByName('editar').AsBoolean;
    consultar := Dmodule.qAux.FieldByName('consultar').AsBoolean;
    excluir := Dmodule.qAux.FieldByName('excluir').AsBoolean;
    }

    DModule.qAcesso.Close;
    DModule.qAcesso.SQL.Text := 'select s.*, i.idinterface as interface, m.idmodulo as modulo from seguranca s ';
    DModule.qAcesso.SQL.Add('left outer join interface i on i.idinterface = s.idinterface ');
    DModule.qAcesso.SQL.Add('left outer join modulo m on m.idmodulo = i.idmodulo ');
    DModule.qAcesso.SQL.Add('where s.idTipo_usuario =:idTU');
    DModule.qAcesso.ParamByName('idTU').Value := Dmodule.idTipoUsuario;
    //DModule.qAcesso.ParamByName('idInterf').Value := idInterface;
    DModule.qAcesso.Open();
    DModule.cdsAcesso.Close;
    DModule.cdsAcesso.Open;
    DModule.cdsAcesso.First;

  finally
    ArqIni.Free;
  end;

  // Configurações
  NomeForm := 'TEAR - Sistema de Acompanhamento e Balancameanto de Produção';
  MontarMenu(PageScroller);

end;

//Função de movimento do Botão
procedure TFPrincipal.MouseEnterComponente(Sender: TObject);
begin
{
  TButton(sender).Height := TButton(sender).Height + 8;
  TButton(sender).Width := TButton(sender).Width + 8;
  TButton(sender).Left := TButton(sender).Left - 4;
  TButton(sender).Top := TButton(sender).Top - 4;
}
end;

//Função de movimento do Botão
procedure TFPrincipal.MouseLeaveComponente(Sender: TObject);
begin
{
  TButton(sender).Height := TButton(sender).Height - 8;
  TButton(sender).Width := TButton(sender).Width - 8;
  TButton(sender).Left := TButton(sender).Left + 4;
  TButton(sender).Top := TButton(sender).Top + 4;
}
end;

function TFPrincipal.validacaoInterface(idInterface: integer): Boolean;
var
resultado : boolean;
begin
  //verifica se tem alguma tela do modulo habilitado
  resultado := false;

  //ShowMessage('Entrou');
  DModule.qAcesso.Close;
  DModule.qAcesso.SQL.Text := 'select s.*, i.idinterface as interface, m.idmodulo as modulo from seguranca s ';
  DModule.qAcesso.SQL.Add('left outer join interface i on i.idinterface = s.idinterface ');
  DModule.qAcesso.SQL.Add('left outer join modulo m on m.idmodulo = i.idmodulo ');
  DModule.qAcesso.SQL.Add('where s.idTipo_usuario =:idTU');
  DModule.qAcesso.ParamByName('idTU').Value := Dmodule.idTipoUsuario;
  DModule.qAcesso.Open();
  DModule.cdsAcesso.close;
  DModule.cdsAcesso.open;
  DModule.cdsAcesso.First;

  while not dModule.cdsAcesso.Eof do
  begin
    if(Dmodule.cdsAcessointerface.AsInteger = idInterface)then
    begin
      resultado := true;
    end;
    DModule.cdsAcesso.Next;
  end;
  Result := resultado;
end;


function TFPrincipal.validacaoModulo(idModulo: integer): Boolean;
var
resultado : boolean;
begin
  //verifica se tem alguma tela do modulo habilitado
  resultado := false;

  //ShowMessage('Entrou');
  DModule.qAcesso.Close;
  DModule.qAcesso.SQL.Text := 'select s.*, i.idinterface as interface, m.idmodulo as modulo from seguranca s ';
  DModule.qAcesso.SQL.Add('left outer join interface i on i.idinterface = s.idinterface ');
  DModule.qAcesso.SQL.Add('left outer join modulo m on m.idmodulo = i.idmodulo ');
  DModule.qAcesso.SQL.Add('where s.idTipo_usuario =:idTU');
  DModule.qAcesso.ParamByName('idTU').Value := Dmodule.idTipoUsuario;
  DModule.qAcesso.Open();
  DModule.cdsAcesso.close;
  DModule.cdsAcesso.open;
  DModule.cdsAcesso.First;

  while not dModule.cdsAcesso.Eof do
  begin
    if(Dmodule.cdsAcessomodulo.AsInteger = idModulo)then
    begin
      resultado := true;
    end;
    DModule.cdsAcesso.Next;
  end;
  Result := resultado;
end;

procedure TFPrincipal.MouseClickComponente(Sender: TObject);
var
  Aux, Cont, Tag : Integer;
begin

  Aux := 100;
  Tag := TButton(Sender).Tag;

  {Limpa os botoes}
  while Panel.ControlCount > 0 do
  begin
    //ShowMessage(panel.Controls[0].ToString);
    Panel.Controls[0].Free;
  end;

  DModule.qAux.SQL.Text := 'SELECT * FROM MODULO WHERE IDMODULO = :ID';
  DModule.qAux.ParamByName('ID').AsInteger := Tag;

  DModule.qAux.Open;
  FPrincipal.Caption := NomeForm + ' - Módulo ' + DModule.qAux.Fields[1].AsString;
  Button := TButton.Create(Panel);
  Button.Parent := Panel;
  Button.Images := ImageList64;
  Button.ImageAlignment := iaCenter;
  Button.ImageIndex := DModule.qAux.Fields[2].AsInteger; // Ícone
  Button.Top := 5;
  Button.Left := 20;
  Button.Width := 90;
  Button.Height := 90;
  Button.OnClick := MontarMenu;
  DModule.qAux.Close;

  DModule.qAux.SQL.Text := 'SELECT * FROM INTERFACE WHERE IDMODULO = :ID';
  DModule.qAux.ParamByName('ID').AsInteger := Tag;

  DModule.qAux.Open;
  Cont := DModule.qAux.RecordCount;
  Panel.Width := 130 + (Cont * 90);

  PageScroller.Height := 100;
  Panel.Height := 100;

  DModule.qAux.First;
  while not DModule.qAux.Eof do
  begin
    if(validacaoInterface(DModule.qAux.FieldByName('idInterface').AsInteger) = true)then
    begin
      Button := TButton.Create(Panel);
      Button.Parent := Panel;
      Button.Images := ImageList32; //ImageList64;
      Button.Height := 70;
      Button.Width := 70;
      Button.Top := 10;
      Button.ImageAlignment := iaCenter;
      Button.ImageIndex := DModule.qAux.Fields[4].AsInteger;
      Button.Tag := DModule.qAux.Fields[0].AsInteger;
      Button.OnMouseEnter := MouseEnterComponente;
      Button.OnMouseLeave := MouseLeaveComponente;
      Button.OnClick := AbrirTela;

      Button.Left := Aux + 20;
      Aux := Aux + 90;

      ArredondarComponente(Button,20);

      Lab := TLabel.Create(Panel);
      Lab.Parent := Panel;
      Lab.Font.Name := 'Calibri';
      Lab.Caption := DModule.qAux.Fields[3].AsString;
      Lab.Top := Button.Height + 13;
      Lab.Width := Button.Width + 10;
      Lab.Left := Button.Left - 5;
      Lab.Alignment := taCenter;
    end;
    DModule.qAux.Next;
  end;
end;

procedure TFPrincipal.MontarMenu(Sender: TObject);
var
  Aux : Integer;
begin

  FPrincipal.Caption := NomeForm;
  Aux := 0;

  {Limpa os botoes}
  while Panel.ControlCount > 0 do
  begin
    Panel.Controls[0].Free;
  end;

  PageScroller.Height := 100;
  Panel.Height := 100;

  DModule.FModulo.Open;
  Panel.Width := DModule.FModulo.RecordCount * 90 + 20;

  DModule.FModulo.First;
  while not dModule.FModulo.Eof do
  begin
    if(validacaoModulo(DModule.FModulo.FieldByName('idModulo').AsInteger) = true)then
    begin
        Button := TButton.Create(self);
        Button.Parent := Panel;
        Button.Images := ImageList64;
        Button.Height := 70;
        Button.Width := 70;
        Button.Top := 10;
        Button.ImageAlignment := iaCenter;
        Button.ImageIndex := DModule.FModulo.Fields[2].AsInteger;
        Button.Tag := DModule.FModulo.Fields[0].AsInteger;
        Button.OnMouseEnter := MouseEnterComponente;
        Button.OnMouseLeave := MouseLeaveComponente;
        Button.OnClick := MouseClickComponente;

        Button.Left := Aux + 20;
        Aux := Aux + 90;

        ArredondarComponente(Button,20);

        Lab := TLabel.Create(Panel);
        Lab.Parent := Panel;
        Lab.Font.Name := 'Calibri';
        Lab.Caption := DModule.FModulo.Fields[1].AsString;
        Lab.Top := Button.Height + 13;
        Lab.Width := Button.Width + 10;
        Lab.Left := Button.Left - 5;
        Lab.Alignment := taCenter;


    end;



    DModule.FModulo.Next;
  end;
end;

end.
