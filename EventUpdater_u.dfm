object frmEVENTupdater: TfrmEVENTupdater
  Left = 0
  Top = 0
  Caption = 'frmEVENTupdater'
  ClientHeight = 178
  ClientWidth = 741
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
  object LBLdate: TLabel
    Left = 8
    Top = 39
    Width = 190
    Height = 19
    Caption = 'Choose date of cleanup'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblBEACH: TLabel
    Left = 296
    Top = 39
    Width = 215
    Height = 19
    Caption = 'Choose beach for clean-up'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDutyArea: TLabel
    Left = 568
    Top = 40
    Width = 143
    Height = 18
    Caption = 'Select section area'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dtpDATE: TDateTimePicker
    Left = 8
    Top = 64
    Width = 169
    Height = 33
    Date = 45157.637531122690000000
    Format = 'dd/mm/yyyy'
    Time = 45157.637531122690000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btnUPDATE: TButton
    Left = 403
    Top = 117
    Width = 107
    Height = 39
    Caption = 'UPDATE'
    TabOrder = 1
    OnClick = btnUPDATEClick
  end
  object btnBACK: TButton
    Left = 24
    Top = 121
    Width = 113
    Height = 32
    Caption = 'BACK'
    TabOrder = 2
    OnClick = btnBACKClick
  end
  object cmbBEACHES: TComboBox
    Left = 296
    Top = 64
    Width = 199
    Height = 21
    TabOrder = 3
    Items.Strings = (
      'ADDINGTON BEACH'
      'AMANZIMTOTI BEACH'
      'BRIGHTON BEACH AND CAVE ROCK'
      'SOUTH BEACH'
      'NORTH BEACH'
      'ANSTEYS BEACH'
      'BLUFF BEACH'
      'LA LUCIA BEACH'
      'USHAKA BEACH'
      'WEDGE BEACH'
      'DAIRY BEACH'
      'BAY OF PLENTY BEACH')
  end
  object dtpTIME: TDateTimePicker
    Left = 183
    Top = 64
    Width = 66
    Height = 27
    Date = 45158.676518368050000000
    Format = 'hh:mm '
    Time = 45158.676518368050000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkTime
    ParentFont = False
    TabOrder = 4
  end
  object cmbDUTY: TComboBox
    Left = 568
    Top = 64
    Width = 89
    Height = 21
    TabOrder = 5
    Items.Strings = (
      'Section A'
      'Section B')
  end
end
