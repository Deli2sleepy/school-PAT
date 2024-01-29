object frmUPDATE: TfrmUPDATE
  Left = 0
  Top = 0
  Caption = 'frmUPDATE'
  ClientHeight = 457
  ClientWidth = 486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnBACK: TButton
    Left = 48
    Top = 406
    Width = 75
    Height = 25
    Caption = 'BACK'
    TabOrder = 0
    OnClick = btnBACKClick
  end
  object btnSEARCH: TButton
    Left = 256
    Top = 48
    Width = 75
    Height = 25
    Caption = 'SEARCH'
    TabOrder = 1
    OnClick = btnSEARCHClick
  end
  object edtMEMBER: TEdit
    Left = 48
    Top = 48
    Width = 153
    Height = 21
    TabOrder = 2
    TextHint = 'enter member username'
  end
  object pnlDETAILS: TPanel
    Left = 48
    Top = 103
    Width = 401
    Height = 273
    TabOrder = 3
    object lblID: TLabel
      Left = 64
      Top = 16
      Width = 52
      Height = 13
      Caption = 'Username:'
    end
    object lblFNAME: TLabel
      Left = 64
      Top = 51
      Width = 64
      Height = 13
      Caption = 'First Name/s:'
    end
    object lblSNAME: TLabel
      Left = 64
      Top = 88
      Width = 46
      Height = 13
      Caption = 'Surname:'
    end
    object lblEMAIL: TLabel
      Left = 64
      Top = 124
      Width = 28
      Height = 13
      Caption = 'Email:'
    end
    object lblMOBILE: TLabel
      Left = 64
      Top = 162
      Width = 34
      Height = 13
      Caption = 'Mobile:'
    end
    object lblDOB: TLabel
      Left = 64
      Top = 194
      Width = 67
      Height = 13
      Caption = 'Date Of Birth:'
    end
    object lblGENDER: TLabel
      Left = 64
      Top = 232
      Width = 39
      Height = 13
      Caption = 'Gender:'
    end
    object edtUNAME: TEdit
      Left = 192
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edtFNAME: TEdit
      Left = 192
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edtSNAME: TEdit
      Left = 192
      Top = 85
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edtEMAIL: TEdit
      Left = 192
      Top = 121
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object edtMOBILE: TEdit
      Left = 192
      Top = 159
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object edtDOB: TEdit
      Left = 192
      Top = 194
      Width = 121
      Height = 21
      TabOrder = 5
      TextHint = 'DD/MM/YYYY'
    end
    object edtGENDER: TEdit
      Left = 192
      Top = 229
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object btnUPDATE: TButton
      Left = 319
      Top = 224
      Width = 75
      Height = 25
      Caption = 'btnUPDATE'
      TabOrder = 7
      OnClick = btnUPDATEClick
    end
  end
end
