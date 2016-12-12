object F01015: TF01015
  Left = 0
  Top = 0
  Caption = 'F01015'
  ClientHeight = 260
  ClientWidth = 1075
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1075
    Height = 260
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitTop = 8
    object DirectoryListBox1: TDirectoryListBox
      Left = 8
      Top = 229
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
      Height = 207
      Align = alCustom
      Anchors = [akLeft, akTop, akBottom]
      Color = 16768991
      ItemHeight = 13
      Mask = '*.json'
      TabOrder = 1
      OnDblClick = FileListBox1DblClick
      ExplicitHeight = 151
    end
    object BitBtn1: TBitBtn
      Left = 985
      Top = 229
      Width = 75
      Height = 25
      Align = alCustom
      Anchors = [akRight, akBottom]
      Caption = 'ADD'
      TabOrder = 2
      OnClick = BitBtn1Click
      ExplicitLeft = 615
      ExplicitTop = 173
    end
    object DBGridBeleza1: TDBGridBeleza
      Left = 181
      Top = 16
      Width = 879
      Height = 207
      Hint = 'Clique no Titulo da Coluna para Ordenar'
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clWhite
      DataSource = DS
      DrawingStyle = gdsGradient
      FixedColor = cl3DLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Cor_2 = 15329769
      Direcao_Cor2 = dg_Vertical
      Direcao_Enter = dg_Horiz
      ClickTituloOrdenar = True
      MarcarLinhaInteira = True
      CorLinhaMarcada = clActiveCaption
      BloquearExportacoes = False
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'idOperacao'
          Title.Caption = 'ID'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBackground
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'operacao'
          Title.Caption = 'OPERA'#199#195'O'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBackground
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 290
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'operador'
          Title.Caption = 'OPERADOR'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBackground
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cronometrista'
          Title.Caption = 'CRONOMETRISTA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBackground
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipoRecurso'
          Title.Caption = 'TIPO RECURSO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBackground
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tecido'
          Title.Caption = 'TECIDO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBackground
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dataCronometragem'
          Title.Caption = 'DATA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBackground
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 168
    object ClientDataSet1idOperacao: TIntegerField
      FieldName = 'idOperacao'
    end
    object ClientDataSet1operacao: TStringField
      FieldName = 'operacao'
      Size = 100
    end
    object ClientDataSet1idOperador: TIntegerField
      FieldName = 'idOperador'
    end
    object ClientDataSet1operador: TStringField
      FieldName = 'operador'
      Size = 100
    end
    object ClientDataSet1idCronometrista: TIntegerField
      FieldName = 'idCronometrista'
    end
    object ClientDataSet1cronometrista: TStringField
      FieldName = 'cronometrista'
      Size = 100
    end
    object ClientDataSet1idTipoRecurso: TIntegerField
      FieldName = 'idTipoRecurso'
    end
    object ClientDataSet1tipoRecurso: TStringField
      FieldName = 'tipoRecurso'
      Size = 100
    end
    object ClientDataSet1idTecido: TIntegerField
      FieldName = 'idTecido'
    end
    object ClientDataSet1tecido: TStringField
      FieldName = 'tecido'
      Size = 100
    end
    object ClientDataSet1dataCronometragem: TDateField
      FieldName = 'dataCronometragem'
    end
  end
  object DS: TDataSource
    DataSet = ClientDataSet1
    Left = 496
    Top = 168
  end
end
