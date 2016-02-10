inherited F01008: TF01008
  Caption = 'F01008'
  ClientHeight = 513
  ClientWidth = 815
  ExplicitWidth = 831
  ExplicitHeight = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 815
    Height = 478
    ExplicitWidth = 815
    ExplicitHeight = 478
    inherited TbDados: TTabSheet
      ExplicitWidth = 807
      ExplicitHeight = 450
      inherited grDados: TGroupBox
        Width = 807
        Height = 450
        ExplicitWidth = 807
        ExplicitHeight = 450
        object GroupBox1: TGroupBox
          Left = 2
          Top = 15
          Width = 803
          Height = 433
          Align = alClient
          TabOrder = 0
          object Label1: TLabel
            Left = 24
            Top = 16
            Width = 22
            Height = 13
            Caption = 'COD'
            FocusControl = DBEdit1
          end
          object Label2: TLabel
            Left = 24
            Top = 56
            Width = 59
            Height = 13
            Caption = 'DESCRI'#199#195'O'
            FocusControl = DBEdit2
          end
          object Label3: TLabel
            Left = 24
            Top = 96
            Width = 29
            Height = 13
            Caption = 'A'#199#195'O'
            FocusControl = DBEdit3
          end
          object Label4: TLabel
            Left = 24
            Top = 136
            Width = 32
            Height = 13
            Caption = 'PARTE'
            FocusControl = DBEdit4
          end
          object Label5: TLabel
            Left = 24
            Top = 176
            Width = 25
            Height = 13
            Caption = 'FASE'
            FocusControl = DBEdit5
          end
          object DBEdit1: TDBEdit
            Left = 24
            Top = 32
            Width = 45
            Height = 21
            TabStop = False
            Color = clWhite
            DataField = 'idoperacao'
            DataSource = DS
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit2: TDBEdit
            Left = 24
            Top = 72
            Width = 366
            Height = 21
            CharCase = ecUpperCase
            Color = clWhite
            DataField = 'descricao'
            DataSource = DS
            TabOrder = 0
          end
          object DBEdit3: TDBEdit
            Left = 24
            Top = 112
            Width = 45
            Height = 21
            TabStop = False
            Color = clWhite
            DataField = 'idAcao'
            DataSource = DS
            ParentShowHint = False
            ReadOnly = True
            ShowHint = False
            TabOrder = 2
          end
          object DBEdit4: TDBEdit
            Left = 24
            Top = 152
            Width = 45
            Height = 21
            TabStop = False
            Color = clWhite
            DataField = 'idParte'
            DataSource = DS
            ReadOnly = True
            TabOrder = 3
          end
          object DBEdit5: TDBEdit
            Left = 24
            Top = 192
            Width = 45
            Height = 21
            TabStop = False
            Color = clWhite
            DataField = 'idFase'
            DataSource = DS
            ReadOnly = True
            TabOrder = 4
          end
        end
      end
      object DBEditBeleza1: TDBEditBeleza
        Left = 77
        Top = 127
        Width = 315
        Height = 21
        Color = 15724527
        DataField = 'acao'
        DataSource = DS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        Ativar_Pesquisa = True
        mostrar_Botao = True
        sql.Strings = (
          
            'select idAcao, descricao from acao where descricao like :varDesc' +
            'ricao')
        database = 'balay'
        campo = 'descricao'
        Sempre_Mostrar_Janela = False
        Outro_Edit = DBEdit3
        campo_outro_edit = 'idAcao'
        CorBorda = clGray
        NovoLayout = False
      end
      object DBEditBeleza2: TDBEditBeleza
        Left = 77
        Top = 167
        Width = 315
        Height = 21
        Color = 15724527
        DataField = 'parte'
        DataSource = DS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Ativar_Pesquisa = True
        mostrar_Botao = True
        sql.Strings = (
          
            'select idParte, descricao from parte where descricao like :varDe' +
            'scricao')
        database = 'balay'
        campo = 'descricao'
        Sempre_Mostrar_Janela = False
        Outro_Edit = DBEdit4
        campo_outro_edit = 'idParte'
        CorBorda = clGray
        NovoLayout = False
      end
      object DBEditBeleza3: TDBEditBeleza
        Left = 77
        Top = 207
        Width = 315
        Height = 21
        Color = 15724527
        DataField = 'fase'
        DataSource = DS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Ativar_Pesquisa = True
        mostrar_Botao = True
        sql.Strings = (
          
            'select idFase, descricao from fase where descricao like :varDesc' +
            'ricao')
        database = 'balay'
        campo = 'descricao'
        Sempre_Mostrar_Janela = False
        Outro_Edit = DBEdit5
        campo_outro_edit = 'idFase'
        CorBorda = clGray
        NovoLayout = False
      end
    end
    inherited TbFiltros: TTabSheet
      ExplicitWidth = 807
      ExplicitHeight = 450
      inherited GBFiltros: TGroupBox
        Width = 807
        ExplicitWidth = 807
      end
      inherited DBGridBeleza1: TDBGridBeleza
        Width = 807
        Height = 413
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'idoperacao'
            Title.Caption = 'COD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'DESCRI'#199#195'O'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'idAcao'
            Title.Alignment = taCenter
            Title.Caption = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'acao'
            Title.Caption = 'A'#199#195'O'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'idParte'
            Title.Alignment = taCenter
            Title.Caption = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'parte'
            Title.Caption = 'PARTE'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'idFase'
            Title.Alignment = taCenter
            Title.Caption = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fase'
            Title.Caption = 'FASE'
            Visible = True
          end>
      end
    end
  end
  inherited Panel2: TPanel
    Width = 815
    ExplicitWidth = 815
    inherited BFechar: TSpeedButton
      Left = 781
      ExplicitLeft = 781
    end
  end
  inherited DS: TDataSource
    Left = 640
    Top = 80
  end
  inherited ClientDataSet1: TClientDataSet
    Left = 584
    Top = 80
    object ClientDataSet1idoperacao: TIntegerField
      FieldName = 'idoperacao'
    end
    object ClientDataSet1descricao: TStringField
      FieldName = 'descricao'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object ClientDataSet1idAcao: TIntegerField
      FieldName = 'idAcao'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1idParte: TIntegerField
      FieldName = 'idParte'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1idFase: TIntegerField
      FieldName = 'idFase'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1parte: TStringField
      FieldName = 'parte'
      ProviderFlags = []
      Size = 45
    end
    object ClientDataSet1fase: TStringField
      FieldName = 'fase'
      ProviderFlags = []
      Size = 45
    end
    object ClientDataSet1acao: TStringField
      FieldName = 'acao'
      ProviderFlags = []
      Size = 45
    end
  end
  inherited DataSetProvider1: TDataSetProvider
    Left = 496
    Top = 80
  end
  inherited FDQuery1: TFDQuery
    SQL.Strings = (
      'select op.*, '#10
      'p.descricao as parte, '#10
      'f.descricao as fase, '#13#10#10
      'a.descricao as acao  '#13#10#10
      'from operacao op'#10' '
      'left outer join parte p on p.idparte = op.idparte '#10
      'left outer join fase f on f.idfase = op.idfase '#10
      'left outer join acao a on a.idAcao = op.idAcao'#10)
    Left = 424
    Top = 80
    object FDQuery1idoperacao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idoperacao'
      Origin = 'idoperacao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuery1descricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object FDQuery1idAcao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idAcao'
      Origin = 'idAcao'
      ProviderFlags = [pfInUpdate]
    end
    object FDQuery1idParte: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idParte'
      Origin = 'idParte'
      ProviderFlags = [pfInUpdate]
    end
    object FDQuery1idFase: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idFase'
      Origin = 'idFase'
      ProviderFlags = [pfInUpdate]
    end
    object FDQuery1parte: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'parte'
      Origin = 'descricao'
      ProviderFlags = []
      Size = 45
    end
    object FDQuery1fase: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fase'
      Origin = 'descricao'
      ProviderFlags = []
      Size = 45
    end
    object FDQuery1acao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'acao'
      Origin = 'descricao'
      ProviderFlags = []
      Size = 45
    end
  end
  inherited Acoes: TActionList
    Left = 488
    Top = 152
  end
end
