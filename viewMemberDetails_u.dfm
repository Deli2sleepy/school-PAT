object frmViewMemberDetails: TfrmViewMemberDetails
  Left = 0
  Top = 0
  Caption = 'frmViewMemberDetails'
  ClientHeight = 395
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnback: TButton
    Left = 8
    Top = 339
    Width = 145
    Height = 25
    Caption = 'Back Admin Options'
    TabOrder = 0
    OnClick = btnbackClick
  end
  object DBGmembers: TDBGrid
    Left = 0
    Top = 0
    Width = 790
    Height = 120
    Align = alTop
    DataSource = dm.dsMembers
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGbeachcleanupduty: TDBGrid
    Left = 0
    Top = 120
    Width = 790
    Height = 113
    Align = alTop
    DataSource = dm.dsBeach
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
