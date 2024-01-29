object frmSTATS: TfrmSTATS
  Left = 0
  Top = 0
  Caption = 'frmSTATS'
  ClientHeight = 301
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object redout: TRichEdit
    Left = 0
    Top = 0
    Width = 635
    Height = 169
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'The Data displayed will all be in Kilograms'
      '')
    ParentFont = False
    TabOrder = 0
  end
  object btnDisplay: TButton
    Left = 96
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Display'
    TabOrder = 1
    OnClick = btnDisplayClick
  end
  object btnAVGm: TButton
    Left = 208
    Top = 200
    Width = 83
    Height = 25
    Caption = 'average/month'
    TabOrder = 2
    OnClick = btnAVGmClick
  end
  object btnAVGt: TButton
    Left = 328
    Top = 200
    Width = 121
    Height = 25
    Caption = 'average/temperature'
    TabOrder = 3
    OnClick = btnAVGtClick
  end
  object btnTOTAL: TButton
    Left = 494
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Total'
    TabOrder = 4
    OnClick = btnTOTALClick
  end
  object btnBack: TButton
    Left = 32
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Back'
    TabOrder = 5
    OnClick = btnBackClick
  end
end
