unit UModulo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider, Datasnap.DBClient, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, DBGridBeleza, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFModulo = class(TFBase)
    FDQuery1idmodulo: TFDAutoIncField;
    FDQuery1descricao: TStringField;
    FDQuery1icone: TIntegerField;
    ClientDataSet1idmodulo: TAutoIncField;
    ClientDataSet1descricao: TStringField;
    ClientDataSet1icone: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEditIcone: TDBEdit;
    ListView: TListView;

    procedure SetIcon(Sender : TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FModulo: TFModulo;
  UltSelecionado : String;

implementation

{$R *.dfm}

uses uPrincipal;


{ TFBase1 }

procedure TFModulo.acEditarExecute(Sender: TObject);
begin
  inherited;
  SetIcon(self);
end;

procedure TFModulo.Action1Execute(Sender: TObject);
begin
  inherited;
  SetIcon(self);
end;

procedure TFModulo.Action2Execute(Sender: TObject);
begin
  inherited;
  SetIcon(self);
end;

procedure TFModulo.Action3Execute(Sender: TObject);
begin
  inherited;
  SetIcon(self);
end;

procedure TFModulo.Action4Execute(Sender: TObject);
begin
  inherited;
  SetIcon(self);
end;

procedure TFModulo.FormShow(Sender: TObject);
var
  Cont, I : Integer;
  ListItem : TListItem;
begin
  inherited;
  Cont := FPrincipal.ImageList32.Count;

 for I := 0 to Cont - 1 do
  begin
    ListItem := ListView.Items.Add;
    ListItem.ImageIndex:= I;
    ListItem.Caption := IntToStr(I);
  end;

end;

procedure TFModulo.ListViewSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  inherited;
  if Item.Caption <> UltSelecionado then
  begin
    DBEditIcone.Text := Item.Caption;
    UltSelecionado := Item.Caption;
  end;
end;

procedure TFModulo.SetIcon(Sender: TObject);
begin
  ListView.Items[ClientDataSet1.Fields[2].AsInteger].Selected := True;
end;

Initialization
  RegisterClass(TFModulo);
Finalization
  UnRegisterClass(TFModulo);
end.
