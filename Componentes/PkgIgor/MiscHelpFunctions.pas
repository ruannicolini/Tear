unit MiscHelpFunctions;

interface

Uses  GanttUnit,Graphics;



function ItemTypeToComboString(ItemType: TGanttItemDrawStyle): string;
function ComboStringToItemType(ItemType: string): TGanttItemDrawStyle;
Function StringToItemType(ItemType : String) : TGanttItemDrawStyle;
Function ItemTypeToString(ItemType : TGanttItemDrawStyle) : String;

Function StatusTypeToString(ItemType : TGanttItemStatus) : String;
Function StringToStatusType(ItemType : String) : TGanttItemStatus;

function BrushStyleToComboString(ItemType: TBrushStyle): string;
function ComboStringToBrushStyle(ItemType: string): TBrushStyle;
Function StringToBrushStyle(ItemType : String) : TBrushStyle;
Function BrushStyleToString(ItemType : TBrushStyle) : String;


implementation




Function StatusTypeToString(ItemType : TGanttItemStatus) : String;
begin
   case ItemType of
   gsNoActivity     : Result := 'gsNoActivity';
   gsWorkInProgress     : Result := 'gsWorkInProgress';
   gsBenchmark      : Result := 'gsBenchmark';
   gsHeldForResource      : Result := 'gsHeldForResource';
   gsCancelled    : Result := 'gsCancelled';
   gsDeferred : Result := 'gsDeferred';
  end;
end;


Function StringToStatusType(ItemType : String) : TGanttItemStatus;
begin
   if ItemType = 'gsNoActivity' then Result := gsNoActivity;
   if ItemType = 'gsWorkInProgress' then Result := gsWorkInProgress;
   if ItemType = 'gsBenchmark' then Result := gsBenchmark;
   if ItemType = 'gsHeldForResource' then Result := gsHeldForResource;
   if ItemType = 'gsCancelled' then Result := gsCancelled;
   if ItemType = 'gsDeferred' then Result := gsDeferred;
end;






Function ItemTypeToString(ItemType : TGanttItemDrawStyle) : String;
begin
   case ItemType of
   dsBlock     : Result := 'dsBlock';
   dsArrow     : Result := 'dsArrow';
   dsBall      : Result := 'dsBall';
   dsRing      : Result := 'dsRing';
   dsFinish    : Result := 'dsFinish';
   dsBenchMark : Result := 'dsBenchMark';
   dsEnd       : Result := 'dsEnd';
   dsDiaGroup  : Result := 'dsDiaGroup';
   dsPointGroup  : Result := 'dsPointGroup';
   dsShardGroup  : Result := 'dsShardGroup';
  end;
end;

Function StringToItemType(ItemType : String) : TGanttItemDrawStyle;
begin
   if ItemType = 'dsBlock' then Result := dsBlock;
   if ItemType = 'dsArrow' then Result := dsArrow;
   if ItemType = 'dsBall' then Result := dsBall;
   if ItemType = 'dsRing' then Result := dsRing;
   if ItemType = 'dsFinish' then Result := dsFinish;
   if ItemType = 'dsBenchMark' then Result := dsBenchMark;
   if ItemType = 'dsEnd' then Result := dsEnd;
   if ItemType = 'dsDiaGroup' then Result := dsDiaGroup;
   if ItemType = 'dsPointGroup' then Result := dsPointGroup;
   if ItemType = 'dsShardGroup' then Result := dsShardGroup;
end;



Function BrushStyleToString(ItemType : TBrushStyle) : String;
begin
   case ItemType of
   bsSolid     : Result := 'bsSolid';
   bsClear     : Result := 'bsClear';
   bsHorizontal      : Result := 'bsHorizontal';
   bsVertical      : Result := 'bsVertical';
   bsFDiagonal    : Result := 'bsFDiagonal';
   bsBDiagonal : Result := 'bsBDiagonal';
   bsCross : Result := 'bsCross';
   bsDiagCross : Result := 'bsDiagCross';
  end;
end;


Function StringToBrushStyle(ItemType : String) : TBrushStyle;
begin
   if ItemType = 'bsSolid' then Result := bsSolid;
   if ItemType = 'bsClear' then Result := bsClear;
   if ItemType = 'bsHorizontal' then Result := bsHorizontal;
   if ItemType = 'bsVertical' then Result := bsVertical;
   if ItemType = 'bsFDiagonal' then Result := bsFDiagonal;
   if ItemType = 'bsBDiagonal' then Result := bsBDiagonal;
   if ItemType = 'bsCross' then Result := bsCross;
   if ItemType = 'bsDiagCross' then Result := bsDiagCross;
end;




function ItemTypeToComboString(ItemType: TGanttItemDrawStyle): string;
begin
   case ItemType of
      dsBlock: Result := 'Block';
      dsArrow: Result := 'Arrow';
      dsBall: Result := 'Ball';
      dsRing: Result := 'Ring';
      dsFinish: Result := 'Finish';
      dsBenchMark: Result := 'BenchMark';
      dsEnd      : Result := 'End';
      dsDiaGroup  : Result := 'Diamond Group';
      dsPointGroup  : Result := 'Point Group';
      dsShardGroup  : Result := 'Shard Group';
   end;
end;



function ComboStringToItemType(ItemType: string): TGanttItemDrawStyle;
begin
   if ItemType = 'Block' then Result := dsBlock;
   if ItemType = 'Arrow' then Result := dsArrow;
   if ItemType = 'Ball' then Result := dsBall;
   if ItemType = 'Ring' then Result := dsRing;
   if ItemType = 'Finish' then Result := dsFinish;
   if ItemType = 'BenchMark' then Result := dsBenchMark;
   if ItemType = 'End' then Result := dsEnd;
   if ItemType = 'Diamond Group' then Result := dsDiaGroup;
   if ItemType = 'Point Group' then Result := dsPointGroup;
   if ItemType = 'Shard Group' then Result := dsShardGroup;
end;



function BrushStyleToComboString(ItemType: TBrushStyle): string;
begin
   case ItemType of
      bsSolid: Result := 'Solid';
      bsClear: Result := 'Clear';
      bsHorizontal: Result := 'Horizontal';
      bsVertical: Result := 'Vertical';
      bsFDiagonal: Result := 'FDiagonal';
      bsBDiagonal: Result := 'BDiagonal';
      bsCross: Result := 'Cross';
      bsDiagCross: Result := 'DiagCross';
   end;
end;


function ComboStringToBrushStyle(ItemType: string): TBrushStyle;
begin
   if ItemType = 'Solid' then Result := bsSolid;
   if ItemType = 'Clear' then Result := bsClear;
   if ItemType = 'Horizontal' then Result := bsHorizontal;
   if ItemType = 'Vertical' then Result := bsVertical;
   if ItemType = 'FDiagonal' then Result := bsFDiagonal;
   if ItemType = 'BDiagonal' then Result := bsBDiagonal;
   if ItemType = 'Cross' then Result := bsCross;
   if ItemType = 'DiagCross' then Result := bsDiagCross;
end;

end.
 