unit u_relatorios;

interface
      //units do DESIGNER DO REPORT BUILDER ESTAO
      //no help pag.: Controlling the End-User Application

      // unit ppPDFDevice serve pra disponibilizar a exportacao pra PDF
      // unit ppCTMain serve pra disponibilizar recurso de CrossTab
uses
  {daDatMan,} Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ppComm, ppEndUsr, Db, ppRptExp, ppModule, daDatMod,
  ppDB, ppBands, ppClass, ppCache, ppDBPipe, ppRelatv, ppProd, ppReport,
  Grids, DBGrids, Buttons, ComCtrls, ExtCtrls, DBCtrls, ppCtrls,
  ppPrnabl, ppStrtch, ppSubRpt, ppVar, ppMemo, ppDBBDE, daDataView,
  daQueryDataView, daDataModule, daSQL, raCodMod, ppViewr,
  ToolWin, raIDE, daDatMan, DBClient, ppPDFDevice, ppCTMain,
  XiButton, jpeg, Menus, ppDesignLayer, ppParameter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList;

type
  TFRelatorios = class(TForm)
    ppDBPipeline1: TppDBPipeline;
    DataSource1: TDataSource;
    ds_relats: TDataSource;
    ds_relats_usur: TDataSource;
    DataSource2: TDataSource;
    ppDBPipeline2: TppDBPipeline;
    ppDBPipeline3: TppDBPipeline;
    DataSource3: TDataSource;
    ppDBPipeline4: TppDBPipeline;
    DataSource4: TDataSource;
    ppDBPipeline5: TppDBPipeline;
    DataSource5: TDataSource;
    Relatorios_sis: TClientDataSet;
    Relatorios_sistela: TStringField;
    Relatorios_sisnum_relat: TSmallintField;
    Relatorios_sisdescricao: TStringField;
    Relatorios_sisarquivo: TStringField;
    relats_usur: TClientDataSet;
    relats_usurTela: TStringField;
    relats_usurNum_Relat: TSmallintField;
    relats_usurDescricao: TStringField;
    relats_usurArquivo: TStringField;
    ppDBPipeline6: TppDBPipeline;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    ppMasterFieldLink1: TppMasterFieldLink;
    DataSource6: TDataSource;
    ppDBPipeline7: TppDBPipeline;
    ppField7: TppField;
    ppField8: TppField;
    ppField9: TppField;
    ppField10: TppField;
    ppField11: TppField;
    ppMasterFieldLink2: TppMasterFieldLink;
    DataSource7: TDataSource;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBPipeline8: TppDBPipeline;
    ppField1: TppField;
    ppField12: TppField;
    ppField13: TppField;
    ppField14: TppField;
    ppField15: TppField;
    ppMasterFieldLink3: TppMasterFieldLink;
    ppMasterFieldLink4: TppMasterFieldLink;
    DataSource8: TDataSource;
    SaveDialog1: TSaveDialog;
    lbTpRelat: TLabel;
    barra: TToolBar;
    btimprimir: TToolButton;
    button5: TToolButton;
    ToolButton2: TToolButton;
    btnovo: TToolButton;
    btalterar: TToolButton;
    btexcluir: TToolButton;
    btsair: TToolButton;
    btEmail: TToolButton;
    btPDF: TToolButton;
    Shape2: TShape;
    PageControl1: TPageControl;
    tbRelatsSistema: TTabSheet;
    tbRelatsUsuarios: TTabSheet;
    gridRelatsSistema: TDBGrid;
    gridRelatsUsuario: TDBGrid;
    btRelatsSistema: TXiButton;
    btRelatsUsuario: TXiButton;
    Label1: TLabel;
    lbRelatAtual: TLabel;
    lbTela: TLabel;
    Label3: TLabel;
    popEnvioEmail: TPopupMenu;
    EnviarporEmail1: TMenuItem;
    EnviarparaumEmaildeClientesRepresentantesFornecedores1: TMenuItem;
    DataSource9: TDataSource;
    ppDBPipeline9: TppDBPipeline;
    ppField16: TppField;
    ppField17: TppField;
    ppField18: TppField;
    ppField19: TppField;
    ppField20: TppField;
    ppMasterFieldLink5: TppMasterFieldLink;
    ppMasterFieldLink6: TppMasterFieldLink;
    ppInfoTelaAtual: TppDBPipeline;
    ppField21: TppField;
    ppField22: TppField;
    ppField23: TppField;
    ppField24: TppField;
    ppField25: TppField;
    ppMasterFieldLink7: TppMasterFieldLink;
    ppMasterFieldLink8: TppMasterFieldLink;
    dsNTela: TDataSource;
    mNumTelaRelat: TClientDataSet;
    mNumTelaRelatNomeRelatorio: TStringField;
    mNumTelaRelatTela: TStringField;
    mNumTelaRelatFiltrosMarcados: TMemoField;
    Image1: TImage;
    q_aux: TFDQuery;
    ImageList1: TImageList;
    procedure btalterarClick(Sender: TObject);
    procedure btnovoClick(Sender: TObject);
    procedure btexcluirClick(Sender: TObject);
    procedure btimprimirClick(Sender: TObject);
    procedure btsairClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridRelatsSistemaDblClick(Sender: TObject);
    procedure Relatorios_sisAfterScroll(DataSet: TDataSet);
    procedure btEmailClick(Sender: TObject);
    procedure btRelatsSistemaClick(Sender: TObject);
    procedure EnviarporEmail1Click(Sender: TObject);
    procedure btPDFClick(Sender: TObject);
  private
    { Private declarations }
    RelatsAtual : Short;

  public
    { Public declarations }
    constructor Create(AOwner : TComponent);
    procedure BuscarRelats(Origem: Short); // Buscar os Relatorios 1 p/ Sistema ou 2 p/ usuario
    procedure Assimila_Relat_q(n_tela: string; parametro: short; tab_mestre: tDataset; tab_filha: tDataset; campo_key_tab_mestre: string; campo_key_tab_filha: string);
    procedure DirList( ASource : string; ADirList : TStringList );
    // Procedure Similar à assimila_relat_q, mas com a diferença de Aqui funcionar pra 3 Datasets
    procedure Assimila3Datasets(nTela: String; TabPai, TabFilha1, TabFilha2: tDataset; CampoKeyTabMestre, CampoKeyTabFilha1, CampoKeyTabFilha2: String);

    function PegaNomeRelat(Arq: String): String;
    function PegaNumRelat(Arq: String): Short;

  end;

var
  FRelatorios: TFRelatorios;
  data : string;

implementation

uses
uDataModule;

{$R *.DFM}

procedure TFRelatorios.assimila_relat_q(n_tela: string; parametro: short; tab_mestre: tDataset; tab_filha: tDataset; campo_key_tab_mestre: string; campo_key_tab_filha: string);
begin

  lbTela.Caption      := n_tela;
  datasource1.dataset := tab_mestre;

  if tab_filha <> tab_mestre then
      datasource2.dataset := tab_filha;
  if campo_key_tab_mestre <> '' then
  begin
      ppDBPipeline2.MasterDataPipeline       := ppDBPipeline1;
      ppDBPipeline2.Links[0].MasterFieldName := campo_key_tab_mestre;
      ppDBPipeline2.Links[0].DetailFieldName := campo_key_tab_filha;
  end;


  // Relatorios do Sistema
  BuscarRelats(1);

  // Relatorios do Usuario
  BuscarRelats(2);

end;

procedure TFRelatorios.btalterarClick(Sender: TObject);
var nomerep: string;
begin

 // nomerep := ('RelatoriosUsuario')+ '\' + Relats_UsurArquivo.AsString;
  //nomerep := ('C:\Users\Thallys\Desktop\Tecno_Vendas-master\app\Relatorios\RelatoriosUsuario')+ '\' + Relats_UsurArquivo.AsString;
  //nomerep := '\relatorios\usuarios';
  nomerep := ExtractFilePath(Application.ExeName)+'relatorios\usuarios' + '\' + Relats_UsurArquivo.AsString;
  ppreport1.template.FileName := nomerep;
  ppreport1.template.LoadFromFile;

  ppdesigner1.Report := ppreport1;
  ppdesigner1.Show;

end;

procedure TFRelatorios.btnovoClick(Sender: TObject);
var nomerep, _tela: string;
    seq, botao: short;
begin

  if not relats_usur.Active then relats_usur.CreateDataSet;

  if (Relatorios_sis.IsEmpty) and (relats_usur.IsEmpty) then
      botao := 7
  else
      botao := application.MessageBox('Deseja copiar LayOut do relatório atual? (Não para relatório em branco)','Relatórios',mb_yesnocancel + mb_iconquestion);

  //sim = 6; nao = 7; cancelar = 2
  case botao of
  6:
  begin
      {case RelatsAtual of
      1: nomerep := f_principal.BuscaParamTexto('RelatoriosSistema') +'\'+ Relatorios_Sisarquivo.AsString;
      2: nomerep := f_principal.BuscaParamTexto('RelatoriosUsuario') + '\' +Relats_UsurArquivo.AsString;
      end;
      }
      case RelatsAtual of
        1: nomerep := ExtractFilePath(Application.ExeName)+'relatorios\sistema'+'\'+ Relatorios_Sisarquivo.AsString;
        2: nomerep := ExtractFilePath(Application.ExeName)+'relatorios\usuarios'+ '\' +Relats_UsurArquivo.AsString;
      end;
      ppreport1.template.FileName := nomerep;
      ppreport1.template.LoadFromFile;
  end;
  7:  ppReport1.template.New;
  2:  exit;
  end;

  nomerep := inputbox('Novo Relatório', 'Digite o nome do novo relatório', '');
  _tela   := lbTela.Caption;

  relats_usur.Last;
  Seq     := relats_usurNum_Relat.AsInteger + 1;

  Relats_Usur.Append;
  Relats_UsurTela.AsString       := _tela;
  Relats_UsurDescricao.AsString  := nomerep;
  Relats_UsurArquivo.AsString    := _tela + ' '+ inttostr(seq) + ' - '+nomerep+'.rtm';
  Relats_UsurNum_Relat.AsInteger := seq;
  Relats_Usur.Post;

  //ppReport1.template.FileName    := f_principal.BuscaParamTexto('RelatoriosUsuario') + '\' + _tela + ' '+ inttostr(seq) + ' - '+nomerep+'.rtm';

 // nomerep := ('C:\Users\Thallys\Desktop\Tecno_Vendas-master\app\Relatorios\RelatoriosUsuario')+ '\' + Relats_UsurArquivo.AsString;
  ppReport1.template.FileName    := ExtractFilePath(Application.ExeName)+'relatorios\usuarios\' + _tela + ' '+ inttostr(seq) + ' - '+nomerep+'.rtm';

  ppReport1.template.SaveToFile;
  PageControl1.ActivePage        := tbRelatsUsuarios;
  ppdesigner1.Report             := ppreport1;
  RelatsAtual                    := 2;
  ppdesigner1.Show;
  ppReport1.template.SaveToFile;

end;

procedure TFRelatorios.btexcluirClick(Sender: TObject);
var nomearq : string;
begin

  if relats_usur.IsEmpty then
      //f_principal.mens_aviso('Não há Relatorios a Excluir!')
  else if Application.MessageBox('Deseja realmente excluir relatório atual?','Exclusão de relatório',mb_okcancel + mb_iconquestion) = idok then
  begin
      //nomearq        := f_principal.BuscaParamTexto('RelatoriosUsuario')+ '\' + Relats_UsurArquivo.AsString;
      nomearq        := ExtractFilePath(Application.ExeName)+ 'relatorios\usuarios\' + Relats_UsurArquivo.AsString;

      deletefile(nomearq);
      Relats_Usur.delete;
  end;

end;

procedure TFRelatorios.btimprimirClick(Sender: TObject);
var nomerep : string;
    TelaF   : tForm;
    CdsTmp  : TClientDataSet;
begin

  // Add Registro da Tela Atual no Dataset
  mNumTelaRelat.Edit;
  mNumTelaRelatTela.AsString            := Copy(Application.Title, 9, Length(Application.Title));
  mNumTelaRelatNomeRelatorio.AsString   := lbRelatAtual.Caption;
  mNumTelaRelatFiltrosMarcados.AsString := '';

  // Pegar Filtros Marcados do Dataset da Tela de Origem
 { if f_principal.FindComponent('f' + Copy(Application.Title, 9, 5)) <> Nil then
  begin
      TelaF := tForm(f_principal.FindComponent('f' + Copy(Application.Title, 9, 5)));
      if TelaF.FindComponent('mImprFiltrosMarcados') <> Nil then
      begin
          // Rodar Dataset, se existir, Copiando Registros

          CdsTmp := TClientDataSet(TelaF.FindComponent('mImprFiltrosMarcados'));

          if CdsTmp.Active then
          begin
              CdsTmp.First;
              while not CdsTmp.Eof do
              begin
                  mNumTelaRelatFiltrosMarcados.AsString :=
                      mNumTelaRelatFiltrosMarcados.AsString + trim(CdsTmp.FieldByName('DescrFiltro').AsString);

                  CdsTmp.Next;
              end;  // Fim do While
          end;      // Fim do IF se o Dataset dos Filtros está Ativo
      end;          // Fim do IF se o Dataset dos Filtros Existe
  end;              // Fim do IF se encontrou a tela de Origem
  }
  mNumTelaRelat.Post;


  ppReport1.ShowPrintDialog := True;
  ppReport1.DeviceType      := 'Screen';

  //case RelatsAtual of
  //1: nomerep := f_principal.BuscaParamTexto('RelatoriosSistema') + '\' + Relatorios_Sisarquivo.AsString;
  //2: nomerep := f_principal.BuscaParamTexto('RelatoriosUsuario') + '\' +Relats_UsurArquivo.AsString;
  //end;
  case RelatsAtual of
      1: nomerep := ExtractFilePath(Application.ExeName)+'relatorios\sistema'+ '\' + Relatorios_Sisarquivo.AsString;
      2: nomerep := ExtractFilePath(Application.ExeName)+'relatorios\usuarios'+ '\' + Relats_UsurArquivo.AsString;
      end;

  ppReport1.template.FileName := nomerep;
  ppReport1.template.LoadFromFile;


  ppreport1.print;

end;

procedure TFRelatorios.btsairClick(Sender: TObject);
begin
  close;
end;

procedure TFRelatorios.FormDestroy(Sender: TObject);
begin
  frelatorios := nil;
end;

procedure TFRelatorios.FormShow(Sender: TObject);
begin
    ppDesigner1.IniStorageName := ExtractFilePath(Application.ExeName)+'\RBuilder.ini';
    
//    if not dm_dados.mConfig.active then
//        dm_dados.mConfig.open;

//    if not dm_dados.mUsuarios.Active then
//        dm_dados.mUsuarios.Open;

    btnovo.Enabled              := true;
    btEmail.Enabled             := true;
    btPDF.Enabled               := true;

    btalterar.Enabled           := true;
    btexcluir.Enabled           := true;
    

    tbRelatsSistema.TabVisible  := False;
    tbRelatsUsuarios.TabVisible := False;
    tbRelatsSistema.Visible     := True;
    RelatsAtual                 := 1;

    btRelatsSistemaClick(btRelatsSistema);
    mNumTelaRelat.CreateDataSet;

end;

procedure TFRelatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Relatorios_Sis.close;
  Relats_Usur.Close;
end;

procedure TFRelatorios.BuscarRelats(Origem: Short);
var Ds    : tClientDataset;
    Arqs  : TStringList;
    i     : Short;
    Dir   : String;
begin

//  if not dm_dados.mConfig.Active then
//      dm_dados.mConfig.Open;

  Ds := Relatorios_Sis;
  if Origem = 2 then Ds := Relats_Usur;

  if Ds.Active then Ds.EmptyDataSet
  else Ds.CreateDataSet;

   //  /*Mudei aqui*/

  //Dir := f_principal.BuscaParamTexto('RelatoriosSistema');
     Dir := 'relatorios\sistema\';
  //if Origem = 2 then Dir := f_principal.BuscaParamTexto('RelatoriosUsuario');
  if Origem = 2 then Dir := ExtractFilePath(Application.ExeName) + 'relatorios\usuarios';

  if Copy(Dir, 1, length(Dir)) <> '\' then
      Dir := Dir + '\';

  Arqs := TStringList.Create;
  DirList(Dir + lbTela.Caption + '*.rtm', Arqs);
  //DirList(Dir + lbTela.Caption + '*.rtm', Arqs);

  for i := 0 to Arqs.Count -1 do
  begin
      Ds.Append;
      Ds.FieldByName('tela').AsString       := lbTela.Caption;
      Ds.FieldByName('num_relat').AsInteger := PegaNumRelat(Arqs[i]);
      Ds.FieldByName('descricao').AsString  := PegaNomeRelat(Arqs[i]);
      Ds.FieldByName('arquivo').AsString    := Arqs[i];
      Ds.Post;
  end;

end;

constructor TFRelatorios.Create(AOwner: TComponent);
begin
  //
  inherited Create(AOwner);
end;

procedure TFRelatorios.gridRelatsSistemaDblClick(Sender: TObject);
begin
  if not tDbGrid(Sender).DataSource.DataSet.IsEmpty then
      btimprimirClick(btimprimir);
end;

procedure TFRelatorios.Relatorios_sisAfterScroll(DataSet: TDataSet);
begin
  lbRelatAtual.Caption := DataSet.FieldByName('descricao').AsString;
end;

function TFRelatorios.PegaNomeRelat(Arq: String): String;
var i  : Short;
    s  : String;
    ok : Boolean;
begin

  s  := '';
  ok := False;
  for i := 1 to length(Arq) do
  begin
      if ok then
          s := s + copy(Arq, i, 1);
      if copy(Arq, i, 1) = '-' then ok := True;
  end;
  Result:= trim(copy(s, 1, length(s) - 4));

end;

function TFRelatorios.PegaNumRelat(Arq: String): Short;
var i  : Short;
    s  : String;
    ok : Boolean;
begin

  s  := '';
  ok := False;
  for i := 1 to length(Arq) do
  begin
      if (ok) and (copy(Arq, i, 1) <> ' ') then s:= s + copy(Arq, i, 1);
      if (ok) and (copy(Arq, i, 1) = ' ') then break;
      if (ok = false) and (copy(Arq, i, 1) = ' ') then ok:= True;
  end;

  try
      Result := StrToInt(trim(s));
  Except
      Result := 0;
  end;

end;

procedure TFRelatorios.Assimila3Datasets(nTela: String; TabPai, TabFilha1,
  TabFilha2: tDataset; CampoKeyTabMestre, CampoKeyTabFilha1,
  CampoKeyTabFilha2: String);
begin

  lbTela.Caption      := nTela;
  DataSource1.dataset := TabPai;
  DataSource2.dataset := TabFilha1;
  DataSource3.dataset := TabFilha2;

  ppDBPipeline2.MasterDataPipeline       := ppDBPipeline1;
  ppDBPipeline2.Links[0].MasterFieldName := CampoKeyTabMestre;
  ppDBPipeline2.Links[0].DetailFieldName := CampoKeyTabFilha1;

  ppDBPipeline3.MasterDataPipeline       := ppDBPipeline1;
  ppDBPipeline3.Links[0].MasterFieldName := CampoKeyTabMestre;
  ppDBPipeline3.Links[0].DetailFieldName := CampoKeyTabFilha2;

  // Relatorios do Sistema
  BuscarRelats(1);

  // Relatorios do Usuario
  BuscarRelats(2);

end;

procedure TFRelatorios.btEmailClick(Sender: TObject);
begin
    popEnvioEmail.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;


procedure TFRelatorios.btRelatsSistemaClick(Sender: TObject);
begin

    tbRelatsSistema.TabVisible  := False;
    tbRelatsUsuarios.TabVisible := False;
    tbRelatsSistema.Visible     := Sender = btRelatsSistema;
    tbRelatsUsuarios.Visible    := Sender = btRelatsUsuario;
    //btRelatsSistema.Enabled     := not btRelatsSistema.Enabled;
    //btRelatsUsuario.Enabled     := not btRelatsUsuario.Enabled;

    if Sender = btRelatsSistema then
    begin
        lbTpRelat.Caption         := 'Relatórios do' + #13 + 'Sistema';
        btRelatsSistema.ColorFace := $00E0E0E0;
        btRelatsUsuario.ColorFace := clSilver;
        btRelatsUsuario.Width     := 55;
        btRelatsSistema.Width     := 57;
        btRelatsUsuario.Height    := 17;
        btRelatsSistema.Height    := 19;
        RelatsAtual               := 1;
        BuscarRelats(1);
    end
    else
    begin
        lbTpRelat.Caption         := 'Relatórios do' + #13 + 'Usuário';
        btRelatsSistema.ColorFace := clSilver;
        btRelatsUsuario.ColorFace := $00E0E0E0;
        btRelatsUsuario.Width     := 57;
        btRelatsSistema.Width     := 55;
        btRelatsUsuario.Height    := 19;
        btRelatsSistema.Height    := 17;
        RelatsAtual               := 2;
        BuscarRelats(2);
    end;

    //Usar assim se o enable funcionasse sem prejudicar a imagem
    //btExcluir.Enabled := (not tbRelatsSistema.Visible) ;
    //btAlterar.Enabled := (not tbRelatsSistema.Visible) ;
    btExcluir.visible := ( not tbRelatsSistema.Visible) ; // similar: Desaparece a imagem
    btAlterar.visible := ( not tbRelatsSistema.Visible) ; // similar: Desaparece a imagem


end;

procedure TFRelatorios.EnviarporEmail1Click(Sender: TObject);
var NomeRep : String;
begin

    case RelatsAtual of
    1:
    begin
        ppReport1.EmailSettings.Subject := Relatorios_sisdescricao.AsString;
        nomerep   := ExtractFilePath(Application.ExeName) + 'relatorios\sistema\' + Relatorios_Sisarquivo.AsString;
    end;
    2:
    begin
        ppReport1.EmailSettings.Subject := relats_usurDescricao.AsString;
        nomerep   := ExtractFilePath(Application.ExeName)+ 'relatorios\usuarios\' + Relats_UsurArquivo.AsString;
    end;
    end;

    ppReport1.EmailSettings.FileName := ppReport1.EmailSettings.Subject;
    ppReport1.template.FileName      := nomerep;
    ppReport1.template.LoadFromFile;
    ppReport1.SendMail;

end;

procedure TFRelatorios.btPDFClick(Sender: TObject);
var s, NomeRep : String;
begin

    if SaveDialog1.InitialDir = '' then SaveDialog1.InitialDir := ExtractFilePath(Application.ExeName);

    case RelatsAtual of
    1:
    begin
        s       := Relatorios_sisdescricao.AsString;
        //nomerep := f_principal.BuscaParamTexto('RelatoriosSistema') + '\' + Relatorios_Sisarquivo.AsString;
        nomerep := ExtractFilePath(Application.ExeName) + 'relatorios\sistema\' + Relatorios_Sisarquivo.AsString;
    end;
    2:
    begin
        s       := relats_usurDescricao.AsString;
        //nomerep := f_principal.BuscaParamTexto('RelatoriosUsuario') + '\' +Relats_UsurArquivo.AsString;
        nomerep := ExtractFilePath(Application.ExeName)+ 'relatorios\usuarios\' + Relats_UsurArquivo.AsString;
    end;
    end;


    SaveDialog1.FileName := s;
    if SaveDialog1.Execute then
    begin
        ppReport1.template.FileName   := nomerep;
        ppReport1.template.LoadFromFile;
        ppReport1.PDFSettings.Author  := 'SAF';
        ppReport1.PDFSettings.Subject := 'PDF Gerado pelo programa " SAF " ';
        ppReport1.PDFSettings.Title   := s;
        ppReport1.ShowPrintDialog     := False;
        ppReport1.DeviceType          := 'PDF';
        ppReport1.TextFileName        := SaveDialog1.FileName;
        ppReport1.Print;
    end;

end;

procedure TFRelatorios.DirList(ASource: string; ADirList: TStringList);
var
  SearchRec : TSearchRec;
  Result : integer;
begin
  Result := FindFirst( ASource, faAnyFile, SearchRec );

  if Result = 0 then
  while (Result = 0) do
  begin
      if (SearchRec.Name+' ')[1] = '.' then
      { Se pegou nome de SubDiretorio }
      begin
          Result := FindNext( SearchRec );
          Continue;
      end;
      ADirList.Add( SearchRec.Name );
      Result := FindNext( SearchRec );
  end;  //Fim do While
  FindClose( SearchRec );
  ADirList.Sort;

end;

Initialization
  RegisterClass(TFRelatorios);
Finalization
  UnRegisterClass(TFRelatorios);
end.
