inherited F01013: TF01013
  Caption = 'F01013'
  ClientHeight = 650
  ClientWidth = 1190
  OnCreate = FormCreate
  ExplicitWidth = 1206
  ExplicitHeight = 689
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 1190
    Height = 615
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
        inherited ImgSaveWhite: TImage
          Left = 646
          Top = 257
          ExplicitLeft = 646
          ExplicitTop = 257
        end
        inherited ImgSaveGray: TImage
          Left = 670
          Top = 257
          ExplicitLeft = 670
          ExplicitTop = 257
        end
        inherited Image1: TImage
          Left = 646
          Top = 288
          ExplicitLeft = 646
          ExplicitTop = 288
        end
        inherited Image2: TImage
          Left = 670
          Top = 288
          ExplicitLeft = 670
          ExplicitTop = 288
        end
        inherited Image3: TImage
          Left = 646
          Top = 319
          ExplicitLeft = 646
          ExplicitTop = 319
        end
        inherited Image6: TImage
          Left = 670
          Top = 319
          ExplicitLeft = 670
          ExplicitTop = 319
        end
        inherited Image7: TImage
          Left = 670
          Top = 350
          ExplicitLeft = 670
          ExplicitTop = 350
        end
        inherited Image8: TImage
          Left = 646
          Top = 350
          ExplicitLeft = 646
          ExplicitTop = 350
        end
        inherited Image4: TImage
          Left = 670
          Top = 381
          ExplicitLeft = 670
          ExplicitTop = 381
        end
        inherited Image5: TImage
          Left = 646
          Top = 381
          ExplicitLeft = 646
          ExplicitTop = 381
        end
        inherited Image9: TImage
          Left = 670
          Top = 412
          ExplicitLeft = 670
          ExplicitTop = 412
        end
        inherited Image10: TImage
          Left = 646
          Top = 412
          ExplicitLeft = 646
          ExplicitTop = 412
        end
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
          Width = 33
          Height = 13
          Caption = 'RITMO'
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
          Width = 64
          Height = 13
          Caption = 'TOLER'#194'NCIA'
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
          Left = 326
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
          Left = 25
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
        end
        object DBEdit3: TDBEdit
          Left = 174
          Top = 174
          Width = 136
          Height = 21
          DataField = 'num_pecas'
          DataSource = DS
          TabOrder = 9
        end
        object DBEdit4: TDBEdit
          Left = 324
          Top = 174
          Width = 136
          Height = 21
          DataField = 'tolerancia'
          DataSource = DS
          TabOrder = 10
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
          Left = 325
          Top = 79
          Width = 28
          Height = 21
          TabStop = False
          Color = 15724527
          DataField = 'idProduto'
          DataSource = DS
          ReadOnly = True
          TabOrder = 13
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
          ReadOnly = True
          TabOrder = 15
        end
        object DBEdit10: TDBEdit
          Left = 25
          Top = 79
          Width = 28
          Height = 21
          TabStop = False
          Color = 15724527
          DataField = 'idOperacao'
          DataSource = DS
          ReadOnly = True
          TabOrder = 16
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
          Left = 53
          Top = 79
          Width = 257
          Height = 21
          Color = 15724527
          DataField = 'Operacao'
          DataSource = DS
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
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
              Height = 73
              Align = alTop
              TabOrder = 0
              object btnINICIAR: TBitBtn
                Left = 176
                Top = 24
                Width = 75
                Height = 28
                Caption = 'INICIAR'
                TabOrder = 0
                OnClick = btnINICIARClick
              end
              object btnLap: TBitBtn
                Left = 257
                Top = 24
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
                Top = 25
                Width = 129
                Height = 27
                Alignment = taCenter
                BevelInner = bvNone
                BevelOuter = bvNone
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
                Top = 25
                Width = 121
                Height = 21
                TabOrder = 3
                Visible = False
              end
            end
            object DBGridBatida: TDBGridBeleza
              Left = 0
              Top = 73
              Width = 877
              Height = 172
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
              OnKeyDown = DBGridBatidaKeyDown
              Cor_2 = 16382457
              Direcao_Cor2 = dg_Vertical
              Direcao_Enter = dg_Horiz
              ClickTituloOrdenar = True
              MarcarLinhaInteira = True
              CorLinhaMarcada = 16382457
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
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'utilizar'
                  Title.Alignment = taCenter
                  Title.Caption = 'UTILIZAR'
                  Width = 75
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
                Width = 51
                Height = 23
                Caption = 'ADD'
                TabOrder = 1
                OnClick = BitBtn1Click
              end
              object BitBtn2: TBitBtn
                Left = 409
                Top = 8
                Width = 51
                Height = 23
                Caption = 'Excluir'
                TabOrder = 2
                Visible = False
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
          Left = 167
          Top = 33
          Width = 143
          Height = 21
          ReadOnly = True
          TabOrder = 23
          Text = 'Edit1'
          Visible = False
        end
        object DBCheckBox3: TDBCheckBox
          Left = 392
          Top = 656
          Width = 97
          Height = 17
          Caption = 'utilizar'
          DataField = 'utilizar'
          DataSource = DS_Batida
          TabOrder = 24
        end
        object DBEditBeleza1: TDBEditBeleza
          Left = 352
          Top = 79
          Width = 257
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
      end
    end
    inherited TbFiltros: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 1182
      ExplicitHeight = 587
      inherited GBFiltros: TGroupBox
        Width = 1182
        ExplicitWidth = 1182
      end
      inherited DBGridBeleza1: TDBGridBeleza
        Width = 1182
        Height = 550
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
            Title.Caption = 'OPERA'#199#195'O'
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
            Title.Caption = ' '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idProduto'
            Title.Caption = 'PRODUTO'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'produto'
            Title.Caption = ' '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idTecido'
            Title.Caption = ' TECIDO'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tecido'
            Title.Caption = ' '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idOperador'
            Title.Caption = 'OPERADOR'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'operador'
            Title.Caption = ' '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'idCronometrista'
            Title.Caption = ' CRONOMETRISTA'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cronometrista'
            Title.Caption = ' '
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
    end
  end
  inherited Panel2: TPanel
    Width = 1190
    ExplicitWidth = 1190
    inherited BSalvar: TSpeedButton
      Left = 328
      ExplicitLeft = 328
    end
    inherited BCancelar: TSpeedButton
      Left = 364
      ExplicitLeft = 364
    end
    inherited BFechar: TSpeedButton
      Left = 1156
      ExplicitLeft = 828
    end
    object BImportar: TSpeedButton
      Left = 292
      Top = 2
      Width = 33
      Height = 31
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
        5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E
        5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E
        5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5EAFAF5E5E5E5E5E5E5E5E5E5E5E5E5E5E
        5E5E5E5E5E5E5EAFFFFFAF5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5EAFFF
        FFFFFFAF5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5EAFFFFFFFFFFFFFAF5E5E5E
        5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5EFFFF5E5E5E5E5E5E5E5E5E5E5E5E5E5E
        5E5E5E5E5E5E5E5EFFFF5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E
        FFFF5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5EFFFF5E5E5E5EFFFF5E5E5E5E5E5E
        5E5E5E5E5E5E5E5E5E5EFFFF5E5E5E5EFFFF5E5E5E5E5E5E5E5E5E5E5E5E5E5E
        5E5EFFFF5E5E5E5EFFFF5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5EFFFF5E5E5E5E
        FFFF5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5EFFFF5E5E5E5E5E5E5E5E5E5E5E5E
        5E5E5E5E5E5E5E5E5E5EFFFF5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E
        5E5EFFFF5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5EAEFDFDFFFFFDFDAE5E
        5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5EB1FFFFFFFFB05E5E5E5E5E5E5E5E5E5E
        5E5E5E5E5E5E5E5E5EB0FFFFAF5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E
        5E5EAFAF5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E
        5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E
        5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E}
    end
  end
  inherited ImageList1: TImageList
    Left = 856
    Top = 96
    Bitmap = {
      494C01010F002C009C0118001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000006000000001002000000000000090
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFCFC07EAEAEA3ACECECE8AB8B8B8CAABABABEEA7A7
      A7FCA7A7A7FCABABABEEB8B8B8CACECECE8AEAEAEA3AFCFCFC07000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F6F6F609B2B2B24D4A4A4AB5C0C0C03F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE01EDEDED31C7C7C79FADADADEAA6A6A6FEA6A6A6FFA6A6A6FFA6A6
      A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FEADADADEAC7C7C79FEDEDED31FEFE
      FE01000000000000000000000000000000000000000000000000000000000000
      0000F6F6F609B8B8B847565656A9101010EF070707F8BEBEBE41000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD05DCDCDC64B0B0B0E2A6A6A6FFA6A6A6FEAEAEAEE6C0C0C0B2D0D0D084D8D8
      D86DD8D8D86DD0D0D084C0C0C0B2AEAEAEE6A6A6A6FEA6A6A6FFB0B0B0E2DCDC
      DC64FDFDFD050000000000000000000000000000000000000000F5F5F50AB4B4
      B44B515151AE0D0D0DF2000000FF000000FF090909F6BEBEBE41000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD05D5D5
      D578A9A9A9F4A6A6A6FFAEAEAEE7D0D0D085EFEFEF2BFCFCFC06000000000000
      00000000000000000000FCFCFC06EFEFEF2BD0D0D085AEAEAEE7A6A6A6FFA9A9
      A9F4D5D5D578FDFDFD050000000000000000F1F1F10EB1B1B14E4D4D4DB20B0B
      0BF4000000FF000000FF000000FF000000FF090909F6C0C0C03F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFE02FFFFFE03000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DCDCDC64A9A9
      A9F4A6A6A6FFB8B8B8CAE9E9E93DFEFEFE01000000000000000000000000FEFE
      FE01FEFEFE01000000000000000000000000FEFEFE01E9E9E93DB8B8B8CAA6A6
      A6FFA9A9A9F4DCDCDC640000000000000000404040BF0A0A0AF5000000FF0000
      00FF000000FF000000FF000000FF000000FF040404FB585858A7767676897676
      7689767676897676768976767689787878879494946BF7F7F708000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F4F4F826B3BAE7A0A8B1E6ABE9E9F4400000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDEDED32B0B0B0E1A6A6
      A6FFB8B8B8C9F0F0F02900000000000000000000000000000000F0F0F03AD5D5
      D5A4D5D5D5A4F0F0F03A00000000000000000000000000000000F0F0F029B8B8
      B8C9A6A6A6FFB0B0B0E1EDEDED3200000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF010101FE151515EA1C1C1CE31C1C
      1CE31C1C1CE31C1C1CE31C1C1CE3070707F8303030CFF0F0F00F000000000000
      0000000000000000000000000000000000000000000000000000DDDBDA32B4B0
      AE71ADA9A871ADA9A871ADA9A871ADA9A871ADA9A871ADA9A871ADA9A871ADA9
      A871ADA9A871ADA9A871ADAAA76EAAA9B9A2546EDEFE4A67E1FF9A9FC2BDD6D3
      D03A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC06C7C7C79FA6A6A6FFAEAE
      AEE7E9E9E93E0000000000000000000000000000000000000000E8E8E85ABFBF
      BFFEBFBFBFFEE8E8E85A0000000000000000000000000000000000000000E9E9
      E93EAEAEAEE7A6A6A6FFC7C7C79FFCFCFC06000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF080808F7A8A8A857E2E2E21DE2E2
      E21DE2E2E21DE2E2E21DE0E0E01F494949B6303030CFF0F0F00F000000000000
      0000000000000000000000000000000000000000000000000000A7A2A0876F63
      5EFF615753FF605652FF605652FF605652FF605652FF605652FF605652FF6056
      52FF605652FF635953FF645952FF7A7584FF526CDEFF4865E2FF78799BFF9991
      8AACFDFDFC050000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA3BADADADE9A6A6A6FFD0D0
      D085FEFEFE010000000000000000000000000000000000000000E8E8E85ABFBF
      BFFEBFBFBFFEE8E8E85A0000000000000000000000000000000000000000FEFE
      FE01D0D0D085A6A6A6FFADADADE9EAEAEA3B000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF090909F6BFBFBF40000000000000
      0000000000000000000000000000535353AC2F2F2FD0F0F0F00F000000000000
      0000000000000000000000000000000000000000000000000000A7A19F88786C
      65FF6D625DFF695E5AFF6A5E5AFF6A5E5AFF6A5E5AFF6A5E5AFF6A5E5AFF695E
      59FF746B6CFF7A7EACFF737BB5FF737FC3FF4B67DFFF4563E1FF6D7BC8FF7F87
      BDE9A8B1E5A8E9EAF53E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECECE8AA6A6A6FFAFAFAFE5EFEF
      EF2C000000000000000000000000000000000000000000000000E8E8E85ABFBF
      BFFEBFBFBFFEE8E8E85A00000000000000000000000000000000000000000000
      0000EFEFEF2CAFAFAFE5A6A6A6FFCECECE8A000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF090909F6BEBEBE41000000000000
      00000000000000000000FDFDFD02535353AC303030CFF0F0F00FFBFBFB040000
      0000000000000000000000000000000000000000000000000000A8A2A0888377
      70FF706560FF695E5AFF695E5AFF695E5AFF695E5AFF695E5AFF695E5AFF685D
      58FF797483FF526CE0FF4261E3FF4261E2FF4462E0FF4462E0FF4361E1FF4362
      E2FF4966E0FFC1C6EA8700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8B8B8CAA6A6A6FFC0C0C0B2FCFC
      FC06000000000000000000000000000000000000000000000000E8E8E85ABFBF
      BFFEBFBFBFFEE8E8E85A00000000000000000000000000000000000000000000
      0000FCFCFC06C0C0C0B2A6A6A6FFB8B8B8CA000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF090909F6BEBEBE41000000000000
      00000000000000000000FDFDFD02505050AF2D2D2DD2EEEEEE119D9D9D62D2D2
      D22D000000000000000000000000000000000000000000000000A8A2A0889285
      7FFF776B65FF685D59FF695E5AFF695E5AFF695E5AFF695E5AFF695E5AFF685D
      58FF787078FF6879CEFF5970D6FF5870D9FF4764E0FF4462E0FF556DDAFF5A70
      D6FF677CDCF3D3D7EF6A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ACACACEDA6A6A6FFD0D0D0850000
      000000000000F0F0F03AE7E7E75CE8E8E85AE8E8E85AE9E9E957D9D9D994BFBF
      BFFEBFBFBFFED9D9D994E9E9E957E8E8E85AE8E8E85AE7E7E75CF0F0F03A0000
      000000000000D0D0D085A6A6A6FFACACACED000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF090909F6BEBEBE41000000000000
      0000000000000000000000000000ABABAB549A9A9A65FAFAFA056161619E3636
      36C9D4D4D42B0000000000000000000000000000000000000000A8A2A0889E91
      8BFF81756FFF685D59FF695E5AFF695E5AFF695E5AFF695E5AFF695E5AFF695E
      5AFF6B605CFF756C6EFF766D71FF838097FF516BDFFF4764E1FF7A7EA8FF776E
      71FFC3C0C57CFFFEFF0800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A7A7A7FCA6A6A6FFD8D8D86D0000
      0000FEFEFE01D5D5D5A4BFBFBFFFBFBFBFFEBFBFBFFEBFBFBFFEBFBFBFFEBFBF
      BFFFBFBFBFFFBFBFBFFEBFBFBFFEBFBFBFFEBFBFBFFEBFBFBFFFD5D5D5A4FEFE
      FE0100000000D8D8D86DA6A6A6FFA7A7A7FC000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF090909F6BEBEBE41F5F5F50ADDDD
      DD22DCDCDC23DCDCDC23DCDCDC23DFDFDF20DFDFDF20DDDDDD22555555AA0000
      00FF363636C9D2D2D22D00000000000000000000000000000000A8A2A088A69A
      94FF8E827CFF685D59FF695E5AFF695E5AFF695E5AFF695E5AFF695E5AFF695E
      5AFF695E5AFF685D59FF685C56FF7D7787FF516BDFFF4664E2FF76789CFF695D
      57FFB4AEAC7E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A7A7A7FCA6A6A6FFD8D8D86D0000
      0000FEFEFE01D5D5D5A4BFBFBFFFBFBFBFFEBFBFBFFEBFBFBFFEBFBFBFFEBFBF
      BFFFBFBFBFFFBFBFBFFEBFBFBFFEBFBFBFFEBFBFBFFEBFBFBFFFD5D5D5A4FEFE
      FE0100000000D8D8D86DA6A6A6FFA7A7A7FC000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF090909F6C2C2C23DBBBBBB441E1E
      1EE11B1B1BE41B1B1BE41B1B1BE41B1B1BE41B1B1BE41B1B1BE40B0B0BF40000
      00FF000000FF353535CAC6C6C639000000000000000000000000A8A2A088ACA0
      9AFF9E918BFF6A5F5AFF695E5AFF695E5AFF695E5AFF695E5AFF695E5AFF695E
      5AFF695E5AFF695E5AFF685D58FF7B737BFF6979CFFF6074D5FF7A778DFF695E
      58FF9F9896A2FEFEFE0100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ACACACEDA6A6A6FFD0D0D0850000
      000000000000F0F0F03AE7E7E75CE8E8E85AE8E8E85AE9E9E957D9D9D994BFBF
      BFFEBFBFBFFED9D9D994E9E9E957E8E8E85AE8E8E85AE7E7E75CF0F0F03A0000
      000000000000D0D0D085A6A6A6FFACACACED000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF090909F6C2C2C23DB1B1B14E0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF4A4A4AB5000000000000000000000000A7A2A088AFA3
      9DFFAEA19AFF6C615CFF675C58FF675C58FF675C58FF675C58FF675C58FF675C
      58FF685D59FF695E5AFF695E5AFF6B605CFF766C6EFF766D71FF6D635FFF695E
      5AFF8C8481C2F8F8F70B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8B8B8CAA6A6A6FFC0C0C0B2FCFC
      FC06000000000000000000000000000000000000000000000000E8E8E85ABFBF
      BFFEBFBFBFFEE8E8E85A00000000000000000000000000000000000000000000
      0000FCFCFC06C0C0C0B2A6A6A6FFB8B8B8CA000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF090909F6C2C2C23DBCBCBC432323
      23DC202020DF202020DF202020DF202020DF202020DF202020DF0C0C0CF30000
      00FF000000FF3A3A3AC5CBCBCB34000000000000000000000000A8A2A088B1A4
      9EFFC3B6B0FF968A83FF8D817BFF8D817CFF8D817CFF8D817CFF8D817CFF8D81
      7BFF796E68FF685D59FF685D59FF685D59FF685D58FF685C58FF685D59FF685D
      59FF7D7370DDEDECEC1D00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CECECE8AA6A6A6FFAFAFAFE5EFEF
      EF2C000000000000000000000000000000000000000000000000E8E8E85ABFBF
      BFFEBFBFBFFEE8E8E85A00000000000000000000000000000000000000000000
      0000EFEFEF2CAFAFAFE5A6A6A6FFCECECE8A000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF090909F6BEBEBE41F6F6F609E2E2
      E21DE1E1E11EE1E1E11EE1E1E11EE4E4E41BE4E4E41BE2E2E21D575757A80000
      00FF3C3C3CC3D6D6D62900000000000000000000000000000000A8A2A088B2A5
      9FFFD2C5BFFFDACDC7FFDED1CBFFDED1CBFFDED1CBFFDED1CBFFDED1CBFFDED1
      CBFFC3B6AFFF817670FF726762FF736763FF736763FF736762FF736863FF7468
      63FE857B77D9EAE9E82300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EAEAEA3BADADADE9A6A6A6FFD0D0
      D085FEFEFE010000000000000000000000000000000000000000E8E8E85ABFBF
      BFFEBFBFBFFEE8E8E85A0000000000000000000000000000000000000000FEFE
      FE01D0D0D085A6A6A6FFADADADE9EAEAEA3B000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF090909F6BEBEBE41000000000000
      0000000000000000000000000000A6A6A6599494946BF9F9F9066161619E3B3B
      3BC4D8D8D8270000000000000000000000000000000000000000A7A2A088B2A5
      9FFFCFC2BBFFC8BBB5FFCABDB6FFC9BCB6FFC9BCB6FFC9BCB6FFC9BCB6FFC9BC
      B5FFC9BCB5FFBCAFA8FFB5A8A1FFB5A8A1FFB5A8A1FFB5A8A2FFAFA39CFFC0B8
      B4A9EBE9E82EFDFDFD0300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC06C7C7C79FA6A6A6FFAEAE
      AEE7E9E9E93E0000000000000000000000000000000000000000E8E8E85ABFBF
      BFFEBFBFBFFEE8E8E85A0000000000000000000000000000000000000000E9E9
      E93EAEAEAEE7A6A6A6FFC7C7C79FFCFCFC06000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF090909F6BEBEBE41000000000000
      00000000000000000000FDFDFD02505050AF2C2C2CD3EEEEEE11A1A1A15ED7D7
      D728000000000000000000000000000000000000000000000000A5A09E887A6E
      69FF847873FF837772FF837772FF837772FF837772FF837772FF877B76F6978E
      8AD899908BD69A908CD69A918CD69A918CD69A918CD69B918CD6978E8ACFD5D2
      D144000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDEDED32B0B0B0E1A6A6
      A6FFB8B8B8C9F0F0F02900000000000000000000000000000000F0F0F03AD5D5
      D5A4D5D5D5A4F0F0F03A00000000000000000000000000000000F0F0F029B8B8
      B8C9A6A6A6FFB0B0B0E1EDEDED3200000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF060606F9BDBDBD42000000000000
      00000000000000000000FDFDFD02535353AC303030CFF0F0F00FFCFCFC030000
      0000000000000000000000000000000000000000000000000000A5A09E875D52
      4EFF5D524EFF5D524EFF5D524EFF5D524EFF5D524EFF5D524EFF7E7674C2E7E6
      E61EEEEDED15EDECEC16EDECEC16EDECEC16EDECEC16EDECEC16EFEFEF13FCFC
      FC03000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DCDCDC64A9A9
      A9F4A6A6A6FFB8B8B8CAE9E9E93DFEFEFE02000000000000000000000000FEFE
      FE01FEFEFE01000000000000000000000000FEFEFE02E9E9E93DB8B8B8CAA6A6
      A6FFA9A9A9F4DCDCDC640000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF060606F9414141BED9D9D926000000000000
      00000000000000000000FDFDFD02535353AC303030CFF0F0F00F000000000000
      0000000000000000000000000000000000000000000000000000D0CDCD448D86
      84AD8B8481B18B8482B08B8482B08B8482B08B8482B08A8380B2B8B4B269FEFE
      FE01000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD05D5D5
      D578A9A9A9F4A6A6A6FFAEAEAEE7D0D0D085EFEFEF2BFCFCFC06000000000000
      00000000000000000000FCFCFC06EFEFEF2BD0D0D085AEAEAEE7A6A6A6FFA9A9
      A9F4D5D5D578FDFDFD050000000000000000000000FF000000FF000000FF0000
      00FF000000FF070707F8404040BFA3A3A35CEDEDED1200000000000000000000
      00000000000000000000FDFDFD02535353AC303030CFF0F0F00F000000000000
      000000000000000000000000000000000000000000000000000000000000FCFC
      FC03FBFBFB04FBFBFB04FBFBFB04FBFBFB04FBFBFB04FBFBFB04FEFEFE010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FD05DCDCDC64B0B0B0E2A6A6A6FFA6A6A6FEAEAEAEE6C0C0C0B2D0D0D084D8D8
      D86DD8D8D86DD0D0D084C0C0C0B2AEAEAEE6A6A6A6FEA6A6A6FFB0B0B0E2DCDC
      DC64FDFDFD05000000000000000000000000000000FF000000FF000000FF0B0B
      0BF4474747B8AAAAAA55F2F2F20D000000000000000000000000000000000000
      0000000000000000000000000000545454AB2F2F2FD0F0F0F00F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE01EDEDED31C7C7C79FADADADEAA6A6A6FEA6A6A6FFA6A6A6FFA6A6
      A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FEADADADEAC7C7C79FEDEDED31FEFE
      FE0100000000000000000000000000000000000000FF000000FF010101FE2929
      29D66B6B6B947C7C7C837A7A7A85797979867979798679797986797979867979
      7986797979867979798678787887272727D8323232CDF0F0F00F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FCFCFC07EAEAEA3ACECECE8AB8B8B8CAABABABEEA7A7
      A7FCA7A7A7FCABABABEEB8B8B8CACECECE8AEAEAEA3AFCFCFC07000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF343434CBF0F0F00F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3664000A0401000A040
      1000A0401000A0401000B3664000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3664000B3664000B366
      4000B3664000B3664000B3664000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098979700989797009897
      9700989797009897970098979700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098979700989797009897
      9700989797009897970098979700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B45F2500B8672F00F3D8A200FEF3C300FFFA
      CE00FFFBD100FEF5C600F3DAA500B8673100B45F270000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B8672F00B8672F00F3D8A200FEF3C300FFFA
      CE00FFFBD100FEF5C600F3DAA500B8673100B867310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009897970098979700B6B3B300B9B5B500C8C3
      C300C6C1C100B6B2B200ACA8A800989797009897970000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009897970098979700B6B3B300B9B5B500C8C3
      C300C6C1C100B6B2B200ACA8A800989797009897970000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AB4F1400B35F2A00FBDB9900FCDF9C00FBE19500FCE69600FDEE
      A300FDEFA400FCE99A00FCE39900FCE1A000FBDD9C00B4602C00AC5016000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B35F2A00B35F2A00FBDB9900FCDF9C00FBE19500FCE69600FDEE
      A300FDEFA400FCE99A00FCE39900FCE1A000FBDD9C00B4602C00B4602C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009897970098979700C1B7B400AE8370009E5633009A4014009933
      0000993300009C421500A55E3B00BB927F00C2BEBE0098979700989797000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009897970098979700C1B7B400AE8370009E5633009A4014009933
      0000993300009C421500A55E3B00BB927F00C2BEBE0098979700989797000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B65C1E00F2BA6500F8C87600F8C05B00F8C55A00F9CF6A00FBD97800FCDF
      8100FCE08200FBDB7B00FAD26E00F8C85E00F8C36000F9CC7B00F4BD6A00B75E
      2000000000000000000000000000000000000000000000000000000000000000
      0000B9622700F2BA6500F8C87600F8C05B00F8C55A00F9CF6A00FBD97800FCDF
      8100FCE08200FBDB7B00FAD26E00F8C85E00F8C36000F9CC7B00F4BD6A00BA64
      2900000000000000000000000000000000000000000000000000000000000000
      000098979700C9C7C700AD83700099390900BA612100D8965200F4D08B00FCE9
      AC00FCECB100F4D39100D99A5700BA6224009E451800C6A49400B6B2B2009897
      9700000000000000000000000000000000000000000000000000000000000000
      000098979700C9C7C700AD83700099390900BA612100D8965200F4D08B00FCE9
      AC00FCECB100F4D39100D99A5700BA6224009E451800C6A49400B6B2B2009897
      970000000000000000000000000000000000000000000000000000000000AF54
      1900ECAA5700F2AE4C00F4A93400F6B23F00F7BC4D00F8C55A00F9CC6400E8B3
      5700FAD26C00FACE6700F9C75D00F7BF5000F6B54200F5AC3800F4B14F00EEAE
      5A00B0561A00000000000000000000000000000000000000000000000000B25B
      2200ECAA5700F2AE4C00F4A93400F6B23F00F7BC4D00F8C55A00F9CC6400FAD1
      6B00E8B45800FACE6700F9C75D00F7BF5000F6B54200F5AC3800F4B14F00EEAE
      5A00B35D23000000000000000000000000000000000000000000000000009897
      9700D5D3D300A15E3E00AD4A0900E5952E00F7BF5200FAD26C00FCDE8100FDEA
      9300FDEC9500FCE18500FBD57000F8C15500E5942E00A8440600B4745400BCB8
      B800989797000000000000000000000000000000000000000000000000009897
      9700D5D3D300A15E3E00AD4A0900E5952E00F7BF5200FAD26C00FCDE8100FDEA
      9300FDEC9500FCE18500FBD57000F8C15500E5942E00A8440600B4745400BCB8
      B800989797000000000000000000000000000000000000000000A2400B00D78A
      3E00E2963D00E9922200F29F2600F5A93200F6B23D00E4A13A00D7AD9300ECD9
      CF00D5AA9100E6A64300F7BC4B00F6B44000F5AB3500F3A22900EC962300E69A
      3F00DA8E4200A2420B0000000000000000000000000000000000AB522100D78A
      3E00E2963D00E9922200F29F2600F5A93200F6B23D00F6BA4800E5A54100D5AA
      9100ECD9CF00D7AD9300E5A23D00F6B44000F5AB3500F3A22900EC962300E69A
      3F00DA8E4200AB5321000000000000000000000000000000000098979700DEDC
      DC00A15F3F00B6540B00EF9C2600F6B03800F7B84900F8C65C00FAD26C00FCDA
      7800FCDB7900FBD47000F9C96000F7BC4D00F6B03800ED962100B54F0800B777
      5700B9B6B600989797000000000000000000000000000000000098979700DEDC
      DC00A15F3F00B6540B00EF9C2600F6B03800F7B84900F8C65C00FAD26C00FCDA
      7800FCDB7900FBD47000F9C96000F7BC4D00F6B03800ED962100B54F0800B777
      5700B9B6B6009897970000000000000000000000000000000000BA5F2100D280
      3600D77D2000E1881F00EB942000F29E2400E3902500DBB5A000FBFBFB00DBDB
      DB00FFFFFF00C9844F00F5AF3800F5A83000F3A12600ED972000E38B1F00DA80
      2100D5853800BC63240000000000000000000000000000000000BA5F2100D280
      3600D77D2000E1881F00EB942000F29E2400F4A62E00F5AD3600C9844F00FFFF
      FF00DBDBDB00FBFBFB00DBB5A000E4922700F3A12600ED972000E38B1F00DA80
      2100D5853800BC6324000000000000000000000000000000000098979700AD7D
      6700AC470600EA922200E9932500F2A12A00F6AE390099330000F8C35500F9C9
      5D00FAC95E00F9C55700F7BC4B00F6B03C0099330000ED982400E6851800A63F
      0300CBAA9A00989797000000000000000000000000000000000098979700AD7D
      6700AC470600EA922200E993250099330000F6AE3900F7B94800F8C35500F9C9
      5D00FAC95E00F9C5570099330000F6B03C00F3A42D00ED982400E6851800A63F
      0300CBAA9A00989797000000000000000000000000009C3A0600BB612300C469
      1E00CD701A00D87C1B00E1871C00DB7F1800DBB4A000FBFBFB00D1D1D100DBDB
      DB00FFFFFF00BF6C2C00F4A22600F29C2100EC941E00E48A1D00DA7F1B00D074
      1B00C86C1F00BF6726009E3A06000000000000000000A1431100BB612300C469
      1E00CD701A00D87C1B00E1871C00EA911D00F19A1F00F4A02400BF6C2B00FFFF
      FF00DBDBDB00D1D1D100FBFBFB00DBB4A000DC821800E48A1D00DA7F1B00D074
      1B00C86C1F00BF672600A3431100000000000000000098979700D4CBC8009939
      0900DD7D1900D77D2000DE851F00EB94210099330000A64D200099330000F7B8
      4300F7B84300F6B43E00F5AD360099330000A64D200099330000DA7E1C00D669
      0A009E451800C8C4C40098979700000000000000000098979700D4CBC8009939
      0900DD7D1900D77D200099330000A64D200099330000F5AB3300F6B33D00F7B8
      4300F7B8430099330000A64D200099330000ED972200E1882000DA7E1C00D669
      0A009E451800C8C4C400989797000000000000000000A03D0B00B0521700BA5A
      1500C4651700CE701800CB6D1300DAB4A000FBFBFB00D1D1D100DBDBDB00FFFF
      FF00BF806000D97E1600EC931B00E68D1B00E0851A00D97C1900D0731800C668
      1700BD5D1600B4561A00A23F0B000000000000000000A03D0B00B0521700BA5A
      1500C4651700CE701800D67A1800DE831A00E58B1B00EA911B00D97D1500BF80
      6000FFFFFF00DBDBDB00D1D1D100FBFBFB00DAB4A000CD6E1400D0731800C668
      1700BD5D1600B4561A00A23F0B00000000000000000098979700B1877300B54F
      0800D87A1E00C6681900CF73190099330000BF806000FFFFFF0099330000F4A6
      2A00F4A62A00EE9C250099330000BF806000FFFFFF0099330000C96B1A00D36B
      1000B0440100BF97840098979700000000000000000098979700B1877300B54F
      0800D87A1E00C668190099330000FFFFFF00BF80600099330000EE9B2400F4A6
      2A00F4A62A0099330000FFFFFF00BF80600099330000D1761900C96B1A00D36B
      1000B0440100BF9784009897970000000000B2663F009B390C00A5441100B04F
      1200B9591300BA5A1000DAB3A000FCFCFC00D3D3D300D5D5D500FFFFFF00D9B2
      9F00B66A4100C1764500C0754400BF744400BE734400BD714400BF744600B857
      1100B2521300A84711009D3B0C00B2663F00CC997F009B390C00A5441100B04F
      1200B5541100BE744600BC714400BE724400BF744400C0754400C0764500B66A
      4100D9B29F00FFFFFF00D5D5D500D3D3D300FCFCFC00DAB3A000BD5C1100BC5C
      1400B2521300A84711009D3B0C00CC997F0098979700D1CFCF009E573400D26F
      1400B95A1700B858140099330000CC998000F4F4F400FFFFFF0099330000EB92
      1B00E68C190099330000CC998000F4F4F400FFFFFF0099330000BD5D1500BF5B
      1400C4510100A7603D00B1AEAE009897970098979700D1CFCF009E573400D26F
      1400B95A1700BA5A150099330000FFFFFF00F4F4F400CC99800099330000E68C
      1900EB921B0099330000FFFFFF00F4F4F400CC99800099330000BB5A1400BF5B
      1400C4510100A7603D00B1AEAE0098979700A0401000912F0B009B390D00A543
      0F00AB4A0E00D9B3A000FDFDFD00DFDFDF00D7D7D700E2E2E200FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDDA
      CF00A7460F009E3C0E0093320C00A0401000B3664000912F0B009B390D00A543
      0F00ECDACF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFDFD00E2E2E200D7D7D700DFDFDF00FDFDFD00D9B3A000AE4B
      0E00A7460F009E3C0E0093320C00B366400098979700DBD8D8009A3A0A00E788
      2000A13F0E0099330000DFBFAF00EDEDED00CACACA00FFFFFF0099330000D97D
      160099330000DFBFAF00EDEDED00CACACA00FFFFFF0099330000AF4E1100A342
      0F00D35C03009C431600BDB9B9009897970098979700DBD8D8009A3A0A00E788
      2000A13F0E00AD4B100099330000FFFFFF00CACACA00EDEDED00DFBFAF009933
      0000D97D160099330000FFFFFF00CACACA00EDEDED00DFBFAF0099330000A342
      0F00D35C03009C431600BDB9B90098979700A04010008C290800912E09009A37
      0B00A03C0900FFFFFF00F5F5F500EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F1F1F100FFFF
      FF009C390B0093310A008D2A0900A0401000B36640008C290800912E09009A37
      0B00FFFFFF00F1F1F100EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F5F5F500FFFFFF00A23E
      0A009C390B0093310A008D2A0900B366400098979700D8D5D50099330000D273
      1B0099330000ECD9CF00EBEBEB00D0D0D000D0D0D000FFFFFF00993300009933
      0000ECD9CF00EBEBEB00D0D0D000D0D0D000FFFFFF0099330000A13E0C009633
      0A00C750030099330000D0CCCC009897970098979700D8D5D50099330000D273
      1B0094310A009F3C0B0099330000FFFFFF00D0D0D000D0D0D000EBEBEB00ECD9
      CF009933000099330000FFFFFF00D0D0D000D0D0D000EBEBEB00ECD9CF009933
      0000C750030099330000D0CCCC0098979700A0401000E2BEA900D9AB8B00BE76
      4B00AF592700D9B3A000FFFFFF00FEFEFE00FEFEFE00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECD9
      CF00BF794E00D8A98B00E1BDA900A0401000B3664000E2BEA900D9AB8B00BE76
      4B00ECD9CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FEFEFE00FFFFFF00D9B3A000B15C
      2C00BF794E00D8A98B00E1BDA900B366400098979700D9D6D60099330000F0C5
      940099330000F7F1ED00F5F5F500F3F3F300F3F3F300FFFFFF00993300009933
      0000F7F1ED00F5F5F500F3F3F300F3F3F300FFFFFF0099330000B86B3E00CC93
      7000EAB1840099330000D2CFCF009897970098979700D9D6D60099330000F0C5
      9400CD926F00B667390099330000FFFFFF00F3F3F300F3F3F300F5F5F500F7F1
      ED009933000099330000FFFFFF00F3F3F300F3F3F300F5F5F500F7F1ED009933
      0000EAB1840099330000D2CFCF0098979700A0401000EFD6C400D9AA8C00C789
      6100C17A4C00B8683600D9B3A100FFFFFF00FEFEFE00FEFEFE00FFFFFF00D9B2
      9F00B56A4300B96E4600B96F4700B9704800BA714A00BA724C00B76B4200BB71
      4300C98C6600D9AC9000F0D8C800A0401000B3664000EFD6C400D9AA8C00C789
      6100B96D3E00B66A4100BA714B00BA714900B96F4700B96E4600B96E4600B56A
      4300D9B29F00FFFFFF00FEFEFE00FEFEFE00FFFFFF00D9B3A100B96C3A00C37F
      5300C98C6600D9AC9000F0D8C800B366400098979700D8D5D5009B3B0B00FBE2
      BF00D39E7E0099330000ECD9CF00FFFFFF00FEFEFE00FFFFFF0099330000B75E
      210099330000ECD9CF00FFFFFF00FEFEFE00FFFFFF0099330000C6865E00D4A1
      8300F1CDAD009B411400C1BEBE009897970098979700D8D5D5009B3B0B00FBE2
      BF00D39E7E00C482590099330000FFFFFF00FEFEFE00FFFFFF00ECD9CF009933
      0000B75E210099330000FFFFFF00FEFEFE00FFFFFF00ECD9CF0099330000D4A1
      8300F1CDAD009B411400C1BEBE0098979700B2663F00E8C8B500DAAD9300C98C
      6700C4825900C17C5000B8693A00D9B3A100FFFFFF00FEFEFE00FEFEFE00FFFF
      FF00C1826200B6612A00BE6F3800BF723D00C0754500C17A4D00C3805600C687
      6000CB917000DCB39900E9CAB900B2663F00CC997F00E8C8B500DAAD9300C98C
      6700C4825900C17C5000BF764700BE724000BD6F3A00BD6C3500B6602900C182
      6200FFFFFF00FEFEFE00FEFEFE00FFFFFF00D9B3A100B96D3F00C3805600C687
      6000CB917000DCB39900E9CAB900CC997F0098979700C9C7C700A65F3C00E3B9
      9500DBAF9200BF7B540099330000DFBFAF00FFFFFF00FFFFFF0099330000BD6E
      3A00B6642F0099330000DFBFAF00FFFFFF00FFFFFF0099330000CA906E00DEB1
      9300DAA784009F583500C0BEBE009897970098979700C9C7C700A65F3C00E3B9
      9500DBAF9200C88C680099330000FFFFFF00FFFFFF00DFBFAF0099330000B663
      2F00BD6F3A0099330000FFFFFF00FFFFFF00DFBFAF0099330000C17E5900DEB1
      9300DAA784009F583500C0BEBE009897970000000000CC997F00DFBBA500CD96
      7600C88B6700C5855E00C3805600B96D4000D9B4A100FFFFFF00FEFEFE00FEFE
      FE00FFFFFF00B05F3300BF774800C17A4D00C27E5300C4835B00C7896400C98F
      6D00CF9C7E00E1BFAB00CC997F000000000000000000CC997F00DFBBA500CD96
      7600C88B6700C5855E00C3805600C17B4F00C0784A00BF754500B05E3200FFFF
      FF00FEFEFE00FEFEFE00FFFFFF00D9B4A100BA704300C4835B00C7896400C98F
      6D00CF9C7E00E1BFAB00CC997F00000000000000000098979700C0978400BF7A
      5400EED2B800CE9A7C00C688650099330000D2A68F00FFFFFF0099330000C17B
      4F00C17B4F00BF784D0099330000D2A68F00FFFFFF0099330000D09E8200EBC7
      AC00BD754D00B78E7B0098979700000000000000000098979700C0978400BF7A
      5400EED2B800CE9A7C0099330000FFFFFF00D2A68F0099330000BE774B00C17B
      4F00C17B4F0099330000FFFFFF00D2A68F0099330000C78C6A00D09E8200EBC7
      AC00BD754D00B78E7B00989797000000000000000000CC997F00EBD0C100D5A8
      8E00CB957600C98F6D00C78A6600C5866000BC744900D9B4A100FFFFFF00FEFE
      FE00FFFFFF00BD785400C4815900C5855D00C7896300C88D6A00CB937200CD99
      7C00D7AC9400ECD3C500CC997F000000000000000000CC997F00EBD0C100D5A8
      8E00CB957600C98F6D00C78A6600C5866000C4835A00C3805600BD785400FFFF
      FF00FEFEFE00FFFFFF00D9B4A100BD764B00C7896300C88D6A00CB937200CD99
      7C00D7AC9400ECD3C500CC997F00000000000000000098979700CFC6C300A144
      1300F0D9C200DDB7A000CE9C8000C88F6F0099330000B973500099330000C689
      6400C7896500C78B6700C588650099330000B973500099330000DEB79F00EDCB
      AF0099390900D1C9C60098979700000000000000000098979700CFC6C300A144
      1300F0D9C200DDB7A00099330000B973500099330000C5876200C78A6600C689
      6400C789650099330000B973500099330000CA927200D09F8500DEB79F00EDCB
      AF0099390900D1C9C60098979700000000000000000000000000CC997F00E2C2
      B000D2A48B00CD9A7D00CB957600CA917000C98E6B00BF7A5400CE9C8300E5CC
      BF00D4A89200BE7A5300C88D6A00C9906E00CB937300CD987A00CF9D8200D4A8
      9000E4C5B400CC997F0000000000000000000000000000000000CC997F00E2C2
      B000D2A48B00CD9A7D00CB957600CA917000C98E6B00C88B6700BE7A5200D4A8
      9200E5CCBF00CE9C8300BF7C5600C9906E00CB937300CD987A00CF9D8200D4A8
      9000E4C5B400CC997F000000000000000000000000000000000098979700C497
      8000B2643B00F9EADA00D9B39F00D1A38B00CF9E840099330000C68B6C00CC97
      7A00CD987A00CD997D00CE9C8100D0A0870099330000D3A48D00F7DDC500B261
      3600BB938000989797000000000000000000000000000000000098979700C497
      8000B2643B00F9EADA00D1A38B0099330000CF9E8400CE9A7F00CD987B00CC97
      7A00CD987A00C68C6D0099330000D0A08700D2A68F00DBB4A100F7DDC500B261
      3600BB9380009897970000000000000000000000000000000000CC997F00EDD5
      C800DFBEAC00D3A79100D0A08600CE9C8100CD997C00CC977900C9907000BE7C
      5800C98F6F00CC967800CD987B00CE9B7F00CF9E8400D1A28A00D5AA9600E1C1
      B100EDD6CA00CC997F0000000000000000000000000000000000CC997F00EDD5
      C800DFBEAC00D3A79100D0A08600CE9C8100CD997C00CC977900CC967700C88F
      6F00BF7C5800C9907000CD987B00CE9B7F00CF9E8400D1A28A00D5AA9600E1C1
      B100EDD6CA00CC997F000000000000000000000000000000000098979700CDC9
      C900B7775700BF7D5900F9EDDF00E1C2B100D6AE9B00D4A99400D2A79100D2A6
      9000D2A69000D3A89200D4AA9600D7B09E00E1C1AF00F8E1CB00BE785200A563
      4300EFEFEF00989797000000000000000000000000000000000098979700CDC9
      C900B7775700BF7D5900F9EDDF00E1C2B100D6AE9B00D4A99400D2A79100D2A6
      9000D2A69000D3A89200D4AA9600D7B09E00E1C1AF00F8E1CB00BE785200A563
      4300EFEFEF00989797000000000000000000000000000000000000000000CC99
      7F00F0DCD200E1C3B300D7AF9C00D3A79100D2A48D00D1A28A00D0A18800D0A1
      8700D0A18700D1A28900D1A38C00D2A68F00D4A99400D8B29F00E2C4B600F0DE
      D400CC997F00000000000000000000000000000000000000000000000000CC99
      7F00F0DCD200E1C3B300D7AF9C00D3A79100D2A48D00D1A28A00D0A18800D0A1
      8700D0A18700D1A28900D1A38C00D2A68F00D4A99400D8B29F00E2C4B600F0DE
      D400CC997F000000000000000000000000000000000000000000000000009897
      9700DBD8D800B3735400B2643C00F1DDCC00F1DED000E3C6B800DBBAAC00DAB7
      A800DAB7A900DCBBAD00E3C6B700F0D9C700EFD3BD00B2623800A4624300E8E7
      E700989797000000000000000000000000000000000000000000000000009897
      9700DBD8D800B3735400B2643C00F1DDCC00F1DED000E3C6B800DBBAAC00DAB7
      A800DAB7A900DCBBAD00E3C6B700F0D9C700EFD3BD00B2623800A4624300E8E7
      E700989797000000000000000000000000000000000000000000000000000000
      0000CC997F00EED9CF00E7CDC300DDBDAE00D7B2A100D6AE9B00D5AC9900D5AC
      9900D5AC9900D5AD9A00D6AF9D00D9B4A300DEBFB000E7CFC400EEDBD100CC99
      7F00000000000000000000000000000000000000000000000000000000000000
      0000CC997F00EED9CF00E7CDC300DDBDAE00D7B2A100D6AE9B00D5AC9900D5AC
      9900D5AC9900D5AD9A00D6AF9D00D9B4A300DEBFB000E7CFC400EEDBD100CC99
      7F00000000000000000000000000000000000000000000000000000000000000
      000098979700CFCCCC00BE907A00A1471A00BF7C5900E4C4AE00FDF1E200F6E6
      D800F6E5D600FCECDA00E3BFA600BE7A550099390900B2836C00E2E1E1009897
      9700000000000000000000000000000000000000000000000000000000000000
      000098979700CFCCCC00BE907A00A1471A00BF7C5900E4C4AE00FDF1E200F6E6
      D800F6E5D600FCECDA00E3BFA600BE7A550099390900B2836C00E2E1E1009897
      9700000000000000000000000000000000000000000000000000000000000000
      000000000000CC997F00CC997F00F0DFD700E8D1C700E2C6BB00DFC0B400DDBE
      B100DDBEB100DFC1B500E2C7BC00E9D2C800F0DFD800CC997F00CC997F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC997F00CC997F00F0DFD700E8D1C700E2C6BB00DFC0B400DDBE
      B100DDBEB100DFC1B500E2C7BC00E9D2C800F0DFD800CC997F00CC997F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009897970098979700CBC1BD00B9917D00A35C39009A3A0B009933
      0000993300009A3A0A009D563300AF867300D1C8C50098979700989797000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009897970098979700CBC1BD00B9917D00A35C39009A3A0B009933
      0000993300009A3A0A009D563300AF867300D1C8C50098979700989797000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CC997F00CC997F00E7CDC000F2E4DE00F0E1
      DB00F0E1DB00F2E4DE00E8CDC000CC997F00CC997F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CC997F00CC997F00E7CDC000F2E4DE00F0E1
      DB00F0E1DB00F2E4DE00E8CDC000CC997F00CC997F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009897970098979700C8C6C600D4D1D100D2CE
      CE00D2CECE00D3CFCF00CDCBCB00989797009897970000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009897970098979700C8C6C600D4D1D100D2CE
      CE00D2CECE00D3CFCF00CDCBCB00989797009897970000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CC997F00CC997F00CC99
      7F00CC997F00CC997F00CC997F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CC997F00CC997F00CC99
      7F00CC997F00CC997F00CC997F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098979700989797009897
      9700989797009897970098979700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000098979700989797009897
      9700989797009897970098979700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000979797009797970000000000000000000000000000000000000000001C1C
      A0001C1CA0001C1CA00000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C1CA0001C1C
      A0001C1CA0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009F9E9E009F9E9E009F9E
      9E009D9A9A009D9A9A009E9D9D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009797
      9700E0E1E100A4A4A400979797000000000000000000000000001C1CA0001C1C
      AB002F2FD1002A2ABF001C1CA000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001C1CA0000303A9000202
      B40002029A001C1CA000000000000000000000000000D7D7D700D7D7D700D8D8
      D800D8D8D800D8D8D800D8D8D800D7D7D700D7D7D700D7D7D700D6D6D600D6D6
      D600D5D5D500D4D4D400D3D3D300D2D2D200D2D2D200D2D2D200D2D2D200D2D2
      D200D2D2D200D2D2D200D2D2D200000000000000000000000000000000000000
      00000000000000000000000000009593930095939300B8B5B500BBB7B700B8B2
      B200B4AFAF00ADA9A900A59F9F008A8888008A88880000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000098989800CFD0
      D000BDBDBD007E7F7F00A2A2A30000000000000000001C1CA0002020AF002828
      D1001111C4002626CE002F2FC1001C1CA0000000000000000000000000000000
      0000000000000000000000000000000000001C1CA0000909AB000404AF000101
      A6000101AF0002029A001C1CA000000000000000000000000000E0E0E000FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FAFAFA00F9F9F900F7F7F700F5F5F500F3F3
      F300F0F0F000EDEDED00EAEAEA00E6E6E600E4E4E400E4E4E400E4E4E400E4E4
      E400E4E4E400DADADA0000000000000000000000000000000000000000000000
      0000000000009695950096959500C6C4C700B8B5C200817FAF005E5DAC006867
      B2006867B0005956A300736E9E009C95A1009F9A9D008B8989008B8989000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000097979700BCBDBD00C9C9
      C9007A7B7B00A5A7A70000000000000000001C1CA0002525B1003030D8001515
      CC001515CB001414CA002B2BD4003333C3001C1CA00000000000000000000000
      00000000000000000000000000001C1CA0000F0FAD000707B0000101A6000101
      A6000101A6000101AF0002029A001C1CA0006F6C6B00373737006E6E6E00ECEC
      EC00FCFCFC00FCFCFC00FBFBFB00FBFBFB00F9F9F900F8F8F800F5F5F500F3F3
      F300F0F0F000EDEDED00EAEAEA00E7E7E700E4E4E400E4E4E400E4E4E400E4E4
      E400E1E1E1009595950037373700666666000000000000000000000000000000
      00009A999900D4D0D000B7B6CE005756BD003131CC005353EE007D7DF800A4A4
      F800A9A9FA008080F8005252EF002C2BC70041409A008B869C009F9999008987
      8700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000098989800AAABAB00D2D2D2007879
      7900A4A6A6000000000000000000000000001C1CA0004747E5001919D4001919
      D4001818D3001818D1001616CF002E2ED7003636C5001C1CA000000000000000
      000000000000000000001C1CA0001717B2000A0AB3000101A6000101A6000101
      A6000101A6000101A6000202B4001C1CA0006F6C6B0006050500060505009292
      9200F6F6F600FCFCFC00FBFBFB00FBFBFB00F9F9F900F8F8F800F6F6F600F3F3
      F300F0F0F000EDEDED00EAEAEA00E7E7E700E4E4E400E4E4E400E4E4E400E4E4
      E400C8C8C80012121200060505006F6C6B00000000000000000000000000A6A6
      A600D8D8D9009898CF001D1DC4003C3CF3006969F2007E7EF3008F8FF6009C9C
      F7009D9DF7009191F6008282F3006C6CF2003D3DF3001717BC006E6A9800A099
      9A008A8787000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000098989800D2D2D2007B7B7B00A0A2
      A200000000000000000000000000000000001C1CA0004242CF003B3BE4001D1D
      DB001C1CDA001B1BD8001A1AD6001919D3003232DB003838C7001C1CA0000000
      0000000000001C1CA0002121B8001313BC000303AA000101A6000101A6000101
      A6000101A6000202AF000303A9001C1CA00087807D008F837E004A434100211F
      1F00B9B8B800F3F3F300F3F3F300F2F2F200F1F1F100EFEFEF00EDEDED00EBEB
      EB00E8E8E800E5E5E500E2E2E200DFDFDF00DCDCDC00DCDCDC00DCDCDC00D5D5
      D5004E4C4C004A4341008F837E0087807D000000000000000000ACACAC00DEDD
      DD009F9FD5001919D9003E3EEB005555ED006363EF007070F2007E7EF3008686
      F4008787F4008080F4007474F2006666F0005858EE003F3FEB001313D4006F6C
      9E00A19A9A008C8A8A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009A9B9B00CBCCCC00808080009A9C9C000000
      000000000000000000000000000000000000000000001C1CA0004747D1004040
      E9002020E1001F1FDF001E1EDD001C1CDA001A1AD6003333DC003838C7001C1C
      A0001C1CA0002929BE001C1CC6000909B4000606AF000303A9000101A6000101
      A6000303AF000404AA001C1CA0000000000087807D00A1938E00A1938E00544C
      4A001B1B1B00676767006C6C6C006C6C6C006C6C6C006B6B6B006B6B6B006A6A
      6A00696969006868680067676700666666006666660066666600666666004949
      4900524B4800A1938E00A1938E0087807D000000000000000000ACACAC00B0B0
      D0001515CE002D2DDA002F2FC6002121AA00292998003535C0006A6AF0006F6F
      F2007070F2006C6CF2003535C000292998002222AA003838D4002D2DDC000C0C
      B700908A9F008C8A8A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009A9B9B00BEBFBF008989890094959500000000000000
      00000000000000000000000000000000000000000000000000001C1CA0004D4D
      D3004444EE002222E6002121E3001F1FE0001D1DDD001B1BD8003333DE003737
      C7003232C5002525CF000E0EBF000B0BB9000808B3000505AD000202A7000606
      B1000707AB001C1CA000000000000000000088817E00A3958F00A3958F00524B
      4800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000524B4800A3958F00A3958F0088817E0000000000ABAAAA00D0CED1002827
      B5001C1CCE002B2BCC001A1AA3009797B700B6B6B6007272AF002F2FBF005C5C
      EF005C5CEF003030BF007272AF00B6B6B6009797B7001B1BA4002D2DCF001515
      CF002D2BA500A69FA3008B8A8A00000000000000000000000000000000000000
      000000000000000000008D8B8C008D8B8C007F7C7D0083808200848283008A88
      89008F8F8F009A9B9B00B0B0B000929393008C8D8D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C1C
      A0005050D3004848F0002525EA002323E7002121E3001E1EDE001C1CD9003232
      DD002D2DD9001313C9001010C3000D0DBD000A0AB7000707B1000C0CB6000B0B
      AD001C1CA00000000000000000000000000089827F00A5989200A59892005C53
      510033292B0033292B0033292B0033292B0033292B0033292B0033292B003329
      2B0033292B0033292B0033292B0033292B0033292B0033292B0033292B003329
      2B005C535100A5989200A598920089827F0000000000ABAAAA00A3A0C1000C0C
      C6001A1AB5002222C10029299800BBBBBB00B6B6B600B6B6B6007272AF002828
      BF002828BF007272AF00B6B6B600B6B6B600BBBBBB00292998002323C4001C1C
      B7000303BC008884A4008B8A8A00000000000000000000000000000000000000
      0000898989007D7C7D00B5B5B500EAE9EA00FFFFFF00FFFFFF00FFFFFF00DFDE
      DE00BDBBBB0088868700A3A2A300828383000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001C1CA0005353D3004C4CF1002727EB002424E8002121E4001E1EDE001C1C
      D9001919D3001616CD001212C7000F0FC1000C0CBB001313BF001414B3001C1C
      A000000000000000000000000000000000008B848200A99C9600A99C9600665C
      5A00433738004337380043373800433738004337380043373800433738004337
      3800433738004337380043373800433738004337380043373800433738004337
      3800665C5A00A99C9600A99C96008B848200B4B2B200BFBDBD004C4AB0000E0E
      BB001313A9001919B600090992007272AF00B6B6B600B6B6B600B6B6B6007272
      AF007272AF00B6B6B600B6B6B600B6B6B6007272AF000A0A93001A1AB7001414
      AB000707B8004A48A000ADA9A9009E9E9E000000000000000000000000008989
      890075747300E4E2E100FFFEFD00FFFEFD00FFFEFD00FFFEFE00FFFFFE00FFFF
      FE00F4F3F300D5D3D300979496008F8F8F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001C1CA0005454D3004D4DF1002828EB002424E9002121E3001E1E
      DE001B1BD8001818D1001414CB001111C4001D1DC9001C1CB8001C1CA0000000
      0000000000000000000000000000000000008E878500AEA29C00AEA29C00665D
      5B00392E3000392E3000392E3000392E3000392E3000392E3000392E3000392E
      3000392E3000392E3000392E3000392E3000392E3000392E3000392E3000392E
      3000665D5B00AEA29C00AEA29C008E878500B0AFAF00C0BDBD002726B7000909
      A4000C0C9D001111A9001616B200080890007272AF00B7B7B700B7B7B700BBBB
      BB00BBBBBB00B7B7B700B7B7B7007272AF00090991001717B4001212AA000D0D
      9F000606A5002E2DAD00B8B5B5009F9D9D000000000000000000898989006D6B
      6A00E6E1DC00FEFBF700FEFCF900FEFCF900FEFCF900FEFCF900FEFCFA00FEFC
      FA00FEFCFA00F8F7F400D8D6D600908D8F009494940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001C1CA0005353D3004B4BF1002727EB002323E8002020
      E2001D1DDB001919D5001616CE002525D2002424BE001C1CA000000000000000
      000000000000000000000000000000000000918B8900B4A9A400B4A9A4005E58
      55000E0B0C000E0B0C000E0B0C000E0B0C000E0B0C000E0B0C000E0B0C000E0B
      0C000E0B0C000E0B0C000E0B0C000E0B0C000E0B0C000E0B0C000E0B0C000E0B
      0C003D383700B4A9A400B4A9A400918B8900B0AFAF00BDBABA002928BF000303
      8800060690000A0A9A000D0DA4001111AB0006068E007474B200C2C2C200C2C2
      C200C2C2C200C2C2C2007474B20006068E001212AD000E0EA5000A0A9C000606
      9200030389001C1CB200C0BCBC009F9D9D00000000000000000078767600BBB5
      AD00FDF5EC00FEF9F300FEF9F400FEF9F400FEF9F400FEFAF400FEFAF500FEFA
      F500FEFAF600FEFAF600F6F3EF00BFBABB008B8A8B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001C1CA0007676DB006666F3002D2DEC002626EB002222
      E5001F1FDF001B1BD8001818D1002626D3002525C0001C1CA000000000000000
      00000000000000000000000000000000000095908D00BCB2AE00BCB2AE003733
      3200383131003831310038313100383131003831310038313100383131003831
      3100383131003831310038313100383131003831310038313100383131003831
      310039353400BCB2AE00BCB2AE0095908D00B0AFAF00B8B4B4005554C0008181
      E2004141CA002323BA001616AF001010AB00080896007E7EBD00DADADA00D8D8
      D800D8D8D800DADADA007E7EBD00090997001212AC001818B1002828BB004545
      CA007979DC004343BB00C6C2C2009F9D9D0000000000858585006A666200F5E9
      DC00FDF2E700FEF7EF00FEF7EF00FEF7EF00FEF7F000FEF7F000FEF8F000FEF8
      F000FEF8F100FEF8F100FEF9F200E3DEDA00938F9100A4A4A400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001C1CA0008484E0008282F6006464F1005A5AF0004343ED002A2A
      E9002020E1001C1CDB001919D4001515CD002121D0002121BE001C1CA0000000
      0000000000000000000000000000000000009A959300C6BDBA00C6BDBA002724
      2400686161006861610068616100686161006861610068616100686161006861
      6100686161006861610068616100686161006861610068616100686161006861
      610027242400C6BDBA00C6BDBA0095908D00B1B0B000B1ABAB006766BB008B8B
      E6005353D0003A3AC9002E2EC7001515A7008888C700F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F400F4F4F4008888C7001818A9003535C9004141CA005A5A
      D1009090E7005D5DB700CBC6C600A3A0A000000000006F6F6E0090887E00FCED
      DB00FDF0E200FDF4EA00FDF5EA00FDF5EB00FDF5EB00FDF5EB00FDF5EB00FDF5
      EC00FDF5EC00FDF6ED00FDF6ED00EFE9E100A39E9E0087878700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001C1CA0009191E3009292F7007676F3006F6FF2006868F2006060F1005858
      EF004A4AE9003333E0002020D6001616CE001212C7001C1CCB001C1CBA001C1C
      A000000000000000000000000000000000009A9593009E999800635F5E002C2B
      2B007C7B7B007C7B7B007C7B7B007C7B7B007C7B7B007C7B7B007C7B7B007C7B
      7B007C7B7B007C7B7B007C7B7B007C7B7B007C7B7B007C7B7B007C7B7B007C7B
      7B002C2B2B00635F5E009E99980095908D00B4B2B200A7A3A3006B69A700A0A0
      ED006262D3004848CB002222AA008989C900FEFEFE00FEFEFE00FEFEFE008989
      C9008989C900FEFEFE00FEFEFE00FEFEFE008989C9002424AA004F4FCC006A6A
      D500A1A1EF006E6DB500C7C4C4009F9F9F00000000006F6F6E009D928300FBE9
      D300FCEDDC00FDF2E500FDF2E500FDF2E600FDF2E600FDF3E700FDF3E700FDF3
      E700FDF3E700FDF3E800FDF3E800F5EADE00ACA6A30087878700000000000000
      0000000000000000000000000000000000000000000000000000000000001C1C
      A0009D9DE600A1A1F8008888F5008181F4007A7AF4007272F3006C6CF2007777
      F4006F6FF1005656E6005252E1004848DA003636D0002727C7002525C8002020
      BB001C1CA0000000000000000000000000000000000000000000000000000000
      0000000000000C0B10000C0B0B00141111001613130016131300161313001613
      130016131300161313001613130016131300141111000C0B0B000F0E13000000
      000000000000000000000000000000000000000000009F9D9D00837F9E008E8E
      E2007A7AD9005B5BCF001D1D9700FEFEFE00FEFEFE00FEFEFE008989C9001010
      9600101096008989C900FEFEFE00FEFEFE00FEFEFE001D1D97006363D0008484
      DC007474D000B8B6CE00999898000000000000000000706F6E009D8F7E00FBE5
      CB00FCEAD600FDF0E100FDF0E100FDF0E100FDF0E100FDF0E200FDF0E200FDF0
      E200FCEDDC00FCEDDC00FCEEDE00F3E8DC00AAA3A10087878700000000000000
      00000000000000000000000000000000000000000000000000001C1CA000AAAA
      E800AFAFF9009898F6009191F5008A8AF5008484F4007C7CF3008787F6007F7F
      E0007777DE007373EE005B5BE3005656DD005050D7004949D1004242C9004545
      CC004040C2001C1CA00000000000000000000000000000000000000000000000
      0000000000002B2838003934420025222B001714180013101200120F0F00120F
      0F00120F0F00120F0F001310110016131600221E2400332C3500272330000000
      000000000000000000000000000000000000000000009F9D9D00A19C9E006360
      AB00ABABED007676D5001C1C95009999D400FEFEFE008989C900161697004A4A
      CC004B4BCC00161697008989C900FEFEFE009999D4001D1D96007E7ED800AAAA
      ED007474C000D8D7D90099989800000000000000000089888900786C5F00FAE2
      C600FBE5CC00FBE8D200FBE8D200FBE8D200FBE8D200FBE7CF00FBE9D300FBE9
      D400FCEDDC00FCEFDE00FCEFDF00EADFD200A39D9D00A7A7A700000000000000
      000000000000000000000000000000000000000000001C1CA000B3B3EA00BBBB
      FA00A6A6F800A0A0F7009A9AF7009393F6008C8CF5009797F7008D8DE3001C1C
      A0001C1CA0007979DE007676EA006060DF005A5AD9005454D3004C4CCC004444
      C6004848C9004444C3001C1CA000000000000000000000000000000000000000
      0000000000002B283800413B4C00413A4A00403A49003F3948003F3846003E37
      45003D3644003D3642003C3541003B3440003B333E003A323D00272330000000
      0000000000000000000000000000000000000000000000000000A7A3A3008A86
      9C007473C500A3A3E6007474D0001F1F960028289E001C1C98006060D0005F5F
      CF005F5FCF006363D0001D1D980028289E001F1F96007979D100A6A6E6007474
      CA00C7C7E000A9A7A70000000000000000000000000000000000736B6200CBB8
      A100FAE4C900FCEBD700FCEBD700FCEBD700FCEDDC00FCEEDD00FCEEDD00FCEE
      DD00FCEEDD00FCEEDD00FCEEDD00D9D0C5008B88890000000000000000000000
      0000000000000000000000000000000000001C1CA000BBBBED00C3C3FB00B0B0
      F900ACACF800A7A7F800A0A0F7009A9AF700A5A5F9009A9AE6001C1CA0000000
      0000000000001C1CA0007C7CDE007575E7006060DB005858D4005151CD004949
      C7004343C1004747C6004747C4001C1CA0000000000000000000000000000000
      0000000000002B283800413B4C00413A4A00403A49003F3948003F3846003E37
      45003D3644003D3642003C3541003B3440003B333E003A323D002B2838000000
      0000000000000000000000000000000000000000000000000000A7A5A5009E98
      980079759C009796D700AFAFE9008F8FDA008181D7007A7AD4007777D4007676
      D4007777D4007878D4007D7DD5008484D7009393DC00B0B0EA007575CA009898
      CA00E0DEDE00A9A7A700000000000000000000000000000000007A7776008C7D
      6D00F2DBC000FCEDDA00FCEEDD00FCEEDD00FCEEDD00FCEEDD00FCEEDD00FCEE
      DD00FCEEDD00FCEEDD00E9DED000B3ABA8008B88890000000000000000000000
      0000000000000000000000000000000000001C1CA000D1D1FD00B8B8F900B5B5
      F900B1B1F800ACACF800A7A7F700B0B0F900A7A7E9001C1CA000000000000000
      000000000000000000001C1CA0007A7ADD007171E3005B5BD5005454CE004D4D
      C7004646C1004141BD005151CF001C1CA0000000000000000000000000000000
      0000000000000000000025233200413A4A00403A49003F3948003F3846003E37
      45003D3644003D3642003C3541003B3440003B333E0023202D00000000000000
      000000000000000000000000000000000000000000000000000000000000ABA9
      A9009C9697006B6695007574BC00CBCBF400ACACE5009C9CDD009393DA009191
      D9009191D9009595DA009E9EDD00AFAFE500C6C6F3007978C5009F9EC600D1D0
      D100B0AFAF000000000000000000000000000000000000000000000000007C75
      6F0095857300F3E1CB00FCEEDD00FCEEDD00FCEEDD00FCEEDD00FCEEDD00FCEE
      DD00FCEEDD00ECE0D200BEB5AD008F8D8D000000000000000000000000000000
      0000000000000000000000000000000000001C1CA000A6A6E100CACAFC00B9B9
      F900B6B6F900B1B1F800BBBBFA00B1B1EC001C1CA00000000000000000000000
      00000000000000000000000000001C1CA0007777DB006C6CDE005555CD004E4E
      C7004848C1005050CA004646B9001C1CA0000000000000000000000000000000
      0000000000000000000025233200413A4A00403A49003F3948003F3846003E37
      45003D3644003D3642003C3541003B3440003B333E002B283800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ACAAAA009D979700958E9A0067659E007A7AC200B1B1E600CACAF200C5C5
      F000C4C4F000C9C9F200AFAFE7008888CB007B7AB600C0BDCA00CCCACA00ADAD
      AD00000000000000000000000000000000000000000000000000000000000000
      0000827B750091837300D9CBBB00F9EBDA00FCEEDD00FCEEDD00FCEEDD00F1E5
      D500D3C8BB00B4A9A0008C888800000000000000000000000000000000000000
      000000000000000000000000000000000000000000001C1CA000A9A9E200CBCB
      FB00BABAF900C4C4FB00BBBBEE001C1CA0000000000000000000000000000000
      0000000000000000000000000000000000001C1CA0007373DA006464D8004D4D
      C6005757CF004C4CBD001C1CA000000000000000000000000000000000000000
      0000000000000000000000000000302C3B00403A49003F3948003F3846003E37
      45003D3644003D3642003C3541003B3440002C27340000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A9A7A700ABA6A6009D989A0097919D0079769C00676498006765
      A6006866A7006E6CA1008887AD00B2AFBB00BFBBBF00AAA9A900AAA9A9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008E8988008D827A00988D8200AEA39400BAAE9F00AEA39600A498
      8E008F8782008F87820000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C1CA000AEAE
      E400D6D6FD00C6C6F1001C1CA000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001C1CA0006F6FD8006A6A
      DC005151C1001C1CA00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002B2838002B2838003F3846003E37
      45003D3644003D3642002B2838002B2838000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5A4A400A5A4A400A7A4A400A7A1A100ACA7
      A700B1ABAB00B4ADAD00B4B1B100A6A4A400A6A4A40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009B9A9A009B9A9A009B9A9A009B9A9A009B9A
      9A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C1C
      A0001C1CA0001C1CA00000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C1CA0001C1C
      A0001C1CA0000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002B2838002926
      3400292533002B28380000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4B2B200B4B2B200B0B0
      B000B0B0B000B0B0B000ADACAC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000013A5FF0013A5FF0013A5FF0013A5FF0013A5FF0013A5FF0013A5FF0013A5
      FF0013A5FF0013A5FF0013A5FF0013A5FF0013A5FF0013A5FF0013A5FF0013A5
      FF00000000000000000000000000000000000000000000000000000000000000
      000026B8FF0026B8FF0026B8FF0026B8FF0026B8FF0026B8FF0026B8FF00A99C
      8A00A99C8A00A99C8A00A99C8A00A99C8A00A99C8A00A99C8A00A99C8A00A99C
      8A00A99C8A00A99C8A00A99C8A00A99C8A000000000000000000000000000000
      000024B8FF0024B8FF0024B8FF0024B8FF0024B8FF0024B8FF0024B8FF0024B8
      FF0024B8FF0024B8FF0024B8FF0024B8FF0024B8FF0024B8FF0024B8FF0024B8
      FF0000000000000000000000000000000000000000007B3E0B007B3E0B007B3E
      0B00653903007B503200ABABAB00AEAEAE00ADADAD00A4A4A4009B9B9B009292
      92008A8A8A00838383007E7E7E00757575006A6A6A006B4A3200964004009640
      040065390300763708007F3B0A000000000000000000000000000000000013A5
      FF0010A0FF0014A4FF001FADFF002DBAFF0043C6FF0057CFFF004DCEFF003ACA
      FF0037CBFF003ACFFF003ED3FF003DD1FF000186030000810000008100000082
      030013A5FF0000000000000000000000000000000000000000000000000026B8
      FF0020B4FF0022B6FF003CC1FF004DCBFF004FCFFF004ACFFF0046D0FF00A99C
      8A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A99C8A0000000000000000000000000024B8
      FF0020B4FF0022B6FF003CC1FF004DCBFF004FCFFF004ACFFF0046D0FF004AD3
      FF004FD7FF0054DAFF0058DDFF0057DCFF0050D7FF0042CFFF003BCAFF0032C1
      FF0024B8FF00000000000000000000000000884B1200BC651A00C46A1C00C56A
      1C008D510F0057411A00F0F0F0006F5F52007B5032007B5032008D827A00CECE
      CE00BDBDBD00ADADAD00A1A1A10094949400818181006B4A3200964004009640
      040065390300B455110091440B000000000000000000000000000000000013A5
      FF001AA5FF0029B6FF0057CEFF007EDEFF009AE7FF00AAEDFF009EEBFF0088E9
      FF0077E7FF007BEAFF0080EDFF0080EDFF000081000016B01E0011AC18000081
      000013A5FF0000000000000000000000000000000000000000000000000026B8
      FF002EB8FF004AC9FF008BE0FF00AEEBFF00A7ECFF008EE8FF007EE6FF00A99C
      8A00FFFFFF00EAE9E400E8E7E100E1DAD100A0411200A03E0B00C69E8500DFDB
      D400DDD9D100DBD7CE00FFFFFF00A99C8A0000000000000000000000000024B8
      FF002EB8FF004AC9FF008BE0FF00AEEBFF00A7ECFF008EE8FF007EE6FF0085E9
      FF008DECFF0094EFFF0098F1FF0098F1FF008DEDFF0076E4FF0055D6FF002ABE
      FF0024B8FF00000000000000000000000000884B1200C76D1D00C76D1D00C76E
      1D00C76E1D0057411A00E6E6E6006B4A320096400400964004008F796A00DBDB
      DB00C9C9C900B8B8B800A9A9A9009E9E9E008F8F8F006B4A3200964004009640
      040065390300B455110091440B000000000000000000000000000000000013A5
      FF0042C1FF002DBBFF0056CEFF007DDDFF0099E7FF00A7EBFF009CEAFF0084E6
      FF0072E5FF0074E7FF0077E9FF0076E9FF000081000024B129001DAC21000081
      000013A5FF0000000000000000000000000000000000000000000000000026B8
      FF005DCFFF004FCDFF0089DFFF00ADEBFF00A5EBFF008CE7FF007AE4FF00A99C
      8A00FFFFFF00E8E7E100FEFEFD00CB977C00B7653300B9662F00A2441300F4E8
      DD00FAF2E900D9D4CB00FFFFFF00A99C8A0000000000000000000000000024B8
      FF005DCFFF004FCDFF0089DFFF00ADEBFF00A5EBFF008CE7FF007AE4FF0080E7
      FF0087EAFF008DEDFF0090EEFF008FEEFF0086EAFF0072E2FF005DD9FF0029BD
      FF0024B8FF000000000000000000000000008A4D1300C9701F00CA711F00CA71
      1F00CA711F0057411A00DBDBDB006B4A32009640040096400400927D6E00E8E8
      E800D6D6D600C5C5C500B4B4B400A6A6A6009B9B9B006B4A3200964004009640
      040065390300B556110091440B000000000000000000000000000000000013A5
      FF0050C6FF002DBBFF0055CCFF007ADCFF0097E6FF00A5EBFF0098E9FF0080E5
      FF006AE1FF006BE2FF006DE3FF006DE3FF000081000038BC3C002DB732000081
      000013A5FF0000000000000000000000000000000000000000000000000026B8
      FF006BD3FF004DCDFF0088DFFF00ACEAFF00A3EAFF0089E5FF0076E2FF00A99C
      8A00FFFFFF00E6E5DF00F8EFE900A74C1A00D28D5300CA814600B0541900C992
      7400F9F0E500D7D2C900FFFFFF00A99C8A0000000000000000000000000024B8
      FF006BD3FF004DCDFF0088DFFF00ACEAFF00A3EAFF0089E5FF0076E2FF007BE5
      FF0081E8FF0085E9FF0087EAFF0087EAFF007FE7FF006CE0FF0059D7FF0027BB
      FF0024B8FF000000000000000000000000008C4F1400CC732000CD742100CD75
      2100CD75210057411A00CDCDCD006B4A3200964004009640040095807100F4F4
      F400E3E3E300D1D1D100C0C0C000AFAFAF00A3A3A3006B4A3200964004009640
      040065390300B658120091440B000000000000000000000000000000000013A5
      FF005ECCFF002BBBFF0052CBFF0078DAFF0095E5FF00A3EAFF0095E7FF007AE2
      FF00068A09000081000000810000008100002AAC2C0050CA53003EC1410014A0
      17000081000000810000008100000081000000000000000000000000000026B8
      FF0079D8FF004CCCFF0086DEFF00AAEAFF00A0E9FF0085E3FF0070E0FF00A99C
      8A00FFFFFF00E4E2DC00D1A38A00C5783E00DD9D5F00D0884B00CA7A3700A445
      1300F2E2D400D6D0C600FFFFFF00A99C8A0000000000000000000000000024B8
      FF0079D8FF004CCCFF0086DEFF00AAEAFF00A0E9FF0085E3FF0070E0FF0074E2
      FF00151B9E000202940002029400020294000202940002029400020294000202
      9400020294000202940002029400020294008D511500CF772200CF772200CF78
      2300D078230057411A00BEBEBE006B4A32009640040096400400957F7000FDFD
      FD00F0F0F000DEDEDE00CCCCCC00BBBBBB00ABABAB006B4A3200964004009640
      040065390300B85A140092450B000000000000000000000000000000000013A5
      FF006FD1FF0029BBFF0051CBFF0075D9FF0091E3FF009FE7FF0090E5FF0074DE
      FF000081000091E9950096E7980097E999008BE38E006CDA6D0049C54B0039BF
      3E0026B22B0014A6190007A40E000081000000000000000000000000000026B8
      FF0089DCFF004ACCFF0085DEFF00A7E9FF009DE8FF0080E2FF006ADEFF00A99C
      8A00FFFFFF00E2E0D900AF5C3000E6B58400E0A97500A2410C00D2884600B55A
      1B00C88F6F00D4CDC300FFFFFF00A99C8A0000000000000000000000000024B8
      FF0089DCFF004ACCFF0085DEFF00A7E9FF009DE8FF0080E2FF006ADEFF006DDF
      FF0002029400A5A5FB009191F8008D8DF7008B8BF8006262F2004242E5003030
      D8001E1EC9000C0CB8000303B800020294008F531600D17A2400D27B2500D27C
      2600D27C260057411A00B0B0B0006B4A32009640040096400400937E6F00FCFC
      FC00FBFBFB00EBEBEB00D9D9D900C8C8C800B7B7B7006B4A3200964004009640
      040065390300B95C140093460C000000000000000000000000000000000013A5
      FF007FD8FF0028BAFF004ECBFF0072D9FF008EE2FF009CE6FF008BE2FF006DDC
      FF0000810000A7F0AA00ABEFAC00ACEFAD009EEB9F007BDC7D0060D3630050CE
      530033BB370018AA1E000AA712000081000000000000000000000000000026B8
      FF0097E1FF0047CCFF0083DDFF00A5E8FF009AE6FF007BDFFF0063DBFF00A99C
      8A00FFFFFF00E1DED600AD572600C27C4F00B25F3000BD7A5600BA652B00CC7C
      3600A4451100CEC1B500FFFFFF00A99C8A0000000000000000000000000024B8
      FF0097E1FF0047CCFF0083DDFF00A5E8FF009AE6FF007BDFFF0063DBFF0066DC
      FF0002029400A8A8FC009797F8009494F8008F8FF8008D8DF9007A7AF4005151
      E4003434D3000E0EBD000303B8000202940090561B00D4812E00D5833100D584
      3300D584340057411A0098989800615449006B4A32006B4A32007E767000D2D2
      D200D6D6D600D1D1D100C3C3C300B6B6B600A9A9A9006B4A3200964004009640
      040065390300BB5E150094470D000000000000000000000000000000000013A5
      FF0091DEFF0025BAFF004BCAFF006FD8FF008AE1FF0098E5FF0087E1FF0067D8
      FF00038707000081000000810000008100003FB4400096E997007ADE7D0028AF
      2A000081000000810000008100000081000000000000000000000000000026B8
      FF00A7E6FF0045CBFF0080DDFF00A3E8FF0096E5FF0075DDFF005CD8FF00A99C
      8A00FFFFFF00DFDBD400E8D0C000E2C2AF00E7CCBA00F8EEE200A9512200CE82
      4100B0541600B47E5F00FFFFFF00A99C8A0000000000000000000000000024B8
      FF00A7E6FF0045CBFF0080DDFF00A3E8FF0096E5FF0075DDFF005CD8FF005ED9
      FF00131B9E000202940002029400020294000202940002029400020294000202
      940002029400020294000202940002029400925B2300D7893B00D78B3F00D88D
      4100D88D42008E5D1F00754D1200754C1100754B1000744A0F0074490D007448
      0B0073470A0073470A0072460A00724609007145090071440900704308006F43
      08007C470A00BC5F160095480D000000000000000000000000000000000013A5
      FF00A3E3FF0023BAFF0048CAFF006CD8FF0087E1FF0095E3FF0081DEFF0060D5
      FF0043CCFF0041CCFF0041CCFF0041CCFF00008100009DEA9E0082E086000081
      000013A5FF0000000000000000000000000000000000000000000000000026B8
      FF00B6EAFF0043CBFF007EDDFF00A1E8FF0093E5FF0070DCFF0054D5FF00A99C
      8A00FFFFFF00DDD9D100FAF2E900F9F0E500F8EEE200F7ECDF00D3A58900B45E
      2500BD682A009F400E00F9F2EF00A99C8A0000000000000000000000000024B8
      FF00B6EAFF0043CBFF007EDDFF00A1E8FF0093E5FF0070DCFF0054D5FF0056D6
      FF0059D7FF005BD8FF005CD8FF005CD8FF0057D6FF004BCFFF003FC9FF001CB0
      FF0024B8FF0000000000000000000000000094602B00D9914900C5793500CD94
      6100CC936100CC936000CB915E00CA8F5B00C98D5800C78B5400C6885000C584
      4B00C3824800C3814800C1804700C07F4600BF7D4600BE7C4500BD7A4400BC79
      4300B9631E00BD61170095490D000000000000000000000000000000000013A5
      FF00B4E9FF004BC9FF0045CAFF0069D8FF0083E0FF0091E3FF007DDDFF005AD3
      FF003CC9FF0039C9FF0039C9FF0039C9FF000081000097E798007FDD82000081
      000013A5FF0000000000000000000000000000000000000000000000000026B8
      FF00C4EEFF006ED8FF007BDDFF009EE8FF0090E5FF006BDCFF004ED4FF00A99C
      8A00FFFFFF00DBD7CE00D9D4CB00D7D2C900D6D0C600D4CDC300D2CBC100A34B
      1D00BC6A3300A3420C00CC997F00A99C8A0000000000000000000000000024B8
      FF00C4EEFF006ED8FF007BDDFF009EE8FF0090E5FF006BDCFF004ED4FF004FD4
      FF0051D4FF0053D5FF0053D5FF0053D5FF004FD3FF0045CDFF0068D5FF0070D6
      FF0024B8FF0000000000000000000000000095653300DC995600AF734500ECEC
      EC00EAEAEA00E8E8E800E5E5E500E3E3E300E1E1E100DEDEDE00DCDCDC00DADA
      DA00D8D8D800D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600B3581200BF621800964A0E000000000000000000000000000000000013A5
      FF0043C1FF0093E1FF00BFEEFF00C4F0FF00C7F2FF00CAF3FF00C9F2FF00C7F2
      FF00C5F0FF00C5F0FF00C5F0FF00C5F0FF000081000089E68F0074DD79000081
      000013A5FF0000000000000000000000000000000000000000000000000026B8
      FF005ECFFF00A9E8FF00CAF1FF00D3F4FF00D4F5FF00D2F5FF00D1F4FF00A99C
      8A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D9B2
      9F00A94F1D00A64919009F411100A99C8A0000000000000000000000000024B8
      FF005ECFFF00A9E8FF00CAF1FF00D3F4FF00D4F5FF00D2F5FF00D1F4FF00D1F4
      FF00D2F4FF00D2F4FF00D2F4FF00D2F4FF00D1F4FF00CFF2FF00AFE9FF0065D0
      FF0024B8FF00000000000000000000000000976A3B00DFA16300AF734500ECEC
      EC00EAEAEA00E8E8E800E5E5E500E3E3E300E1E1E100DEDEDE00DCDCDC00DADA
      DA00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600B3581200BF641800964A0E000000000000000000000000000000000013A5
      FF0010A0FF0012A3FF001FAFFF002DBDFF0038C5FF003FC7FF003EC9FF0039CA
      FF0035CAFF0037CCFF003ACFFF0039CFFF000286050000810000008100000387
      070013A5FF0000000000000000000000000000000000000000000000000026B8
      FF0020B4FF0027B7FF003DC2FF004DCEFF004FD1FF0049D0FF0045D1FF00A99C
      8A00A99C8A00A99C8A00A99C8A00A99C8A00A99C8A00A99C8A00A99C8A00A99C
      8A009E4A1E009F3F0F009A3B0A00A99C8A0000000000000000000000000024B8
      FF0020B4FF0027B7FF003DC2FF004DCEFF004FD1FF0049D0FF0045D1FF0049D3
      FF004DD6FF0051D8FF0054DAFF0053DAFF004DD6FF0041CEFF0038C8FF0032C2
      FF0024B8FF00000000000000000000000000996E4200E1A97000AF734500CFCF
      CF00CDCDCD00CCCCCC00CBCBCB00CACACA00C9C9C900C8C8C800C6C6C600C5C5
      C500C4C4C400C3C3C300C2C2C200C1C1C100BFBFBF00BEBEBE00BEBEBE00BEBE
      BE00B3581200C0651900974B0F000000000000000000000000000000000013A5
      FF0019A5FF002BB7FF0058CFFF007FDEFF009AE9FF00AAEDFF009EEBFF0089E9
      FF0078E7FF007BEBFF0081EDFF0080EDFF0074E7FF005BDCFF003ECBFF0017AB
      FF0013A5FF0000000000000000000000000000000000000000000000000026B8
      FF002DB8FF004ECAFF008DE1FF00AEECFF00A6EBFF008EE8FF007EE6FF0085E9
      FF008DEDFF0094F0FF0099F1FF0098F1FF008DEDFF0076E4FF0058D7FF002ABD
      FF0026B8FF0000000000000000000000000000000000000000000000000024B8
      FF002DB8FF004ECAFF008DE1FF00AEECFF00A6EBFF008EE8FF007EE6FF0085E9
      FF008DEDFF0094F0FF0099F1FF0098F1FF008DEDFF0076E4FF0058D7FF002ABD
      FF0024B8FF000000000000000000000000009A724900E4B07C00AF734500FCFC
      FC00FAFAFA00F7F7F700F5F5F500F3F3F300F0F0F000EEEEEE00ECECEC00E9E9
      E900E7E7E700E5E5E500E3E3E300E0E0E000DEDEDE00DCDCDC00D9D9D900D7D7
      D700B3581200C1661900974B0F000000000000000000000000000000000013A5
      FF0042C1FF002EBBFF0057CEFF007EDDFF0099E7FF00A9EDFF009CEAFF0084E7
      FF0072E5FF0074E7FF0077E9FF0077E9FF006DE3FF0057D9FF0042CEFF0016AA
      FF0013A5FF0000000000000000000000000000000000000000000000000026B8
      FF005DCFFF0051CDFF008CE0FF00ADEBFF00A4EBFF008CE7FF007BE4FF0081E8
      FF0088EAFF008DEDFF0090EEFF0090EEFF0087EAFF0072E2FF005DD9FF0029BC
      FF0026B8FF0000000000000000000000000000000000000000000000000024B8
      FF005DCFFF0051CDFF008CE0FF00ADEBFF00A4EBFF008CE7FF007BE4FF0081E8
      FF0088EAFF008DEDFF0090EEFF0090EEFF0087EAFF0072E2FF005DD9FF0029BC
      FF0024B8FF000000000000000000000000009B764F00E6B68700AF734500FCFC
      FC00FAFAFA00F7F7F700F5F5F500F3F3F300F0F0F000EEEEEE00ECECEC00E9E9
      E900E7E7E700E5E5E500E3E3E300E0E0E000DEDEDE00DCDCDC00D9D9D900D7D7
      D700B3581200C2661A00974C0F000000000000000000000000000000000013A5
      FF0050C7FF002DBBFF0055CCFF007BDCFF0097E6FF00A5EBFF0098E9FF0080E5
      FF006BE1FF006CE3FF006EE5FF006EE3FF0066E0FF0051D7FF003FCBFF0015A9
      FF0013A5FF0000000000000000000000000000000000000000000000000026B8
      FF006BD4FF0050CDFF008AE0FF00ACEBFF00A2EAFF0088E5FF0076E3FF007BE5
      FF0081E8FF0086EAFF0088EBFF0088EAFF0080E7FF006CE0FF0059D7FF0027BB
      FF0026B8FF0000000000000000000000000000000000000000000000000024B8
      FF006BD4FF0050CDFF008AE0FF00ACEBFF00A2EAFF0088E5FF0076E3FF007BE5
      FF0081E8FF0086EAFF0088EBFF0088EAFF0080E7FF006CE0FF0059D7FF0027BB
      FF0024B8FF000000000000000000000000009C795400E8BC9000AF734500D2D2
      D200D2D2D200D2D2D200D2D2D200D1D1D100D1D1D100CFCFCF00CECECE00CDCD
      CD00CCCCCC00CBCBCB00CACACA00C8C8C800C7C7C700C6C6C600C5C5C500C4C4
      C400B3581200C2671A00984C0F000000000000000000000000000000000013A5
      FF005ECCFF002CBBFF0053CCFF0078DAFF0095E5FF00A3EAFF0095E7FF007AE2
      FF0064DDFF0063DEFF0065E0FF0065E0FF005DDCFF004BD3FF003BC9FF0013A6
      FF0013A5FF0000000000000000000000000000000000000000000000000026B8
      FF0079D8FF004ECDFF0089DFFF00AAEAFF009FE9FF0084E3FF0070E0FF0075E3
      FF007AE5FF007DE6FF007FE7FF007FE7FF0078E4FF0066DDFF0055D5FF0025B9
      FF0026B8FF0000000000000000000000000000000000000000000000000024B8
      FF0079D8FF004ECDFF0089DFFF00AAEAFF009FE9FF0084E3FF0070E0FF0075E3
      FF007AE5FF007DE6FF007FE7FF007FE7FF0078E4FF0066DDFF0055D5FF0025B9
      FF0024B8FF000000000000000000000000009D7B5700E9C09600AF734500FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFDFD00FBFBFB00F9F9
      F900F7F7F700F4F4F400F7F7F700F5F5F500F3F3F300F0F0F000EEEEEE00ECEC
      EC00B3581200C2671A00984C0F000000000000000000000000000000000013A5
      FF006ED1FF002ABBFF0051CCFF0075D9FF0091E3FF009FE7FF0090E5FF0075E0
      FF005CD9FF005ADAFF005CDAFF005CDAFF0055D8FF0045CFFF0036C5FF0012A4
      FF0013A5FF0000000000000000000000000000000000000000000000000026B8
      FF0088DCFF004CCDFF0087DFFF00A8E9FF009CE8FF0080E2FF006ADEFF006EE0
      FF0072E1FF0075E3FF0077E3FF0077E3FF0070E1FF0060DAFF0050D2FF0023B7
      FF0026B8FF0000000000000000000000000000000000000000000000000024B8
      FF0088DCFF004CCDFF0087DFFF00A8E9FF009CE8FF0080E2FF006ADEFF006EE0
      FF0072E1FF0075E3FF0077E3FF0077E3FF0070E1FF0060DAFF0050D2FF0023B7
      FF0024B8FF000000000000000000000000009D7C5800EAC19900AF734500FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFD
      FD00FCFCFC00FAFAFA00F7F7F700F5F5F500F3F3F300F0F0F000EEEEEE00ECEC
      EC00B3581200C2671A00984C0F000000000000000000000000000000000013A5
      FF007FD8FF0028BAFF004FCBFF0073D9FF008EE2FF009CE6FF008BE3FF006EDC
      FF0054D5FF0052D5FF0053D7FF0053D7FF004DD3FF0040CAFF0031C1FF0011A1
      FF0013A5FF0000000000000000000000000000000000000000000000000026B8
      FF0097E1FF004ACCFF0085DEFF00A6E8FF0099E6FF007BE0FF0063DBFF0067DD
      FF006ADEFF006DDFFF006EE0FF006EE0FF0068DDFF005AD6FF004ACFFF0021B5
      FF0026B8FF0000000000000000000000000000000000000000000000000024B8
      FF0097E1FF004ACCFF0085DEFF00A6E8FF0099E6FF007BE0FF0063DBFF0067DD
      FF006ADEFF006DDFFF006EE0FF006EE0FF0068DDFF005AD6FF004ACFFF0021B5
      FF0024B8FF000000000000000000000000009D7B5700E9C09600AF734500C4C4
      C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4
      C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4
      C400B3581200C2671A00984C0F000000000000000000000000000000000013A5
      FF0090DDFF0026BAFF004CCBFF006FD8FF008AE1FF0098E5FF0087E1FF0068D8
      FF004CD1FF0049D1FF004AD1FF004AD1FF0045CFFF0039C6FF002DBFFF000F9E
      FF0013A5FF0000000000000000000000000000000000000000000000000026B8
      FF00A6E5FF0048CCFF0083DEFF00A4E8FF0096E5FF0075DDFF005CD8FF005FD9
      FF0062DBFF0064DCFF0065DCFF0065DCFF0060DAFF0053D3FF0045CDFF001EB2
      FF0026B8FF0000000000000000000000000000000000000000000000000024B8
      FF00A6E5FF0048CCFF0083DEFF00A4E8FF0096E5FF0075DDFF005CD8FF005FD9
      FF0062DBFF0064DCFF0065DCFF0065DCFF0060DAFF0053D3FF0045CDFF001EB2
      FF0024B8FF000000000000000000000000009C795400E8BC8F00AF734500FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFDFD00FBFBFB00F9F9F900F6F6
      F600B3581200C2671A00984C0F000000000000000000000000000000000013A5
      FF00A1E3FF0023BAFF0049CAFF006CD8FF0087E1FF0095E3FF0082DEFF0060D5
      FF0044CCFF0041CCFF0042CEFF0042CEFF003ECAFF0033C2FF0028BAFF000D9C
      FF0013A5FF0000000000000000000000000000000000000000000000000026B8
      FF00B5EAFF0045CCFF0080DEFF00A1E8FF0092E5FF0070DCFF0055D5FF0057D6
      FF005AD7FF005CD8FF005DD9FF005DD9FF0058D6FF004CD0FF003FC9FF001CB0
      FF0026B8FF0000000000000000000000000000000000000000000000000024B8
      FF00B5EAFF0045CCFF0080DEFF00A1E8FF0092E5FF0070DCFF0055D5FF0057D6
      FF005AD7FF005CD8FF005DD9FF005DD9FF0058D6FF004CD0FF003FC9FF001CB0
      FF0024B8FF0000000000000000000000000085542C00AF734500AF734500FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFDFD00FBFB
      FB00B35812009C4B0D008B3F08000000000000000000000000000000000013A5
      FF00B4E9FF0032C0FF0046CAFF0069D8FF0083E1FF0091E3FF007EDEFF005BD3
      FF003DCAFF003AC9FF003AC9FF003AC9FF0036C6FF002DBFFF002BBBFF0041BF
      FF0013A5FF0000000000000000000000000000000000000000000000000026B8
      FF00C4EEFF0056D1FF007EDEFF009FE7FF008FE5FF006BDBFF004FD4FF0050D4
      FF0052D4FF0054D5FF0054D5FF0054D5FF0050D3FF0045CDFF004DCDFF006BD5
      FF0026B8FF0000000000000000000000000000000000000000000000000024B8
      FF00C4EEFF0056D1FF007EDEFF009FE7FF008FE5FF006BDBFF004FD4FF0050D4
      FF0052D4FF0054D5FF0054D5FF0054D5FF0050D3FF0045CDFF004DCDFF006BD5
      FF0024B8FF000000000000000000000000006E310800000000008A4B2A00C4C4
      C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4
      C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4C400C4C4
      C40082462900000000007F3302000000000000000000000000000000000013A5
      FF0062CEFF00BAEBFF00BFEEFF00C7F2FF00CFF4FF00D1F4FF00CFF3FF00CAF2
      FF00C5F0FF00C5F0FF00BBEEFF009EE6FF00A5E7FF00C1EEFF00BDEDFF0064CE
      FF0013A5FF0000000000000000000000000000000000000000000000000026B8
      FF007CD9FF00CAF1FF00CFF3FF00D3F4FF00D4F5FF00D2F5FF00D1F4FF00D1F4
      FF00D2F4FF00D2F4FF00D3F4FF00D3F4FF00D1F4FF00CFF2FF00C3EEFF007ED9
      FF0026B8FF0000000000000000000000000000000000000000000000000024B8
      FF007CD9FF00CAF1FF00CFF3FF00D3F4FF00D4F5FF00D2F5FF00D1F4FF00D1F4
      FF00D2F4FF00D2F4FF00D3F4FF00D3F4FF00D1F4FF00CFF2FF00C3EEFF007ED9
      FF0024B8FF00000000000000000000000000834F2400AC6B37007E3B33002100
      8C0021008C0021008C0021008C0021008C0021008C0021008C0021008C002100
      8C0021008C0021008C0021008C0021008C0021008C0021008C0021008C002100
      8C00773128009C4A0D008B3F0800000000000000000000000000000000000000
      000013A5FF0013A5FF0013A5FF0013A5FF0013A5FF0013A5FF0013A5FF0013A5
      FF0013A5FF0013A5FF0013A5FF0013A5FF0013A5FF0013A5FF0013A5FF0013A5
      FF00000000000000000000000000000000000000000000000000000000000000
      000026B8FF0026B8FF0026B8FF0026B8FF0026B8FF0026B8FF0026B8FF0026B8
      FF0026B8FF0026B8FF0026B8FF0026B8FF0026B8FF0026B8FF0026B8FF0026B8
      FF00000000000000000000000000000000000000000000000000000000000000
      000024B8FF0024B8FF0024B8FF0024B8FF0024B8FF0024B8FF0024B8FF0024B8
      FF0024B8FF0024B8FF0024B8FF0024B8FF0024B8FF0024B8FF0024B8FF0024B8
      FF0000000000000000000000000000000000834F24008654280087422E006935
      8900693589006935890069358900693589006935890069358900693589006935
      8900693589006935890069358900693589006935890069358900693589006935
      8900843D27007A3D0B007E3B070000000000424D3E000000000000003E000000
      2800000060000000600000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF00FC003FFC3FFFFFFFFF000000F0000FF0
      3FFFFFFFFF000000E00007C03FFFFFFFFF000000C03C03003FFFFFFF3F000000
      C0E70300003FFFFE1F00000083C3C100003FC0000F00000007C3E000003FC000
      0700000007C3E0003E3FC000030000000FC3F0003C1FC000030000000FC3F000
      3C0FC00003000000180018003E07C00003000000100008000003C00007000000
      100008000001C00003000000180018000001C000030000000FC3F0000001C000
      030000000FC3F0000003C0000300000007C3E0003E07C0000300000007C3E000
      3C0FC0000F00000083C3C1003C1FC0000F000000C0E703003C3FC00FFF000000
      C03C03007C3FE01FFF000000E0000701FE3FFFFFFF000000F0000F00003FFFFF
      FF000000FC003F00003FFFFFFF000000FF81FFFF81FFFF81FFFF81FFFE007FFE
      007FFE007FFE007FF8001FF8001FF8001FF8001FF0000FF0000FF0000FF0000F
      E00007E00007E00007E00007C00003C00003C00003C00003C00003C00003C000
      03C0000380000180000180000180000180000180000180000180000100000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000800001800001800001800001800001800001800001800001C00003C0
      0003C00003C00003C00003C00003C00003C00003E00007E00007E00007E00007
      F0000FF0000FF0000FF0000FF8001FF8001FF8001FF8001FFE007FFE007FFE00
      7FFE007FFF81FFFF81FFFF81FFFF81FFFFFFF3E3FFC7FFFFFFFF81FFFFFFE1C1
      FF83800001FE007FFFFFC180FF01C00003F8001FFFFF83007E00000000F0000F
      FFFF07003C00000000E00007FFFF0F001800000000C00003FFFE1F8000010000
      00C00003FFFC3FC00003000000800001FC007FE00007000000800001F000FFF0
      000F000000000000E000FFF8001F000000000000C0007FFC003F000000000000
      C0007FFC003F00000000000080003FF8001F00000000000080003FF0000F0000
      0000000080003FE00007F8001F80000180003FC00003F8001F80000180003F80
      0001F8001FC00003C0007F001800F8001FC00003C0007F003C00FC003FE00007
      E000FF007E00FC003FF0000FF001FF80FF01FE007FF8001FF803FFC1FF83FF00
      FFFE007FFE0FFFE3FFC7FFC3FFFF81FFF0000FF00000F0000F800001E00007E0
      0000E00007000001E00007E00000E00007000001E00007E00000E00007000001
      E00007E00000E00007000001E00000E00000E00000000001E00000E00000E000
      00000001E00000E00000E00000000001E00000E00000E00000000001E00007E0
      0000E00007000001E00007E00000E00007000001E00007E00000E00007000001
      E00007E00000E00007000001E00007E00007E00007000001E00007E00007E000
      07000001E00007E00007E00007000001E00007E00007E00007000001E00007E0
      0007E00007000001E00007E00007E00007000001E00007E00007E00007000001
      E00007E00007E00007000001E00007E00007E00007400005E00007E00007E000
      07000001F0000FF0000FF0000F00000100000000000000000000000000000000
      000000000000}
  end
  inherited DS: TDataSource
    Left = 792
    Top = 96
  end
  inherited ClientDataSet1: TClientDataSet
    IndexFieldNames = 'idOperacao'
    Left = 760
    Top = 96
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
    end
    object ClientDataSet1num_pecas: TIntegerField
      FieldName = 'num_pecas'
    end
    object ClientDataSet1tolerancia: TIntegerField
      FieldName = 'tolerancia'
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
      FieldKind = fkLookup
      FieldName = 'operacao'
      LookupDataSet = ClientDataSet3
      LookupKeyFields = 'idoperacao'
      LookupResultField = 'descricao'
      KeyFields = 'idOperacao'
      Size = 50
      Lookup = True
    end
    object ClientDataSet1tecido: TStringField
      FieldKind = fkLookup
      FieldName = 'tecido'
      LookupDataSet = ClientDataSet4
      LookupKeyFields = 'idtecido'
      LookupResultField = 'descricao'
      KeyFields = 'idTecido'
      Size = 50
      Lookup = True
    end
    object ClientDataSet1operador: TStringField
      FieldKind = fkLookup
      FieldName = 'operador'
      LookupDataSet = ClientDataSet5
      LookupKeyFields = 'idoperador'
      LookupResultField = 'nome'
      KeyFields = 'idOperador'
      Size = 50
      Lookup = True
    end
    object ClientDataSet1cronometrista: TStringField
      FieldKind = fkLookup
      FieldName = 'cronometrista'
      LookupDataSet = ClientDataSet6
      LookupKeyFields = 'idcronometrista'
      LookupResultField = 'nome'
      KeyFields = 'idCronometrista'
      Size = 50
      Lookup = True
    end
    object ClientDataSet1produto: TStringField
      FieldKind = fkLookup
      FieldName = 'produto'
      LookupDataSet = ClientDataSet2
      LookupKeyFields = 'idProduto'
      LookupResultField = 'descricao'
      KeyFields = 'idProduto'
      Size = 50
      Lookup = True
    end
  end
  inherited DataSetProvider1: TDataSetProvider
    Left = 728
    Top = 96
  end
  inherited FDQuery1: TFDQuery
    SQL.Strings = (
      'select * from cronometragem')
    Left = 704
    Top = 96
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
    end
    object FDQuery1tempo_ideal: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'tempo_ideal'
      Origin = 'tempo_ideal'
    end
    object FDQuery1ritmo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ritmo'
      Origin = 'ritmo'
    end
    object FDQuery1num_pecas: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'num_pecas'
      Origin = 'num_pecas'
    end
    object FDQuery1tolerancia: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'tolerancia'
      Origin = 'tolerancia'
    end
    object FDQuery1comprimento_prod: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'comprimento_prod'
      Origin = 'comprimento_prod'
    end
    object FDQuery1num_ocorrencia: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'num_ocorrencia'
      Origin = 'num_ocorrencia'
    end
    object FDQuery1idProduto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idProduto'
      Origin = 'idProduto'
    end
    object FDQuery1idCronometrista: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idCronometrista'
      Origin = 'idCronometrista'
    end
    object FDQuery1idTecido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idTecido'
      Origin = 'idTecido'
    end
    object FDQuery1idOperacao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idOperacao'
      Origin = 'idOperacao'
    end
    object FDQuery1idOperador: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idOperador'
      Origin = 'idOperador'
    end
  end
  inherited ImageListBase: TImageList
    Left = 824
    Top = 96
    Bitmap = {
      494C01010C002C00F40010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
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
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFF81FF81FFFFFFFFF
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
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 888
    Top = 399
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider2'
    Left = 856
    Top = 399
    object ClientDataSet2idProduto: TIntegerField
      FieldName = 'idProduto'
    end
    object ClientDataSet2descricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
    object ClientDataSet2data: TDateField
      FieldName = 'data'
    end
    object ClientDataSet2idGrupo: TIntegerField
      FieldName = 'idGrupo'
    end
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = FDQuery2
    Left = 826
    Top = 399
  end
  object FDQuery2: TFDQuery
    ConnectionName = 'balay'
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    Left = 794
    Top = 399
    object FDQuery2idProduto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idProduto'
      Origin = 'idProduto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuery2descricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 45
    end
    object FDQuery2data: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'data'
      Origin = '`data`'
    end
    object FDQuery2idGrupo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idGrupo'
      Origin = 'idGrupo'
    end
  end
  object DataSource3: TDataSource
    DataSet = ClientDataSet3
    Left = 888
    Top = 452
  end
  object ClientDataSet3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider3'
    Left = 856
    Top = 452
  end
  object DataSetProvider3: TDataSetProvider
    DataSet = FDQuery3
    Left = 824
    Top = 452
  end
  object FDQuery3: TFDQuery
    ConnectionName = 'balay'
    SQL.Strings = (
      'select * from operacao')
    Left = 792
    Top = 452
  end
  object DataSource4: TDataSource
    DataSet = ClientDataSet4
    Left = 888
    Top = 500
  end
  object DataSource5: TDataSource
    DataSet = ClientDataSet5
    Left = 888
    Top = 543
  end
  object DataSource6: TDataSource
    DataSet = ClientDataSet6
    Left = 888
    Top = 591
  end
  object ClientDataSet4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider4'
    Left = 856
    Top = 500
    object ClientDataSet4idtecido: TIntegerField
      FieldName = 'idtecido'
    end
    object ClientDataSet4descricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
  end
  object ClientDataSet5: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider5'
    Left = 856
    Top = 543
    object ClientDataSet5idoperador: TIntegerField
      FieldName = 'idoperador'
    end
    object ClientDataSet5nome: TStringField
      FieldName = 'nome'
      Size = 45
    end
    object ClientDataSet5idGrupo: TIntegerField
      FieldName = 'idGrupo'
    end
  end
  object ClientDataSet6: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider6'
    Left = 856
    Top = 591
    object ClientDataSet6idcronometrista: TIntegerField
      FieldName = 'idcronometrista'
    end
    object ClientDataSet6nome: TStringField
      FieldName = 'nome'
      Size = 45
    end
  end
  object DataSetProvider4: TDataSetProvider
    DataSet = FDQuery4
    Left = 824
    Top = 500
  end
  object DataSetProvider5: TDataSetProvider
    DataSet = FDQuery5
    Left = 824
    Top = 543
  end
  object DataSetProvider6: TDataSetProvider
    DataSet = FDQuery6
    Left = 824
    Top = 591
  end
  object FDQuery4: TFDQuery
    ConnectionName = 'balay'
    SQL.Strings = (
      'select * from tecido')
    Left = 792
    Top = 500
    object FDQuery4idtecido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idtecido'
      Origin = 'idtecido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuery4descricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 45
    end
  end
  object FDQuery5: TFDQuery
    ConnectionName = 'balay'
    SQL.Strings = (
      'select * from operador')
    Left = 792
    Top = 543
    object FDQuery5idoperador: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idoperador'
      Origin = 'idoperador'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuery5nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 45
    end
    object FDQuery5idGrupo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idGrupo'
      Origin = 'idGrupo'
    end
  end
  object FDQuery6: TFDQuery
    ConnectionName = 'balay'
    SQL.Strings = (
      'select * from cronometrista')
    Left = 792
    Top = 591
    object FDQuery6idcronometrista: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idcronometrista'
      Origin = 'idcronometrista'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuery6nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 45
    end
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
    ConnectionName = 'balay'
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
  end
  object FDQ_Batida: TFDQuery
    ConnectionName = 'balay'
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
