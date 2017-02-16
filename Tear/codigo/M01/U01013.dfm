inherited F01013: TF01013
  Caption = 'F01013'
  ClientHeight = 650
  ClientWidth = 1190
  OnCreate = FormCreate
  ExplicitTop = -274
  ExplicitWidth = 1206
  ExplicitHeight = 689
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 1190
    Height = 615
    ActivePage = TbDados
    ExplicitWidth = 1190
    ExplicitHeight = 615
    inherited TbDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1182
      ExplicitHeight = 587
      inherited grDados: TGroupBox
        Width = 1182
        Height = 587
        ExplicitWidth = 1182
        ExplicitHeight = 587
        object Label1: TLabel
          Left = 25
          Top = 19
          Width = 22
          Height = 13
          Caption = 'COD'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 25
          Top = 160
          Width = 55
          Height = 13
          Caption = 'RITMO (%)'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 174
          Top = 158
          Width = 94
          Height = 13
          Caption = 'NUMERO DE PE'#199'AS'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 324
          Top = 160
          Width = 86
          Height = 13
          Caption = 'TOLER'#194'NCIA (%)'
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 625
          Top = 159
          Width = 75
          Height = 13
          Caption = 'COMPRIMENTO'
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 473
          Top = 160
          Width = 68
          Height = 13
          Caption = 'OCORR'#202'NCIA'
          FocusControl = DBEdit6
        end
        object Label7: TLabel
          Left = 25
          Top = 63
          Width = 49
          Height = 13
          Caption = 'PRODUTO'
          FocusControl = DBEdit7
        end
        object Label8: TLabel
          Left = 325
          Top = 111
          Width = 87
          Height = 13
          Caption = 'CRONOMETRISTA'
          FocusControl = DBEdit8
        end
        object Label9: TLabel
          Left = 625
          Top = 63
          Width = 38
          Height = 13
          Caption = 'TECIDO'
          FocusControl = DBEdit9
        end
        object Label10: TLabel
          Left = 324
          Top = 63
          Width = 56
          Height = 13
          Caption = 'OPERA'#199#195'O'
          FocusControl = DBEdit10
        end
        object Label11: TLabel
          Left = 25
          Top = 111
          Width = 56
          Height = 13
          Caption = 'OPERADOR'
          FocusControl = DBEdit11
        end
        object Label12: TLabel
          Left = 38
          Top = 495
          Width = 83
          Height = 13
          Caption = 'idcronometragem'
          FocusControl = DBEdit12
          Visible = False
        end
        object Label13: TLabel
          Left = 122
          Top = 495
          Width = 67
          Height = 13
          Caption = 'idTipoRecurso'
          FocusControl = DBEdit13
          Visible = False
        end
        object Label14: TLabel
          Left = 195
          Top = 495
          Width = 68
          Height = 13
          Caption = 'idtipo_recurso'
          FocusControl = DBEdit14
          Visible = False
        end
        object Label15: TLabel
          Left = 252
          Top = 495
          Width = 45
          Height = 13
          Caption = 'descricao'
          FocusControl = DBEdit15
          Visible = False
        end
        object Label16: TLabel
          Left = 776
          Top = 160
          Width = 111
          Height = 13
          Caption = 'TEMPO PADR'#195'O FINAL'
          FocusControl = DBEdit16
        end
        object DBEdit1: TDBEdit
          Left = 25
          Top = 33
          Width = 136
          Height = 21
          TabStop = False
          DataField = 'idcronometragem'
          DataSource = DS
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 25
          Top = 174
          Width = 136
          Height = 21
          DataField = 'ritmo'
          DataSource = DS
          TabOrder = 8
          OnClick = DBEdit2Click
        end
        object DBEdit3: TDBEdit
          Left = 174
          Top = 174
          Width = 136
          Height = 21
          DataField = 'num_pecas'
          DataSource = DS
          TabOrder = 9
          OnClick = DBEdit3Click
        end
        object DBEdit4: TDBEdit
          Left = 324
          Top = 174
          Width = 136
          Height = 21
          DataField = 'tolerancia'
          DataSource = DS
          TabOrder = 10
          OnClick = DBEdit4Click
        end
        object DBEdit5: TDBEdit
          Left = 625
          Top = 174
          Width = 136
          Height = 21
          DataField = 'comprimento_prod'
          DataSource = DS
          TabOrder = 12
        end
        object DBEdit6: TDBEdit
          Left = 473
          Top = 174
          Width = 136
          Height = 21
          DataField = 'num_ocorrencia'
          DataSource = DS
          TabOrder = 11
        end
        object DBEdit7: TDBEdit
          Left = 24
          Top = 79
          Width = 28
          Height = 21
          TabStop = False
          Color = 15724527
          DataField = 'idProduto'
          DataSource = DS
          ReadOnly = True
          TabOrder = 13
          OnChange = DBEdit7Change
        end
        object DBEdit8: TDBEdit
          Left = 324
          Top = 127
          Width = 28
          Height = 21
          TabStop = False
          Color = 15724527
          DataField = 'idCronometrista'
          DataSource = DS
          ReadOnly = True
          TabOrder = 14
        end
        object DBEdit9: TDBEdit
          Left = 625
          Top = 79
          Width = 28
          Height = 21
          TabStop = False
          Color = 15724527
          DataField = 'idTecido'
          DataSource = DS
          ParentShowHint = False
          ReadOnly = True
          ShowHint = False
          TabOrder = 15
        end
        object DBEdit10: TDBEdit
          Left = 324
          Top = 79
          Width = 28
          Height = 21
          TabStop = False
          Color = 15724527
          DataField = 'idOperacao'
          DataSource = DS
          Enabled = False
          ReadOnly = True
          TabOrder = 16
          OnChange = DBEdit10Change
        end
        object DBEdit11: TDBEdit
          Left = 25
          Top = 127
          Width = 28
          Height = 21
          TabStop = False
          Color = 15724527
          DataField = 'idOperador'
          DataSource = DS
          ReadOnly = True
          TabOrder = 17
        end
        object DBEditBeleza2: TDBEditBeleza
          Left = 352
          Top = 79
          Width = 257
          Height = 21
          AutoSize = False
          Color = 15724527
          DataField = 'operacao'
          DataSource = DS
          Enabled = False
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
            'select idoperacao, descricao '
            'from operacao where descricao'
            'like :varDescricao')
          database = 'balay'
          campo = 'descricao'
          Sempre_Mostrar_Janela = False
          Outro_Edit = DBEdit10
          campo_outro_edit = 'idOperacao'
          CorBorda = clGray
          NovoLayout = False
        end
        object DBEditBeleza3: TDBEditBeleza
          Left = 653
          Top = 79
          Width = 257
          Height = 21
          Color = 15724527
          DataField = 'tecido'
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
            'select idtecido, descricao '
            'from tecido where descricao'
            'like :varDescricao')
          database = 'balay'
          campo = 'descricao'
          Sempre_Mostrar_Janela = False
          Outro_Edit = DBEdit9
          campo_outro_edit = 'idtecido'
          CorBorda = clGray
          NovoLayout = False
        end
        object DBEditBeleza4: TDBEditBeleza
          Left = 53
          Top = 127
          Width = 257
          Height = 21
          Color = 15724527
          DataField = 'operador'
          DataSource = DS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Ativar_Pesquisa = True
          mostrar_Botao = True
          sql.Strings = (
            'select idoperador, nome '
            'from operador where nome'
            'like :varDescricao')
          database = 'balay'
          campo = 'nome'
          Sempre_Mostrar_Janela = False
          Outro_Edit = DBEdit11
          campo_outro_edit = 'idoperador'
          CorBorda = clGray
          NovoLayout = False
        end
        object DBEditBeleza5: TDBEditBeleza
          Left = 352
          Top = 127
          Width = 257
          Height = 21
          Color = 15724527
          DataField = 'cronometrista'
          DataSource = DS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Ativar_Pesquisa = True
          mostrar_Botao = True
          sql.Strings = (
            'select idcronometrista, nome '
            'from cronometrista where nome'
            'like :varDescricao')
          database = 'balay'
          campo = 'nome'
          Sempre_Mostrar_Janela = False
          Outro_Edit = DBEdit8
          campo_outro_edit = 'idcronometrista'
          CorBorda = clGray
          NovoLayout = False
        end
        object Panel3: TPanel
          Left = 625
          Top = 127
          Width = 137
          Height = 21
          BevelKind = bkFlat
          BevelOuter = bvNone
          Color = 15724527
          ParentBackground = False
          TabOrder = 6
          object DBCheckBox1: TDBCheckBox
            Left = 13
            Top = 0
            Width = 110
            Height = 17
            Caption = 'TEMPO ORIGINAL'
            DataField = 'tempo_original'
            DataSource = DS
            TabOrder = 0
          end
        end
        object Panel4: TPanel
          Left = 773
          Top = 127
          Width = 137
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          Margins.Right = 1
          Margins.Bottom = 1
          BevelKind = bkFlat
          BevelOuter = bvNone
          Color = 15724527
          ParentBackground = False
          TabOrder = 7
          object DBCheckBox2: TDBCheckBox
            Left = 14
            Top = 0
            Width = 97
            Height = 17
            Caption = 'TEMPO IDEAL'
            DataField = 'tempo_ideal'
            DataSource = DS
            TabOrder = 0
          end
        end
        object PageControl1: TPageControl
          Left = 25
          Top = 216
          Width = 885
          Height = 273
          ActivePage = TabSheet1
          TabOrder = 18
          TabStop = False
          object TabSheet1: TTabSheet
            Caption = 'TEMPO'
            object GroupBox1: TGroupBox
              Left = 0
              Top = 0
              Width = 877
              Height = 57
              Align = alTop
              Color = 16382457
              ParentBackground = False
              ParentColor = False
              TabOrder = 0
              object btnINICIAR: TBitBtn
                Left = 176
                Top = 14
                Width = 75
                Height = 28
                Caption = 'NOVO'
                TabOrder = 0
                OnClick = btnINICIARClick
              end
              object btnLap: TBitBtn
                Left = 257
                Top = 14
                Width = 75
                Height = 28
                Caption = 'LAP'
                Enabled = False
                TabOrder = 1
                OnClick = btnLapClick
                OnKeyDown = btnLapKeyDown
              end
              object Edit2: TEdit
                Left = 40
                Top = 15
                Width = 129
                Height = 27
                Alignment = taCenter
                BevelInner = bvNone
                BevelOuter = bvNone
                Color = 15724527
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
              end
              object Edit3: TEdit
                Left = 379
                Top = 10
                Width = 65
                Height = 21
                TabOrder = 3
                Visible = False
              end
            end
            object DBGridBatida: TDBGridBeleza
              Left = 0
              Top = 57
              Width = 877
              Height = 188
              Hint = 'Clique no Titulo da Coluna para Ordenar'
              Align = alClient
              BorderStyle = bsNone
              Color = 16382457
              DataSource = DS_Batida
              FixedColor = 16762447
              GradientEndColor = 16382457
              GradientStartColor = 16382457
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnDrawColumnCell = DBGridBatidaDrawColumnCell
              OnDblClick = DBGridBatidaDblClick
              OnKeyDown = DBGridBatidaKeyDown
              Cor_2 = 16382457
              Direcao_Cor2 = dg_Vertical
              Direcao_Enter = dg_Horiz
              ClickTituloOrdenar = True
              MarcarLinhaInteira = False
              CorLinhaMarcada = 15854564
              BloquearExportacoes = False
              Columns = <
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'idbatida'
                  Title.Alignment = taCenter
                  Title.Caption = 'COD'
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'minutos'
                  Title.Alignment = taCenter
                  Title.Caption = 'MINUTOS'
                  Title.Color = clBlack
                  Width = 75
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'segundos'
                  Title.Alignment = taCenter
                  Title.Caption = 'SEGUNDOS'
                  Width = 75
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'milesimos'
                  Title.Alignment = taCenter
                  Title.Caption = 'MILES'#205'MOS'
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UTI'
                  Title.Caption = 'UTILIZAR'
                  Visible = True
                end>
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'Recursos'
            ImageIndex = 1
            object GroupBox2: TGroupBox
              Left = 0
              Top = 0
              Width = 877
              Height = 39
              Align = alTop
              TabOrder = 0
              object EditBeleza1: TEditBeleza
                Left = 17
                Top = 9
                Width = 342
                Height = 21
                Color = 15724527
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                Ativar_Pesquisa = True
                Ativar_MultiSelecao = False
                mostrar_Botao = True
                sql.Strings = (
                  'select idtipo_recurso, descricao from tipo_RECURSO '
                  'where descricao like :varDescricao')
                database = 'balay'
                campo = 'descricao'
                Sempre_Mostrar_Janela = False
                Outro_Edit = Edit1
                campo_outro_edit = 'idtipo_recurso'
                CorBorda = clGray
                NovoLayout = False
              end
              object BitBtn1: TBitBtn
                Left = 359
                Top = 8
                Width = 28
                Height = 23
                Caption = '+'
                TabOrder = 1
                OnClick = BitBtn1Click
              end
              object BitBtn2: TBitBtn
                Left = 386
                Top = 8
                Width = 28
                Height = 23
                Caption = '-'
                TabOrder = 2
                OnClick = BitBtn2Click
              end
            end
            object DBGridBeleza2: TDBGridBeleza
              Left = 0
              Top = 39
              Width = 877
              Height = 206
              Hint = 'Clique no Titulo da Coluna para Ordenar'
              Align = alClient
              BorderStyle = bsNone
              Color = 16382457
              DataSource = DS_Recurso
              FixedColor = 16762447
              GradientEndColor = 16382457
              GradientStartColor = 16382457
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnKeyDown = DBGridBeleza2KeyDown
              Cor_2 = 16382457
              Direcao_Cor2 = dg_Vertical
              Direcao_Enter = dg_Horiz
              ClickTituloOrdenar = True
              MarcarLinhaInteira = False
              CorLinhaMarcada = 16382457
              BloquearExportacoes = False
              Columns = <
                item
                  Expanded = False
                  FieldName = 'idtipo_recurso'
                  Title.Caption = 'COD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'descricao'
                  Title.Caption = 'DESCRI'#199#195'O'
                  Visible = True
                end>
            end
          end
        end
        object DBEdit12: TDBEdit
          Left = 38
          Top = 511
          Width = 51
          Height = 21
          DataField = 'idcronometragem'
          TabOrder = 19
          Visible = False
        end
        object DBEdit13: TDBEdit
          Left = 122
          Top = 511
          Width = 55
          Height = 21
          DataField = 'idTipoRecurso'
          TabOrder = 20
          Visible = False
        end
        object DBEdit14: TDBEdit
          Left = 195
          Top = 511
          Width = 51
          Height = 21
          DataField = 'idtipo_recurso'
          TabOrder = 21
          Visible = False
        end
        object DBEdit15: TDBEdit
          Left = 252
          Top = 511
          Width = 45
          Height = 21
          DataField = 'descricao'
          TabOrder = 22
          Visible = False
        end
        object Edit1: TEdit
          Left = 495
          Top = 250
          Width = 74
          Height = 21
          ReadOnly = True
          TabOrder = 23
          Visible = False
        end
        object DBCheckBox3: TDBCheckBox
          Left = 392
          Top = 563
          Width = 97
          Height = 17
          Caption = 'utilizar'
          DataField = 'utilizar'
          DataSource = DS_Batida
          TabOrder = 24
        end
        object DBEditBeleza1: TDBEditBeleza
          Left = 51
          Top = 79
          Width = 259
          Height = 21
          Color = 15724527
          DataField = 'produto'
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
            'select idproduto, descricao '
            'from produto where descricao'
            'like :varDescricao')
          database = 'balay'
          campo = 'descricao'
          Sempre_Mostrar_Janela = False
          Outro_Edit = DBEdit7
          campo_outro_edit = 'idProduto'
          CorBorda = clGray
          NovoLayout = False
        end
        object DBEdit16: TDBEdit
          Left = 916
          Top = 174
          Width = 136
          Height = 21
          DataField = 'tempoPadraoFinal'
          DataSource = DS
          TabOrder = 25
          Visible = False
          OnChange = DBEdit16Change
        end
        object Edit6: TEdit
          Left = 773
          Top = 174
          Width = 137
          Height = 21
          Alignment = taCenter
          ReadOnly = True
          TabOrder = 26
        end
      end
    end
    inherited TbFiltros: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1182
      ExplicitHeight = 587
      inherited GBFiltros: TGroupBox
        Top = 67
        Width = 1182
        Height = 35
        ExplicitTop = 67
        ExplicitWidth = 1182
        ExplicitHeight = 35
        inherited Panel1: TPanel
          Width = 1176
          Height = 29
          ExplicitWidth = 1176
          ExplicitHeight = 29
          inherited BtnLimparFiltros: TButton
            Left = 1123
            Top = 1
            Height = 28
            ExplicitLeft = 1123
            ExplicitTop = 1
            ExplicitHeight = 28
          end
        end
      end
      inherited DBGridBeleza1: TDBGridBeleza
        Top = 102
        Width = 1182
        Height = 485
        OnDrawColumnCell = DBGridBeleza1DrawColumnCell
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'idcronometragem'
            Title.Caption = 'COD'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idOperacao'
            Title.Caption = ' '
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'operacao'
            Title.Caption = 'OPERA'#199#195'O'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idProduto'
            Title.Caption = ' '
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'produto'
            Title.Caption = 'PRODUTO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idTecido'
            Title.Caption = ' '
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tecido'
            Title.Caption = ' TECIDO'
            Title.Color = clFuchsia
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'tempo_original'
            Title.Caption = 'T. ORIGINAL'
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'tempo_ideal'
            Title.Caption = 'T. IDEAL'
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ritmo'
            Title.Caption = 'RITMO'
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'num_pecas'
            Title.Caption = 'NUM PE'#199'AS'
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'tolerancia'
            Title.Caption = 'TOLER'#194'NCIA'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idCronometrista'
            Title.Caption = ' '
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cronometrista'
            Title.Caption = 'CRONOMET.'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idOperador'
            Title.Caption = ' '
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'operador'
            Title.Caption = 'OPERADOR'
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'comprimento_prod'
            Title.Caption = 'COMPRIMENTO'
            Width = 100
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'num_ocorrencia'
            Title.Caption = 'OCORR'#202'NCIA'
            Width = 100
            Visible = True
          end>
      end
      inherited PanelFiltros: TPanel
        Width = 1182
        Height = 67
        ExplicitWidth = 1182
        ExplicitHeight = 67
        object chkProduto: TCheckBox [0]
          Left = 17
          Top = 9
          Width = 181
          Height = 17
          Caption = 'PRODUTO'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Century Gothic'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object Edit4: TEdit [1]
          Left = 216
          Top = 27
          Width = 25
          Height = 21
          Color = 15724527
          ReadOnly = True
          TabOrder = 5
          Visible = False
        end
        object ChkOperacao: TCheckBox [2]
          Left = 241
          Top = 9
          Width = 181
          Height = 17
          Caption = 'OPERA'#199#195'O'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Century Gothic'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 1
        end
        object Edit5: TEdit [3]
          Left = 440
          Top = 27
          Width = 25
          Height = 21
          Color = 15724527
          ReadOnly = True
          TabOrder = 2
          Visible = False
        end
        object EditBeleza2: TEditBeleza [4]
          Left = 17
          Top = 27
          Width = 200
          Height = 21
          Color = 16382457
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Ativar_Pesquisa = True
          Ativar_MultiSelecao = False
          mostrar_Botao = True
          sql.Strings = (
            'select idproduto, descricao from produto '
            'where descricao like :varDescricao')
          database = 'balay'
          campo = 'descricao'
          Sempre_Mostrar_Janela = False
          Marcar_CheckBox = chkProduto
          Outro_Edit = Edit4
          campo_outro_edit = 'idProduto'
          CorBorda = clGray
          NovoLayout = False
        end
        object EditBeleza3: TEditBeleza [5]
          Left = 240
          Top = 27
          Width = 200
          Height = 21
          Color = 16382457
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Ativar_Pesquisa = True
          Ativar_MultiSelecao = False
          mostrar_Botao = True
          sql.Strings = (
            'select idoperacao, descricao from operacao '
            'where descricao like :varDescricao')
          database = 'balay'
          campo = 'descricao'
          Sempre_Mostrar_Janela = False
          Marcar_CheckBox = ChkOperacao
          Outro_Edit = Edit5
          campo_outro_edit = 'idOperacao'
          CorBorda = clGray
          NovoLayout = False
        end
        inherited btnFiltrar: TButton
          Left = 1126
          TabOrder = 6
          OnClick = btnFiltrarClick
          ExplicitLeft = 1126
        end
        object chkTempoOriginal: TCheckBox
          Left = 466
          Top = 9
          Width = 121
          Height = 17
          Caption = 'TEMPO ORIGINAL'
          TabOrder = 7
        end
        object chkTempoIdeal: TCheckBox
          Left = 466
          Top = 30
          Width = 121
          Height = 17
          Caption = 'TEMPO IDEAL'
          TabOrder = 8
        end
      end
    end
  end
  inherited Panel2: TPanel
    Width = 1190
    ExplicitWidth = 1190
    inherited BSalvar: TSpeedButton
      Left = 364
      ExplicitLeft = 364
    end
    inherited BCancelar: TSpeedButton
      Left = 400
      ExplicitLeft = 400
    end
    inherited BFechar: TSpeedButton
      Left = 1156
      ExplicitLeft = 828
    end
    object BReutilizar: TSpeedButton
      Left = 328
      Top = 2
      Width = 33
      Height = 31
      Hint = 'Reutilizar Tempo'
      HelpType = htKeyword
      Flat = True
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000120B0000120B00000001000000000000000000000101
        0100020202000303030004040400050505000606060007070700080808000909
        09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
        1100121212001313130014141400151515001616160017171700181818001919
        19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
        2100222222002323230024242400252525002626260027272700282828002929
        29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
        3100323232003333330034343400353535003636360037373700383838003939
        39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
        4100424242004343430044444400454545004646460047474700484848004949
        49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
        5100525252005353530054545400555555005656560057575700585858005959
        59005A5A5A005B5B5B005C5C5C005D5D5D005E5E5E005F5F5F00606060006161
        6100626262006363630064646400656565006666660067676700686868006969
        69006A6A6A006B6B6B006C6C6C006D6D6D006E6E6E006F6F6F00707070007171
        7100727272007373730074747400757575007676760077777700787878007979
        79007A7A7A007B7B7B007C7C7C007D7D7D007E7E7E007F7F7F00808080008181
        8100828282008383830084848400858585008686860087878700888888008989
        89008A8A8A008B8B8B008C8C8C008D8D8D008E8E8E008F8F8F00909090009191
        9100929292009393930094949400959595009696960097979700989898009999
        99009A9A9A009B9B9B009C9C9C009D9D9D009E9E9E009F9F9F00A0A0A000A1A1
        A100A2A2A200A3A3A300A4A4A400A5A5A500A6A6A600A7A7A700A8A8A800A9A9
        A900AAAAAA00ABABAB00ACACAC00ADADAD00AEAEAE00AFAFAF00B0B0B000B1B1
        B100B2B2B200B3B3B300B4B4B400B5B5B500B6B6B600B7B7B700B8B8B800B9B9
        B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBFBF00C0C0C000C1C1
        C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6C600C7C7C700C8C8C800C9C9
        C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECECE00CFCFCF00D0D0D000D1D1
        D100D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9
        D900DADADA00DBDBDB00DCDCDC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1
        E100E2E2E200E3E3E300E4E4E400E5E5E500E6E6E600E7E7E700E8E8E800E9E9
        E900EAEAEA00EBEBEB00ECECEC00EDEDED00EEEEEE00EFEFEF00F0F0F000F1F1
        F100F2F2F200F3F3F300F4F4F400F5F5F500F6F6F600F7F7F700F8F8F800F9F9
        F900FAFAFA00FBFBFB00FCFCFC00FDFDFD00FEFEFE00FFFFFF005E5E5E5E5E5E
        5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5EAF5E5E
        5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5EAFFF5E5E5E5E5E5E5E5E5E5E
        5E5E5E5E5E5E5E5E5E5E5EAFFFFF5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E
        5E5EAFFFFFFFFBE5BB7A5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5EAFFFFFFFFFFF
        FFFEBB625E5E5E5E5E5E5E5E5E5E5E5E5E5E5EAFFFFF647FBAFBFFD6625E5E5E
        5E5E5E5E5E5E5E665E5E5E5EAFFF5E5E5E7CEFFFBB5E5E5E5E5E5E5E5E5E7CE9
        715E5E5E5EAF5E5E5E5E7CFBFE7A5E5E5E5E5E5E5E5EBDFFB15E5E5E5E5E5E5E
        5E5E5EBAFFBB5E5E5E5E5E5E5E5EE8FF7D5E5E5E5E5E5E5E5E5E5E7FFFE55E5E
        5E5E5E5E5E5EFCFF625E5E5E5E5E5E5E5E5E5E64FFFB5E5E5E5E5E5E5E5EFBFF
        625E5E5E5E5E5E5E5E5E5E63FFFB5E5E5E5E5E5E5E5EE8FF7E5E5E5E5E5E5E5E
        5E5E5E7FFFE65E5E5E5E5E5E5E5EBEFFB75E5E5E5E5E5E5E5E5E5EB4FFBC5E5E
        5E5E5E5E5E5E7DFFFA795E5E5E5EAF5E5E5E5E73EB7A5E5E5E5E5E5E5E5E5EC0
        FFED795E5E5EFFAF5E5E5E5E675E5E5E5E5E5E5E5E5E5E64D8FFFAB77E62FFFF
        AF5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E64C0FFFFFFFFFFFFFFAF5E5E5E5E5E5E
        5E5E5E5E5E5E5E5E5E5E7DBEE8FBFFFFFFAF5E5E5E5E5E5E5E5E5E5E5E5E5E5E
        5E5E5E5E5E5EFFFFAF5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5EFFAF
        5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5EAF5E5E5E5E5E5E5E5E5E
        5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E}
      ParentShowHint = False
      ShowHint = True
      OnClick = BReutilizarClick
    end
  end
  inherited DS: TDataSource
    Left = 792
    Top = 80
  end
  inherited ClientDataSet1: TClientDataSet
    IndexFieldNames = 'idOperacao'
    Left = 752
    Top = 80
    object ClientDataSet1idcronometragem: TIntegerField
      FieldName = 'idcronometragem'
    end
    object ClientDataSet1tempo_original: TBooleanField
      FieldName = 'tempo_original'
    end
    object ClientDataSet1tempo_ideal: TBooleanField
      FieldName = 'tempo_ideal'
    end
    object ClientDataSet1ritmo: TIntegerField
      FieldName = 'ritmo'
      OnChange = ClientDataSet1ritmoChange
    end
    object ClientDataSet1num_pecas: TIntegerField
      FieldName = 'num_pecas'
      OnChange = ClientDataSet1num_pecasChange
    end
    object ClientDataSet1tolerancia: TIntegerField
      FieldName = 'tolerancia'
      OnChange = ClientDataSet1toleranciaChange
    end
    object ClientDataSet1comprimento_prod: TSingleField
      FieldName = 'comprimento_prod'
    end
    object ClientDataSet1num_ocorrencia: TIntegerField
      FieldName = 'num_ocorrencia'
    end
    object ClientDataSet1idProduto: TIntegerField
      FieldName = 'idProduto'
    end
    object ClientDataSet1idCronometrista: TIntegerField
      FieldName = 'idCronometrista'
    end
    object ClientDataSet1idTecido: TIntegerField
      FieldName = 'idTecido'
    end
    object ClientDataSet1idOperacao: TIntegerField
      FieldName = 'idOperacao'
    end
    object ClientDataSet1idOperador: TIntegerField
      FieldName = 'idOperador'
    end
    object ClientDataSet1operacao: TStringField
      FieldName = 'operacao'
      Size = 45
    end
    object ClientDataSet1produto: TStringField
      FieldName = 'produto'
      Size = 45
    end
    object ClientDataSet1tecido: TStringField
      FieldName = 'tecido'
      Size = 45
    end
    object ClientDataSet1operador: TStringField
      FieldName = 'operador'
      Size = 45
    end
    object ClientDataSet1cronometrista: TStringField
      FieldName = 'cronometrista'
      Size = 45
    end
    object ClientDataSet1tempoPadraoFinal: TSingleField
      FieldName = 'tempoPadraoFinal'
      ProviderFlags = [pfInUpdate]
    end
  end
  inherited DataSetProvider1: TDataSetProvider
    Left = 728
    Top = 80
  end
  inherited FDQuery1: TFDQuery
    SQL.Strings = (
      
        'select cr.*, o.descricao as operacao, p.descricao as produto, t.' +
        'descricao as tecido,  op.nome as operador, cron.nome as cronomet' +
        'rista   '#10'from cronometragem cr '#10'left outer join operacao o on o.' +
        'idoperacao = cr.idoperacao '#10'left outer join produto p on p.idPro' +
        'duto = cr.idproduto '#10'left outer join tecido t on t.idTecido = cr' +
        '.idtecido '#10'left outer join operador op on op.idOperador = cr.idO' +
        'perador '#10'left outer join cronometrista cron on cron.idCronometri' +
        'sta = cr.idCronometrista;')
    Left = 704
    Top = 80
    object FDQuery1idcronometragem: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idcronometragem'
      Origin = 'idcronometragem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuery1tempo_original: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'tempo_original'
      Origin = 'tempo_original'
      ProviderFlags = [pfInUpdate]
    end
    object FDQuery1tempo_ideal: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'tempo_ideal'
      Origin = 'tempo_ideal'
      ProviderFlags = [pfInUpdate]
    end
    object FDQuery1ritmo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ritmo'
      Origin = 'ritmo'
      ProviderFlags = [pfInUpdate]
    end
    object FDQuery1num_pecas: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'num_pecas'
      Origin = 'num_pecas'
      ProviderFlags = [pfInUpdate]
    end
    object FDQuery1tolerancia: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tolerancia'
      Origin = 'tolerancia'
      ProviderFlags = [pfInUpdate]
    end
    object FDQuery1comprimento_prod: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'comprimento_prod'
      Origin = 'comprimento_prod'
      ProviderFlags = [pfInUpdate]
    end
    object FDQuery1num_ocorrencia: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'num_ocorrencia'
      Origin = 'num_ocorrencia'
      ProviderFlags = [pfInUpdate]
    end
    object FDQuery1idProduto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idProduto'
      Origin = 'idProduto'
      ProviderFlags = [pfInUpdate]
    end
    object FDQuery1idCronometrista: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idCronometrista'
      Origin = 'idCronometrista'
      ProviderFlags = [pfInUpdate]
    end
    object FDQuery1idTecido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idTecido'
      Origin = 'idTecido'
      ProviderFlags = [pfInUpdate]
    end
    object FDQuery1idOperacao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idOperacao'
      Origin = 'idOperacao'
      ProviderFlags = [pfInUpdate]
    end
    object FDQuery1idOperador: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idOperador'
      Origin = 'idOperador'
      ProviderFlags = [pfInUpdate]
    end
    object FDQuery1operacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'operacao'
      Origin = 'descricao'
      ProviderFlags = []
      Size = 45
    end
    object FDQuery1produto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'descricao'
      ProviderFlags = []
      Size = 45
    end
    object FDQuery1tecido: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tecido'
      Origin = 'descricao'
      ProviderFlags = []
      Size = 45
    end
    object FDQuery1operador: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'operador'
      Origin = 'nome'
      ProviderFlags = []
      Size = 45
    end
    object FDQuery1cronometrista: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'cronometrista'
      Origin = 'nome'
      ProviderFlags = []
      Size = 45
    end
    object FDQuery1tempoPadraoFinal: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'tempoPadraoFinal'
      Origin = 'tempoPadraoFinal'
      ProviderFlags = [pfInUpdate]
    end
  end
  inherited ImageListBase: TImageList
    Left = 824
    Top = 80
    Bitmap = {
      494C01010E002C00400210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F7F7F708C3C3C33C77777788363636C9101010EF1E1E
      1EE1CACACA350000000000000000000000000000000000000000000000000000
      00000000000000000000F3F3F30CB4B4B44B525252AD0F0F0FF09E9E9E610000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBFBFB04BEBEBE41545454AB1B1B1BE4030303FC444444BBA0A0A05F4343
      43BC585858A7F6F6F60900000000000000000000000000000000000000000000
      000000000000E7E7E718595959A61F1F1FE0494949B61E1E1EE1868686790000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EBEB
      EB147474748B0E0E0EF1484848B7B5B5B54A9595956A6565659AE9E9E916C4C4
      C43B1F1F1FE0B0B0B04F00000000000000000000000000000000000000000000
      00000000000099999966252525DAC0C0C03FF1F1F10E434343BC8484847B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2E2E21D5050
      50AF303030CF8282827DA0A0A05FF9F9F90600000000DADADA25D8D8D827FDFD
      FD026262629D4C4C4CB3F6F6F609000000000000000000000000000000000000
      0000000000008484847B424242BDF8F8F807F8F8F807424242BD8484847B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F2F2F20D525252AD0808
      08F77E7E7E81DCDCDC23F1F1F10EFBFBFB040000000000000000FEFEFE010000
      0000C2C2C23D202020DFC1C1C13E000000000000000000000000000000000000
      0000000000008484847B424242BDF8F8F807F8F8F807424242BD8484847B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ECECEC13686868974141
      41BE2A2A2AD5222222DD555555AABCBCBC43FBFBFB0400000000000000000000
      0000F5F5F50A484848B78181817E000000000000000000000000000000000000
      0000000000008484847B424242BDF8F8F807F8F8F807424242BD8484847B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE01F9F9
      F906E6E6E619B3B3B34C575757A81C1C1CE38282827DF6F6F609000000000000
      000000000000D5D5D52AD6D6D629FAFAFA050000000000000000000000000000
      0000000000008484847B424242BDF8F8F807F8F8F807424242BD8484847B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD02ADADAD527171
      718EC8C8C83700000000F9F9F906A3A3A35C1C1C1CE39393936C000000000000
      0000EDEDED12ABABAB54585858A7C0C0C03F0000000000000000000000000000
      0000000000008484847B424242BDF8F8F807F8F8F807424242BD8484847B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D9D9D9261D1D1DE20000
      00FF404040BFF3F3F30C00000000FEFEFE01AAAAAA55B4B4B44BE2E2E21D9393
      936C383838C7040404FB1D1D1DE2CECECE310000000000000000000000000000
      0000FEFEFE017070708F252525DA9191916E9191916E252525DA7070708FFEFE
      FE01000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DFDFDF20282828D70000
      00FF4E4E4EB1F6F6F609000000000000000000000000A2A2A25D222222DD0101
      01FE090909F6444444BBB2B2B24DFDFDFD020000000000000000000000000000
      0000A9A9A9561C1C1CE3313131CE363636C9363636C9313131CE1C1C1CE3A9A9
      A956000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE01C6C6C6399797
      9768DBDBDB2400000000000000000000000000000000CACACA355D5D5DA26161
      619EA3A3A35CA1A1A15ECFCFCF3000000000000000000000000000000000B9B9
      B946202020DF7D7D7D82EFEFEF10F2F2F20DF2F2F20DEFEFEF107D7D7D822020
      20DFB9B9B9460000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3C3C33CD4D4D42BFCFCFC03CACA
      CA35ECECEC130000000000000000000000000000000000000000FDFDFD020000
      00009B9B9B64050505FA68686897FEFEFE010000000000000000C8C8C8372727
      27D86B6B6B94F5F5F50A00000000000000000000000000000000F5F5F50A6B6B
      6B94272727D8C8C8C83700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000111111EE4D4D4DB2EDEDED126A6A
      6A95C6C6C6390000000000000000000000000000000000000000000000000000
      0000D8D8D827212121DE252525DADCDCDC2300000000D6D6D629323232CD5959
      59A6EFEFEF10000000000000000000000000000000000000000000000000EFEF
      EF10595959A6323232CDD6D6D629000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009494946BB1B1B14EFEFEFE01F4F4
      F40BFCFCFC030000000000000000000000000000000000000000000000000000
      0000000000008585857A060606F99595956ADDDDDD22434343BC4C4C4CB3E9E9
      E916000000000000000000000000000000000000000000000000000000000000
      0000E9E9E9164C4C4CB3434343BCDDDDDD220000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E2E2E21D2C2C2CD33A3A3AC53F3F3FC0171717E896969669BBBB
      BB44B8B8B847B8B8B847B8B8B847B8B8B847B8B8B847B8B8B847B8B8B847B8B8
      B847BBBBBB4496969669171717E83F3F3FC00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008A8A8A75252525DA383838C7040404FB090909F60808
      08F7080808F7080808F7080808F7080808F7080808F7080808F7080808F70808
      08F7080808F7090909F6040404FB383838C70000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000097979700CACACA00FBFBFB00FBFBFB00C9C9C900969696000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8B8B800C2C2C200CDCDCD00CDCDCD00C2C2C200B7B7B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000094949400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009292
      9200000000000000000000000000000000000000000000000000000000000000
      0000B7B7B700CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00B7B7
      B700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000565656000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B0B0B000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E6E6
      E600FFFFFF005656560000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C8C8
      C800CDCDCD00B0B0B0000000000000000000000000000000000094949400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009292920000000000000000000000000000000000B7B7B700CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00B7B7B70000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000057575700FFFF
      FF00E6E6E6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0B0B000CDCD
      CD00C8C8C8000000000000000000000000000000000098989800FFFFFF00FFFF
      FF00FFFFFF00000000007A7A7A00FFFFFF00FFFFFF007979790000000000FFFF
      FF00FFFFFF00FFFFFF00969696000000000000000000B8B8B800CDCDCD00CDCD
      CD00CDCDCD0000000000B2B2B200CDCDCD00CDCDCD00B2B2B20000000000CDCD
      CD00CDCDCD00CDCDCD00B7B7B700000000000000000000000000000000000000
      00006F6F6F00EEEEEE00FDFDFD00BFBFBF006D6D6D00E8E8E800FFFFFF005757
      5700000000000000000000000000000000000000000000000000000000000000
      0000B4B4B400CACACA00CDCDCD00C2C2C200B3B3B300C9C9C900CDCDCD00B0B0
      B0000000000000000000000000000000000000000000CBCBCB00FFFFFF00FFFF
      FF00FFFFFF007979790000000000F2F2F200F2F2F2000000000079797900FFFF
      FF00FFFFFF00FFFFFF00C9C9C9000000000000000000C2C2C200CDCDCD00CDCD
      CD00CDCDCD00B2B2B20000000000CACACA00CACACA0000000000B2B2B200CDCD
      CD00CDCDCD00CDCDCD00C2C2C20000000000000000000000000000000000B3B3
      B300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8E8E8000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00C9C9C9000000
      00000000000000000000000000000000000000000000FCFCFC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1F1F1000000000000000000F2F2F200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBFBFB000000000000000000CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CACACA000000000000000000CACACA00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CDCDCD0000000000000000000000000070707000F8F8
      F8006868680000000000000000000000000069696900FFFFFF006D6D6D000000
      0000000000000000000000000000000000000000000000000000B4B4B400CBCB
      CB00B3B3B300000000000000000000000000B3B3B300CDCDCD00B3B3B3000000
      00000000000000000000000000000000000000000000FCFCFC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1F1F1000000000000000000F2F2F200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBFBFB000000000000000000CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CACACA000000000000000000CACACA00CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00000000000000000000000000C1C1C1009C9C
      9C000000000000000000000000000000000000000000FFFFFF00BFBFBF000000
      0000000000000000000000000000000000000000000000000000C2C2C200BCBC
      BC000000000000000000000000000000000000000000CDCDCD00C2C2C2000000
      00000000000000000000000000000000000000000000CCCCCC00FFFFFF00FFFF
      FF00FFFFFF007A7A7A0000000000F1F1F100F1F1F100000000007A7A7A00FFFF
      FF00FFFFFF00FFFFFF00CACACA000000000000000000C2C2C200CDCDCD00CDCD
      CD00CDCDCD00B2B2B20000000000CACACA00CACACA0000000000B2B2B200CDCD
      CD00CDCDCD00CDCDCD00C2C2C200000000000000000000000000FEFEFE004141
      41000000000000000000000000000000000000000000FFFFFF00FDFDFD000000
      0000000000000000000000000000000000000000000000000000CDCDCD00ACAC
      AC000000000000000000000000000000000000000000CDCDCD00CDCDCD000000
      0000000000000000000000000000000000000000000099999900FFFFFF00FFFF
      FF00FFFFFF00000000007A7A7A00FFFFFF00FFFFFF007979790000000000FFFF
      FF00FFFFFF00FFFFFF00979797000000000000000000B8B8B800CDCDCD00CDCD
      CD00CDCDCD0000000000B2B2B200CDCDCD00CDCDCD00B2B2B20000000000CDCD
      CD00CDCDCD00CDCDCD00B8B8B800000000000000000000000000EFEFEF005656
      56000000000000000000000000000000000000000000FFFFFF00EEEEEE000000
      0000000000000000000000000000000000000000000000000000CACACA00B0B0
      B0000000000000000000000000000000000000000000CDCDCD00CACACA000000
      000000000000000000000000000000000000000000000000000096969600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF009494940000000000000000000000000000000000B7B7B700CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00B7B7B7000000000000000000000000000000000072727200F7F7
      F7006767670000000000000000000000000068686800FFFFFF006F6F6F000000
      0000000000000000000000000000000000000000000000000000B5B5B500CBCB
      CB00B3B3B300000000000000000000000000B3B3B300CDCDCD00B4B4B4000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD00000000000000000000000000000000000000000000000000FFFF
      FF00F7F7F70056565600414141009C9C9C00F8F8F800B3B3B300000000000000
      000000000000000000000000000000000000000000000000000000000000CDCD
      CD00CBCBCB00B0B0B000ACACAC00BCBCBC00CBCBCB00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000096969600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000B7B7B700CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00B7B7
      B700000000000000000000000000000000000000000000000000000000000000
      000072727200EFEFEF00FEFEFE00C1C1C1007070700000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5B5B500CACACA00CDCDCD00C2C2C200B4B4B40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00FCFCFC00FCFCFC00CBCBCB00989898000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8B8B800C2C2C200CDCDCD00CDCDCD00C2C2C200B8B8B8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000090909000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008F8F
      8F00000000000000000000000000000000000000000000000000000000000000
      0000B6B6B600CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00B6B6
      B60000000000000000000000000000000000000000000000000091919100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008F8F8F0000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FBFBFB006767670068686800FBFBFB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A2A2A2000000000000000000A4A4A400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0066666600000000000000000067676700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A0A0A0000000000000000000A2A2A200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C0000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00AFAFAF0000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C0000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000C0C0C0000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      00000000000072727200EBEBEB00FFFFFF00FFFFFF00EBEBEB00727272000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B0B0B000C9C9C900CDCDCD00CDCDCD00C9C9C900B0B0B0000000
      000000000000000000000000000000000000000000000000000091919100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AFAF
      AF00000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F2F2
      F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F0F0F000000000000000000000000000000000000000000000000000CACA
      CA00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CACACA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FAFAFA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CDCDCD00CDCD
      CD00CBCBCB000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00CDCDCD00CDCDCD000000000000000000CDCDCD00CDCDCD00CDCD
      CD00CDCDCD000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FAFAFA008A8A8A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CDCDCD00CDCD
      CD00CDCDCD00CBCBCB00B5B5B500000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00CDCDCD00CDCDCD000000000000000000CDCDCD00CDCDCD00CDCD
      CD00CDCDCD000000000000000000000000000000000000000000FBFBFB00FFFF
      FF00FFFFFF00FFFFFF00FAFAFA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CDCDCD00CDCD
      CD00CDCDCD00CDCDCD00CBCBCB00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00000000000000000000000000000000000000000000000000FBFB
      FB00FFFFFF00FFFFFF00FFFFFF00FAFAFA008A8A8A0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CBCBCB00B5B5B50000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD000000000000000000000000000000000000000000000000008C8C
      8C00FBFBFB00FFFFFF00FFFFFF00FFFFFF00FAFAFA0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B5B5
      B500CDCDCD00CDCDCD00CDCDCD00CDCDCD00CBCBCB0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00CDCDCD00CDCDCD000000000000000000CDCDCD00CDCDCD00CDCD
      CD00CDCDCD000000000000000000000000000000000000000000000000000000
      000000000000FBFBFB00FFFFFF00FFFFFF00FFFFFF00FAFAFA008A8A8A000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CDCDCD00CDCDCD00CDCDCD00CDCDCD00CBCBCB00B5B5B5000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00CDCDCD00CDCDCD000000000000000000CDCDCD00CDCDCD00CDCD
      CD00CDCDCD000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C00FBFBFB00FFFFFF00FFFFFF00FFFFFF00F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B5B5B500CDCDCD00CDCDCD00CDCDCD00CDCDCD00CBCBCB000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCD
      CD00CDCDCD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBFBFB00FFFFFF00FFFFFF00FFFFFF009999
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CDCDCD00CDCDCD00CDCDCD00CDCDCD00B8B8
      B80000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000007272
      7200EBEBEB00000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD000000000000000000B0B0
      B000C9C9C9000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008D8D8D00FBFBFB00FFFFFF00FEFEFE000000
      0000AAAAAA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B5B5B500CDCDCD00CDCDCD00CDCDCD000000
      0000BFBFBF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000072727200FFFF
      FF00AFAFAF00000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD0000000000B0B0B000CDCD
      CD00BCBCBC000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009999990000000000FFFF
      FF00FFFFFF00F4F4F40000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B8B8B80000000000CDCD
      CD00CDCDCD00CACACA000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0072727200EBEBEB00AFAF
      AF0000000000000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00B0B0B000C9C9C900BCBC
      BC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AAAAAA00FFFF
      FF00FFFFFF00B8B8B80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF00CDCD
      CD00CDCDCD00BEBEBE000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AFAFAF000000
      000000000000000000000000000000000000000000000000000000000000CDCD
      CD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00BCBCBC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F8F8
      F800B8B8B8000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CBCB
      CB00BEBEBE00000000000000000000000000000000000000000000000000F1F1
      F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AFAFAF00000000000000
      000000000000000000000000000000000000000000000000000000000000CACA
      CA00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00BCBCBC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FC07FC1F00000000F003F81F00000000
      E003F81F00000000C081F81F0000000080D1F81F000000008071F81F00000000
      C038F81F000000008430F81F000000008200F00F000000008380F00F00000000
      8781E0070000000007D0C3C30000000007F087E10000000007F80FF000000000
      FFF8000000000000FFFC000000000000FFFFFFFFFFFFFFFFF81FF81FFFFFFFFF
      F00FF00FFFF7FFF7E007E007FFE3FFE3C003C003FFC7FFC784218421F00FF00F
      82418241E01FE01F81818181C71FC71F81818181CF9FCF9F82418241CF9FCF9F
      84218421CF9FCF9FC003C003C71FC71FE007E007E03FE03FF00FF00FF07FF07F
      F81FF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F00FF00FC003C003F00FF00FC003C003F00FF00FC183C183F00FF00FC183C183
      F00FF00FC183C183F00FF00FC003C003F00FF00FC003C003F00FF00FC003C003
      F00FF00FDFC3DFC3FFFFFFFFDFC3DFC3E007E007DFC7DFC7F81FF81FC00FC00F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE007E007FFFFFFFF
      E007E007C7FFC7FFE187E187C1FFC1FFE187E187C1FFC1FFE7E7E7E7E07FE07F
      E7E7E7E7E07FE07FE187E187F81FF81FE187E187F81FF81FE007E007FE0FFE0F
      E067E067FE17FE17E047E047FFA3FFA3E00FE00FFFC3FFC3E01FE01FFFE7FFE7
      E03FE03FFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  inherited Acoes: TActionList
    Left = 672
    Top = 80
  end
  object DS_Recurso: TDataSource
    DataSet = CDS_Recurso
    Left = 896
    Top = 280
  end
  object DSP_Recurso: TDataSetProvider
    DataSet = FDQ_Recurso
    Left = 832
    Top = 280
  end
  object CDS_Recurso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Recurso'
    AfterPost = CDS_RecursoAfterPost
    AfterCancel = CDS_RecursoAfterCancel
    AfterDelete = CDS_RecursoAfterDelete
    Left = 864
    Top = 280
    object CDS_Recursoidcronometragem: TIntegerField
      FieldName = 'idcronometragem'
    end
    object CDS_RecursoidTipoRecurso: TIntegerField
      FieldName = 'idTipoRecurso'
    end
    object CDS_Recursoidtipo_recurso: TIntegerField
      FieldName = 'idtipo_recurso'
      ReadOnly = True
    end
    object CDS_Recursodescricao: TStringField
      FieldName = 'descricao'
      ReadOnly = True
      Size = 45
    end
  end
  object FDQ_Recurso: TFDQuery
    Connection = DModule.FDConnection
    SQL.Strings = (
      
        'select * from cronometragem_has_tipo_recurso otr'#10'left outer join' +
        ' tipo_recurso t '#10'on otr.idTipoRecurso = t.idtipo_recurso '#10'where ' +
        'otr.idCronometragem =:id;')
    Left = 800
    Top = 280
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQ_Recursoidcronometragem: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idcronometragem'
      Origin = 'idcronometragem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQ_RecursoidTipoRecurso: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idTipoRecurso'
      Origin = 'idTipoRecurso'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQ_Recursoidtipo_recurso: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idtipo_recurso'
      Origin = 'idtipo_recurso'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQ_Recursodescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 45
    end
  end
  object crono: TTimer
    Enabled = False
    Interval = 1
    OnTimer = cronoTimer
    Left = 704
    Top = 352
  end
  object DS_Batida: TDataSource
    DataSet = CDS_Batida
    Left = 888
    Top = 352
  end
  object DSP_Batida: TDataSetProvider
    DataSet = FDQ_Batida
    Left = 832
    Top = 352
  end
  object CDS_Batida: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_Batida'
    AfterInsert = CDS_BatidaAfterInsert
    AfterPost = CDS_BatidaAfterPost
    AfterCancel = CDS_BatidaAfterCancel
    AfterDelete = CDS_BatidaAfterDelete
    Left = 862
    Top = 352
    object CDS_Batidaidbatida: TIntegerField
      FieldName = 'idbatida'
      Origin = 'idbatida'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CDS_Batidaminutos: TIntegerField
      FieldName = 'minutos'
      Origin = 'minutos'
    end
    object CDS_Batidasegundos: TIntegerField
      FieldName = 'segundos'
      Origin = 'segundos'
    end
    object CDS_Batidamilesimos: TIntegerField
      FieldName = 'milesimos'
      Origin = 'milesimos'
    end
    object CDS_Batidautilizar: TBooleanField
      FieldName = 'utilizar'
      Origin = 'utilizar'
    end
    object CDS_BatidaidCronometragem: TIntegerField
      FieldName = 'idCronometragem'
      Origin = 'idCronometragem'
    end
    object CDS_BatidaUTI: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'UTI'
      Size = 1
    end
  end
  object FDQ_Batida: TFDQuery
    Connection = DModule.FDConnection
    SQL.Strings = (
      'select * from batida where idCronometragem =:id;')
    Left = 800
    Top = 352
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQ_Batidaidbatida: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idbatida'
      Origin = 'idbatida'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQ_Batidaminutos: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'minutos'
      Origin = 'minutos'
    end
    object FDQ_Batidasegundos: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'segundos'
      Origin = 'segundos'
    end
    object FDQ_Batidamilesimos: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'milesimos'
      Origin = 'milesimos'
    end
    object FDQ_Batidautilizar: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'utilizar'
      Origin = 'utilizar'
    end
    object FDQ_BatidaidCronometragem: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idCronometragem'
      Origin = 'idCronometragem'
    end
  end
end
