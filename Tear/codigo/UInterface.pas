unit UInterface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider, Datasnap.DBClient, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, DBGridBeleza, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, DBEditBeleza;

type
  TFInterface = class(TFBase)
    FDQuery1idinterface: TFDAutoIncField;
    FDQuery1idmodulo: TIntegerField;
    FDQuery1idgrupo: TIntegerField;
    FDQuery1descricao: TStringField;
    FDQuery1icone: TIntegerField;
    FDQuery1tela: TStringField;
    ClientDataSet1idinterface: TAutoIncField;
    ClientDataSet1idmodulo: TIntegerField;
    ClientDataSet1idgrupo: TIntegerField;
    ClientDataSet1descricao: TStringField;
    ClientDataSet1icone: TIntegerField;
    ClientDataSet1tela: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEditIcone: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    FModulo: TFDQuery;
    DataSetModulo: TDataSetProvider;
    ClientDataSetModulo: TClientDataSet;
    DataSource1: TDataSource;
    FModuloidmodulo: TFDAutoIncField;
    FModulodescricao: TStringField;
    ClientDataSetModuloidmodulo: TAutoIncField;
    ClientDataSetModulodescricao: TStringField;
    ClientDataSet1modulo: TStringField;
    ListView: TListView;
    Label4: TLabel;
    DBEditBeleza1: TDBEditBeleza;
    procedure FormShow(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure SetIcon(Sender : TObject);
    procedure ListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInterface: TFInterface;
  UltSelecionado : String;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TFInterface.SetIcon(Sender : TObject);
begin
  ListView.Items[ClientDataSet1.Fields[4].AsInteger].Selected := True;
end;

procedure TFInterface.acEditarExecute(Sender: TObject);
begin
  inherited;
  SetIcon(self);
end;

procedure TFInterface.Action1Execute(Sender: TObject);
begin
  inherited;
  SetIcon(self);
end;

procedure TFInterface.Action2Execute(Sender: TObject);
begin
  inherited;
  SetIcon(self);
end;

procedure TFInterface.Action3Execute(Sender: TObject);
begin
  inherited;
  SetIcon(self);
end;

procedure TFInterface.Action4Execute(Sender: TObject);
begin
  inherited;
  SetIcon(self);
end;

procedure TFInterface.FormShow(Sender: TObject);
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

procedure TFInterface.ListViewSelectItem(Sender: TObject; Item: TListItem;
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
  RegisterClass(TFInterface);
Finalization
  UnRegisterClass(TFInterface);
end.
