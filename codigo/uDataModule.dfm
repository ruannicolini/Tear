object DModule: TDModule
  OldCreateOrder = False
  Height = 375
  Width = 424
  object qAux: TFDQuery
    BeforeExecute = qAuxBeforeExecute
    Connection = FDConnection
    Left = 96
    Top = 32
  end
  object FModulo: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM MODULO')
    Left = 136
    Top = 32
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    DriverID = 'MySQL'
    VendorLib = 'libmysql.dll'
    Left = 288
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 320
    Top = 24
  end
  object FDConnection: TFDConnection
    ConnectionName = 'balay'
    Params.Strings = (
      'Database=balay'
      'User_Name=root'
      'Password=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    BeforeConnect = FDConnectionBeforeConnect
    Left = 40
    Top = 32
  end
  object qAcesso: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'select s.*, i.idinterface as interface, m.idmodulo as modulo fro' +
        'm seguranca s '#10
      'left outer join interface i on i.idinterface = s.idinterface'#10' '
      'left outer join modulo m on m.idmodulo = i.idmodulo'
      'where s.idTipo_usuario =:idTU')
    Left = 112
    Top = 280
    ParamData = <
      item
        Name = 'IDTU'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qAcessoidTipo_Usuario: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idTipo_Usuario'
      Origin = 'idTipo_Usuario'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qAcessoidinterface: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idinterface'
      Origin = 'idinterface'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qAcessoadicionar: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'adicionar'
      Origin = 'adicionar'
    end
    object qAcessoconsultar: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'consultar'
      Origin = 'consultar'
    end
    object qAcessoeditar: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'editar'
      Origin = 'editar'
    end
    object qAcessoexcluir: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'excluir'
      Origin = 'excluir'
    end
    object qAcessointerface: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'interface'
      Origin = 'idinterface'
      ProviderFlags = []
      ReadOnly = True
    end
    object qAcessomodulo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'modulo'
      Origin = 'idmodulo'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object pAcesso: TDataSetProvider
    DataSet = qAcesso
    Left = 144
    Top = 280
  end
  object cdsAcesso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pAcesso'
    Left = 176
    Top = 280
    object cdsAcessoidTipo_Usuario: TIntegerField
      FieldName = 'idTipo_Usuario'
    end
    object cdsAcessoidinterface: TIntegerField
      FieldName = 'idinterface'
    end
    object cdsAcessoadicionar: TBooleanField
      FieldName = 'adicionar'
    end
    object cdsAcessoconsultar: TBooleanField
      FieldName = 'consultar'
    end
    object cdsAcessoeditar: TBooleanField
      FieldName = 'editar'
    end
    object cdsAcessoexcluir: TBooleanField
      FieldName = 'excluir'
    end
    object cdsAcessointerface: TIntegerField
      FieldName = 'interface'
      ReadOnly = True
    end
    object cdsAcessomodulo: TIntegerField
      FieldName = 'modulo'
      ReadOnly = True
    end
  end
end
