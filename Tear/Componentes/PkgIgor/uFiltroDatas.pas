unit uFiltroDatas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, edit_calendario, stdctrls;

type
  tFiltroDatas = class(TPanel)
  private
    { Private declarations }
    EdData : tEdit_Calendario;
    Check  : tCheckBox;
    fCaptionCheck: String;
    fChecked: Boolean;
    fformat_Data: String;
    fsqlquery: String;
    fData1: tDateTime;
    fData2: tDateTime;

    procedure CriarEdData(Ordem : Smallint);
    procedure CriarCheck;
    procedure setCaptionCheck(const Value: String);
    procedure ExitCalendario(Sender : tObject);
    procedure setChecked(const Value: Boolean);
    procedure setformato_Data(const Value: String);
    procedure set_sqlquery(const Value: String);
    procedure setData1(const Value: tDateTime);
    procedure setData2(const Value: tDateTime);
    procedure ClickCheck(Sender: tObject);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor create(Owner : tComponent); override;
  published
    { Published declarations }
    Property CaptionCheck : String read fCaptionCheck write setCaptionCheck;
    Property Checked : Boolean read fChecked write setChecked;
    Property Formato_Data: String read fformat_Data write setformato_Data;
    Property Sql_botao_Pesquisa: String read fsqlquery write set_sqlquery;
    property Data1 : tDateTime read fData1 write setData1;
    property Data2 : tDateTime read fData2 write setData2;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Beleza', [tFiltroDatas]);
end;

{ tFiltroDatas }

procedure tFiltroDatas.ClickCheck(Sender: tObject);
begin
    Checked := Check.Checked;
end;

constructor tFiltroDatas.create(Owner: tComponent);
begin
  inherited;

    Width                 := 210;
    Height                := 40;
    BorderStyle           := bsNone;
    BevelInner            := bvNone;
    BevelOuter            := bvNone;
    Caption               := '';
    CaptionCheck          := 'Data Entre';
    Constraints.MaxHeight := 40;
    Constraints.MinHeight := 40;
    //Constraints.MaxWidth  := 210;
    Constraints.MinWidth  := 210;
    ParentColor           := True;

    CriarCheck;
    CriarEdData(0);
    CriarEdData(1);

    Formato_Data  := 'dd/mm/yyyy';

end;

procedure tFiltroDatas.CriarCheck;
begin

    Check         := TCheckBox.Create(Self);
    Check.Parent  := Self;
    Check.Top     := 1;
    Check.Left    := 3;
    Check.Caption := CaptionCheck;
    Check.Name    := 'Check';
    Check.OnClick := ClickCheck;
    Check.Width   := Width - 10;

end;

procedure tFiltroDatas.CriarEdData(Ordem: Smallint);
begin

    EdData                := TEdit_Calendario.Create(Self);
    EdData.Parent         := Self;
    EdData.Top            := 17;
    EdData.Width          := 100;
    EdData.Left           := (Ordem * 101) + 3;
    EdData.Name           := 'Data' + intToStr(Ordem);
    EdData.formato_data   := Formato_Data;
    EdData.AoValidarData  := ExitCalendario;

end;

procedure tFiltroDatas.ExitCalendario(Sender: tObject);
begin

    if not Checked then Checked := True;

    if TEdit_Calendario(Sender).Name = 'Data0' then
    begin
        Data1 := StrToDate(TEdit_Calendario(Sender).Text);
        TEdit_Calendario(FindComponent('Data1')).SetFocus;
    end
    else if TEdit_Calendario(Sender).Name = 'Data1' then
        Data2 := StrToDate(TEdit_Calendario(Sender).Text);

end;

procedure tFiltroDatas.setCaptionCheck(const Value: String);
begin
  fCaptionCheck := Value;
  TCheckBox(FindComponent('Check')).Caption := fCaptionCheck;
end;

procedure tFiltroDatas.setChecked(const Value: Boolean);
begin
  fChecked      := Value;

end;

procedure tFiltroDatas.setData1(const Value: tDateTime);
begin

  fData1 := Value;

  try
      TEdit_Calendario(FindComponent('Data0')).Data := fData1;
  Except
      ShowMessage('Informe uma Data Válida!');
  end;

end;

procedure tFiltroDatas.setData2(const Value: tDateTime);
begin
  fData2 := Value;

  try
      TEdit_Calendario(FindComponent('Data1')).Data := fData2;
  Except
      ShowMessage('Informe uma Data Válida!');
  end;

end;

procedure tFiltroDatas.setformato_Data(const Value: String);
begin

  fformat_Data := Value;
  TEdit_Calendario(FindComponent('Data0')).Formato_Data := fformat_Data;
  TEdit_Calendario(FindComponent('Data1')).Formato_Data := fformat_Data;

  if fformat_Data = 'dd/mm/yy' then
  begin
      TEdit_Calendario(FindComponent('Data0')).EditMask := '##/##/##';
      TEdit_Calendario(FindComponent('Data1')).EditMask := '##/##/##';
  end
  else if fformat_Data = 'dd/mm/yyyy' then
  begin
      TEdit_Calendario(FindComponent('Data0')).EditMask := '##/##/####';
      TEdit_Calendario(FindComponent('Data1')).EditMask := '##/##/####';
  end;

end;

procedure tFiltroDatas.set_sqlquery(const Value: String);
begin
  fsqlquery := Value;
end;

end.
