object ItemDetailsForm: TItemDetailsForm
  Left = 362
  Top = -3
  Caption = 'Item Details'
  ClientHeight = 357
  ClientWidth = 565
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 89
    Top = 47
    Width = 43
    Height = 13
    Caption = 'Item Title'
  end
  object Label2: TLabel
    Left = 86
    Top = 76
    Width = 46
    Height = 13
    Caption = 'Item Style'
  end
  object Label3: TLabel
    Left = 18
    Top = 134
    Width = 114
    Height = 13
    Caption = 'Item Background Colour'
  end
  object Label4: TLabel
    Left = 71
    Top = 196
    Width = 61
    Height = 13
    Caption = 'Item Fill Style'
  end
  object Label5: TLabel
    Left = 61
    Top = 225
    Width = 71
    Height = 13
    Caption = 'Item Start Date'
  end
  object Label6: TLabel
    Left = 61
    Top = 255
    Width = 71
    Height = 13
    Caption = 'Length in Days'
  end
  object Label7: TLabel
    Left = 44
    Top = 166
    Width = 87
    Height = 13
    Caption = 'Item Border Colour'
  end
  object Label8: TLabel
    Left = 80
    Top = 105
    Width = 53
    Height = 13
    Caption = 'Item Status'
  end
  object Label9: TLabel
    Left = 378
    Top = 105
    Width = 90
    Height = 13
    Caption = 'Percent Completed'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 565
    Height = 26
    Align = alTop
    Caption = 'Create / Edit Task Item'
    Color = clMoneyGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 573
  end
  object Panel2: TPanel
    Left = 0
    Top = 323
    Width = 565
    Height = 34
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 327
    ExplicitWidth = 573
    object Button1: TButton
      Left = 301
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 0
    end
    object Button2: TButton
      Left = 220
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Ok'
      ModalResult = 1
      TabOrder = 1
    end
  end
  object ItemNameEdit: TEdit
    Left = 144
    Top = 43
    Width = 299
    Height = 21
    TabOrder = 2
    Text = 'New Item'
  end
  object StyleComboBox: TComboBox
    Left = 144
    Top = 72
    Width = 225
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 3
    Text = 'Block'
    Items.Strings = (
      'Block'
      'Arrow'
      'Ball'
      'Ring'
      'Finish'
      'BenchMark'
      'End'
      'Diamond Group'
      'Point Group'
      'Shard Group')
  end
  object ItemColorBox: TColorBox
    Left = 144
    Top = 131
    Width = 145
    Height = 22
    Selected = clMoneyGreen
    TabOrder = 4
  end
  object FillComboBox: TComboBox
    Left = 144
    Top = 191
    Width = 146
    Height = 21
    ItemIndex = 0
    TabOrder = 5
    Text = 'Solid'
    Items.Strings = (
      'Solid'
      'Clear'
      'Horizontal'
      'Vertical'
      'FDiagonal'
      'BDiagonal'
      'Cross'
      'DiagCross')
  end
  object StartDateEdit: TDateTimePicker
    Left = 144
    Top = 221
    Width = 186
    Height = 21
    Date = 39188.583807037000000000
    Time = 39188.583807037000000000
    TabOrder = 6
  end
  object LengthSpinEdit: TSpinEdit
    Left = 144
    Top = 251
    Width = 186
    Height = 22
    MaxValue = 365
    MinValue = 1
    TabOrder = 7
    Value = 1
  end
  object PenColorBox: TColorBox
    Left = 144
    Top = 161
    Width = 145
    Height = 22
    Selected = clNavy
    TabOrder = 8
  end
  object hardCheckBox: TCheckBox
    Left = 144
    Top = 282
    Width = 185
    Height = 17
    Caption = 'Use Hard Link when Linking'
    TabOrder = 9
  end
  object StatusComboBox: TComboBox
    Left = 144
    Top = 101
    Width = 225
    Height = 21
    ItemIndex = 0
    TabOrder = 10
    Text = 'gsNoActivity'
    Items.Strings = (
      'gsNoActivity'
      'gsWorkInProgress'
      'gsBenchmark'
      'gsHeldForResource'
      'gsCancelled'
      'gsDeferred')
  end
  object percentSpinEdit: TSpinEdit
    Left = 474
    Top = 101
    Width = 67
    Height = 22
    MaxValue = 100
    MinValue = 1
    TabOrder = 11
    Value = 1
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 414
    Top = 266
  end
end
