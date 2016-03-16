object F01015: TF01015
  Left = 0
  Top = 0
  Caption = 'F01015'
  ClientHeight = 201
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 201
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitWidth = 365
    object Label1: TLabel
      Left = 8
      Top = 157
      Width = 109
      Height = 13
      Caption = 'C:\Windows\System32'
      Visible = False
    end
    object memLista: TMemo
      Left = 298
      Top = 16
      Width = 59
      Height = 153
      TabOrder = 0
    end
    object DirectoryListBox1: TDirectoryListBox
      Left = 8
      Top = 176
      Width = 145
      Height = 17
      DirLabel = Label1
      FileList = FileListBox1
      TabOrder = 1
      Visible = False
    end
    object FileListBox1: TFileListBox
      Left = 8
      Top = 16
      Width = 145
      Height = 135
      Color = 15854564
      FileEdit = Edit1
      ItemHeight = 13
      Mask = '*.json'
      TabOrder = 2
      OnDblClick = FileListBox1DblClick
    end
    object Edit1: TEdit
      Left = 159
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '*.json'
    end
  end
end
