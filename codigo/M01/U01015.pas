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
    Label1: TLabel;
    Edit1: TEdit;
    ListView1: TListView;
    ListBox1: TListBox;
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
arqCompleto : TJsonObject;
begin
  //Lendo arquivo json
  arqCompleto := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(TFile.ReadAllText(FileListBox1.FileName)), 0) as TJSONObject;

  //path
  showmessage(FileListBox1.FileName);
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
