unit DBNavigatoraf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls;

type
  TDBNavigatoraf = class(TDBNavigator)
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure Paint; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  published
    { Published declarations }
    property Color;
  end;

procedure Register;

implementation

constructor TDBNavigatoraf.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //FComponentStyle := FComponentStyle - [csInheritable];
  VisibleButtons:= [nbFirst, nbPrior, nbnext, nbLast];
  Flat:= true;
end;

procedure TDBNavigatoraf.Paint;
var
  Rect: TRect;
begiN
  Rect := ClientRect;
  //Canvas.Font := Font;
  Canvas.Brush.Color := Color;
  Canvas.FillRect(Rect);
  //DrawText(Canvas.Handle, PChar(Caption), Length(Caption), Rect,
  //  DT_EXPANDTABS or DT_WORDBREAK or DT_LEFT);
end;

procedure Register;
begin
  RegisterComponents('Beleza', [TDBNavigatoraf]);
end;

end.
