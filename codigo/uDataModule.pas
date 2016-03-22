unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, Dialogs;

type
  TDModule = class(TDataModule)
    qAux: TFDQuery;
    FModulo: TFDQuery;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDConnection: TFDConnection;
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure qAuxBeforeExecute(DataSet: TFDDataSet);
  private
    { Private declarations }
  public
    function buscaProximoParametro(p: string): integer;
    procedure CalculaTempoPadraoFinal(idCronometragem :integer; num_pecas:integer; ritmo: integer; tolerancia:integer);
  end;

var
  DModule: TDModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses MidasLib, IniFiles;


function TDModule.buscaProximoParametro(p: string): integer;
var
  i : integer;
begin

  qAux.SQL.Text := 'select valor from parametros where parametro =:p';
  qAux.ParamByName('p').AsString:= p;
  qAux.Open;

  if not qAux.IsEmpty then
  begin
    i := StrToInt(qAux.Fields[0].AsString);
    qAux.SQL.Text := 'update parametros set valor =:v where parametro =:p';
    qAux.ParamByName('p').AsString := p;
    qAux.ParamByName('v').AsString := IntToStr(i+1);
    qAux.ExecSQL;
    buscaProximoParametro := i;
  end
  else

  ShowMessage('Parametro Inválido.');

end;

procedure TDModule.CalculaTempoPadraoFinal(idCronometragem, num_pecas, ritmo,
  tolerancia: integer);
var
i, hor, min, seg, mil, soma : integer;
tempoMedio, tempoPadrao, tempoPadraoFinal: double;
fTPF: Ttime;
begin
  //Obtenção dos dados
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'select * from batida where idCronometragem =:idCro';
    DModule.qAux.ParamByName('idCro').AsInteger:= idCronometragem;
    DModule.qAux.Open;
    DModule.qAux.first;

    //Contagem dos valores
    i := 0; min := 0; seg := 0; mil := 0; soma := 0;

    while not DModule.qAux.eof do
    begin
      min := min + DModule.qAux.FieldByName('minutos').AsInteger;
      seg := seg + StrToInt(DModule.qAux.FieldByName('segundos').AsString);
      mil := mil + StrToInt(DModule.qAux.FieldByName('milesimos').AsString);
      i := i +1;
      DModule.qAux.next;
    end;
    soma := (min* 60000) + seg * 1000 + mil;

    if((i > 0) and ( num_pecas > 0))then
    begin
      //TempoMedio = (SomatórioTempo/NumeroBatidas)/NumerodePeças
        tempoMedio := (soma/i)/num_pecas;

      //TempoPadrao = TempoMedio * (1+(1-(ritmo/100)))
        tempoPadrao := tempoMedio * (ritmo/100);

      //TempoPadraoFinal = TempoPadrao * (Tolerancia/100)
        tempoPadraoFinal := tempoPadrao * (1+(tolerancia/100));

        //sql alteração
        DModule.qAux.Close;
        DModule.qAux.SQL.Text := 'UPDATE cronometragem SET tempoPadraoFinal =:tpf where idCronometragem =:idCro';
        DModule.qAux.ParamByName('idCro').AsInteger:= idCronometragem;
        DModule.qAux.ParamByName('tpf').AsFloat:= tempoPadraoFinal;
        DModule.qAux.ExecSQL;
    end;

end;

procedure TDModule.FDConnectionBeforeConnect(Sender: TObject);
begin
  FDConnection.Params.DriverID := 'MYSQL';
  FDConnection.DriverName := 'MYSQL';
  FDPhysMySQLDriverLink1.DriverID := 'MYSQL';
end;

procedure TDModule.qAuxBeforeExecute(DataSet: TFDDataSet);
var
ConfigIni: TIniFile;
begin
//ConfigIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
//FModulo.ConnectionName := configIni.ReadString('CONFIG', 'DATABASE', '');

end;

End.
