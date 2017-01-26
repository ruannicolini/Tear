unit uCaixaProgresso;

interface

  uses
    forms, comctrls, controls, stdCtrls, extCtrls, Graphics, Gauges;

  Type
    tCaixaProgresso = class
    private
      Tela : tForm;
      Bar  : tGauge;
      Lb   : tLabel;
      Sh   : tShape;
      FPosicao: Integer;
      procedure SetPosicao(const Value: Integer);
      procedure AtualizarImgObjeto;
    public
      procedure Mostrar(Maximo: Integer);
      procedure Liberar;
      procedure Incrementar;
    protected

    published
      property Posicao: Integer read FPosicao write SetPosicao;
    end;

implementation

{ tCaixaProgresso }

procedure tCaixaProgresso.AtualizarImgObjeto;
begin
  Bar.Update;
  Lb.Update;
  Sh.Update;
end;

procedure tCaixaProgresso.Incrementar;
begin
  Bar.AddProgress(1);
  AtualizarImgObjeto;
end;

procedure tCaixaProgresso.Liberar;
begin
  Tela.Close;
  Tela.Free;
end;

procedure tCaixaProgresso.Mostrar(Maximo: Integer);
begin

  Tela             := TForm.Create(Application);
  Tela.FormStyle   := fsStayOnTop;
  Tela.Caption     := 'Aguarde...';
  Tela.BorderStyle := bsNone;
  Tela.Width       := 200;
  Tela.Height      := 34;
  Tela.Top         := 5;
  Tela.Left        := 5;
  Tela.Color       := clWhite;
  Tela.Font.Name   := 'Trebuchet MS'; //'Tahoma';

  Sh               := tShape.Create(Tela);
  Sh.Parent        := Tela;
  Sh.Align         := alClient;
  Sh.Brush.Style   := bsSolid;
  Sh.Brush.Color   := clWhite; // $00E1FFFF;
  Sh.Pen.Style     := psSolid;
  Sh.Pen.Color     := clSilver;
  Sh.Pen.Width     := 1;

  Lb               := tLabel.Create(Tela);
  Lb.Parent        := Tela;
  Lb.Transparent   := True;
  Lb.Left          := 4;
  Lb.Top           := 2;
  Lb.Caption       := 'Aguarde...';

  Bar              := TGauge.Create(Tela);
  Bar.Parent       := Tela;
  Bar.Width        := Tela.Width - 4;
  Bar.Left         := 2;
  Bar.Top          := 17;
  Bar.Height       := 15;
  Bar.MaxValue     := Maximo;
  Bar.BackColor    := $00E1FFFF;
  Bar.ForeColor    := $00BFDFFF;
  
  Tela.Show;
  
end;

procedure tCaixaProgresso.SetPosicao(const Value: Integer);
begin
  FPosicao     := Value;
  Bar.Progress := fPosicao;
  AtualizarImgObjeto;
end;

end.
