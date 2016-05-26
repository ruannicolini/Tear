unit U03003;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Datasnap.DBClient, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, DBGridBeleza,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, DBEditBeleza, Vcl.Mask, Vcl.DBCtrls;

type
  TF03003 = class(TFBase)
    FDQuery1idusuario: TIntegerField;
    FDQuery1nome: TStringField;
    FDQuery1senha: TStringField;
    FDQuery1idtipoUsuario: TIntegerField;
    FDQuery1tipo: TStringField;
    ClientDataSet1idusuario: TIntegerField;
    ClientDataSet1nome: TStringField;
    ClientDataSet1senha: TStringField;
    ClientDataSet1idtipoUsuario: TIntegerField;
    ClientDataSet1tipo: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBEditBeleza1: TDBEditBeleza;
    FDQuery1login: TStringField;
    ClientDataSet1login: TStringField;
    DBEdit3: TDBEdit;
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F03003: TF03003;

implementation

uses
UDataModule;

{$R *.dfm}

procedure TF03003.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idusuario.AsInteger := DModule.buscaProximoParametro('seqUsuario');

end;

Initialization
  RegisterClass(TF03003);
Finalization
  UnRegisterClass(TF03003);
end.
