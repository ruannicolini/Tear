unit U02004;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Datasnap.DBClient, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, DBGridBeleza,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TF02004 = class(TFBase)
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    SpeedButton1: TSpeedButton;
    Panel5: TPanel;
    PanelLinhadeProducao: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    Panel8: TPanel;
    ProgressBar1: TProgressBar;
    Image1: TImage;
    Panel9: TPanel;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Panel : TPANEL;
    ProgressBar : TProgressBar;
    procedure montaPanelLinhaDeProducao();
  end;

var
  F02004: TF02004;

implementation

{$R *.dfm}

procedure TF02004.montaPanelLinhaDeProducao;
var
numOperacoes, numOperadores, numFilas, quebraFila :integer;
begin
  //

end;

procedure TF02004.SpeedButton1Click(Sender: TObject);
var
i : integer;
begin
  inherited;

  //apaga os paineis dentro do scrollbox
  ScrollBox1.DestroyComponents;

  i:= 0;
  while i<10 do
  begin
    //cria painel de operações
    //OBS: O SCROLLBOX SEMPRE ADD O NOVO PANEL EM CIMA
    panel := TPanel.Create(ScrollBox1);
    panel.Parent := ScrollBox1;
    panel.Align := alTop;
    panel.Tag := i;
    panel.Caption := inttostr(i);
    panel.Height := 60;
    panel.AlignWithMargins := true;
    panel.Margins.Top := 5;
    panel.Margins.Bottom := 0;
    panel.Color := $00EAE9E8;
    panel.BevelInner := bvLowered;
    panel.ParentBackground := false;

    //ProgressBar do Panel
    ProgressBar := TProgressBar.Create(panel);
    ProgressBar.Parent := Panel;
    ProgressBar.Align := alBottom;
    ProgressBar.Smooth := true;
    ProgressBar.Height := 7;
    ProgressBar.Position := i * 10;

    i := i+1;
  end;

  //Monta PanelLinhadeProducao
end;

Initialization
  RegisterClass(TF02004);
Finalization
  UnRegisterClass(TF02004);
end.
