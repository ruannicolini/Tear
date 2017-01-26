unit uMsg;

interface

  uses
      Classes, Forms, ExtCtrls, Graphics, Controls, Windows;

  type
      tJanelaMensagem = Class(tObject)

      Private
          f  : tForm;
          lb : tPanel;
          fCor: tColor;
          tt : tTimer;
          procedure CriarTelaMsg;
          procedure TimerFecha(Sender: tObject);
      Public
          procedure Mensagem(Msg : String);
          procedure Liberar;
          constructor Create;
      Published
          property Color : tColor read fCor write fCor default clInfoBk;
  end;


implementation

{ tMsg }

constructor tJanelaMensagem.Create;
begin

end;

procedure tJanelaMensagem.CriarTelaMsg;
begin

    f              := tForm.Create(Nil);
    f.BorderStyle  := bsNone;
    f.FormStyle    := fsStayOnTop;
    f.Left         := 20;
    f.Top          := 20;
    f.Height       := 25;
    f.Width        := 50;

    lb             := tPanel.Create(f);
    lb.Parent      := f;
    lb.Align       := alClient;
    lb.Alignment   := taLeftJustify;
    lb.Font.Name   := 'tahoma';
    lb.Font.Style  := [fsBold];
    lb.Color       := clInfoBk;
    lb.Ctl3D       := False;
    lb.BorderStyle := bsSingle;
    lb.BevelOuter  := bvNone;

    tt             := tTimer.Create(f);
    tt.Enabled     := True;
    tt.Interval    := 2000;
    tt.OnTimer     := TimerFecha;

end;

procedure tJanelaMensagem.Liberar;
begin
    f.Free;
    f := Nil;
end;

procedure tJanelaMensagem.Mensagem(Msg: String);
var Ok : Boolean;
begin

    if f = Nil then
    begin
        Ok := True;
        CriarTelaMsg;
    end
    else Ok := False;

    lb.Caption := Msg;
    lb.Update;

    f.Width := Length(lb.Caption) * 10;

    if Ok then f.Show;

    f.Update;

end;

procedure tJanelaMensagem.TimerFecha(Sender: tObject);
begin
    f.Close;
    f.Free;
    f := Nil;
end;

end.
