unit uTelaBuscaCEP;

interface

uses
  Forms, idHTTP, Mask, StdCtrls, Dialogs, Classes, Windows, SysUtils,
  uMsg, Graphics, ExtCtrls;

Type

  tBuscaCEP = class
  private
    fTela: tForm;
    ConexaoWebServic : TIdHTTP;
    edCEP : tMaskEdit;
    lbCEP : tLabel;
    fPesqEfetuadaSucesso: Boolean;
    btPesquisar : tButton;
    FProxyServer: String;
    FPortaProxy: Integer;
    FEnderecoProxy: String;
    FUsuarioProxy: String;
    FSenhaProxy: String;
    fCidadeEncontrada: String;
    fUFEncontrada: String;
    fBairroEncontrado: String;
    FEnderecoEncontrado: String;
    fCEPEncontrado: String;
    fCodMunicipioEncontrado: Integer;
    procedure ConstruirTela;
    procedure ConstruirWebService;
    procedure ConstruirEditCEP(CEP: String);
    procedure ConstruirBotaoPesquisa;
    procedure edCEPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OnClickbtPesquisar(Sender: TObject);
    procedure SetProxyServer(const Value: String);
    procedure SetPortaProxy(const Value: Integer);
    procedure SetEnderecoProxy(const Value: String);
    procedure SetSenhaProxy(const Value: String);
    procedure SetUsuarioProxy(const Value: String);
    procedure SetEnderecoEncontrado(const Value: String);
  public
    constructor Create;
    destructor Destroy;
    function BuscarCEP(CEP: String): Boolean;
  published
    property EnderecoProxy: String read FEnderecoProxy write SetEnderecoProxy;
    property UsuarioProxy: String read FUsuarioProxy write SetUsuarioProxy;
    property SenhaProxy: String read FSenhaProxy write SetSenhaProxy;
    property PortaProxy: Integer read FPortaProxy write SetPortaProxy;

    property CEPEncontrado: String read fCEPEncontrado;
    property CidadeEncontrada: String read fCidadeEncontrada;
    property BairroEncontrado: String read fBairroEncontrado;
    property UFEncontrada: String read fUFEncontrada;
    property EnderecoEncontrado: String read FEnderecoEncontrado write SetEnderecoEncontrado;
    property CodMunicipioEncontrado: Integer read fCodMunicipioEncontrado;
  end;


implementation

{ tBuscaCEP }

function tBuscaCEP.BuscarCEP(CEP: String): Boolean;
begin
    {
        Função principal (a que o Usuario deve chamar)
        pra abrir a tela de pesquisa do CEP

        Retornar TRUE se o CEP foi buscado com sucesso
    }

    Result := False;

    ConstruirTela;
    ConstruirWebService;
    ConstruirEditCEP(CEP);
    ConstruirBotaoPesquisa;

    fTela.ShowModal;

    Result := fPesqEfetuadaSucesso;

end;

procedure tBuscaCEP.ConstruirBotaoPesquisa;
begin
    {
      Criar o Botao para Efetuar a Pesquisa
    }

    btPesquisar         := TButton.Create(fTela);
    btPesquisar.Parent  := fTela;
    btPesquisar.Left    := edCEP.Left + edCEP.Width + 5;
    btPesquisar.Top     := edCEP.Top;
    btPesquisar.Height  := edCEP.Height;
    btPesquisar.Width   := 55;
    btPesquisar.Caption := 'Pesquisar';
    btPesquisar.OnClick := OnClickbtPesquisar;

end;

procedure tBuscaCEP.ConstruirEditCEP;
begin
    {
      Criar o MaskEdit de Digitação do CEP
    }

    lbCEP           := TLabel.Create(fTela);
    lbCEP.Caption   := 'Informe o CEP';
    lbCEP.Parent    := fTela;
    lbCEP.Left      := 20;
    lbCEP.Top       := 40;

    edCEP           := TMaskEdit.Create(fTela);
    edCEP.Parent    := fTela;
    edCEP.EditMask  := '#####-###;0';
    edCEP.Top       := lbCEP.Top + 14;
    edCEP.Left      := lbCEP.Left;
    edCEP.OnKeyDown := edCEPKeyDown;
    edCEP.Text      := CEP;

end;

procedure tBuscaCEP.ConstruirTela;
var Sh : tShape;
    LbTitulo : tLabel;
begin

    {
      Criar a Tela p/ Informar o CEP
    }

    fTela             := TForm.Create(Nil);
    fTela.Width       := 280;
    fTela.Height      := 100;
    fTela.Font.Name   := 'tahoma';
    fTela.Color       := clWhite;
    fTela.BorderStyle := bsNone; //bsToolWindow;
    fTela.Position    := poScreenCenter;
    fTela.Caption     := 'Buscar Informações do CEP na Internet';
    fTela.OnKeyDown   := TelaKeyDown;
    fTela.KeyPreview  := True;

    // Criar o Shape para dar um pequeno efeito no form
    Sh                := TShape.Create(fTela);
    Sh.Parent         := fTela;
    Sh.Width          := fTela.Width - 1;
    Sh.Height         := fTela.Height - 1;
    Sh.Brush.Style    := bsClear;
    Sh.Pen.Color      := clSilver;

    // Label Titulo da Tela
    LbTitulo           := tLabel.Create(fTela);
    LbTitulo.Parent    := fTela;
    LbTitulo.Caption   := 'Pesquisa de CEP na Internet';
    LbTitulo.Font.Name := 'Trebuchet MS';
    LbTitulo.Font.Size := 10;
    LbTitulo.Left      := 15;
    LbTitulo.Top       := 10;
    LbTitulo.Font.Color := clGrayText;

end;

procedure tBuscaCEP.ConstruirWebService;
begin
    ConexaoWebServic := TIdHTTP.Create(fTela);
end;

Constructor tBuscaCEP.Create;
begin

end;

destructor tBuscaCEP.Destroy;
begin
    fTela.Free;
    fTela := Nil;
end;

procedure tBuscaCEP.edCEPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    {
        Qdo pressionar ENTER no Edit, efetuar a Pesquisa
    }

    if Key = vk_Return then
        OnClickbtPesquisar(btPesquisar);

end;

procedure tBuscaCEP.OnClickbtPesquisar(Sender: TObject);
var
  RespBruta, Resp : TStringList;
  tpLogr, Res : String;
  i      : Integer;
begin

  if Length(StringReplace(edCEP.Text, '-', '', [])) < 8 then
  begin
      ShowMessage('O CEP informado está com tamanho Inválido. Corrija!');
      fPesqEfetuadaSucesso := False;
      if edCEP.CanFocus then edCEP.SetFocus;
      edCEP.SelectAll;
      Exit;
  end;

  if Length(EnderecoProxy) > 0 then
  begin
      ConexaoWebServic.ProxyParams.ProxyServer := EnderecoProxy;
      ConexaoWebServic.ProxyParams.ProxyPort   := PortaProxy;
      if Length(UsuarioProxy) > 0 then
      begin
          ConexaoWebServic.ProxyParams.ProxyUsername := UsuarioProxy;
          ConexaoWebServic.ProxyParams.ProxyPassword := SenhaProxy;
      end;
  end;

  tJanelaMensagem.Create.Mensagem('Efetuando Pesquisa...');

  // Efetuar a pesquisa pelo WebService
  RespBruta      := TStringList.Create;

  Try
      RespBruta.Text := ConexaoWebServic.Get('http://www.buscarcep.com.br/?cep='
          + StringReplace(edCEP.Text, '-', '', [rfReplaceAll])
          + '&formato=string');
  Except
      ShowMessage('Não foi possível conectar ao WebService de pesquisa de CEPs');
      raise;
      fPesqEfetuadaSucesso := False;
      if edCEP.CanFocus then edCEP.SetFocus;
      edCEP.SelectAll;
      Exit;
  end;

  // Fazer o Tratamento da Informação recebida, quebrando em linha
  Resp      := TStringList.Create;
  Resp.Text := StringReplace(RespBruta.Text, '&', #13#10, [rfReplaceAll]);

  tJanelaMensagem.Create.Mensagem('Pesquisa Concluida!');

  // Verificar se não encontrou o CEP (atraves da opcao Resultado= )
  for i := 0 to Resp.Count - 1 do
      if Copy(Resp[i], 1, 10) = 'resultado=' then
          Res := Copy(Resp[i], 11, Length(Resp[i]));

  fPesqEfetuadaSucesso := False;
  if Res = '-1' then
  begin
      ShowMessage('Não foi encontrado o CEP digitado!');
      if edCEP.CanFocus then edCEP.SetFocus;
      edCEP.SelectAll;
  end
  else if Res = '-3' then
  begin
      ShowMessage('Excedeu o limite de pesquisa de CEPs (5 por minuto). Tente novamente daqui a alguns instantes!');
      if edCEP.CanFocus then edCEP.SetFocus;
      edCEP.SelectAll;
  end
  else
  begin
      // Enviar as Informacoes às propriedades
      // Rodando o StringList retornado e captando as Opções

      for i := 0 to Resp.Count - 1 do
      begin
          if Copy(Resp[i], 1, 4) = 'cep=' then
              fCEPEncontrado          := Copy(Resp[i], 5, Length(Resp[i]))
          else if Copy(Resp[i], 1, 3) = 'uf=' then
              fUFEncontrada           := Copy(Resp[i], 4, Length(Resp[i]))
          else if Copy(Resp[i], 1, 7) = 'cidade=' then
              fCidadeEncontrada       := Copy(Resp[i], 8, Length(Resp[i]))
          else if Copy(Resp[i], 1, 7) = 'bairro=' then
              fBairroEncontrado       := Copy(Resp[i], 8, Length(Resp[i]))
          else if Copy(Resp[i], 1, 16) = 'tipo_logradouro=' then
          begin
              tpLogr                  := Copy(Resp[i], 17, Length(Resp[i]));

              if tpLogr = 'Avenida' then tpLogr := 'Av.'
              else if tpLogr = 'Rua' then tpLogr := 'R.'
          end
          else if Copy(Resp[i], 1, 11) = 'logradouro=' then
              FEnderecoEncontrado     := StringReplace(tpLogr + ' ' + Copy(Resp[i], 12, Length(Resp[i])), '''', ' ', [rfReplaceAll])
          else if Copy(Resp[i], 1, 27) = 'ibge_municipio_verificador=' then
              fCodMunicipioEncontrado := StrToInt(Copy(Resp[i], 28, Length(Resp[i])));
      end;

      {fCEPEncontrado       := Copy(Resp.Strings[1], 5, Length(Resp.Strings[1]));
      fCidadeEncontrada    := Copy(Resp.Strings[3], 8, Length(Resp.Strings[3]));
      fUFEncontrada        := Copy(Resp.Strings[2], 4, Length(Resp.Strings[2]));

      tpLogr               := Copy(Resp.Strings[5], 17, Length(Resp.Strings[5]));

      if tpLogr = 'Avenida' then
          tpLogr           := 'Av.'
      else if tpLogr = 'Rua' then
          tpLogr           := 'R.';

      // Atenção: Substituir o "'" por espaço (tem endereços com este caracter)
      // Só retornar o endereço se o CEP ñ tiver o final '000'
      if Copy(StringReplace(edCEP.Text, '-', '', [rfReplaceAll]), 6, 3) <> '000' then
      begin
          fBairroEncontrado    := Copy(Resp.Strings[4], 8, Length(Resp.Strings[4]));
          FEnderecoEncontrado  := StringReplace(tpLogr + ' ' + Copy(Resp.Strings[6], 12, Length(Resp.Strings[6])), '''', ' ', [rfReplaceAll])
      end
      else
      begin
          fBairroEncontrado    := '';
          FEnderecoEncontrado  := '';
      end;

      if Resp.Count > 10 then
          fCodMunicipioEncontrado := StrToInt(Copy(Resp.Strings[12], 28, Length(Resp.Strings[12])))
      else
          fCodMunicipioEncontrado := 0;
      }

      fPesqEfetuadaSucesso    := True;

      Resp.Free;
      RespBruta.Free;
      fTela.Close;
      Exit;
  end;

{Exemplo de Texto Retornado

      cep=29704600
      uf=ES
      cidade=Colatina
      bairro=Honorio Fraga
      tipo_logradouro=Rua
      logradouro=Tupinambás
      resultado=1
      resultado_txt=sucesso. cep encontrado local
      limite_buscas=5
      ibge_uf=32
      ibge_municipio=320150
      ibge_municipio_verificador=3201506
}

  Resp.Free;
  RespBruta.Free;

end;

procedure tBuscaCEP.SetEnderecoEncontrado(const Value: String);
begin
  FEnderecoEncontrado := Value;
end;

procedure tBuscaCEP.SetEnderecoProxy(const Value: String);
begin
  FEnderecoProxy := Value;
end;

procedure tBuscaCEP.SetPortaProxy(const Value: Integer);
begin
  FPortaProxy := Value;
end;

procedure tBuscaCEP.SetProxyServer(const Value: String);
begin
  FProxyServer := Value;
end;

procedure tBuscaCEP.SetSenhaProxy(const Value: String);
begin
  FSenhaProxy := Value;
end;

procedure tBuscaCEP.SetUsuarioProxy(const Value: String);
begin
  FUsuarioProxy := Value;
end;

procedure tBuscaCEP.TelaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    // Pressionar ESC fechar a tela
    if Key = vk_Escape then
        fTela.Close;
end;

end.
