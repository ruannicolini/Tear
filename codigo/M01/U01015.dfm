object F01015: TF01015
  Left = 0
  Top = 0
  Caption = 'F01015'
  ClientHeight = 204
  ClientWidth = 705
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
    Width = 705
    Height = 204
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object DirectoryListBox1: TDirectoryListBox
      Left = 8
      Top = 173
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
      Height = 151
      Color = 15854564
      ItemHeight = 13
      Mask = '*.json'
      TabOrder = 1
      OnDblClick = FileListBox1DblClick
    end
    object ListView1: TListView
      Left = 191
      Top = 16
      Width = 537
      Height = 151
      Columns = <
        item
          Caption = 'idOPERA'#199#195'O'
        end
        item
          Caption = 'Opera'#231#227'o'
        end
        item
          Caption = 'idOPERADOR'
        end
        item
          Caption = 'Operador'
        end
        item
          Caption = 'idCRONOMETRISTA'
        end
        item
          Caption = 'Cronometrista'
        end
        item
          Caption = 'idTecido'
        end
        item
          Caption = 'Tecido'
        end
        item
          Caption = 'idRecurso'
        end
        item
          Caption = 'Recurso'
        end
        item
          Caption = 'DATA'
        end>
      SortType = stText
      TabOrder = 2
      ViewStyle = vsReport
    end
    object BitBtn1: TBitBtn
      Left = 621
      Top = 173
      Width = 75
      Height = 25
      Caption = 'ADD'
      TabOrder = 3
      OnClick = BitBtn1Click
    end
  end
end
