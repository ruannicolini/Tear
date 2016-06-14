unit U01014;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, UPrincipal,
  Vcl.ComCtrls, system.JSON, Vcl.FileCtrl;

type
  TF01014 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    btnFechar: TSpeedButton;
    Memo1: TMemo;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    obj : TJsonObject;
  end;

var
  F01014: TF01014;

implementation

{$R *.dfm}

uses UDataModule;

procedure TF01014.btnFecharClick(Sender: TObject);
begin
close;
end;

procedure TF01014.Button1Click(Sender: TObject);
var
i:integer;
arq : TextFile;
pasta : string;
arqCompleto : TJsonObject;
arrayCronometrista, arrayOperador, arrayOperacao, arrayTecido, arrayTipoRecurso :TJsonarray;
begin
  // cria OBJEto JSON PRincipal
  arqCompleto := TJSONObject.Create;

  try
    //CRONOMETRISTA
    arrayCronometrista := TJSONArray.Create;
    // PESQUISA NA TABELA Cronometrista
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'SELECT * FROM CRONOMETRISTA';
    DModule.qAux.Open;
    DModule.qAux.First;
    //Atribuindo dados ao array
    while NOT DModule.qAux.Eof do
    BEGIN
        //cria o objeto JSON
        obj := TJSONObject.Create;
        obj.AddPair('id',TJSONNumber.Create( DModule.qAux.FieldByName('idCronometrista').AsInteger ));
        obj.AddPair('nome',TJSONString.Create(  DModule.qAux.FieldByName('nome').AsString  ));

        //adiciona o obj ao arrayCronometrista
        arrayCronometrista.Add(obj);
        //Libera espaço de memoria
        obj := nil;
        obj.Free;

        DModule.qAux.Next;
    END;
    arqCompleto.AddPair('cronometrista', arrayCronometrista);


    //OPERADOR
    arrayOperador := TJSONArray.Create;
    // PESQUISA NA TABELA Cronometrista
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'SELECT * FROM OPERADOR';
    DModule.qAux.Open;
    DModule.qAux.First;
    //Atribuindo dados ao array
    while NOT DModule.qAux.Eof do
    BEGIN
        //cria o objeto JSON
        obj := TJSONObject.Create;
        obj.AddPair('id',TJSONNumber.Create( DModule.qAux.FieldByName('idOperador').AsInteger ));
        obj.AddPair('nome',TJSONString.Create(  DModule.qAux.FieldByName('nome').AsString  ));

        //adiciona o obj ao arrayCronometrista
        arrayOperador.Add(obj);
        //Libera espaço de memoria
        obj := nil;
        obj.Free;

        DModule.qAux.Next;
    END;
    arqCompleto.AddPair('operador', arrayOperador);


    //OPERAÇÃO
    arrayOperacao := TJSONArray.Create;
    // PESQUISA NA TABELA Cronometrista
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'SELECT * FROM OPERACAO';
    DModule.qAux.Open;
    DModule.qAux.First;
    //Atribuindo dados ao array
    while NOT DModule.qAux.Eof do
    BEGIN
        //cria o objeto JSON
        obj := TJSONObject.Create;
        obj.AddPair('id',TJSONNumber.Create( DModule.qAux.FieldByName('idOperacao').AsInteger ));
        obj.AddPair('nome',TJSONString.Create(  DModule.qAux.FieldByName('descricao').AsString  ));

        //adiciona o obj ao arrayCronometrista
        arrayOperacao.Add(obj);
        //Libera espaço de memoria
        obj := nil;
        obj.Free;

        DModule.qAux.Next;
    END;
    arqCompleto.AddPair('operacao', arrayOperacao);


    //TECIDO
    arrayTecido := TJSONArray.Create;
    // PESQUISA NA TABELA Cronometrista
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'SELECT * FROM TECIDO';
    DModule.qAux.Open;
    DModule.qAux.First;
    //Atribuindo dados ao array
    while NOT DModule.qAux.Eof do
    BEGIN
        //cria o objeto JSON
        obj := TJSONObject.Create;
        obj.AddPair('id',TJSONNumber.Create( DModule.qAux.FieldByName('idTecido').AsInteger ));
        obj.AddPair('nome',TJSONString.Create(  DModule.qAux.FieldByName('descricao').AsString  ));

        //adiciona o obj ao arrayCronometrista
        arrayTecido.Add(obj);
        //Libera espaço de memoria
        obj := nil;
        obj.Free;

        DModule.qAux.Next;
    END;
    arqCompleto.AddPair('tecido', arrayTecido);


    //TipoRecurso
    arrayTipoRecurso := TJSONArray.Create;
    // PESQUISA NA TABELA Cronometrista
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'SELECT * FROM TIPO_RECURSO';
    DModule.qAux.Open;
    DModule.qAux.First;
    //Atribuindo dados ao array
    while NOT DModule.qAux.Eof do
    BEGIN
        //cria o objeto JSON
        obj := TJSONObject.Create;
        obj.AddPair('id',TJSONNumber.Create( DModule.qAux.FieldByName('idTipo_Recurso').AsInteger ));
        obj.AddPair('nome',TJSONString.Create(  DModule.qAux.FieldByName('descricao').AsString  ));

        //adiciona o obj ao arrayCronometrista
        arrayTipoRecurso.Add(obj);
        //Libera espaço de memoria
        obj := nil;
        obj.Free;

        DModule.qAux.Next;
    END;
    arqCompleto.AddPair('recurso', arrayTipoRecurso);



  finally

    memo1.Clear;
    memo1.Lines.Add(arqCompleto.ToString);
    SelectDirectory('SALVA EM: ','',pasta);
    if (Trim(Pasta) <> '') then
    begin
      Assignfile(arq,pasta+'\dados.json');
      //showmessage(pasta+'\dados.json');
      Rewrite(arq);
      Write( arq,arqCompleto.ToString);
      CloseFile(arq);
      ShowMessage('Arquivo Salvo com Sucesso.');
    end;
    //showmessage(arqCompleto.ToString);
    arqCompleto.FreeInstance;


  end;

end;

procedure TF01014.FormShow(Sender: TObject);
begin
FPrincipal.ArredondarComponente(Button1,20);
end;

Initialization
  RegisterClass(TF01014);
Finalization
  UnRegisterClass(TF01014);
end.
