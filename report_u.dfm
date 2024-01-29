object frmreport: Tfrmreport
  Left = 0
  Top = 0
  Caption = 'frmreport'
  ClientHeight = 470
  ClientWidth = 697
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
  object pnlREPORT: TPanel
    Left = -34
    Top = -9
    Width = 723
    Height = 497
    TabOrder = 0
    object lblREPORT: TLabel
      Left = 72
      Top = 27
      Width = 285
      Height = 35
      Caption = 'GENERATE REPORT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -29
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object redout: TRichEdit
      Left = 392
      Top = 48
      Width = 281
      Height = 385
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Lines.Strings = (
        'redout')
      ParentFont = False
      TabOrder = 0
    end
    object btnFIND: TButton
      Left = 250
      Top = 92
      Width = 75
      Height = 33
      Caption = 'Find'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnFINDClick
    end
    object edtUNAME: TEdit
      Left = 102
      Top = 96
      Width = 121
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TextHint = 'Enter username '
    end
    object btnPRINT: TButton
      Left = 112
      Top = 152
      Width = 99
      Height = 41
      Caption = 'Print'
      TabOrder = 3
      OnClick = btnPRINTClick
    end
    object BtnBACK: TButton
      Left = 80
      Top = 392
      Width = 97
      Height = 41
      Caption = 'Back'
      TabOrder = 4
      OnClick = BtnBACKClick
    end
  end
end
