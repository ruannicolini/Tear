unit dataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.DBClient, Datasnap.Provider, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, iniFiles,
  FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL;

type
  TdmPadrao = class(TDataModule)
    FDConnection: TFDConnection;
    FDQuery1: TFDQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet: TClientDataSet;
    FDQuery1idUsuario: TIntegerField;
    FDQuery1login: TStringField;
    FDQuery1senha: TStringField;
    ClientDataSetidUsuario: TIntegerField;
    ClientDataSetlogin: TStringField;
    ClientDataSetsenha: TStringField;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
  private
    { Private declarations }
  public
  end;

var
  dmPadrao: TdmPadrao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFrmLogin, uFuncao;


{$R *.dfm}


end.
