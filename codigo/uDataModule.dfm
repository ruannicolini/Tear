object DModule: TDModule
  OldCreateOrder = False
  Height = 375
  Width = 424
  object qAux: TFDQuery
    ConnectionName = 'balay'
    Left = 48
    Top = 152
  end
  object FModulo: TFDQuery
    ConnectionName = 'balay'
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
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    BeforeConnect = FDConnectionBeforeConnect
    Left = 184
    Top = 152
  end
end
