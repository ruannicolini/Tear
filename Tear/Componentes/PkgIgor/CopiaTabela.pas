unit CopiaTabela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Datasnap.DBClient,
  Controls, Forms, Dialogs, comctrls, stdctrls, uCaixaProgresso;

type
  TCopiaTabela = class(TComponent)
  private
    ftaborig: TClientDataSet;
    ftabdest: TClientDataSet;
    fcampos: TStrings;
    fAntes_Copia: TNotifyEvent;
    fDepois_Copia: TNotifyEvent;
    fbarra: TProgressBar;
    Progr: tCaixaProgresso;
    fMostraBarra: Boolean;
    FRegistrosCopiados: Integer;
    procedure settaborig(const Value: TClientDataSet);
    procedure settabdest(const Value: TClientDataSet);
    procedure Copiar;
    Procedure Copiar_Reg;
    Function Verif_Tabs: boolean;
    procedure setcampos(const Value: TStrings);
    procedure setbarra(const Value: TProgressBar);
    procedure setMostraBarra(const Value: Boolean);
    procedure SetRegistrosCopiados(const Value: Integer);
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create (dono: tcomponent); override;
    Procedure Exec_Copia;
    Procedure Exec_Copia_Reg_Atual;
  published
    { Published declarations }

    //Propriedades
    Property Tabela_Origem: TClientDataSet read ftaborig write settaborig;
    Property Tabela_Destino: TClientDataSet read ftabdest write settabdest;
    Property Campos: TStrings read fcampos write setcampos;
    Property Barra_Progresso: TProgressBar read fbarra write setbarra;
    property MostrarBarraProgresso: Boolean read fMostraBarra write setMostraBarra default true;
    property RegistrosCopiados: Integer read FRegistrosCopiados write SetRegistrosCopiados;

    //Eventos
    Property Antes_Copia: TNotifyEvent read fAntes_Copia write fAntes_Copia;
    Property Depois_Copia: TNotifyEvent read fDepois_Copia write fDepois_Copia;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Beleza', [TCopiaTabela]);
end;

{ TCopiaTabela }

procedure TCopiaTabela.Copiar;
begin
  if not Verif_Tabs then;


  //Max da Barra de Progresso
  if assigned(fbarra) then
  begin
    TProgressBar(fbarra).Position:= 0;
    TProgressBar(fbarra).Max:= ftaborig.RecordCount;
  end;

  //Tela de Barra d Progresso
  if fMostraBarra then
  begin
      Progr := tCaixaProgresso.Create;
      Progr.mostrar(ftaborig.RecordCount);
  end;


  //Copiar dados da tab origem para tab destino
  ftaborig.first;
  while not ftaborig.eof do
  begin
      Copiar_Reg;

      ftaborig.next;

      if fMostraBarra then
          Progr.Posicao := Progr.Posicao + 1;
  end;

  if fMostraBarra then
      Progr.Liberar;

end;

procedure TCopiaTabela.Exec_Copia;
begin
  if assigned(fAntes_Copia) then
      Antes_Copia(self);


  Copiar;


  if assigned(fDepois_Copia) then
      Depois_Copia(self);

end;

constructor TCopiaTabela.create(dono: tcomponent);
begin
  inherited;
  fcampos           := tStringList.create;
  fMostraBarra      := True;
  RegistrosCopiados := 0;
end;

procedure TCopiaTabela.setcampos(const Value: TStrings);
begin
  Fcampos.Assign(Value);
end;

procedure TCopiaTabela.settabdest(const Value: TClientDataSet);
begin
  ftabdest := Value;
end;

procedure TCopiaTabela.settaborig(const Value: TClientDataSet);
begin
  ftaborig := Value;
end;

procedure TCopiaTabela.setbarra(const Value: TProgressBar);
begin
  fbarra := Value;
end;

procedure TCopiaTabela.Exec_Copia_Reg_Atual;
begin
  if not Verif_Tabs then exit;
  
  Copiar_Reg;
end;

procedure TCopiaTabela.Copiar_Reg;
var i, col, campos : short;
    c_orig, c_dest : string;
begin

  // Verificar se foi preenchida a propr. CAMPOS
  // case ñ foi deve ser percorrido todos os campos
  // das 2 tabs
  if trim(fcampos.Text) <> '' then
      campos := fcampos.count -1
  else campos := ftaborig.FieldCount -1;

  ftabdest.append;

  // Percorrer a propriedade dos Campos
  for i := 0 to campos do
  begin

    if trim(fcampos.Text) <> '' then
    begin
        c_orig := '';
        c_dest := fcampos[i];

        // remove o conteudo depois do ;
        // jogando pro c_dest
        col := 1;
        while c_dest[col+1] <> ';' do
            inc(col);

        c_orig := copy(c_dest, 1, col);
        delete(c_dest, 1, length(c_orig)+1);

        // Copia o campo
        ftabdest.FieldByName(trim(c_dest)).value := ftaborig.FieldByName(trim(c_orig)).value;

    end
    else if ftaborig.Fields[i].Visible then
    begin
        Try
            ftabdest.Fields[i].Value := ftaborig.Fields[i].Value;
        Except
        end;
    end;

  end;  //Fim do FOR q percorre os campos

  try
      ftabdest.post;
      RegistrosCopiados := RegistrosCopiados + 1;
  except
      if (Tabela_Destino.Name = 'memTabProds') then
          ShowMessage('Houve um problema na inserção da referência ' + ftaborig.Fields[1].AsString + '. Talvez ela já esteja inserida na tabela.');

      ftabdest.cancel;
  end;

  if assigned(fbarra) then
      TProgressBar(fbarra).Position :=
         TProgressBar(fbarra).Position + 1;

end;

Function TCopiaTabela.Verif_Tabs: boolean;
begin
  if not ftabdest.active then
  begin
      ShowMessage('Tabela Destino Fechada!');
      result := false;
  end
  else if not ftaborig.active then
  begin
      ShowMessage('Tabela Origem Fechada!');
      result := false;
  end
  else result := true;

end;

procedure TCopiaTabela.setMostraBarra(const Value: Boolean);
begin
  fMostraBarra := Value;
end;

procedure TCopiaTabela.SetRegistrosCopiados(const Value: Integer);
begin
  FRegistrosCopiados := Value;
end;

end.
