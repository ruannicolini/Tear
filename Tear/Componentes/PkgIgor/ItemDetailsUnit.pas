{-----------------------------------------------------------------------------
 Unit Name: ItemDetailsUnit
 Author:    paul fisher
 Purpose:
 History:
-----------------------------------------------------------------------------}


unit ItemDetailsUnit;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ExtCtrls, Spin, GanttUnit, ComCtrls, ExtDlgs;

type
   TItemDetailsForm = class(TForm)
      Panel1: TPanel;
      Panel2: TPanel;
      Button1: TButton;
      Button2: TButton;
      ItemNameEdit: TEdit;
      Label1: TLabel;
      Label2: TLabel;
      StyleComboBox: TComboBox;
      Label3: TLabel;
      ItemColorBox: TColorBox;
      Label4: TLabel;
      FillComboBox: TComboBox;
      StartDateEdit: TDateTimePicker;
      Label5: TLabel;
      LengthSpinEdit: TSpinEdit;
      Label6: TLabel;
      PenColorBox: TColorBox;
      Label7: TLabel;
    hardCheckBox: TCheckBox;
    StatusComboBox: TComboBox;
    Label8: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    Label9: TLabel;
    percentSpinEdit: TSpinEdit;
   private
    { Private declarations }
   public
    { Public declarations }
      function EditDetails(var Item: TGanttItem): Boolean;
   end;

var
   ItemDetailsForm: TItemDetailsForm;

implementation

{$R *.dfm}

uses MiscHelpFunctions;




function TItemDetailsForm.EditDetails(var Item: TGanttItem): Boolean;
begin
   Result := False;
   ItemNameEdit.Text := Item.ItemName;
   StyleCombobox.Text := ItemTypeToComboString(Item.ItemType);
   StatusCombobox.Text := StatusTypeToString(Item.ItemStatus);
   PercentSpinEdit.Value := Item.PercentCompleted;
   ItemColorBox.Selected := Item.ItemBrush.Color;
   PenColorBox.Selected := Item.ItemPen.Color;
   FillComboBox.Text := BrushStyleToComboString(Item.ItemBrush.Style);
   StartDateEdit.DateTime := Item.StartDate;
   LengthSpinEdit.Value := Item.Days;
   Hardcheckbox.Checked := Item.ItemHardLink;
   if showmodal = mrOK then
   begin
      Item.ItemName := ItemNameEdit.Text;
      Item.ItemType := ComboStringToItemType(StyleCombobox.Text);
      Item.ItemStatus := StringToStatusType(StatusCombobox.Text);
      Item.PercentCompleted := PercentSpinEdit.Value;
      Item.ItemBrush.Color := ItemColorBox.Selected;
      Item.ItemPen.Color := PenColorBox.Selected;
      Item.ItemBrush.Style := ComboStringToBrushStyle(FillComboBox.Text);
      Item.StartDate := StartDateEdit.DateTime;
      Item.Days := LengthSpinEdit.Value;
      Item.ItemHardLink := Hardcheckbox.Checked;
      Result := True;
   end;
   close;
end;



end.
