object frmSPONSOR: TfrmSPONSOR
  Left = 0
  Top = 0
  Caption = 'frmSPONSOR'
  ClientHeight = 403
  ClientWidth = 657
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object tblsponsors: TDBGrid
    Left = 56
    Top = 32
    Width = 545
    Height = 217
    DataSource = dm.dsqry
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object RBmost: TRadioButton
    Left = 56
    Top = 288
    Width = 113
    Height = 17
    Caption = 'Highest Donation'
    TabOrder = 1
    OnClick = RBmostClick
  end
  object RBmodal: TRadioButton
    Left = 208
    Top = 288
    Width = 113
    Height = 17
    Caption = 'Most donations'
    TabOrder = 2
    OnClick = RBmodalClick
  end
  object btnBack: TButton
    Left = 56
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Back'
    TabOrder = 3
    OnClick = btnBackClick
  end
  object RBlatest: TRadioButton
    Left = 344
    Top = 288
    Width = 113
    Height = 17
    Caption = 'Newest donation'
    TabOrder = 4
    OnClick = RBlatestClick
  end
  object RBearliest: TRadioButton
    Left = 488
    Top = 288
    Width = 113
    Height = 17
    Caption = 'Oldest Donation'
    TabOrder = 5
    OnClick = RBearliestClick
  end
end
