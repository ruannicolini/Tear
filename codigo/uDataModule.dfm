object DModule: TDModule
  OldCreateOrder = False
  Height = 375
  Width = 424
  object qAux: TFDQuery
    BeforeExecute = qAuxBeforeExecute
    Connection = FDConnection
    Left = 48
    Top = 152
  end
  object FModulo: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM MODULO')
    Left = 48
    Top = 88
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    DriverID = 'MySQL'
    VendorLib = 'libmysql.dll'
    Left = 144
    Top = 40
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 264
    Top = 40
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
    Left = 184
    Top = 152
  end
  object qAcesso: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'select * from seguranca where idinterface =:idInterf  and idTipo' +
        '_usuario =:idTU')
    Left = 112
    Top = 280
    ParamData = <
      item
        Name = 'IDINTERF'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDTU'
        DataType = ftInteger
        ParamType = ptInput
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
  end
end
