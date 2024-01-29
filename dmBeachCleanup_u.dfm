object dm: Tdm
  OldCreateOrder = False
  Height = 380
  Width = 459
  object connBeachCleanup: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Us' +
      'ers\Alvin AMD\Desktop\Beach Cleanup PAT 2023\database\BeachClean' +
      'upDB.mdb;Mode=Share Deny None;Persist Security Info=False;Jet OL' +
      'EDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Data' +
      'base Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Lock' +
      'ing Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global ' +
      'Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet OLEDB' +
      ':Create System Database=False;Jet OLEDB:Encrypt Database=False;J' +
      'et OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact Wi' +
      'thout Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 24
  end
  object tblMembers: TADOTable
    Active = True
    Connection = connBeachCleanup
    CursorType = ctStatic
    TableName = 'tblMembers'
    Left = 40
    Top = 104
  end
  object tblBeachCleanup: TADOTable
    Active = True
    Connection = connBeachCleanup
    CursorType = ctStatic
    TableName = 'tblBeachCleanup'
    Left = 40
    Top = 160
  end
  object tblSponsors: TADOTable
    Active = True
    Connection = connBeachCleanup
    CursorType = ctStatic
    TableName = 'tblSponsors'
    Left = 40
    Top = 224
  end
  object dsMembers: TDataSource
    DataSet = tblMembers
    Left = 128
    Top = 104
  end
  object dsBeach: TDataSource
    DataSet = tblBeachCleanup
    Left = 128
    Top = 176
  end
  object dssponsors: TDataSource
    DataSet = tblSponsors
    Left = 128
    Top = 232
  end
  object dsqry: TDataSource
    DataSet = qry
    Left = 392
    Top = 216
  end
  object qry: TADOQuery
    Connection = connBeachCleanup
    Parameters = <>
    Left = 304
    Top = 216
  end
end
