program BeachCleanup_p;

uses
  Forms,
  opening_u in 'opening_u.pas' {frmopening},
  login_u in 'login_u.pas' {frmlogin},
  adminMain_u in 'adminMain_u.pas' {frmadminMain},
  viewMemberDetails_u in 'viewMemberDetails_u.pas' {frmViewMemberDetails},
  dmBeachCleanup_u in 'dmBeachCleanup_u.pas' {dm: TDataModule},
  memberREGISTER_u in 'memberREGISTER_u.pas' {frmREGISTER},
  MainUI in 'MainUI.pas' {frmMainUI},
  objVALID_u in 'objVALID_u.pas',
  objMEMBER_u in 'objMEMBER_u.pas',
  deleteMember_u in 'deleteMember_u.pas' {frmDELETE},
  UpdateMember_u in 'UpdateMember_u.pas' {frmUPDATE},
  report_u in 'report_u.pas' {frmreport},
  EventUpdater_u in 'EventUpdater_u.pas' {frmEVENTupdater},
  other_u in 'other_u.pas' {frmOther},
  sponsor_u in 'sponsor_u.pas' {frmSPONSOR},
  Stats_u in 'Stats_u.pas' {frmSTATS};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrmopening, frmopening);
  Application.CreateForm(Tfrmlogin, frmlogin);
  Application.CreateForm(TfrmadminMain, frmadminMain);
  Application.CreateForm(TfrmViewMemberDetails, frmViewMemberDetails);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmREGISTER, frmREGISTER);
  Application.CreateForm(TfrmMainUI, frmMainUI);
  Application.CreateForm(TfrmDELETE, frmDELETE);
  Application.CreateForm(TfrmUPDATE, frmUPDATE);
  Application.CreateForm(Tfrmreport, frmreport);
  Application.CreateForm(TfrmEVENTupdater, frmEVENTupdater);
  Application.CreateForm(TfrmOther, frmOther);
  Application.CreateForm(TfrmSPONSOR, frmSPONSOR);
  Application.CreateForm(TfrmSTATS, frmSTATS);
  Application.Run;
end.
