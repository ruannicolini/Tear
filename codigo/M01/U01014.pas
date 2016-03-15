unit U01014;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, UPrincipal,
  Vcl.ComCtrls, system.JSON;

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


procedure TF01014.btnFecharClick(Sender: TObject);
begin
close;
end;

procedure TF01014.Button1Click(Sender: TObject);
var
i:integer;
arqCompleto : TJsonObject;
arrayCronometrista :TJsonarray;
begin
  //
  arqCompleto := TJSONObject.Create;
  try
    //Array Cronometrista
    arrayCronometrista := TJSONArray.Create;

    //Atribuindo dados ao array
    for i := 0 to 2 do
    begin
        //cria o objeto JSON
        obj := TJSONObject.Create;
        obj.AddPair('id',TJSONNumber.Create(i));
        obj.AddPair('nome',TJSONString.Create(  'Teste ' + inttostr(i)  ));

        //adiciona o obj ao arrayCronometrista
        arrayCronometrista.Add(obj);
        //Libera espaço de memoria
        obj := nil;
        obj.Free;

    end;
      arqCompleto.AddPair('cronometrista', arrayCronometrista);
  finally
    ShowMessage('Calma');
    memo1.Clear;
    memo1.Lines.Add(arqCompleto.ToString);
    arqCompleto.FreeInstance;
  end;

  ShowMessage('ok');

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
