unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Imaging.jpeg, IdHashMessageDigest, iniFiles, DateUtils,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, System.Actions, Vcl.ActnList,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus,
  Vcl.PlatformDefaultStyleActnCtrls;

type
  TFPrincipal = class(TForm)
    ImageList: TImageList;
    Background: TImage;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure MouseEnterComponente(Sender: TObject);
    procedure MouseLeaveComponente(Sender: TObject);
    procedure MouseClickComponente(Sender: TObject);
    procedure MontarMenu(Sender: TObject);
    procedure AbrirTela(Sender: TObject);
    procedure CriarForm(Tela, Desc : String);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Panel : TPanel;
    PageScroller : TPageScroller;
    Button : TButton;
    Lab : TLabel;
    NomeForm : String;
  end;

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses uDataModule, UBase;

procedure TFPrincipal.AbrirTela(Sender: TObject);
var
  Tela, Desc : String;
begin
  DModule.qAux.SQL.Text := 'SELECT * FROM INTERFACE WHERE IDINTERFACE = :ID';
  DModule.qAux.ParamByName('ID').AsInteger := TButton(Sender).Tag;
  DModule.qAux.Open;

  Tela := 'F' + DModule.qAux.Fields[5].AsString;
  Desc := DModule.qAux.Fields[3].AsString;
  CriarForm(Tela, Desc);
end;

procedure TFPrincipal.Button1Click(Sender: TObject);
begin
  CriarForm('FInterface', 'Inteface');
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
        ShowModal;
      finally
        Free;
        tFormClass(PClass) := nil;
      end;
   end;
end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin
  NomeForm := 'Sistema de Balancameanto';

  PageScroller := TPageScroller.Create(self);
  Panel := Tpanel.Create(PageScroller);
  MontarMenu(PageScroller);
end;

procedure TFPrincipal.MouseEnterComponente(Sender: TObject);
begin
  TButton(sender).Height := TButton(sender).Height + 8;
  TButton(sender).Width := TButton(sender).Width + 8;
  TButton(sender).Left := TButton(sender).Left - 4;
  TButton(sender).Top := TButton(sender).Top - 4;
end;

procedure TFPrincipal.MouseLeaveComponente(Sender: TObject);
begin
  TButton(sender).Height := TButton(sender).Height - 8;
  TButton(sender).Width := TButton(sender).Width - 8;
  TButton(sender).Left := TButton(sender).Left + 4;
  TButton(sender).Top := TButton(sender).Top + 4;
end;

procedure TFPrincipal.MouseClickComponente(Sender: TObject);
var
  Aux, Cont, Tag : Integer;
begin

  Aux := 100;
  Tag := TButton(Sender).Tag;

  Panel.Destroy;
  Panel := Tpanel.Create(PageScroller);
  Panel.Parent := PageScroller;
  Panel.Height := 100;

  DModule.qAux.SQL.Text := 'SELECT * FROM MODULO WHERE IDMODULO = :ID';
  DModule.qAux.ParamByName('ID').AsInteger := Tag;

  DModule.qAux.Open;
  FPrincipal.Caption := NomeForm + ' - Módulo ' + DModule.qAux.Fields[1].AsString;
  Button := TButton.Create(Panel);
  Button.Parent := Panel;
  Button.Images := ImageList;
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
  Panel.Width := 130 + (Cont * 90);  // Corrigir essa função

  DModule.qAux.First;
  while not DModule.qAux.Eof do
  begin

    Button := TButton.Create(Panel);
    Button.Parent := Panel;
    Button.Images := ImageList;
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

    Lab := TLabel.Create(Panel);
    Lab.Parent := Panel;
    Lab.Font.Name := 'Calibri';
    Lab.Caption := DModule.qAux.Fields[3].AsString;
    Lab.Top := Button.Height + 13;
    Lab.Width := Button.Width + 10;
    Lab.Left := Button.Left - 5;
    Lab.Alignment := taCenter;

    DModule.qAux.Next;
  end;

end;

procedure TFPrincipal.MontarMenu(Sender: TObject);
var
  Aux : Integer;
begin

  FPrincipal.Caption := NomeForm;
  Aux := 0;

  Panel.Destroy;
  Panel := Tpanel.Create(PageScroller);

  PageScroller.Parent := FPrincipal;
  PageScroller.Control := Panel;
  PageScroller.Align := alTop;
  PageScroller.Height := 100;
  Panel.Parent := PageScroller;
  Panel.Height := 100;

  DModule.FModulo.Open;
  Panel.Width := DModule.FModulo.RecordCount * 90 + 20;

  DModule.FModulo.First;
  while not dModule.FModulo.Eof do
  begin
    Button := TButton.Create(self);
    Button.Parent := Panel;
    Button.Images := ImageList;
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

    Lab := TLabel.Create(Panel);
    Lab.Parent := Panel;
    Lab.Font.Name := 'Calibri';
    Lab.Caption := DModule.FModulo.Fields[1].AsString;
    Lab.Top := Button.Height + 13;
    Lab.Width := Button.Width + 10;
    Lab.Left := Button.Left - 5;
    Lab.Alignment := taCenter;

    DModule.FModulo.Next;
  end;

end;

end.
