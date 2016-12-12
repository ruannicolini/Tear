unit U01015;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.FileCtrl, system.JSON, Data.DB, Vcl.Grids, Vcl.DBGrids, DBGridBeleza,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient, Datasnap.Provider,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons;

type
  TF01015 = class(TForm)
    Panel1: TPanel;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    BitBtn1: TBitBtn;
    DBGridBeleza1: TDBGridBeleza;
    ClientDataSet1: TClientDataSet;
    DS: TDataSource;
    ClientDataSet1idOperacao: TIntegerField;
    ClientDataSet1operacao: TStringField;
    ClientDataSet1idOperador: TIntegerField;
    ClientDataSet1operador: TStringField;
    ClientDataSet1idCronometrista: TIntegerField;
    ClientDataSet1cronometrista: TStringField;
    ClientDataSet1idTipoRecurso: TIntegerField;
    ClientDataSet1tipoRecurso: TStringField;
    ClientDataSet1idTecido: TIntegerField;
    ClientDataSet1tecido: TStringField;
    ClientDataSet1dataCronometragem: TDateField;
    procedure FormShow(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    matriz: array of array of integer; // valor das batidas deTempos
    ParIdProduto : integer;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; pPROD: integer);

  end;

var
  F01015: TF01015;

implementation

{$R *.dfm}

uses UPrincipal, udATAMODULE, IOUtils,DBXJSONReflect, DBXJSON, Generics.Collections, sYSTEM.DateUtils;

procedure TF01015.BitBtn1Click(Sender: TObject);
var
idOperacao, idOperador, idCronometrista, idTecido, idRecurso, I, idNovaCronometragem: Integer;
ritmo, num_pecas, tolerancia, COMPRIMENTO_PECA, num_Ocorrencia :integer;
dataCronometragem : TDate;
QAux2 : TFDQuery;
Hora, Min, Seg, MSeg: Word;
begin
//
  QAux2 := TFDQuery.Create(self);
  QAux2.Connection := DModule.FDConnection;

  if NOT(ClientDataSet1.IsEmpty) then
  BEGIN

     idOperacao := ClientDataSet1idOperacao.AsInteger;
     idOperador := ClientDataSet1idOperador.AsInteger;
     idCronometrista := ClientDataSet1idCronometrista.AsInteger;
     idTecido := ClientDataSet1idTecido.AsInteger;
     idRecurso := ClientDataSet1idTipoRecurso.AsInteger;
     dataCronometragem := ClientDataSet1dataCronometragem.AsDateTime;

     //Valores
     ritmo := 80;
     num_pecas := 1;
     tolerancia := 15;
     COMPRIMENTO_PECA := 0;
     num_Ocorrencia := 1;

     //Verifica se Fase da cronometragem esta habilitada para o produto
     DModule.qAux.Close;
     DModule.qAux.SQL.Text := 'SELECT * FROM produto_has_fase where idProduto =:idProd and idfase = ( select idFase from operacao where idOperacao =:idOp)';
     DModule.qAux.ParamByName('idProd').AsInteger:= (ParIdProduto);
     DModule.qAux.ParamByName('idOp').AsInteger:= (idOperacao);
     DModule.qAux.Open;
     DModule.qAux.first;
     if NOT(DModule.qAux.IsEmpty)then
     begin
         //Verifica se já tem cronometragem dessa operação
         DModule.qAux.Close;
         DModule.qAux.SQL.Text := 'select * from cronometragem where idProduto =:idProd and idOperacao =:idOp';
         DModule.qAux.ParamByName('idProd').AsInteger:= (ParIdProduto);
         DModule.qAux.ParamByName('idOp').AsInteger:= (idOperacao);
         DModule.qAux.Open;
         DModule.qAux.first;
         if(DModule.qAux.IsEmpty)then
         begin
              {ShowMessage('Operação:' + inttostr(idOperacao) +#13+
                      'Operador:' + inttostr(idOperador) +#13+
                      'Cronometrista:' + inttostr(idCronometrista) +#13+
                      'Tecido:' + inttostr(idTecido) +#13+
                      'Recurso:' + inttostr(idRecurso) +#13+
                      'Data:' + DateToStr(dataCronometragem)
              );}

             //ID NOVA CRONOMETRAGEM
             idNovaCronometragem := DModule.buscaProximoParametro('seqCronometragem');

             //INSERI NOVA CRONOMETRAGEM
             DModule.qAux.Close;
             DModule.qAux.SQL.Text := 'INSERT INTO CRONOMETRAGEM(idCronometragem, tempo_original, tempo_ideal,ritmo, num_pecas,tolerancia,comprimento_prod,num_ocorrencia,idProduto,idCronometrista, idTecido, idOperacao,idOperador,dataCronometragem)' +
                'VALUES('+
                inttostr(idNovaCronometragem) +',' +         //IDCRONOMETRIA
                'false,'+                                    //TEMPO ORIGINAL
                'false,'+                                    //TEMPO_IDEAL
                inttostr(ritmo) + ',' +                      //RITMO
                inttostr(num_pecas) + ','+                   //NUM_PEÇAS
                inttostr(tolerancia)+','+                    //TOLERANCIA
                inttostr(COMPRIMENTO_PECA)+','+              //COMPRIMENTO_PEÇA
                inttostr(num_Ocorrencia) +','+               //NUM_OCORRENCIA
                inttostr(ParIdProduto) +',' +                //PRODUTO
                inttostr(idCronometrista) +','+              //CRONOMETRISTA
                inttostr(idTecido) +','+                     //TECIDO
                inttostr(idOperacao)+','+                    //OPERAÇÃO
                inttostr(idOperador)+','+                    //OPERADOR
                DateToStr(dataCronometragem)+')';            //DATA
             DModule.qAux.ExecSQL;

             //Obtenção dos tempos na matriz
             For I := 0 to (Length(matriz[DBGridBeleza1.SelectedIndex]) -1) do
             begin
                //SEPARA MIN, SEG E MSEG
                DecodeTime(( (matriz[DBGridBeleza1.SelectedIndex][I] ) * OneMillisecond), Hora, Min, Seg, MSeg);

                //INSERI BATIDA
                DModule.qAux.Close;
                DModule.qAux.SQL.Text := 'insert into Batida(idbatida, minutos, segundos, milesimos, utilizar, idCronometragem)'+
                'values('+
                INTTOSTR(DModule.buscaProximoParametro('seqBatida')) +','+     //IDBATIDA
                INTTOSTR(MIN) +','+                                            //MINUTOS
                INTTOSTR(SEG) +','+                                            //SEGUNDOS
                INTTOSTR(MSEG) +','+                                           //MILESIMOS
                'TRUE' + ',' +                                                 //UTILIZAR
                INTTOSTR(idNovaCronometragem)+')';                             //IDCRONOMETRAGEM
                DModule.qAux.ExecSQL;
             end;

             //inseri Tipo de Recurso Utilizado
             DModule.qAux.Close;
             DModule.qAux.SQL.Text := 'insert into cronometragem_has_tipo_recurso(idCronometragem, idTipoRecurso)values('+
             INTTOSTR(idNovaCronometragem) +','+     //IDCRONOMETRAGEM
             INTTOSTR(idRecurso) +')';                     //IDTIPORECURSO
             DModule.qAux.ExecSQL;

             //Calcula Tempo Padrao Final
             DModule.CalculaTempoPadraoFinal(idNovaCronometragem,num_pecas,ritmo,tolerancia);

             ShowMessage('CRONOMETRAGEM ADICIONADA COM SUCESSO!');

         end else
          ShowMessage('Cronometragem já existente.');


     end else
     begin
       DModule.qAux.Close;
       DModule.qAux.SQL.Text := 'select op.*, f.descricao as fase from operacao op left outer join fase f on op.idfase = f.idfase where idOperacao =:idOp';
       DModule.qAux.ParamByName('idOp').AsInteger:= (idOperacao);
       DModule.qAux.Open;
       DModule.qAux.first;
       ShowMessage('Fase ('+ DModule.qAux.FieldByName('idFase').AsString + ' - '
       + DModule.qAux.FieldByName('fase').AsString
       +') não esta habilitada para este produto.');
     end;

  END else
    ShowMessage('Selecione uma cronometragem.');
end;

constructor TF01015.Create(AOwner: TComponent; pPROD: integer);
begin
  //
  inherited Create(AOwner);
  ParIdProduto := pPROD;
end;

procedure TF01015.FileListBox1DblClick(Sender: TObject);
var
arqCompleto, jSubObj: TJSONObject;
jp: TJSONPair;  //
jArrayCronometragem, jarrayTempo : TJSONArray;
i,j,r: integer;
begin
    TRY
      //Limpa clientDataset
      ClientDataSet1.Close;
      ClientDataSet1.CreateDataSet;
      ClientDataSet1.Close;
      ClientDataSet1.Open;

      //Lendo arquivo json
      arqCompleto := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(TFile.ReadAllText(FileListBox1.FileName)), 0) as TJSONObject;

      //percorre o arquivo
      for i := 0 to arqCompleto.Size - 1 do
      begin
          //obtém tag i (Exemplo: tag "Dados" do arquivo)
          jp := arqCompleto.Get(i);

          //Pega lista de cronometragens
          jArrayCronometragem := TJSONArray.Create;
          jArrayCronometragem := (jp.JsonValue as TJSONArray);
          jSubObj:= TJSONObject.Create;

          //Tamanho MatrizTemo Vertical
          matriz := nil;
          SetLength(matriz,jArrayCronometragem.Size);

          //Percorre cada cronometragem
          for j := 0 to jArrayCronometragem.Size -1 do
          begin
              jSubObj := (jArrayCronometragem.Get(j) as TJSONObject);
              try
                  ClientDataSet1.insert;

                  //Operacao
                  ClientDataSet1idOperacao.AsInteger := StrToInt((jSubObj.GetValue('operacao').Value));
                  DModule.qAux.Close;
                  DModule.qAux.SQL.Text := 'select descricao from operacao where idOperacao =:idO';
                  DModule.qAux.ParamByName('idO').Value := StrToInt((jSubObj.GetValue('operacao').Value));
                  DModule.qAux.Open;
                  if not(DModule.qAux.IsEmpty)then
                  begin
                      ClientDataSet1Operacao.AsString := DModule.qAux.FieldByName('descricao').AsString;
                  end else
                  begin
                      ClientDataSet1Operacao.AsString := 'Operação Desconhecida';
                  end;

                  //Operador
                  ClientDataSet1idOperador.AsInteger := StrToInt((jSubObj.GetValue('operador').Value));
                  DModule.qAux.Close;
                  DModule.qAux.SQL.Text := 'select nome from operador where idOperador =:idO';
                  DModule.qAux.ParamByName('idO').Value := StrToInt((jSubObj.GetValue('operador').Value));
                  DModule.qAux.Open;
                  if not(DModule.qAux.IsEmpty)then
                  begin
                    ClientDataSet1operador.AsString := DModule.qAux.FieldByName('nome').AsString;
                  end else
                  begin
                    ClientDataSet1operador.AsString := 'Operador Desconhecido';
                  end;

                  //Cronometrista
                  ClientDataSet1idCronometrista.AsInteger := StrToInt((jSubObj.GetValue('cronometrista').Value));
                  DModule.qAux.Close;
                  DModule.qAux.SQL.Text := 'select nome from cronometrista where idCronometrista =:idO';
                  DModule.qAux.ParamByName('idO').Value := StrToInt((jSubObj.GetValue('cronometrista').Value));
                  DModule.qAux.Open;
                  if not(DModule.qAux.IsEmpty)then
                  begin
                      ClientDataSet1cronometrista.AsSTRING:= DModule.qAux.FieldByName('nome').AsString;
                  end else
                  begin
                      ClientDataSet1cronometrista.AsString := 'Cronometrista Desconhecido';
                  end;

                  //Tecido
                  ClientDataSet1idTecido.AsInteger := StrToInt((jSubObj.GetValue('tecido').Value));
                  DModule.qAux.Close;
                  DModule.qAux.SQL.Text := 'select descricao from tecido where idTecido =:idO';
                  DModule.qAux.ParamByName('idO').Value := StrToInt((jSubObj.GetValue('tecido').Value));
                  DModule.qAux.Open;
                  if not(DModule.qAux.IsEmpty)then
                  begin
                    ClientDataSet1tecido.AsString := (DModule.qAux.FieldByName('descricao').AsString);
                  end else
                  begin
                    ClientDataSet1tecido.AsString := 'Tecido Desconhecido';
                  end;

                  //Recurso
                  ClientDataSet1idTipoRecurso.AsInteger := StrToInt((jSubObj.GetValue('recurso').Value));
                  DModule.qAux.Close;
                  DModule.qAux.SQL.Text := 'select descricao from recurso where idRecurso =:idO';
                  DModule.qAux.ParamByName('idO').Value := StrToInt((jSubObj.GetValue('recurso').Value));
                  DModule.qAux.Open;
                  if not(DModule.qAux.IsEmpty)then
                  begin
                      ClientDataSet1tipoRecurso.AsString := (DModule.qAux.FieldByName('descricao').AsString);
                  end else
                  begin
                      ClientDataSet1tipoRecurso.AsString := (DModule.qAux.FieldByName('descricao').AsString);
                  end;

                  //Data
                  ClientDataSet1dataCronometragem.AsDateTime := StrToDate(StringReplace(jSubObj.GetValue('data').Value, '-', '/', [rfReplaceAll, rfIgnoreCase]));

                  {ShowMessage(
                  jSubObj.Get(0).JsonString.Value + ': ' + jSubObj.Get(0).JsonValue.Value + #13 +
                  jSubObj.Get(1).JsonString.Value + ': ' + jSubObj.Get(1).JsonValue.Value + #13 +
                  jSubObj.Get(2).JsonString.Value + ': ' + jSubObj.Get(2).JsonValue.Value + #13 +
                  jSubObj.Get(3).JsonString.Value + ': ' + jSubObj.Get(3).JsonValue.Value + #13 +
                  jSubObj.Get(4).JsonString.Value + ': ' + jSubObj.Get(4).JsonValue.Value + #13 +
                  jSubObj.Get(5).JsonString.Value + ': ' + jSubObj.Get(5).JsonValue.Value + #13 +
                  jSubObj.Get(6).JsonString.Value + ': ' + jSubObj.Get(6).JsonValue.Value + #13
                  );
                   }
                  //Add no clientDataSet / DGBrid
                  ClientDataSet1.Post;

                  //Pega o array "TEMPO"
                  jArrayTempo := TJSONArray.Create;
                  jArrayTempo := (jSubObj.Get(5).JsonValue as TJSONArray);

                  //Tamanho da matriz horizontal
                  SetLength(matriz[j], jArrayTempo.Size);

                  //percorre cada elemento
                  for r := 0 to jArrayTempo.Size -1 do
                  begin
                      matriz[j][r] := strtoint(jArrayTempo.Get(r).Value);
                  end;
              finally
              begin
                  //Finally
              end;
          end;

        end;

      end;
    FINALLY
        arqCompleto.Free;
    END;
end;

procedure TF01015.FormShow(Sender: TObject);
begin
  DirectoryListBox1.Directory := ExtractFilePath(Application.ExeName) + 'APPCronometragens';
end;

Initialization
  RegisterClass(TF01015);
Finalization
  UnRegisterClass(TF01015);
end.
