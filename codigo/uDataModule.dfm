object DModule: TDModule
  OldCreateOrder = False
  Height = 375
  Width = 407
  object FDConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=balay')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 32
  end
  object qAux: TFDQuery
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
end
