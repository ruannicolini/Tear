unit U01015;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.FileCtrl, system.JSON;

type
  TF01015 = class(TForm)
    Panel1: TPanel;
    memLista: TMemo;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    ListView1: TListView;
    procedure FormShow(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F01015: TF01015;

implementation

{$R *.dfm}

uses UPrincipal,IOUtils,DBXJSONReflect, DBXJSON, Generics.Collections;

procedure TF01015.FileListBox1DblClick(Sender: TObject);
var
o : TextFile;
arqCompleto, jSubObj: TJSONObject;
jp: TJSONPair;  //
jArrayCronometragem, jarrayTempo : TJSONArray;
i,j,r: integer;
begin
  //Limpa Memo
  memLista.Clear;

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
    //Percorre cada cronometragem
    for j := 0 to jArrayCronometragem.Size -1 do
    begin
      jSubObj := (jArrayCronometragem.Get(j) as TJSONObject);

      ShowMessage(
      jSubObj.Get(0).JsonString.Value + ': ' + jSubObj.Get(0).JsonValue.Value + #13 +
      jSubObj.Get(1).JsonString.Value + ': ' + jSubObj.Get(1).JsonValue.Value + #13 +
      jSubObj.Get(2).JsonString.Value + ': ' + jSubObj.Get(2).JsonValue.Value + #13 +
      jSubObj.Get(3).JsonString.Value + ': ' + jSubObj.Get(3).JsonValue.Value + #13 +
      jSubObj.Get(4).JsonString.Value + ': ' + jSubObj.Get(4).JsonValue.Value + #13 +
      jSubObj.Get(5).JsonString.Value + ': ' + jSubObj.Get(5).JsonValue.Value + #13 +
      jSubObj.Get(6).JsonString.Value + ': ' + jSubObj.Get(6).JsonValue.Value + #13
      );

      //Pega a lista "TEMPO"
      jArrayTempo := TJSONArray.Create;
      jArrayTempo := (jSubObj.Get(5).JsonValue as TJSONArray);
      ShowMessage('quantidade de elementos tempo: ' +   IntToStr(jArrayTempo.Size));
      //percorre cada elemento
      for r := 0 to jArrayTempo.Size -1 do
      begin
        ShowMessage(jArrayTempo.Get(r).Value);
      end;

    end;

  end;

  //
  //showmessage(inttostr(arqCompleto.Count));

  //Teste
  memLista.Clear;
  memLista.Lines.Add(arqCompleto.ToString);
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
