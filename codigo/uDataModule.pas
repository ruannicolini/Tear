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
    procedure calculoMovimentcao(idOrd: integer);
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

procedure TDModule.calculoMovimentcao(idOrd: integer);
var
contRegistros : integer;
qtdOriginal, qtdPrevisto, qtdProduzindo, qtdFinalizado : Integer;
qAux2, qAux3: TFDQuery;
teste :boolean;
begin
  qAux2 := TFDQuery.Create(DModule);
  qAux2.Connection := DModule.FDConnection;
  qAux3 := TFDQuery.Create(DModule);
  qAux3.Connection := DModule.FDConnection;

  //Busca fases da ordem;
  DModule.qAux.Close;
  DModule.qAux.SQL.Text :='SELECT OHF.*,ohf.idOrdem_has_fase as idO_H_S, OP.qtdOriginal AS qORI FROM ordem_has_fase OHF LEFT OUTER JOIN ordem_producao OP ON OHF.idOrdem = OP.idORDEM where OHF.idORDEM =:IDOrd Order by (sequencia)';
  ShowMessage('Id Ordem: ' + inttostr(idOrd));
  DModule.qAux.ParamByName('IDOrd').AsInteger:= idOrd;
  DModule.qAux.Open;
  DModule.qAux.first;

  // Seta valores na primeira fase da ordem;
  qAux2.Close;
  qAux2.SQL.Text := 'UPDATE ordem_has_fase SET qtdOriginal =:qtdO, qtdProduzindo =:qtdO, qtdPrevista = 0, qtdFinalizada = 0 WHERE idOrdem_has_fase =:IDOHS';
  qAux2.ParamByName('qtdO').value:= DModule.qAux.FieldByName('qORI').AsInteger;
  qAux2.ParamByName('IDOHS').value:= DModule.qAux.FieldByName('idO_H_S').AsInteger;
  qAux2.ExecSQL;

  //Atribuição dos valores
  qtdOriginal := DModule.qAux.FieldByName('qORI').AsInteger;
  qtdFinalizado := DModule.qAux.FieldByName('qORI').AsInteger;
  qtdProduzindo := 0;
  qtdPrevisto := 0;

  //Passa em todas as fases da ordem de produção (Ordem_has_fase)
  while not DModule.qAux.eof do
  begin
      //busca movimentações da ordem_has_fase corrente
      qAux2.Close;
      qAux2.SQL.Text := 'select ohf.*, tm.*, m.* from movimentacao m ';
      qAux2.SQL.Add('left outer join ordem_has_fase ohf on ohf.idOrdem_has_fase = m.idOrdem_has_fase ');
      qAux2.SQL.Add('left outer join tipo_movimentacao tm on tm.idTipo_movimentacao = m.idTipoMovimentacao');
      qAux2.SQL.Add('where ohf.idordem =:idOrdem and m.idOrdem_has_fase =:idOHF');
      qAux2.SQL.Add('order by (m.idOrdem_has_fase)');
      qAux2.ParamByName('idOrdem').AsInteger:= (idOrd);
      qAux2.ParamByName('idOHF').AsInteger:= StrToInt(DModule.qAux.FieldByName('idO_H_S').AsString);
      qAux2.Open;
      qAux2.first;

      //Atribuição dos valores
      qtdPrevisto := qtdPrevisto + qtdProduzindo; // é a soma da qtdPrevista + qtdProduzindo da fase anterior;
      qtdProduzindo := qtdFinalizado; //qtdFinalizado da fase anterior

      qtdFinalizado := 0; // Cada Fase calcula sua qtdFinalizado a seguir

      while not qaux2.Eof do
      begin
        if(qAux2.FieldByName('finalizar').AsBoolean = true)then
        begin
          //subtrai movimentacao.qtd de qtdProduzindo
          IF(qtdProduzindo > 0)THEN
          begin
          qtdProduzindo := qtdProduzindo - qAux2.FieldByName('qtd').AsInteger;
          end;
          //Add quantidade finalizada
          qtdFinalizado := qtdFinalizado + qAux2.FieldByName('QTD').AsInteger;

        end;

        //
        if(qAux2.FieldByName('incrementar').AsBoolean = true)then
        begin
          //ShowMessage('incrementar fase ' + qAux2.FieldByName('idOrdem_has_fase').AsString);
          qtdProduzindo := qtdProduzindo + qAux2.FieldByName('qtd').AsInteger;
        end;

        //
        if(qAux2.FieldByName('decrementar').AsBoolean = true)then
        begin
          //ShowMessage('Decrementar fase ' + qAux2.FieldByName('idOrdem_has_fase').AsString);
          qtdProduzindo := qtdProduzindo - qAux2.FieldByName('qtd').AsInteger;
        end;

        //
        if(qAux2.FieldByName('dividirOrdemAvancar').AsBoolean = true)then
        begin
          //ShowMessage('DividirOrdem fase ' + qAux2.FieldByName('idOrdem_has_fase').AsString);

          //Esta sendo tratado ao salvar uma nova movimentcao

        end;

        qaux2.Next;
      end;

      // Repara valores recalculados
      qAux2.Close;
      qAux2.SQL.Text := 'UPDATE ordem_has_fase SET qtdOriginal =:qtdOri, qtdProduzindo =:qtdProd, qtdPrevista =:qtdPrev, qtdFinalizada =:qtdFin WHERE idOrdem_has_fase =:IDOHS';
      qAux2.ParamByName('qtdOri').value:= qtdOriginal;
      qAux2.ParamByName('qtdProd').value:= qtdProduzindo;
      qAux2.ParamByName('qtdPrev').value:= qtdPrevisto;
      qAux2.ParamByName('qtdFin').value:= qtdFinalizado;
      qAux2.ParamByName('IDOHS').value:= DModule.qAux.FieldByName('idO_H_S').AsInteger;
      qAux2.ExecSQL;

      DModule.qAux.next;
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
