unit GeraTXT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Datasnap.DBClient;

type
  TArq_opcoes = (ao_Substituir, ao_Adicionar);
  TGeraTXT = class(TComponent)
  private
    farqsaida: String;
    fdataset: TClientDataSet;
    fopcao: TArq_Opcoes;
    fAntes_Gerar_Arquivo: TNotifyEvent;
    fDepois_Gerar_Arquivo: TNotifyEvent;
    fAo_nao_encontrar_Arquivo: TNotifyEvent;
    fColEsp: Boolean;
    fSepar: String;
    procedure setarqsaida(const Value: String);
    procedure setdataset(const Value: TClientDataSet);
    function preenche_espacos(texto: string; tamanho: short): String;
    procedure setopcao(const Value: TArq_Opcoes);
    procedure setColEsp(const Value: Boolean);
    procedure setSepar(const Value: String);
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor create(COwner: TComponent); override;
    procedure Gerar_Arquivo;
  published
    { Published declarations }

    //Propriedades
    property Arquivo_Saida: String read farqsaida write setarqsaida;
    property Dataset: TClientDataSet read fdataset write setdataset;
    property Arquivo_Opcao: TArq_Opcoes read fopcao write setopcao;
    property ColsTamFixo: Boolean read fColEsp write setColEsp;
    property SeparadorCols: String read fSepar write setSepar;

    // EVENTOS
    property Antes_Gerar_Arquivo: TNotifyEvent read fAntes_Gerar_Arquivo write fAntes_Gerar_Arquivo;
    property Depois_Gerar_Arquivo: TNotifyEvent read fDepois_Gerar_Arquivo write fDepois_Gerar_Arquivo;
    property Ao_nao_encontrar_Arquivo: TNotifyEvent read fAo_nao_encontrar_Arquivo write fAo_nao_encontrar_Arquivo;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Beleza', [TGeraTXT]);
end;

{ TGeraTXT }

constructor TGeraTXT.create(COwner: TComponent);
begin
  inherited;

end;

procedure TGeraTXT.Gerar_Arquivo;
var campo: short;
    f: textfile;
    linha: string;
    i : integer;
begin                            showmessage('ok');
  //Procedure que Gera o arquivo com a tab indicada

  //verifica se EVENTO foi assimilado
  if Assigned(fAntes_Gerar_Arquivo) then
    fAntes_Gerar_Arquivo(self);

  //assimila o arq texto
  AssignFile(f, farqsaida);

  //verifica opção
  if fopcao = ao_substituir then
    rewrite(f)
  else if fopcao = ao_adicionar then
  begin

    if FileExists(farqsaida) then
      append(f)
    else
    begin
      //verifica se EVENTO foi assimilado
      if Assigned(fAo_nao_encontrar_Arquivo) then
        fAo_nao_encontrar_Arquivo(self);
    end;

  end;

  //percorre o dataset
  with fdataset do
  begin

    linha := '';
    for i := 0 to FieldCount - 1 do
        linha := linha + ';' +  Fields[i].FieldName;

    writeln(f, linha);
    First;

    while not eof do
    begin
      linha:= '';

      //percorre os campos para gerar a linha
      for campo:= 0 to FieldCount -1 do
        if fields[campo].Visible then
        begin

          if ColsTamFixo then
          begin
           // if fields[campo].AsString ='' then
           //   linha:= linha + preenche_espacos(fields[campo].DefaultExpression, fields[campo].DisplayWidth)
           // else
              linha:= linha + preenche_espacos(fields[campo].AsString, fields[campo].DisplayWidth);
          end //Fim do IF se é col de tam fixo
          else
          begin
            if fields[campo].AsString ='' then
              linha:= linha + SeparadorCols + trim(fields[campo].DefaultExpression)
            else
              linha:= linha + SeparadorCols + trim(fields[campo].AsString);
          end

        end; //Fim do IF se campo está visivel

      //grava a linha no arquivo
      writeln(f, linha);

      next;
    end;

  end;


  //finaliza o arquivo
  CloseFile(f);

  //verifica se EVENTO foi assimilado
  if Assigned(fDepois_Gerar_Arquivo) then
    fDepois_Gerar_Arquivo(self);

end;

function TGeraTXT.preenche_espacos(texto: string; tamanho: short): String;
var i: short;
    s: string;
begin
  //função para preencher com espaços em branco no final
  //da string
  if length(texto) > tamanho then
    s:= copy(texto, 1, tamanho)
  else
  begin
    s:= texto;
    for i:= length(texto) +1 to tamanho do
      s:= s + ' ';
  end;

  result:= s;
end;

procedure TGeraTXT.setarqsaida(const Value: String);
begin
  farqsaida := Value;
end;

procedure TGeraTXT.setColEsp(const Value: Boolean);
begin
  fColEsp := Value;
end;

procedure TGeraTXT.setdataset(const Value: TClientDataSet);
begin
  fdataset := Value;
end;

procedure TGeraTXT.setopcao(const Value: TArq_Opcoes);
begin
  fopcao := Value;
end;

procedure TGeraTXT.setSepar(const Value: String);
begin
  fSepar := Value;
end;

end.
 