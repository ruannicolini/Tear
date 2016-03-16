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
    object memLista: TMemo
      Left = 359
      Top = 16
      Width = 262
      Height = 153
      TabOrder = 0
    end
    object DirectoryListBox1: TDirectoryListBox
      Left = 8
      Top = 150
      Width = 145
      Height = 17
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
      ItemHeight = 13
      Mask = '*.json'
      TabOrder = 2
      OnDblClick = FileListBox1DblClick
    end
    object ListView1: TListView
      Left = 286
      Top = 16
      Width = 67
      Height = 150
      Columns = <
        item
          Caption = 'OPERA'#199#195'O'
        end
        item
          Caption = 'OPERADOR'
        end
        item
          Caption = 'CRONOMETRISTA'
        end
        item
          Caption = 'DATA'
        end>
      TabOrder = 3
    end
  end
end
