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
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    FDQuery2: TFDQuery;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    DataSource1: TDataSource;
    FDQuery2idmodulo: TFDAutoIncField;
    FDQuery2descricao: TStringField;
    ClientDataSet2idmodulo: TAutoIncField;
    ClientDataSet2descricao: TStringField;
    ClientDataSet1Modulo: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInterface: TFInterface;

implementation

{$R *.dfm}

Initialization
  RegisterClass(TFInterface);
Finalization
  UnRegisterClass(TFInterface);
end.
