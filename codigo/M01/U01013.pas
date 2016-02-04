unit U01013;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider, Datasnap.DBClient, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, DBGridBeleza, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask, DBEditBeleza, EditBeleza, DATEUTILS;

type
  TF01013 = class(TFBase)
    FDQuery1idcronometragem: TIntegerField;
    FDQuery1tempo_original: TBooleanField;
    FDQuery1tempo_ideal: TBooleanField;
    FDQuery1ritmo: TIntegerField;
    FDQuery1num_pecas: TIntegerField;
    FDQuery1tolerancia: TIntegerField;
    FDQuery1comprimento_prod: TSingleField;
    FDQuery1num_ocorrencia: TIntegerField;
    FDQuery1idProduto: TIntegerField;
    FDQuery1idCronometrista: TIntegerField;
    FDQuery1idTecido: TIntegerField;
    FDQuery1idOperacao: TIntegerField;
    FDQuery1idOperador: TIntegerField;
    ClientDataSet1idcronometragem: TIntegerField;
    ClientDataSet1tempo_original: TBooleanField;
    ClientDataSet1tempo_ideal: TBooleanField;
    ClientDataSet1ritmo: TIntegerField;
    ClientDataSet1num_pecas: TIntegerField;
    ClientDataSet1tolerancia: TIntegerField;
    ClientDataSet1comprimento_prod: TSingleField;
    ClientDataSet1num_ocorrencia: TIntegerField;
    ClientDataSet1idProduto: TIntegerField;
    ClientDataSet1idCronometrista: TIntegerField;
    ClientDataSet1idTecido: TIntegerField;
    ClientDataSet1idOperacao: TIntegerField;
    ClientDataSet1idOperador: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBEditBeleza2: TDBEditBeleza;
    DBEditBeleza3: TDBEditBeleza;
    DBEditBeleza4: TDBEditBeleza;
    DBEditBeleza5: TDBEditBeleza;
    Panel3: TPanel;
    DBCheckBox2: TDBCheckBox;
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGridBeleza2: TDBGridBeleza;
    DS_Recurso: TDataSource;
    DSP_Recurso: TDataSetProvider;
    CDS_Recurso: TClientDataSet;
    FDQ_Recurso: TFDQuery;
    FDQ_Recursoidcronometragem: TIntegerField;
    FDQ_RecursoidTipoRecurso: TIntegerField;
    FDQ_Recursoidtipo_recurso: TIntegerField;
    FDQ_Recursodescricao: TStringField;
    CDS_Recursoidcronometragem: TIntegerField;
    CDS_RecursoidTipoRecurso: TIntegerField;
    CDS_Recursoidtipo_recurso: TIntegerField;
    CDS_Recursodescricao: TStringField;
    EditBeleza1: TEditBeleza;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    crono: TTimer;
    Edit2: TEdit;
    btnINICIAR: TBitBtn;
    btnLap: TBitBtn;
    Edit3: TEdit;
    DS_Batida: TDataSource;
    DSP_Batida: TDataSetProvider;
    CDS_Batida: TClientDataSet;
    FDQ_Batida: TFDQuery;
    DBGridBatida: TDBGridBeleza;
    DBCheckBox3: TDBCheckBox;
    FDQ_Batidaidbatida: TIntegerField;
    FDQ_Batidaminutos: TIntegerField;
    FDQ_Batidasegundos: TIntegerField;
    FDQ_Batidamilesimos: TIntegerField;
    FDQ_Batidautilizar: TBooleanField;
    FDQ_BatidaidCronometragem: TIntegerField;
    CDS_Batidaidbatida: TIntegerField;
    CDS_Batidaminutos: TIntegerField;
    CDS_Batidasegundos: TIntegerField;
    CDS_Batidamilesimos: TIntegerField;
    CDS_Batidautilizar: TBooleanField;
    CDS_BatidaidCronometragem: TIntegerField;
    DBEditBeleza1: TDBEditBeleza;
    BImportar: TSpeedButton;
    FDQuery1operacao: TStringField;
    ClientDataSet1operacao: TStringField;
    FDQuery1produto: TStringField;
    ClientDataSet1produto: TStringField;
    FDQuery1tecido: TStringField;
    ClientDataSet1tecido: TStringField;
    FDQuery1operador: TStringField;
    ClientDataSet1operador: TStringField;
    FDQuery1cronometrista: TStringField;
    ClientDataSet1cronometrista: TStringField;
    procedure DBEditBeleza1Click(Sender: TObject);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CDS_RecursoAfterCancel(DataSet: TDataSet);
    procedure CDS_RecursoAfterDelete(DataSet: TDataSet);
    procedure CDS_RecursoAfterPost(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure cronoTimer(Sender: TObject);
    procedure btnINICIARClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLapClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure CDS_BatidaAfterCancel(DataSet: TDataSet);
    procedure CDS_BatidaAfterDelete(DataSet: TDataSet);
    procedure CDS_BatidaAfterPost(DataSet: TDataSet);
    procedure CDS_BatidaAfterInsert(DataSet: TDataSet);
    procedure DBGridBatidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure DBGridBeleza2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BEditarClick(Sender: TObject);
    procedure BInserirClick(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure btnLapKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    fTempo: Ttime;  //Tempo corrido do cronometro
    fTempoParada: Ttime; //Tempo que o cronometro fica pausado
    fMomento: integer; // "Hora" em que o cronometro iniciou
    fMomentoParada: integer; // "Hora" em que a Parada do cronometro iniciou
    fMomentoUltimoLap: integer;
    status: boolean; //controle do botoes de Iniciar/Parar e Lap/Continuar
    statusParada: boolean; //controle de Parada, quando contar o tempo parado.
    milissegundoAUX: integer; // milessegundos parados

  public
    { Public declarations }
  end;

var
  F01013: TF01013;

implementation

{$R *.dfm}

uses
uDataModule;

procedure TF01013.Action5Execute(Sender: TObject);
begin
    if DS.DataSet.State=dsInsert then
  begin
    {ShowMessage('Inserção');}
    //DELETAR BATIDA
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'Delete from batida where idCronometragem =:p';
    DModule.qAux.ParamByName('p').AsString := ClientDataSet1idcronometragem.AsString;
    DModule.qAux.execsql;

    //DELETAR TipoRecurso
    DModule.qAux.Close;
    DModule.qAux.SQL.Text := 'Delete from cronometragem_has_tipo_recurso where idCronometragem =:p';
    DModule.qAux.ParamByName('p').AsString := ClientDataSet1idcronometragem.AsString;
    DModule.qAux.execsql;
  end else
    if DS.DataSet.State=dsEdit then {ShowMessage('Edição')};

  //Herança
  inherited;

  //
  crono.Enabled := false;
  status := false;
  btnINICIAR.Caption := 'INICIAR';
  btnLap.Caption := 'LAP';
  btnLap.Enabled := false;
  BImportar.Enabled := false;

  DBEdit1.Color := clWindow;
  DBEdit7.Color := $00EFEFEF;
  DBEdit8.Color := $00EFEFEF;
  DBEdit9.Color := $00EFEFEF;
  DBEdit10.Color := $00EFEFEF;
  DBEdit11.Color := $00EFEFEF;
end;

procedure TF01013.BEditarClick(Sender: TObject);
begin
  inherited;
  BImportar.Enabled := false;

  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit7.Color := CorCamposOnlyRead();
  DBEdit8.Color := CorCamposOnlyRead();
  DBEdit9.Color := CorCamposOnlyRead();
  DBEdit10.Color := CorCamposOnlyRead();
  DBEdit11.Color := CorCamposOnlyRead();
end;

procedure TF01013.BInserirClick(Sender: TObject);
begin
  inherited;
  BImportar.Enabled := true;

  DBEdit1.Color := CorCamposOnlyRead();
  DBEdit7.Color := CorCamposOnlyRead();
  DBEdit8.Color := CorCamposOnlyRead();
  DBEdit9.Color := CorCamposOnlyRead();
  DBEdit10.Color := CorCamposOnlyRead();
  DBEdit11.Color := CorCamposOnlyRead();

  DBCheckBox1.Checked := false;
  DBCheckBox2.Checked := false;

end;

procedure TF01013.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if trim(EditBeleza1.Text) <> '' then
    begin
      {Coloca em Modo de Edição}
      if not DS_Recurso.DataSet.Active then
            DS_Recurso.DataSet.Open;

      if(CDS_Recurso.Locate('idtipo_recurso',Edit1.Text,[]) = false)then
      begin
        DS_Recurso.DataSet.Append;
        CDS_Recursoidcronometragem.asInteger := ClientDataSet1idcronometragem.value;
        CDS_RecursoidTipoRecurso.AsInteger := strToInt( Edit1.Text );

        {Salva}
        DS_Recurso.DataSet.Post;

        {Atualiza grid}
        FDQ_Recurso.ParamByName('id').Value:=(ClientDataSet1idcronometragem.AsInteger);
        DS_Recurso.DataSet.Close;
        DS_Recurso.DataSet.Open;
      end else
      ShowMessage('Fase já adicionada');

    end else
       showmessage('Preencha o Campo');

end;

procedure TF01013.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja Apagar Item Selecionado ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    CDS_Recurso.Delete;
  end;
end;

procedure TF01013.BSalvarClick(Sender: TObject);
begin
  inherited;
  crono.Enabled := false;
  status := false;
  btnINICIAR.Caption := 'INICIAR';
  btnLap.Caption := 'LAP';
  btnLap.Enabled := false;
  BImportar.Enabled := false;

  DBEdit1.Color := clWindow;
  DBEdit7.Color := $00EFEFEF;
  DBEdit8.Color := $00EFEFEF;
  DBEdit9.Color := $00EFEFEF;
  DBEdit10.Color := $00EFEFEF;
  DBEdit11.Color := $00EFEFEF;
end;

procedure TF01013.btnLapClick(Sender: TObject);
var
Ano, Mes, Dia, Hora, Min, Seg, MSeg: Word;
tempoCronometro :TDateTime;
r: TDateTime;
begin
  inherited;
  if(status = false)then
  begin
    //Continuar
    btnLap.Caption := 'LAP';
    statusParada := false;

    status := true;
    btnINICIAR.Caption := 'PARAR';
    btnLap.Caption := 'LAP';
    btnLap.Enabled := true;

    //Parte do calculo do Tempo Parcial
    fMomentoUltimoLap := GetTickCount;

  end else
    if(status = true)then
    begin
    //LAP Tempo total do cronometro
    //DecodeTime(((GetTickCount - fmomento) * OneMillisecond), Hora, Min, Seg, MSeg);

    //LAP Tempo Parcial
    DecodeTime(((GetTickCount - fMomentoUltimoLap) * OneMillisecond), Hora, Min, Seg, MSeg);
    //Parte do calculo do Tempo Parcial
    fMomentoUltimoLap := GetTickCount;

    {ShowMessage(' Tempo -> Hora: ' + inttostr(hora) + #13
    + 'Min: ' + inttostr(min) + #13
    + 'Seg: ' + inttostr(seg) + #13
    + 'Milessimos: ' + inttostr(Mseg) + #13);
    }

    // DataSource Batida
    if not DS_Batida.DataSet.Active then
        DS_Batida.DataSet.Open;

    DS_Batida.DataSet.Append;
    CDS_Batidaminutos.AsInteger := min;
    CDS_Batidasegundos.AsInteger := seg;
    CDS_Batidamilesimos.AsInteger := MSeg;
    CDS_Batidautilizar.AsBoolean := true;
    CDS_BatidaidCronometragem.AsInteger := ClientDataSet1idcronometragem.AsInteger;

    DS_Batida.DataSet.Post;

    //DBGrid Batida
    FDQ_Batida.ParamByName('id').Value:=(ClientDataSet1idcronometragem.AsInteger);
    DS_Batida.DataSet.Close;
    DS_Batida.DataSet.Open;


    end;
end;

procedure TF01013.btnLapKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  //
  if (key = 13) then
  //click
  begin
    btnLap.Click;
  end;
end;

procedure TF01013.btnINICIARClick(Sender: TObject);
begin
  inherited;
  if(status = false)then
  begin
  // CRONOMETRO RODANDO
    milissegundoAUX := 0;
    fTempo := 0;
    edit2.Text := formatdatetime('hh:nn:ss.zzz', fTempo);

    status := true;
    statusParada := false;
    fmomento := GetTickCount;
    crono.Enabled := false; //Timer
    crono.Enabled := true;

    btnINICIAR.Caption := 'PARAR';
    btnLap.Caption := 'LAP';
    btnLap.Enabled := true;

    ///Parte do calculo do Tempo Parcial
      fMomentoUltimoLap := GetTickCount;

  end else
  begin
    if(status = true)then
    begin
    //CRONOMETRO PARADO
      status := false;
      statusParada := true;

      fMomentoParada :=  GetTickCount;

      btnINICIAR.Caption := 'NOVO';
      btnLap.Caption := 'CONTINUAR';
      btnLap.Enabled := true;

      ///Parte do calculo do Tempo Parcial
      fMomentoUltimoLap := GetTickCount;

    end;
  end;
  btnLap.SetFocus;
end;

procedure TF01013.cronoTimer(Sender: TObject);
var
  Ano, Mes, Dia, Hora, Min, Seg, MSeg: Word;
begin
  inherited;
  if(statusParada = true)then
  begin
    fTempoParada := ((GetTickCount - fMomentoParada) * OneMillisecond);
    DecodeTime(fTempoParada, Hora, Min, Seg, MSeg);
    milissegundoAUX := mseg + (seg * 1000) + (min * 60000) + (hora * 3600000);
    edit3.Text := formatdatetime('hh:nn:ss.zzz', fTempoParada);
  end else
    if(milissegundoAUX > 0)then
    begin
      edit3.Text := 'ENTROU';

      //aumenta o tempo em que o cronometro começou para se ter o tempo fiel
      fmomento := fmomento + milissegundoAUX;

      ftempo := ((GetTickCount - fmomento) * OneMillisecond);
      edit2.Text := formatdatetime('hh:nn:ss.zzz', fTempo);
      milissegundoAUX := 0;
    end else
      if(milissegundoAUX = 0)then
      begin
        ftempo := ((GetTickCount - fmomento) * OneMillisecond);
        edit2.Text := formatdatetime('hh:nn:ss.zzz', fTempo);
      end;
end;

procedure TF01013.CDS_BatidaAfterCancel(DataSet: TDataSet);
begin
  inherited;
  CDS_Batida.CancelUpdates;
end;

procedure TF01013.CDS_BatidaAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CDS_Batida.ApplyUpdates(-1);
end;

procedure TF01013.CDS_BatidaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CDS_Batidaidbatida.AsInteger := DModule.buscaProximoParametro('seqBatida');

end;

procedure TF01013.CDS_BatidaAfterPost(DataSet: TDataSet);
begin
  inherited;
  CDS_Batida.ApplyUpdates(-1);
end;

procedure TF01013.CDS_RecursoAfterCancel(DataSet: TDataSet);
begin
  inherited;
  CDS_Recurso.CancelUpdates;
end;

procedure TF01013.CDS_RecursoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CDS_Recurso.ApplyUpdates(-1);
end;

procedure TF01013.CDS_RecursoAfterPost(DataSet: TDataSet);
begin
  inherited;
  CDS_Recurso.ApplyUpdates(-1);
end;

procedure TF01013.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
  inherited;
  ClientDataSet1idcronometragem.AsInteger := DModule.buscaProximoParametro('seqCronometragem');
end;

procedure TF01013.DBEditBeleza1Click(Sender: TObject);
begin
  inherited;
  DBEdit7.Text := '';
  DBEditBeleza1.Text := '';
end;

procedure TF01013.DBGridBatidaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = 46) then
  //Deleta Batida
  begin
    if MessageDlg('Deseja Apagar Item Selecionado ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
        CDS_Batida.Delete;
     end;
  end;
end;

procedure TF01013.DBGridBeleza2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = 46) then
  //Deleta Batida
  begin
    if MessageDlg('Deseja Apagar Item Selecionado ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
        CDS_Recurso.Delete;
     end;
  end;
end;

procedure TF01013.DSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  //DBGRID TIPO RECURSO
  FDQ_Recurso.ParamByName('id').Value:=(ClientDataSet1idcronometragem.AsInteger);
  DS_Recurso.DataSet.Close;
  DS_Recurso.DataSet.Open;

  //DBGrid Batida
  FDQ_Batida.ParamByName('id').Value:=(ClientDataSet1idcronometragem.AsInteger);
  DS_Batida.DataSet.Close;
  DS_Batida.DataSet.Open;

end;

procedure TF01013.FormCreate(Sender: TObject);
begin
  inherited;
  status := false;
  self.DouBleBuffered := True; //evitar o flick do relógio.
end;

procedure TF01013.FormShow(Sender: TObject);
begin
  inherited;
  BPesquisarClick(Sender);
  BImportar.Enabled := false;
end;

Initialization
  RegisterClass(TF01013);
Finalization
  UnRegisterClass(TF01013);
end.