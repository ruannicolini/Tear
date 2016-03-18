object F01015: TF01015
  Left = 0
  Top = 0
  Caption = 'F01015'
  ClientHeight = 238
  ClientWidth = 749
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
    Width = 749
    Height = 238
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitWidth = 634
    ExplicitHeight = 201
    object DirectoryListBox1: TDirectoryListBox
      Left = 8
      Top = 150
      Width = 145
      Height = 17
      FileList = FileListBox1
      TabOrder = 0
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
      TabOrder = 1
      OnDblClick = FileListBox1DblClick
    end
    object ListView1: TListView
      Left = 159
      Top = 16
      Width = 537
      Height = 128
      Columns = <
        item
          Caption = 'idOPERA'#199#195'O'
        end
        item
          Caption = 'idOPERADOR'
        end
        item
          Caption = 'idCRONOMETRISTA'
        end
        item
          Caption = 'idTecido'
        end
        item
          Caption = 'idRecurso'
        end
        item
          Caption = 'DATA'
        end>
      SortType = stText
      TabOrder = 2
      ViewStyle = vsReport
    end
  end
end
