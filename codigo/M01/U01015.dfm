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
      Width = 161
      Height = 151
      Align = alCustom
      Anchors = [akLeft, akTop, akBottom]
      Color = 16768991
      ItemHeight = 13
      Mask = '*.json'
      TabOrder = 1
      OnDblClick = FileListBox1DblClick
    end
    object ListView1: TListView
      Left = 183
      Top = 16
      Width = 507
      Height = 151
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <
        item
          Caption = 'ID'
          Width = 100
        end
        item
          Alignment = taCenter
          Caption = 'Opera'#231#227'o'
          Width = 200
        end
        item
          Alignment = taCenter
          Caption = 'Operador'
          Width = 200
        end
        item
          Alignment = taCenter
          Caption = 'Cronometrista'
          Width = 200
        end
        item
          Alignment = taCenter
          Caption = 'Tecido'
          Width = 150
        end
        item
          Alignment = taCenter
          Caption = 'Recurso'
          Width = 200
        end
        item
          Alignment = taCenter
          Caption = 'DATA'
          Width = 100
        end>
      SortType = stText
      TabOrder = 2
      ViewStyle = vsReport
    end
    object BitBtn1: TBitBtn
      Left = 615
      Top = 173
      Width = 75
      Height = 25
      Align = alCustom
      Anchors = [akRight, akBottom]
      Caption = 'ADD'
      TabOrder = 3
      OnClick = BitBtn1Click
    end
  end
end
