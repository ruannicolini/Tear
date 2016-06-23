unit EditDinheiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TEditDinheiro = class(TEdit)
  private
    fformato: String;
    fvalor: Currency;
    procedure setformato(const Value: String);
    procedure setvalor(const Value: Currency);
    Function RetiraPontos(Valor: String): String;
    procedure Valida;
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor create (COwner: TComponent); override;
    procedure doexit; override;
    procedure KeyPress (var Key: char); override;
    procedure Change; override;
  published
    { Published declarations }
    property Formato: String read fformato write setformato;
    property Valor: Currency read fvalor write setvalor;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Beleza', [TEditDinheiro]);
end;

{ TEditDinheiro }

procedure TEditDinheiro.Change;
begin
  inherited;
end;

constructor TEditDinheiro.create(COwner: TComponent);
begin
  inherited;
  Text:= '0,00';
  Valor:= 0;
  Formato:= '0.00';
end;

procedure TEditDinheiro.doexit;
begin
//  inherited;
// Alterado por Rafael em 26/04/08 
  valida;
  inherited;
end;

procedure TEditDinheiro.KeyPress(var Key: char);
begin
  inherited;

  //Teclas --> 13 ENTER; 8 BACKSPACE; 9 TAB, 127 DELETE

  if key in ['0'..'9', ',', chr(13), chr(8), chr(9), chr(127)] then
  begin
  end
  else abort;

end;

function TEditDinheiro.RetiraPontos(Valor: String): String;
var s: string;
    i: short;
begin

  s:= '';
  for i:= 1 to length(valor) do
    if valor[i] <> '.' then
      s:= s + valor[i];

  result:= s;
end;

procedure TEditDinheiro.setformato(const Value: String);
begin
  fformato := Value;
end;

procedure TEditDinheiro.setvalor(const Value: Currency);
begin
  fvalor := Value;
  text:= formatcurr(formato, value);
end;

procedure TEditDinheiro.Valida;
begin

  if trim(Text) <> '' then
  try
    strtocurr(retirapontos(Text));
    Valor:= strtocurr(retirapontos(Text));
  except
    showmessage('Valor Inválido!');
  end;

end;

end.
