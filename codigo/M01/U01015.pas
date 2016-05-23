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
    ListView1: TListView;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    matriz: array of array of integer;
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

  if ListView1.Selected <> nil then
  BEGIN
    //Obtenção dos valores na listview
     idOperacao := strtoint(ListView1.Items[ListView1.Selected.Index].Caption);
     idOperador := strtoint(ListView1.Items[ListView1.Selected.Index].SubItems[0]);
     idCronometrista := strtoint(ListView1.Items[ListView1.Selected.Index].SubItems[1]);
     idTecido := strtoint(ListView1.Items[ListView1.Selected.Index].SubItems[2]);
     idRecurso := strtoint(ListView1.Items[ListView1.Selected.Index].SubItems[3]);
     dataCronometragem := StrToDate(ListView1.Items[ListView1.Selected.Index].SubItems[4]);

     //Valores
     ritmo := 80;
     num_pecas := 1;
     tolerancia := 15;
     COMPRIMENTO_PECA := 35;
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
              ShowMessage('Operação:' + inttostr(idOperacao) +#13+
                      'Operador:' + inttostr(idOperador) +#13+
                      'Cronometrista:' + inttostr(idCronometrista) +#13+
                      'Tecido:' + inttostr(idTecido) +#13+
                      'Recurso:' + inttostr(idRecurso) +#13+
                      'Data:' + DateToStr(dataCronometragem)
              );

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
             For I := 0 to (Length(matriz[ListView1.Selected.Index]) -1) do
             begin
                //SEPARA MIN, SEG E MSEG
                DecodeTime(( (matriz[ListView1.Selected.Index][I] ) * OneMillisecond), Hora, Min, Seg, MSeg);

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
LI: TListItem;
arqCompleto, jSubObj: TJSONObject;
jp: TJSONPair;  //
jArrayCronometragem, jarrayTempo : TJSONArray;
i,j,r: integer;
begin
    TRY
      //Propriedade para selecionar a linha toda
      ListView1.RowSelect := true;

      //Limpa ListView
      ListView1.Clear;

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

          //Tamanho Matriz Vertical
          matriz := nil;
          SetLength(matriz,jArrayCronometragem.Size);

          //Percorre cada cronometragem
          for j := 0 to jArrayCronometragem.Size -1 do
          begin
              jSubObj := (jArrayCronometragem.Get(j) as TJSONObject);
              try
                  LI := ListView1.Items.Add;
                  //Operacao
                  li.Caption := ((jSubObj.GetValue('operacao').Value)); //
                  DModule.qAux.Close;
                  DModule.qAux.SQL.Text := 'select descricao from operacao where idOperacao =:idO';
                  DModule.qAux.ParamByName('idO').Value := StrToInt((jSubObj.GetValue('operacao').Value));
                  DModule.qAux.Open;
                  if not(DModule.qAux.IsEmpty)then
                  begin
                    LI.SubItems.Add(DModule.qAux.FieldByName('descricao').AsString);
                  end else
                    LI.SubItems.Add('Operação Desconhecida');

                  //Operador
                  //LI.SubItems.Add((jSubObj.GetValue('operador').Value));
                  DModule.qAux.Close;
                  DModule.qAux.SQL.Text := 'select nome from operador where idOperador =:idO';
                  DModule.qAux.ParamByName('idO').Value := StrToInt((jSubObj.GetValue('operador').Value));
                  DModule.qAux.Open;
                  if not(DModule.qAux.IsEmpty)then
                  begin
                    LI.SubItems.Add(DModule.qAux.FieldByName('nome').AsString);
                  end else
                    LI.SubItems.Add('Operador Desconhecido');

                  //Cronometrista
                  //LI.SubItems.Add((jSubObj.GetValue('cronometrista').Value));
                  DModule.qAux.Close;
                  DModule.qAux.SQL.Text := 'select nome from cronometrista where idCronometrista =:idO';
                  DModule.qAux.ParamByName('idO').Value := StrToInt((jSubObj.GetValue('cronometrista').Value));
                  DModule.qAux.Open;
                  if not(DModule.qAux.IsEmpty)then
                  begin
                    LI.SubItems.Add(DModule.qAux.FieldByName('nome').AsString);
                  end else
                    LI.SubItems.Add('Cronometrista Desconhecido');

                  //Tecido
                  //LI.SubItems.Add(jSubObj.GetValue('tecido').Value);
                  DModule.qAux.Close;
                  DModule.qAux.SQL.Text := 'select descricao from tecido where idTecido =:idO';
                  DModule.qAux.ParamByName('idO').Value := StrToInt((jSubObj.GetValue('tecido').Value));
                  DModule.qAux.Open;
                  if not(DModule.qAux.IsEmpty)then
                  begin
                    LI.SubItems.Add(DModule.qAux.FieldByName('descricao').AsString);
                  end else
                    LI.SubItems.Add('Tecido Desconhecido');

                  //Recurso
                  //LI.SubItems.Add((jSubObj.GetValue('recurso').Value));
                  DModule.qAux.Close;
                  DModule.qAux.SQL.Text := 'select descricao from recurso where idRecurso =:idO';
                  DModule.qAux.ParamByName('idO').Value := StrToInt((jSubObj.GetValue('recurso').Value));
                  DModule.qAux.Open;
                  if not(DModule.qAux.IsEmpty)then
                  begin
                    LI.SubItems.Add(DModule.qAux.FieldByName('descricao').AsString);
                  end else
                    LI.SubItems.Add('Recurso Desconhecido');

                  //Data
                  LI.SubItems.Add((jSubObj.GetValue('data').Value));;

                  {ShowMessage(
                  jSubObj.Get(0).JsonString.Value + ': ' + jSubObj.Get(0).JsonValue.Value + #13 +
                  jSubObj.Get(1).JsonString.Value + ': ' + jSubObj.Get(1).JsonValue.Value + #13 +
                  jSubObj.Get(2).JsonString.Value + ': ' + jSubObj.Get(2).JsonValue.Value + #13 +
                  jSubObj.Get(3).JsonString.Value + ': ' + jSubObj.Get(3).JsonValue.Value + #13 +
                  jSubObj.Get(4).JsonString.Value + ': ' + jSubObj.Get(4).JsonValue.Value + #13 +
                  jSubObj.Get(5).JsonString.Value + ': ' + jSubObj.Get(5).JsonValue.Value + #13 +
                  jSubObj.Get(6).JsonString.Value + ': ' + jSubObj.Get(6).JsonValue.Value + #13
                  );}


                  //Pega o array "TEMPO"
                  jArrayTempo := TJSONArray.Create;
                  jArrayTempo := (jSubObj.Get(5).JsonValue as TJSONArray);

                  //Tamanho da matriz horizontal
                  SetLength(matriz[j], jArrayTempo.Size);

                  //percorre cada elemento
                  for r := 0 to jArrayTempo.Size -1 do
                  begin
                      //ShowMessage(jArrayTempo.Get(r).Value);
                      matriz[j][r] := strtoint(jArrayTempo.Get(r).Value);
                  end;

              finally
              begin
                //desaloca memoria
                li := nil;
                li.Free;
              end;
          end;

        end;

      end;
    FINALLY
      arqCompleto.Free;
      //ShowMessage('OK');

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
