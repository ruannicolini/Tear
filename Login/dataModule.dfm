object dmPadrao: TdmPadrao
  OldCreateOrder = False
  Height = 205
  Width = 397
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=balay'
      'User_Name=ruan'
      'Password=ruan'
      'Server=192.168.1.200'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 40
    Top = 32
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM USUARIO'
      'WHERE LOGIN =:LOGIN'
      'AND SENHA =:SENHA')
    Left = 128
    Top = 32
    ParamData = <
      item
        Name = 'LOGIN'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
    object FDQuery1idUsuario: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idUsuario'
      Origin = 'idUsuario'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQuery1login: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'login'
      Origin = 'login'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object FDQuery1senha: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'senha'
      Origin = 'senha'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = FDQuery1
    Left = 216
    Top = 32
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'LOGIN'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'SENHA'
        ParamType = ptInput
        Value = ''
      end>
    ProviderName = 'DataSetProvider1'
    Left = 304
    Top = 32
    object ClientDataSetidUsuario: TIntegerField
      FieldName = 'idUsuario'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ClientDataSetlogin: TStringField
      FieldName = 'login'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
    object ClientDataSetsenha: TStringField
      FieldName = 'senha'
      ProviderFlags = [pfInUpdate]
      Size = 45
    end
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 64
    Top = 120
  end
end
