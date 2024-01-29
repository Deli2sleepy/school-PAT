object frmDELETE: TfrmDELETE
  Left = 0
  Top = 0
  Caption = 'frmDELETE'
  ClientHeight = 105
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnDELETE: TButton
    Left = 176
    Top = 22
    Width = 75
    Height = 25
    Caption = 'DELETE'
    TabOrder = 0
    OnClick = btnDELETEClick
  end
  object edtSEARCH: TEdit
    Left = 32
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
    TextHint = 'Enter  member Username'
  end
  object btnBACK: TButton
    Left = 32
    Top = 72
    Width = 75
    Height = 25
    Caption = 'BACK'
    TabOrder = 2
    OnClick = btnBACKClick
  end
end
