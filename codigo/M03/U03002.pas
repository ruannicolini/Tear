unit U03002;

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
  TF03002 = class(TFBase)
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

    procedure ListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ClientDataSet1AfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F03002: TF03002;
  UltSelecionado : String;

implementation

{$R *.dfm}

uses uPrincipal;


{ TFBase1 }

procedure TF03002.ClientDataSet1AfterScroll(DataSet: TDataSet);
begin
  inherited;
  ListView.Items[ClientDataSet1.Fields[2].AsInteger].Selected := True;
end;

procedure TF03002.FormCreate(Sender: TObject);
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

procedure TF03002.ListViewSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  inherited;
  if Item.Caption <> UltSelecionado then
  begin
    DBEditIcone.Text := Item.Caption;
    UltSelecionado := Item.Caption;
  end;
end;

Initialization
  RegisterClass(TF03002);
Finalization
  UnRegisterClass(TF03002);
end.
