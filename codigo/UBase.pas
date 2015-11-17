unit UBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus, System.ImageList,
  Vcl.ImgList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  DBGridBeleza, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons;

type
  TFBase = class(TForm)
    Panel1: TPanel;
    ImageList1: TImageList;
    DS: TDataSource;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    FDQuery1: TFDQuery;
    PageControl: TPageControl;
    TbDados: TTabSheet;
    grDados: TGroupBox;
    TbFiltros: TTabSheet;
    GBFiltros: TGroupBox;
    DBGridBeleza1: TDBGridBeleza;
    btnInserir: TSpeedButton;
    ActAcoes: TActionList;
    acInserir: TAction;
    acEditar: TAction;
    acExcluir: TAction;
    acSalvar: TAction;
    acCancelar: TAction;
    acPesquisar: TAction;
    acImprimir: TAction;
    acFechar: TAction;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnPesquisar: TSpeedButton;
    btnImpromir: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;

    procedure ClientDataSet1AfterCancel(DataSet: TDataSet);
    procedure ClientDataSet1AfterDelete(DataSet: TDataSet);
    procedure ClientDataSet1AfterInsert(DataSet: TDataSet);
    procedure ClientDataSet1AfterPost(DataSet: TDataSet);
    procedure DSStateChange(Sender: TObject);
    procedure acInserirExecute(Sender: TObject);
    procedure acEditarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acPesquisarExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ClientDataSet1BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
    procedure StatusBotoes (e : integer);
  public
    { Public declarations }
    function CorCamposOnlyRead():TColor;
  end;

var
  FBase: TFBase;

implementation

{$R *.dfm}


procedure TFBase.acCancelarExecute(Sender: TObject);
begin
if (Application.MessageBox('Deseja Cancelar ', 'Cancelar', MB_YESNO + MB_ICONQUESTION )= id_yes) then
    begin
        ds.DataSet.Cancel;
    end;
end;

procedure TFBase.acEditarExecute(Sender: TObject);
begin
if ds.DataSet.Active then
    begin
        if not ds.DataSet.IsEmpty then
        begin
            ds.DataSet.Edit;
            PageControl.ActivePageIndex := 0;
        end else
            ShowMessage('Não Há Registros para Alteração.');
    end;
end;

procedure TFBase.acExcluirExecute(Sender: TObject);
begin
if ds.DataSet.Active then
  begin
    if not ds.DataSet.IsEmpty then
    begin
        if (Application.MessageBox('Deseja Deletar ', 'Deletar', MB_YESNO + MB_ICONQUESTION) = id_yes) then
        begin
          ds.DataSet.Delete;
        end;
    end
    else
        ShowMessage('Não Há registros');
  end;
end;

procedure TFBase.acInserirExecute(Sender: TObject);
begin
if not ds.DataSet.Active then
        ds.DataSet.Open;

    PageControl.ActivePageIndex := 0;
    ds.DataSet.Append;


end;

procedure TFBase.acPesquisarExecute(Sender: TObject);
begin
DS.DataSet.Close;
DS.DataSet.Open;
end;

procedure TFBase.acSalvarExecute(Sender: TObject);
begin
DS.DataSet.Post;
end;

procedure TFBase.Action1Execute(Sender: TObject);
begin
DS.DataSet.First;
end;

procedure TFBase.Action2Execute(Sender: TObject);
begin
DS.DataSet.Last;
end;

procedure TFBase.Action3Execute(Sender: TObject);
begin
DS.DataSet.Prior;
end;

procedure TFBase.Action4Execute(Sender: TObject);
begin
DS.DataSet.Next;
end;

procedure TFBase.ClientDataSet1AfterCancel(DataSet: TDataSet);
begin
 ClientDataSet1.CancelUpdates;
end;

procedure TFBase.ClientDataSet1AfterDelete(DataSet: TDataSet);
begin
  ClientDataSet1.ApplyUpdates(-1);
end;

procedure TFBase.ClientDataSet1AfterInsert(DataSet: TDataSet);
begin
    {Toda tela tem um codigo com parametro diferente.  >> SEQUENCIAL <<}
end;

procedure TFBase.ClientDataSet1AfterPost(DataSet: TDataSet);
begin
  ClientDataSet1.ApplyUpdates(-1);
end;


procedure TFBase.ClientDataSet1BeforeInsert(DataSet: TDataSet);
var i : integer;
begin

 TClientDataSet( dataset).IndexFieldNames := '';

  for i := 0 to TClientDataSet(DataSet).IndexDefs.Count - 1 do
  begin
    TClientDataSet(DataSet).IndexDefs.delete(i);
  end;
end;

function TFBase.CorCamposOnlyRead: TColor;
begin
  Result := $009393FF;
end;

procedure TFBase.DSStateChange(Sender: TObject);
begin
    tbFiltros.TabVisible := ds.DataSet.State in [dsBrowse, dsInactive];
    grDados.Enabled      := ds.DataSet.State in dsEditModes;

    if ds.DataSet.State in dsEditModes then
      StatusBotoes(1)
    else
      StatusBotoes(2);
end;

procedure TFBase.FormShow(Sender: TObject);
begin
  btnPesquisar.Click;
end;

procedure TFBase.StatusBotoes(e: integer);
begin
//

  acSalvar.Enabled := e=1;
  acCancelar.Enabled := e=1;

  Action3.Enabled := (e=2) and not (DS.DataSet.IsEmpty);
  Action4.Enabled := (e=2) and not (DS.DataSet.IsEmpty);
  Action1.Enabled := (e=2) and not (DS.DataSet.IsEmpty);
  Action2.Enabled := (e=2) and not (DS.DataSet.IsEmpty);

  acInserir.Enabled := e=2;
  acExcluir.Enabled := (e=2) and not (DS.DataSet.IsEmpty);
  acEditar.Enabled := (e=2) and not (DS.DataSet.IsEmpty);
  acPesquisar.Enabled := e=2;
end;

end.
