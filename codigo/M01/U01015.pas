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
jArray : TJSONArray;
i,j, r: integer;

begin
  //Lendo arquivo json
  arqCompleto := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(TFile.ReadAllText(FileListBox1.FileName)), 0) as TJSONObject;

  //percorre o arquivo
  for i := 0 to arqCompleto.Size - 1 do
  begin
    //obtém tag i
    jp := arqCompleto.Get(i);

    //Pega a lista "DADOS"
    jArray := TJSONArray.Create;
    jArray := (jp.JsonValue as TJSONArray); // do par zero pega o valor, que é array
    ShowMessage('quantidade de elementos ' +   IntToStr(jArray.Size));

    jSubObj:= TJSONObject.Create;
    for j := 0 to jArray.Size -1 do //itera o array para pegar cada elemento
    begin
      jSubObj := (jArray.Get(j) as TJSONObject);

      ShowMessage(
      jSubObj.Get(0).JsonString.Value + ': ' + jSubObj.Get(0).JsonValue.Value + #13 +
      jSubObj.Get(1).JsonString.Value + ': ' + jSubObj.Get(1).JsonValue.Value + #13 +
      jSubObj.Get(2).JsonString.Value + ': ' + jSubObj.Get(2).JsonValue.Value + #13 +
      jSubObj.Get(3).JsonString.Value + ': ' + jSubObj.Get(3).JsonValue.Value + #13 +
      jSubObj.Get(4).JsonString.Value + ': ' + jSubObj.Get(4).JsonValue.Value + #13 +
      jSubObj.Get(5).JsonString.Value + ': ' + jSubObj.Get(5).JsonValue.Value + #13 +
      jSubObj.Get(6).JsonString.Value + ': ' + jSubObj.Get(6).JsonValue.Value + #13
      );

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
