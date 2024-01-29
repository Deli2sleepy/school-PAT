object frmOther: TfrmOther
  Left = 0
  Top = 0
  Caption = 'frmOther'
  ClientHeight = 423
  ClientWidth = 696
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object btnback: TButton
    Left = 32
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Back'
    TabOrder = 0
    OnClick = btnbackClick
  end
  object DBGrid1: TDBGrid
    Left = 296
    Top = 48
    Width = 383
    Height = 338
    Align = alCustom
    DataSource = dm.dsqry
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object pnlSEARCH: TPanel
    Left = 32
    Top = 48
    Width = 242
    Height = 65
    TabOrder = 2
    object lblINFO: TLabel
      Left = 16
      Top = 16
      Width = 219
      Height = 13
      Caption = 'Type Username of member for contact details'
    end
    object edtSearch: TEdit
      Left = 16
      Top = 35
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = edtSearchChange
    end
  end
  object pnlOPTIONS: TPanel
    Left = 32
    Top = 193
    Width = 242
    Height = 193
    TabOrder = 3
    object rbtnCount: TRadioButton
      Left = 24
      Top = 24
      Width = 113
      Height = 17
      Caption = 'rbtnCount'
      TabOrder = 0
      OnClick = rbtnCountClick
    end
    object rbtnsortYear: TRadioButton
      Left = 24
      Top = 48
      Width = 113
      Height = 17
      Caption = 'rbtnsortYear'
      TabOrder = 1
      OnClick = rbtnsortYearClick
    end
    object rbtnsortSurname: TRadioButton
      Left = 24
      Top = 80
      Width = 113
      Height = 17
      Caption = 'rbtnsortSurname'
      TabOrder = 2
      OnClick = rbtnsortSurnameClick
    end
    object rbtnsortcredits: TRadioButton
      Left = 24
      Top = 112
      Width = 113
      Height = 17
      Caption = 'rbtnsortcredits'
      TabOrder = 3
      OnClick = rbtnsortcreditsClick
    end
  end
end
