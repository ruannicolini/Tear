unit MontaSQL;

interface

uses
  forms, Windows, stdctrls, Messages, uFiltroDatas,
  SysUtils, Classes, Graphics, Controls, Dialogs, EditBeleza, ADODB, uFiltroFaixaValores, FireDAC.Comp.Client;

type

  tSomarFiltro = procedure (ComponenteAtual: tObject; Filtro, Valor1, Valor2: String) of object;

  TMontaSQL = class(TComponent)
  private
    fSomarFiltro: tSomarFiltro;
    SQL_Final: TStrings;
    SqlParcialtFaixaValores : String;  //Sql que Guarda o Sql_Botao_Pesquisa do tFaixaValores depois de Tratado
    fQuery: TFDQuery;
    fFiltrosGerados: tStrings;
    fFGLL: Boolean;
    fADOQuery: TADOQuery;
    procedure PegaValorEditBeleza(idComponente: Short);
    procedure AddFiltroGeradoDatas(idComponente: Short);

    // Procedure para o Componente FaixaValores
    procedure AddFiltroGeradoFaixaValores(idComponente: Short);
    procedure AddSqlFaixaValores(idComponente: Short);

    procedure setQuery(const Value: TFDQuery);
    procedure PegarNomeParametro(Componente : tComponent);
    Function AcertaParam(Sql, TextoEdit : String): String;
    procedure setFiltrosGerados(const Value: tStrings);
    procedure setFGLL(const Value: Boolean);
    procedure setADOQuery(const Value: TADOQuery);
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor create(COwner: TComponent); override;
    procedure Gerar_SQL;
  published
    { Published declarations }

    // Propriedades
    Property Query: TFDQuery read fQuery write setQuery;
    Property QueryADO: TADOQuery read fADOQuery write setADOQuery;
    Property FiltrosGerados: tStrings read fFiltrosGerados write setFiltrosGerados; // Guarda os Filtros Utilizados (para impressao em Relatorios)
    Property MostrarFiltrosGeradosLinhaLinha: Boolean read fFGLL write setFGLL;

    // Eventos
    Property AoSomarFiltro: tSomarFiltro read fSomarFiltro write fSomarFiltro;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Beleza', [TMontaSQL]);
end;

{ TMontaSQL }

function TMontaSQL.AcertaParam(Sql, TextoEdit: String): String;
var i  : Short;
    ok : Boolean;
    Parametro, S : String;
begin

    // Esta Funcao pega o Comando Sql e altera o parametro
    // para o texto e acrescentar tb os parenteses

    ok        := False;
    Result    := '';
    Parametro := '';

    for i := 1 to Length(Sql) do
    begin
        Result := Result + Copy(Sql, i, 1);
        if Copy(Sql, i, 1) = ':' then
            Ok := True
        else if (Ok) and (Copy(Sql, i, 1) <> ' ') then
            Parametro := Parametro + Copy(sql, i, 1)
        else if (Ok) and (Copy(Sql, i, 1) = ' ') then
        begin
            Result := Result + ')';
            Ok     := False;
        end;
    end;

    S      := Result;
    S      := StringReplace(s, 'like', 'in (', [rfIgnoreCase]);
    if Copy(TextoEdit, 1, 1) <> '"' then TextoEdit := '"' + TextoEdit;
    if Copy(TextoEdit, length(TextoEdit), 1) <> '"' then TextoEdit := TextoEdit + '"';
    Result := StringReplace(S, ':' + Parametro, TextoEdit, [rfIgnoreCase]);

end;

procedure TMontaSQL.AddFiltroGeradoDatas(idComponente: Short);
var LinhaFiltro : String;
begin

    LinhaFiltro := tFiltroDatas(Owner.Components[idComponente]).CaptionCheck
        + ' entre '
        + FormatDateTime('dd/mm/yy', tFiltroDatas(Owner.components[idComponente]).Data1)
        + ' e '
        + FormatDateTime('dd/mm/yy', tFiltroDatas(Owner.components[idComponente]).Data2);


    if MostrarFiltrosGeradosLinhaLinha then
        FiltrosGerados.Add(LinhaFiltro)
    else
        FiltrosGerados.Text := FiltrosGerados.Text
            + LinhaFiltro + '; ';

end;

procedure TMontaSQL.AddFiltroGeradoFaixaValores(idComponente: Short);
var LinhaFiltro : String;
begin

    LinhaFiltro := tFiltroFaixaValores(Owner.Components[idComponente]).CaptionCheck
        + ' entre '
        + FormatFloat(tFiltroFaixaValores(Owner.components[idComponente]).FormatoValor, tFiltroFaixaValores(Owner.components[idComponente]).Valor1)
        + ' e '
        + FormatFloat(tFiltroFaixaValores(Owner.components[idComponente]).FormatoValor, tFiltroFaixaValores(Owner.components[idComponente]).Valor2);

    if MostrarFiltrosGeradosLinhaLinha then
        FiltrosGerados.Add(LinhaFiltro)
    else
        FiltrosGerados.Text := FiltrosGerados.Text
            + LinhaFiltro + '; ';
end;

procedure TMontaSQL.AddSqlFaixaValores(idComponente: Short);
var s : String;
    i : Short;
    AcabouPrimParam, PegandoParam : Boolean;
begin

  {
      Procedure para Adicionar SQL conforme opcao Selecionada
      caso for "entre", manter o Sql Atual
      para as outras opcoes, deve remover o 2º parametro
  }

  // Inicializar a Variavel com o Valor da opcao "Entre"
  SqlParcialtFaixaValores := tFiltroFaixaValores(Owner.components[idComponente]).Sql_botao_Pesquisa;  // Entre

  if tFiltroFaixaValores(Owner.components[idComponente]).OpcaoSelecionada <> opEntre then
  begin
      // Pegar Somente 1º Parametro
      // Ex.: trocar o "and valor between :v1 and :v2" por "and valor > :v1"
      // Aqui percorro aí o final do 1º parametro, armazenado, e depois limpo a String
      // até o proximo ")" ou final dela

      AcabouPrimParam := False;
      PegandoParam    := False;
      s               := '';
      for i := 1 to Length(SqlParcialtFaixaValores) do
      begin
          if SqlParcialtFaixaValores[i] = ':' then
          begin
              s            := s + ':';
              PegandoParam := True;
          end
          else if (PegandoParam) and ((SqlParcialtFaixaValores[i] = ')') or (SqlParcialtFaixaValores[i] = ' ')) then
          begin
              AcabouPrimParam := True;
              Break;
          end
          else if AcabouPrimParam then
          begin
          end
          else
              s := s + SqlParcialtFaixaValores[i];
      end;

      case tFiltroFaixaValores(Owner.components[idComponente]).OpcaoSelecionada of
      opIgual     : SqlParcialtFaixaValores := StringReplace(s, 'between', '=', []);
      opMaior     : SqlParcialtFaixaValores := StringReplace(s, 'between', '>', []);
      opMenor     : SqlParcialtFaixaValores := StringReplace(s, 'between', '<', []);
      opDiferente : SqlParcialtFaixaValores := StringReplace(s, 'between', '<>', []);
      end;
  end;


  Sql_Final.Add(SqlParcialtFaixaValores);

end;

constructor TMontaSQL.create(COwner: TComponent);
begin
  inherited;

  sql_final                       := tStringList.Create;
  FiltrosGerados                  := tStringList.Create;
  MostrarFiltrosGeradosLinhaLinha := True;

end;

procedure TMontaSQL.Gerar_SQL;
var i : Short;
begin

  {
      Procedure para Percorrer os Componentes do tipo tEditBeleza, tFaixaValores e tFiltroDatas
      pegando o comando na propriedade SQL_Botao_Pesquisa e montando para a query principal
  }

  if Assigned(Query) then
      SQL_Final := Query.Sql
  else if Assigned(QueryADO) then
      SQL_Final := QueryADO.Sql;

  FiltrosGerados.Clear;

  for i := 0 to Owner.ComponentCount -1 do
  begin

      // Verif. se o Comp. atual é um EditBeleza e
      // testa se o Checkbox ligado a ele esta checkado
      if Owner.Components[i] is TEditBeleza then
      begin

          if (Assigned(tEditBeleza(Owner.Components[i]).Marcar_CheckBox))
              and (Trim(tEditBeleza(Owner.Components[i]).Sql_Botao_Pesquisa) <> '') then
          begin
              if (tCheckBox(tEditBeleza(Owner.Components[i]).Marcar_CheckBox).Checked)
                  and (Trim(tEditBeleza(Owner.Components[i]).Text) <> '') then
              begin
                  PegaValorEditBeleza(i);
              end;
          end    // Fim do IF se o tEditBeleza tem checkBox associado
          else if (trim(tEditBeleza(Owner.Components[i]).Sql_Botao_Pesquisa) <> '')
              and (trim(tEditBeleza(Owner.Components[i]).Text) <> '') then
              PegaValorEditBeleza(i);

      end
      else if Owner.Components[i] is TFiltroDatas then
      begin
          // Verificar se Esta Marcado e se possui a propriedade SQL_Bt_Pesquisa
          if (trim(tFiltroDatas(Owner.Components[i]).Sql_botao_Pesquisa) <> '')
              and (tFiltroDatas(Owner.Components[i]).Checked) then
          begin
              Sql_Final.Add(tFiltroDatas(Owner.components[i]).Sql_botao_Pesquisa);
              PegarNomeParametro(tFiltroDatas(Owner.components[i]));

              // Somar na Propriedade dos Filtros Gerados
              AddFiltroGeradoDatas(i);

              if Assigned(fSomarFiltro) then
                  AoSomarFiltro(tFiltroDatas(Owner.Components[i]),
                      tFiltroDatas(Owner.components[i]).Sql_botao_Pesquisa,
                      DateToStr(tFiltroDatas(Owner.components[i]).Data1),
                      DateToStr(tFiltroDatas(Owner.components[i]).Data2));
          end;  // Fim do IF q verif se tem a propr SQL informada

      end      // Fim do IF se Componente é tFiltroDatas

      else if Owner.Components[i] is tFiltroFaixaValores then
      begin
          // Verificar se Esta Marcado e se possui a propriedade SQL_Bt_Pesquisa
          if (trim(tFiltroFaixaValores(Owner.Components[i]).Sql_botao_Pesquisa) <> '')
              and (tFiltroFaixaValores(Owner.Components[i]).Checked) then
          begin
              // Add SQL conforme Opcao que o usuario escolheu
              AddSqlFaixaValores(i);

              PegarNomeParametro(tFiltroFaixaValores(Owner.components[i]));

              // Somar na Propriedade dos Filtros Gerados
              AddFiltroGeradoFaixaValores(i);


              if Assigned(fSomarFiltro) then
                  AoSomarFiltro(tFiltroFaixaValores(Owner.Components[i]),
                      tFiltroFaixaValores(Owner.components[i]).Sql_botao_Pesquisa,
                      FloatToStr(tFiltroFaixaValores(Owner.components[i]).Valor1),
                      FloatToStr(tFiltroFaixaValores(Owner.components[i]).Valor2));
          end;  // Fim do IF q verif se tem a propr SQL informada

      end;      // Fim do IF se Componente é tFiltroFaixaValores
  end;

  if Assigned(Query) then
      Query.Sql := SQL_Final
  else if Assigned(QueryADO) then
      QueryADO.Sql := SQL_Final;
  
end;

procedure TMontaSQL.PegarNomeParametro(Componente : tComponent);
var Parametro, Texto  : String;
    pos               : Short;
    achou, JogouData1 : Boolean;
begin

    //PEGAR O NOME DO PARAMETRO Q ESTA DENTRO DO SQL DO EDIT
    parametro  := '';
    pos        := 1;
    achou      := False;
    JogouData1 := False;

    if Componente is TEditBeleza then
        Texto := TEditBeleza(Componente).Sql_botao_Pesquisa
    else if Componente is tFiltroDatas then
        Texto := tFiltroDatas(Componente).Sql_botao_Pesquisa
    else if Componente is tFiltroFaixaValores then
        Texto := SqlParcialtFaixaValores + ' ';  // Texto := tFiltroFaixaValores(Componente).Sql_botao_Pesquisa;

    while pos <= length(texto) do
    begin

        // Adicionar o nome do parametro se achou
        if achou then
            parametro := parametro + texto[pos];

        // Verif. se achou o nome do parametro
        if texto[pos] = ':' then achou := true;
        if texto[pos] = ' ' then achou := false;

        if (not achou) and (trim(Parametro) <> '') then
        begin
            // Assimilar o Valor ao Parametro encontrado
            // Verificar tb qual o componente encontrado
            if Componente is TEditBeleza then
                Query.ParamByName(trim(parametro)).AsString := TEditBeleza(Componente).Text
            else if Componente is tFiltroDatas then
            begin
                if JogouData1 then
                    Query.ParamByName(trim(parametro)).AsDateTime := tFiltroDatas(Componente).Data2
                else
                    Query.ParamByName(trim(parametro)).AsDateTime := tFiltroDatas(Componente).Data1;
                JogouData1 := True;
            end
            else if Componente is tFiltroFaixaValores then
            begin
                if JogouData1 then
                    Query.ParamByName(trim(parametro)).AsFloat := tFiltroFaixaValores(Componente).Valor2
                else
                    Query.ParamByName(trim(parametro)).AsFloat := tFiltroFaixaValores(Componente).Valor1;
                JogouData1 := True;
            end;

            Parametro := '';
        end;

        inc(pos);
    end; //FIM DO WHILE

end;

procedure TMontaSQL.PegaValorEditBeleza(idComponente: Short);
begin

    // Caso Seja MultiSelecao, deve trocar o Like pelo IN
    if (tEditbeleza(Owner.components[idComponente]).Ativar_MultiSelecao)
        and (tEditbeleza(Owner.components[idComponente]).RealizouMultPesquisa) then
    begin
        Sql_Final.Add(
            AcertaParam(TEditBeleza(Owner.components[idComponente]).Sql_botao_Pesquisa,
            TEditBeleza(Owner.components[idComponente]).Text));

        // Somar na Propriedade dos Filtros Gerados
        if MostrarFiltrosGeradosLinhaLinha then
            FiltrosGerados.Add(tCheckBox(tEditBeleza(Owner.Components[idComponente]).Marcar_CheckBox).Caption
                + ' = '
                + TEditBeleza(Owner.components[idComponente]).Text + '; ')
        else
            FiltrosGerados.Text := trim(FiltrosGerados.Text)
                + tCheckBox(tEditBeleza(Owner.Components[idComponente]).Marcar_CheckBox).Caption
                + ' = '
                + TEditBeleza(Owner.components[idComponente]).Text
                + '; ';

        if Assigned(fSomarFiltro) then
            AoSomarFiltro(tEditbeleza(Owner.components[idComponente]),
                AcertaParam(TEditBeleza(Owner.components[idComponente]).Sql_botao_Pesquisa, TEditBeleza(Owner.components[idComponente]).Text),
                TEditBeleza(Owner.components[idComponente]).Text,
                '');
    end  // Fim do end se usou MultiSelecao
    else
    begin
        Sql_Final.Add(TEditBeleza(Owner.Components[idComponente]).Sql_botao_Pesquisa);
        PegarNomeParametro(TEditBeleza(Owner.components[idComponente]));

        // Somar na Propriedade dos Filtros Gerados
        if MostrarFiltrosGeradosLinhaLinha then
            FiltrosGerados.Add(tCheckBox(tEditBeleza(Owner.Components[idComponente]).Marcar_CheckBox).Caption
                + ' = "'
                + TEditBeleza(Owner.components[idComponente]).Text + '"')
        else
            FiltrosGerados.Text := trim(FiltrosGerados.Text)
                + tCheckBox(tEditBeleza(Owner.Components[idComponente]).Marcar_CheckBox).Caption
                + ' = "'
                + TEditBeleza(Owner.components[idComponente]).Text + '"; ';

        if Assigned(fSomarFiltro) then
            AoSomarFiltro(tEditBeleza(Owner.components[idComponente]),
                TEditBeleza(Owner.Components[idComponente]).Sql_botao_Pesquisa,
                TEditBeleza(Owner.Components[idComponente]).Text,
                '');

    end; // Fim do end se NÃO usou MultiSelecao

end;

procedure TMontaSQL.setADOQuery(const Value: TADOQuery);
begin
  fADOQuery := Value;
end;

procedure TMontaSQL.setFGLL(const Value: Boolean);
begin
  fFGLL := Value;
end;

procedure TMontaSQL.setFiltrosGerados(const Value: tStrings);
begin
  fFiltrosGerados := Value;
end;

procedure TMontaSQL.setQuery(const Value: TFDQuery);
begin
  fQuery := Value;
end;

end.
