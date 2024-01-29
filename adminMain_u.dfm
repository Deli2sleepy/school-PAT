object frmadminMain: TfrmadminMain
  Left = 0
  Top = 0
  Caption = 'frmadminMain'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = Mmenu
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblSTATUS: TLabel
    Left = 32
    Top = 168
    Width = 98
    Height = 13
    Caption = 'ADMIN LOGGED ON:'
  end
  object lbladmin: TLabel
    Left = 144
    Top = 170
    Width = 38
    Height = 13
    Caption = 'lbladmin'
  end
  object Mmenu: TMainMenu
    Left = 32
    Top = 8
    object MemberDetails1: TMenuItem
      Caption = 'Member Details'
      object ViewMembersBeachcleanup1: TMenuItem
        Caption = 'View Members/Beach cleanup'
        OnClick = ViewMembersBeachcleanup1Click
      end
      object Insertnewbeachcleanup: TMenuItem
        Caption = 'Insert new beach cleanup duty'
        OnClick = InsertnewbeachcleanupClick
      end
      object UpdateDetails1: TMenuItem
        Caption = 'Update Details'
        OnClick = UpdateDetails1Click
      end
      object DeleteMember1: TMenuItem
        Caption = 'Delete Member'
        OnClick = DeleteMember1Click
      end
      object Report: TMenuItem
        Caption = 'Report'
        OnClick = ReportClick
      end
      object Other1: TMenuItem
        Caption = 'Other'
        OnClick = Other1Click
      end
      object stats: TMenuItem
        Caption = 'Statistics'
        OnClick = statsClick
      end
    end
    object SponsorDetails1: TMenuItem
      Caption = 'Sponsor Details'
      object ViewAll1: TMenuItem
        Caption = 'View All'
        OnClick = ViewAll1Click
      end
    end
    object Exit1: TMenuItem
      Caption = 'Exit'
      OnClick = Exit1Click
    end
  end
end
