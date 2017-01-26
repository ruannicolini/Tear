
{*******************************************************************}
{                                                                   }
{                      Delphi XML Data Binding                      }
{                                                                   }
{         Generated on: 20/04/2007 10:56:42                         }
{       Generated from: D:\Fish Soft\Gantt Creator\GanttModel.xml   }
{   Settings stored in: D:\Fish Soft\Gantt Creator\GanttModel.xdb   }
{                                                                   }
{*******************************************************************}
unit GanttDataBinder3;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLRoot_ElementType = interface;
  IXMLGantt_ChartType = interface;
  IXMLGantt_Chart_DetailsType = interface;
  IXMLGantt_ProjectsType = interface;
  IXMLGantt_ProjectType = interface;
  IXMLGantt_Project_ItemsType = interface;
  IXMLProject_ItemType = interface;
  IXMLItem_BrushType = interface;
  IXMLItem_PenType = interface;
  IXMLItem_LinkType = interface;

{ IXMLRoot_ElementType }

  IXMLRoot_ElementType = interface(IXMLNode)
    ['{0197FE8E-8C86-49A3-ABF3-929975CB8E2F}']
    { Property Accessors }
    function Get_Gantt_Chart: IXMLGantt_ChartType;
    { Methods & Properties }
    property Gantt_Chart: IXMLGantt_ChartType read Get_Gantt_Chart;
  end;

{ IXMLGantt_ChartType }

  IXMLGantt_ChartType = interface(IXMLNode)
    ['{68D48272-6325-4A95-94B1-875DB6AE7CB0}']
    { Property Accessors }
    function Get_Gantt_Chart_Details: IXMLGantt_Chart_DetailsType;
    function Get_Gantt_Projects: IXMLGantt_ProjectsType;
    { Methods & Properties }
    property Gantt_Chart_Details: IXMLGantt_Chart_DetailsType read Get_Gantt_Chart_Details;
    property Gantt_Projects: IXMLGantt_ProjectsType read Get_Gantt_Projects;
  end;

{ IXMLGantt_Chart_DetailsType }

  IXMLGantt_Chart_DetailsType = interface(IXMLNode)
    ['{2DAC9625-4E04-44D6-B364-E126C5673879}']
    { Property Accessors }
    function Get_Gantt_Title: WideString;
    function Get_Start_Month: Integer;
    function Get_Number_of_Months: Integer;
    function Get_Project_Title_Colour: WideString;
    function Get_Project_Height: Integer;
    function Get_Day_Width: Integer;
    function Get_Shadow_Colour: WideString;
    function Get_Gantt_Version: WideString;
    procedure Set_Gantt_Title(Value: WideString);
    procedure Set_Start_Month(Value: Integer);
    procedure Set_Number_of_Months(Value: Integer);
    procedure Set_Project_Title_Colour(Value: WideString);
    procedure Set_Project_Height(Value: Integer);
    procedure Set_Day_Width(Value: Integer);
    procedure Set_Shadow_Colour(Value: WideString);
    procedure Set_Gantt_Version(Value: WideString);
    { Methods & Properties }
    property Gantt_Title: WideString read Get_Gantt_Title write Set_Gantt_Title;
    property Start_Month: Integer read Get_Start_Month write Set_Start_Month;
    property Number_of_Months: Integer read Get_Number_of_Months write Set_Number_of_Months;
    property Project_Title_Colour: WideString read Get_Project_Title_Colour write Set_Project_Title_Colour;
    property Project_Height: Integer read Get_Project_Height write Set_Project_Height;
    property Day_Width: Integer read Get_Day_Width write Set_Day_Width;
    property Shadow_Colour: WideString read Get_Shadow_Colour write Set_Shadow_Colour;
    property Gantt_Version: WideString read Get_Gantt_Version write Set_Gantt_Version;
  end;

{ IXMLGantt_ProjectsType }

  IXMLGantt_ProjectsType = interface(IXMLNodeCollection)
    ['{0707B6F5-324C-4DA6-B734-BA68C0408EC5}']
    { Property Accessors }
    function Get_Gantt_Project(Index: Integer): IXMLGantt_ProjectType;
    { Methods & Properties }
    function Add: IXMLGantt_ProjectType;
    function Insert(const Index: Integer): IXMLGantt_ProjectType;
    property Gantt_Project[Index: Integer]: IXMLGantt_ProjectType read Get_Gantt_Project; default;
  end;

{ IXMLGantt_ProjectType }

  IXMLGantt_ProjectType = interface(IXMLNode)
    ['{EAAB338F-D8B4-4D89-BC71-B4F49300F0F4}']
    { Property Accessors }
    function Get_Gantt_Project_Name: WideString;
    function Get_Gantt_Project_Resource1: WideString;
    function Get_Gantt_Project_Resource2: WideString;
    function Get_Gantt_Project_Items: IXMLGantt_Project_ItemsType;
    procedure Set_Gantt_Project_Name(Value: WideString);
    procedure Set_Gantt_Project_Resource1(Value: WideString);
    procedure Set_Gantt_Project_Resource2(Value: WideString);
    { Methods & Properties }
    property Gantt_Project_Name: WideString read Get_Gantt_Project_Name write Set_Gantt_Project_Name;
    property Gantt_Project_Resource1: WideString read Get_Gantt_Project_Resource1 write Set_Gantt_Project_Resource1;
    property Gantt_Project_Resource2: WideString read Get_Gantt_Project_Resource2 write Set_Gantt_Project_Resource2;
    property Gantt_Project_Items: IXMLGantt_Project_ItemsType read Get_Gantt_Project_Items;
  end;

{ IXMLGantt_Project_ItemsType }

  IXMLGantt_Project_ItemsType = interface(IXMLNodeCollection)
    ['{104892A3-9DDE-4700-B5BB-BC0BDC389FF1}']
    { Property Accessors }
    function Get_Project_Item(Index: Integer): IXMLProject_ItemType;
    { Methods & Properties }
    function Add: IXMLProject_ItemType;
    function Insert(const Index: Integer): IXMLProject_ItemType;
    property Project_Item[Index: Integer]: IXMLProject_ItemType read Get_Project_Item; default;
  end;

{ IXMLProject_ItemType }

  IXMLProject_ItemType = interface(IXMLNode)
    ['{20A0AB91-EC5C-4F33-B34C-3BA6438D3848}']
    { Property Accessors }
    function Get_Item_Name: WideString;
    function Get_Item_Type: WideString;
    function Get_Item_Status: WideString;
    function Get_Item_Percent_Completed: Integer;
    function Get_Item_Colour: WideString;
    function Get_Item_Start_Date: WideString;
    function Get_Item_Days: Integer;
    function Get_Item_Brush: IXMLItem_BrushType;
    function Get_Item_Pen: IXMLItem_PenType;
    function Get_Item_Link: IXMLItem_LinkType;
    procedure Set_Item_Name(Value: WideString);
    procedure Set_Item_Type(Value: WideString);
    procedure Set_Item_Status(Value: WideString);
    procedure Set_Item_Percent_Completed(Value: Integer);
    procedure Set_Item_Colour(Value: WideString);
    procedure Set_Item_Start_Date(Value: WideString);
    procedure Set_Item_Days(Value: Integer);
    { Methods & Properties }
    property Item_Name: WideString read Get_Item_Name write Set_Item_Name;
    property Item_Type: WideString read Get_Item_Type write Set_Item_Type;
    property Item_Status: WideString read Get_Item_Status write Set_Item_Status;
    property Item_Percent_Completed: Integer read Get_Item_Percent_Completed write Set_Item_Percent_Completed;
    property Item_Colour: WideString read Get_Item_Colour write Set_Item_Colour;
    property Item_Start_Date: WideString read Get_Item_Start_Date write Set_Item_Start_Date;
    property Item_Days: Integer read Get_Item_Days write Set_Item_Days;
    property Item_Brush: IXMLItem_BrushType read Get_Item_Brush;
    property Item_Pen: IXMLItem_PenType read Get_Item_Pen;
    property Item_Link: IXMLItem_LinkType read Get_Item_Link;
  end;

{ IXMLItem_BrushType }

  IXMLItem_BrushType = interface(IXMLNode)
    ['{888A4162-95E5-443F-BC47-AB8AB5BFC99D}']
    { Property Accessors }
    function Get_Item_Brush_Colour: WideString;
    function Get_Item_Brush_Style: WideString;
    procedure Set_Item_Brush_Colour(Value: WideString);
    procedure Set_Item_Brush_Style(Value: WideString);
    { Methods & Properties }
    property Item_Brush_Colour: WideString read Get_Item_Brush_Colour write Set_Item_Brush_Colour;
    property Item_Brush_Style: WideString read Get_Item_Brush_Style write Set_Item_Brush_Style;
  end;

{ IXMLItem_PenType }

  IXMLItem_PenType = interface(IXMLNode)
    ['{ED1BB30F-0718-4CB7-BCF2-5836FFD712DD}']
    { Property Accessors }
    function Get_Item_Pen_Colour: WideString;
    function Get_Item_Pen_Size: Integer;
    procedure Set_Item_Pen_Colour(Value: WideString);
    procedure Set_Item_Pen_Size(Value: Integer);
    { Methods & Properties }
    property Item_Pen_Colour: WideString read Get_Item_Pen_Colour write Set_Item_Pen_Colour;
    property Item_Pen_Size: Integer read Get_Item_Pen_Size write Set_Item_Pen_Size;
  end;

{ IXMLItem_LinkType }

  IXMLItem_LinkType = interface(IXMLNode)
    ['{D19A95AB-6C78-47BA-AE04-E061699FC80C}']
    { Property Accessors }
    function Get_Project_ID: Integer;
    function Get_Item_ID: Integer;
    procedure Set_Project_ID(Value: Integer);
    procedure Set_Item_ID(Value: Integer);
    { Methods & Properties }
    property Project_ID: Integer read Get_Project_ID write Set_Project_ID;
    property Item_ID: Integer read Get_Item_ID write Set_Item_ID;
  end;

{ Forward Decls }

  TXMLRoot_ElementType = class;
  TXMLGantt_ChartType = class;
  TXMLGantt_Chart_DetailsType = class;
  TXMLGantt_ProjectsType = class;
  TXMLGantt_ProjectType = class;
  TXMLGantt_Project_ItemsType = class;
  TXMLProject_ItemType = class;
  TXMLItem_BrushType = class;
  TXMLItem_PenType = class;
  TXMLItem_LinkType = class;

{ TXMLRoot_ElementType }

  TXMLRoot_ElementType = class(TXMLNode, IXMLRoot_ElementType)
  protected
    { IXMLRoot_ElementType }
    function Get_Gantt_Chart: IXMLGantt_ChartType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLGantt_ChartType }

  TXMLGantt_ChartType = class(TXMLNode, IXMLGantt_ChartType)
  protected
    { IXMLGantt_ChartType }
    function Get_Gantt_Chart_Details: IXMLGantt_Chart_DetailsType;
    function Get_Gantt_Projects: IXMLGantt_ProjectsType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLGantt_Chart_DetailsType }

  TXMLGantt_Chart_DetailsType = class(TXMLNode, IXMLGantt_Chart_DetailsType)
  protected
    { IXMLGantt_Chart_DetailsType }
    function Get_Gantt_Title: WideString;
    function Get_Start_Month: Integer;
    function Get_Number_of_Months: Integer;
    function Get_Project_Title_Colour: WideString;
    function Get_Project_Height: Integer;
    function Get_Day_Width: Integer;
    function Get_Shadow_Colour: WideString;
    function Get_Gantt_Version: WideString;
    procedure Set_Gantt_Title(Value: WideString);
    procedure Set_Start_Month(Value: Integer);
    procedure Set_Number_of_Months(Value: Integer);
    procedure Set_Project_Title_Colour(Value: WideString);
    procedure Set_Project_Height(Value: Integer);
    procedure Set_Day_Width(Value: Integer);
    procedure Set_Shadow_Colour(Value: WideString);
    procedure Set_Gantt_Version(Value: WideString);
  end;

{ TXMLGantt_ProjectsType }

  TXMLGantt_ProjectsType = class(TXMLNodeCollection, IXMLGantt_ProjectsType)
  protected
    { IXMLGantt_ProjectsType }
    function Get_Gantt_Project(Index: Integer): IXMLGantt_ProjectType;
    function Add: IXMLGantt_ProjectType;
    function Insert(const Index: Integer): IXMLGantt_ProjectType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLGantt_ProjectType }

  TXMLGantt_ProjectType = class(TXMLNode, IXMLGantt_ProjectType)
  protected
    { IXMLGantt_ProjectType }
    function Get_Gantt_Project_Name: WideString;
    function Get_Gantt_Project_Resource1: WideString;
    function Get_Gantt_Project_Resource2: WideString;
    function Get_Gantt_Project_Items: IXMLGantt_Project_ItemsType;
    procedure Set_Gantt_Project_Name(Value: WideString);
    procedure Set_Gantt_Project_Resource1(Value: WideString);
    procedure Set_Gantt_Project_Resource2(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLGantt_Project_ItemsType }

  TXMLGantt_Project_ItemsType = class(TXMLNodeCollection, IXMLGantt_Project_ItemsType)
  protected
    { IXMLGantt_Project_ItemsType }
    function Get_Project_Item(Index: Integer): IXMLProject_ItemType;
    function Add: IXMLProject_ItemType;
    function Insert(const Index: Integer): IXMLProject_ItemType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLProject_ItemType }

  TXMLProject_ItemType = class(TXMLNode, IXMLProject_ItemType)
  protected
    { IXMLProject_ItemType }
    function Get_Item_Name: WideString;
    function Get_Item_Type: WideString;
    function Get_Item_Status: WideString;
    function Get_Item_Percent_Completed: Integer;
    function Get_Item_Colour: WideString;
    function Get_Item_Start_Date: WideString;
    function Get_Item_Days: Integer;
    function Get_Item_Brush: IXMLItem_BrushType;
    function Get_Item_Pen: IXMLItem_PenType;
    function Get_Item_Link: IXMLItem_LinkType;
    procedure Set_Item_Name(Value: WideString);
    procedure Set_Item_Type(Value: WideString);
    procedure Set_Item_Status(Value: WideString);
    procedure Set_Item_Percent_Completed(Value: Integer);
    procedure Set_Item_Colour(Value: WideString);
    procedure Set_Item_Start_Date(Value: WideString);
    procedure Set_Item_Days(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLItem_BrushType }

  TXMLItem_BrushType = class(TXMLNode, IXMLItem_BrushType)
  protected
    { IXMLItem_BrushType }
    function Get_Item_Brush_Colour: WideString;
    function Get_Item_Brush_Style: WideString;
    procedure Set_Item_Brush_Colour(Value: WideString);
    procedure Set_Item_Brush_Style(Value: WideString);
  end;

{ TXMLItem_PenType }

  TXMLItem_PenType = class(TXMLNode, IXMLItem_PenType)
  protected
    { IXMLItem_PenType }
    function Get_Item_Pen_Colour: WideString;
    function Get_Item_Pen_Size: Integer;
    procedure Set_Item_Pen_Colour(Value: WideString);
    procedure Set_Item_Pen_Size(Value: Integer);
  end;

{ TXMLItem_LinkType }

  TXMLItem_LinkType = class(TXMLNode, IXMLItem_LinkType)
  protected
    { IXMLItem_LinkType }
    function Get_Project_ID: Integer;
    function Get_Item_ID: Integer;
    procedure Set_Project_ID(Value: Integer);
    procedure Set_Item_ID(Value: Integer);
  end;

{ Global Functions }

function GetRoot_Element(Doc: IXMLDocument): IXMLRoot_ElementType;
function LoadRoot_Element(const FileName: WideString): IXMLRoot_ElementType;
function NewRoot_Element: IXMLRoot_ElementType;

implementation

{ Global Functions }

function GetRoot_Element(Doc: IXMLDocument): IXMLRoot_ElementType;
begin
  Result := Doc.GetDocBinding('Root_Element', TXMLRoot_ElementType) as IXMLRoot_ElementType;
end;
function LoadRoot_Element(const FileName: WideString): IXMLRoot_ElementType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Root_Element', TXMLRoot_ElementType) as IXMLRoot_ElementType;
end;

function NewRoot_Element: IXMLRoot_ElementType;
begin
  Result := NewXMLDocument.GetDocBinding('Root_Element', TXMLRoot_ElementType) as IXMLRoot_ElementType;
end;

{ TXMLRoot_ElementType }

procedure TXMLRoot_ElementType.AfterConstruction;
begin
  RegisterChildNode('Gantt_Chart', TXMLGantt_ChartType);
  inherited;
end;

function TXMLRoot_ElementType.Get_Gantt_Chart: IXMLGantt_ChartType;
begin
  Result := ChildNodes['Gantt_Chart'] as IXMLGantt_ChartType;
end;

{ TXMLGantt_ChartType }

procedure TXMLGantt_ChartType.AfterConstruction;
begin
  RegisterChildNode('Gantt_Chart_Details', TXMLGantt_Chart_DetailsType);
  RegisterChildNode('Gantt_Projects', TXMLGantt_ProjectsType);
  inherited;
end;

function TXMLGantt_ChartType.Get_Gantt_Chart_Details: IXMLGantt_Chart_DetailsType;
begin
  Result := ChildNodes['Gantt_Chart_Details'] as IXMLGantt_Chart_DetailsType;
end;

function TXMLGantt_ChartType.Get_Gantt_Projects: IXMLGantt_ProjectsType;
begin
  Result := ChildNodes['Gantt_Projects'] as IXMLGantt_ProjectsType;
end;

{ TXMLGantt_Chart_DetailsType }

function TXMLGantt_Chart_DetailsType.Get_Gantt_Title: WideString;
begin
  Result := ChildNodes['Gantt_Title'].Text;
end;

procedure TXMLGantt_Chart_DetailsType.Set_Gantt_Title(Value: WideString);
begin
  ChildNodes['Gantt_Title'].NodeValue := Value;
end;

function TXMLGantt_Chart_DetailsType.Get_Start_Month: Integer;
begin
  Result := ChildNodes['Start_Month'].NodeValue;
end;

procedure TXMLGantt_Chart_DetailsType.Set_Start_Month(Value: Integer);
begin
  ChildNodes['Start_Month'].NodeValue := Value;
end;

function TXMLGantt_Chart_DetailsType.Get_Number_of_Months: Integer;
begin
  Result := ChildNodes['Number_of_Months'].NodeValue;
end;

procedure TXMLGantt_Chart_DetailsType.Set_Number_of_Months(Value: Integer);
begin
  ChildNodes['Number_of_Months'].NodeValue := Value;
end;

function TXMLGantt_Chart_DetailsType.Get_Project_Title_Colour: WideString;
begin
  Result := ChildNodes['Project_Title_Colour'].Text;
end;

procedure TXMLGantt_Chart_DetailsType.Set_Project_Title_Colour(Value: WideString);
begin
  ChildNodes['Project_Title_Colour'].NodeValue := Value;
end;

function TXMLGantt_Chart_DetailsType.Get_Project_Height: Integer;
begin
  Result := ChildNodes['Project_Height'].NodeValue;
end;

procedure TXMLGantt_Chart_DetailsType.Set_Project_Height(Value: Integer);
begin
  ChildNodes['Project_Height'].NodeValue := Value;
end;

function TXMLGantt_Chart_DetailsType.Get_Day_Width: Integer;
begin
  Result := ChildNodes['Day_Width'].NodeValue;
end;

procedure TXMLGantt_Chart_DetailsType.Set_Day_Width(Value: Integer);
begin
  ChildNodes['Day_Width'].NodeValue := Value;
end;

function TXMLGantt_Chart_DetailsType.Get_Shadow_Colour: WideString;
begin
  Result := ChildNodes['Shadow_Colour'].Text;
end;

procedure TXMLGantt_Chart_DetailsType.Set_Shadow_Colour(Value: WideString);
begin
  ChildNodes['Shadow_Colour'].NodeValue := Value;
end;

function TXMLGantt_Chart_DetailsType.Get_Gantt_Version: WideString;
begin
  Result := ChildNodes['Gantt_Version'].Text;
end;

procedure TXMLGantt_Chart_DetailsType.Set_Gantt_Version(Value: WideString);
begin
  ChildNodes['Gantt_Version'].NodeValue := Value;
end;

{ TXMLGantt_ProjectsType }

procedure TXMLGantt_ProjectsType.AfterConstruction;
begin
  RegisterChildNode('Gantt_Project', TXMLGantt_ProjectType);
  ItemTag := 'Gantt_Project';
  ItemInterface := IXMLGantt_ProjectType;
  inherited;
end;

function TXMLGantt_ProjectsType.Get_Gantt_Project(Index: Integer): IXMLGantt_ProjectType;
begin
  Result := List[Index] as IXMLGantt_ProjectType;
end;

function TXMLGantt_ProjectsType.Add: IXMLGantt_ProjectType;
begin
  Result := AddItem(-1) as IXMLGantt_ProjectType;
end;

function TXMLGantt_ProjectsType.Insert(const Index: Integer): IXMLGantt_ProjectType;
begin
  Result := AddItem(Index) as IXMLGantt_ProjectType;
end;


{ TXMLGantt_ProjectType }

procedure TXMLGantt_ProjectType.AfterConstruction;
begin
  RegisterChildNode('Gantt_Project_Items', TXMLGantt_Project_ItemsType);
  inherited;
end;

function TXMLGantt_ProjectType.Get_Gantt_Project_Name: WideString;
begin
  Result := ChildNodes['Gantt_Project_Name'].Text;
end;

procedure TXMLGantt_ProjectType.Set_Gantt_Project_Name(Value: WideString);
begin
  ChildNodes['Gantt_Project_Name'].NodeValue := Value;
end;

function TXMLGantt_ProjectType.Get_Gantt_Project_Resource1: WideString;
begin
  Result := ChildNodes['Gantt_Project_Resource1'].Text;
end;

procedure TXMLGantt_ProjectType.Set_Gantt_Project_Resource1(Value: WideString);
begin
  ChildNodes['Gantt_Project_Resource1'].NodeValue := Value;
end;

function TXMLGantt_ProjectType.Get_Gantt_Project_Resource2: WideString;
begin
  Result := ChildNodes['Gantt_Project_Resource2'].Text;
end;

procedure TXMLGantt_ProjectType.Set_Gantt_Project_Resource2(Value: WideString);
begin
  ChildNodes['Gantt_Project_Resource2'].NodeValue := Value;
end;

function TXMLGantt_ProjectType.Get_Gantt_Project_Items: IXMLGantt_Project_ItemsType;
begin
  Result := ChildNodes['Gantt_Project_Items'] as IXMLGantt_Project_ItemsType;
end;

{ TXMLGantt_Project_ItemsType }

procedure TXMLGantt_Project_ItemsType.AfterConstruction;
begin
  RegisterChildNode('Project_Item', TXMLProject_ItemType);
  ItemTag := 'Project_Item';
  ItemInterface := IXMLProject_ItemType;
  inherited;
end;

function TXMLGantt_Project_ItemsType.Get_Project_Item(Index: Integer): IXMLProject_ItemType;
begin
  Result := List[Index] as IXMLProject_ItemType;
end;

function TXMLGantt_Project_ItemsType.Add: IXMLProject_ItemType;
begin
  Result := AddItem(-1) as IXMLProject_ItemType;
end;

function TXMLGantt_Project_ItemsType.Insert(const Index: Integer): IXMLProject_ItemType;
begin
  Result := AddItem(Index) as IXMLProject_ItemType;
end;


{ TXMLProject_ItemType }

procedure TXMLProject_ItemType.AfterConstruction;
begin
  RegisterChildNode('Item_Brush', TXMLItem_BrushType);
  RegisterChildNode('Item_Pen', TXMLItem_PenType);
  RegisterChildNode('Item_Link', TXMLItem_LinkType);
  inherited;
end;

function TXMLProject_ItemType.Get_Item_Name: WideString;
begin
  Result := ChildNodes['Item_Name'].Text;
end;

procedure TXMLProject_ItemType.Set_Item_Name(Value: WideString);
begin
  ChildNodes['Item_Name'].NodeValue := Value;
end;

function TXMLProject_ItemType.Get_Item_Type: WideString;
begin
  Result := ChildNodes['Item_Type'].Text;
end;

procedure TXMLProject_ItemType.Set_Item_Type(Value: WideString);
begin
  ChildNodes['Item_Type'].NodeValue := Value;
end;

function TXMLProject_ItemType.Get_Item_Status: WideString;
begin
  Result := ChildNodes['Item_Status'].Text;
end;

procedure TXMLProject_ItemType.Set_Item_Status(Value: WideString);
begin
  ChildNodes['Item_Status'].NodeValue := Value;
end;

function TXMLProject_ItemType.Get_Item_Percent_Completed: Integer;
begin
  Result := ChildNodes['Item_Percent_Completed'].NodeValue;
end;

procedure TXMLProject_ItemType.Set_Item_Percent_Completed(Value: Integer);
begin
  ChildNodes['Item_Percent_Completed'].NodeValue := Value;
end;

function TXMLProject_ItemType.Get_Item_Colour: WideString;
begin
  Result := ChildNodes['Item_Colour'].Text;
end;

procedure TXMLProject_ItemType.Set_Item_Colour(Value: WideString);
begin
  ChildNodes['Item_Colour'].NodeValue := Value;
end;

function TXMLProject_ItemType.Get_Item_Start_Date: WideString;
begin
  Result := ChildNodes['Item_Start_Date'].Text;
end;

procedure TXMLProject_ItemType.Set_Item_Start_Date(Value: WideString);
begin
  ChildNodes['Item_Start_Date'].NodeValue := Value;
end;

function TXMLProject_ItemType.Get_Item_Days: Integer;
begin
  Result := ChildNodes['Item_Days'].NodeValue;
end;

procedure TXMLProject_ItemType.Set_Item_Days(Value: Integer);
begin
  ChildNodes['Item_Days'].NodeValue := Value;
end;

function TXMLProject_ItemType.Get_Item_Brush: IXMLItem_BrushType;
begin
  Result := ChildNodes['Item_Brush'] as IXMLItem_BrushType;
end;

function TXMLProject_ItemType.Get_Item_Pen: IXMLItem_PenType;
begin
  Result := ChildNodes['Item_Pen'] as IXMLItem_PenType;
end;

function TXMLProject_ItemType.Get_Item_Link: IXMLItem_LinkType;
begin
  Result := ChildNodes['Item_Link'] as IXMLItem_LinkType;
end;

{ TXMLItem_BrushType }

function TXMLItem_BrushType.Get_Item_Brush_Colour: WideString;
begin
  Result := ChildNodes['Item_Brush_Colour'].Text;
end;

procedure TXMLItem_BrushType.Set_Item_Brush_Colour(Value: WideString);
begin
  ChildNodes['Item_Brush_Colour'].NodeValue := Value;
end;

function TXMLItem_BrushType.Get_Item_Brush_Style: WideString;
begin
  Result := ChildNodes['Item_Brush_Style'].Text;
end;

procedure TXMLItem_BrushType.Set_Item_Brush_Style(Value: WideString);
begin
  ChildNodes['Item_Brush_Style'].NodeValue := Value;
end;

{ TXMLItem_PenType }

function TXMLItem_PenType.Get_Item_Pen_Colour: WideString;
begin
  Result := ChildNodes['Item_Pen_Colour'].Text;
end;

procedure TXMLItem_PenType.Set_Item_Pen_Colour(Value: WideString);
begin
  ChildNodes['Item_Pen_Colour'].NodeValue := Value;
end;

function TXMLItem_PenType.Get_Item_Pen_Size: Integer;
begin
  Result := ChildNodes['Item_Pen_Size'].NodeValue;
end;

procedure TXMLItem_PenType.Set_Item_Pen_Size(Value: Integer);
begin
  ChildNodes['Item_Pen_Size'].NodeValue := Value;
end;

{ TXMLItem_LinkType }

function TXMLItem_LinkType.Get_Project_ID: Integer;
begin
  Result := ChildNodes['Project_ID'].NodeValue;
end;

procedure TXMLItem_LinkType.Set_Project_ID(Value: Integer);
begin
  ChildNodes['Project_ID'].NodeValue := Value;
end;

function TXMLItem_LinkType.Get_Item_ID: Integer;
begin
  Result := ChildNodes['Item_ID'].NodeValue;
end;

procedure TXMLItem_LinkType.Set_Item_ID(Value: Integer);
begin
  ChildNodes['Item_ID'].NodeValue := Value;
end;

end.
