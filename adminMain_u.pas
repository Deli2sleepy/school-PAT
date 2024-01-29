unit adminMain_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus,other_u,sponsor_u,stats_u;

type
  TfrmadminMain = class(TForm)
    lblSTATUS: TLabel;
    lbladmin: TLabel;
    Mmenu: TMainMenu;
    MemberDetails1: TMenuItem;
    SponsorDetails1: TMenuItem;
    ViewMembersBeachcleanup1: TMenuItem;
    Insertnewbeachcleanup: TMenuItem;
    UpdateDetails1: TMenuItem;
    DeleteMember1: TMenuItem;
    Report: TMenuItem;
    Other1: TMenuItem;
    ViewAll1: TMenuItem;
    Exit1: TMenuItem;
    stats: TMenuItem;
    procedure ViewMembersBeachcleanup1Click(Sender: TObject);
    procedure UpdateDetails1Click(Sender: TObject);
    procedure DeleteMember1Click(Sender: TObject);
    procedure ReportClick(Sender: TObject);
    procedure Other1Click(Sender: TObject);
    procedure InsertnewbeachcleanupClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure ViewAll1Click(Sender: TObject);
    procedure statsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmadminMain: TfrmadminMain;

implementation

uses
  viewmemberdetails_u, updatemember_u,
  deletemember_u,report_u,login_u,eventupdater_u;
{$R *.dfm}


procedure TfrmadminMain.DeleteMember1Click(Sender: TObject);     //  nav to delete form
begin
  frmadminMain.Hide;
  frmDELETE.Show;
end;

procedure TfrmadminMain.Exit1Click(Sender: TObject);           //nav to login
begin
frmadminMain.Hide;
frmlogin.Show;
end;

procedure TfrmadminMain.InsertnewbeachcleanupClick(Sender: TObject);      //nav to event updater
begin
   frmadminMain.Hide;
  frmeventupdater.Show;
end;

procedure TfrmadminMain.Other1Click(Sender: TObject);                     //nav to other form
begin
  frmadminMain.Hide;
  frmOther.Show;
end;

procedure TfrmadminMain.ReportClick(Sender: TObject);                   //nav to report
begin
  frmadminMain.Hide;
  frmreport.Show;
end;

procedure TfrmadminMain.statsClick(Sender: TObject);                     //nav to statistics
begin
 frmSTATS.show;
 frmadminMain.hide;
end;

procedure TfrmadminMain.UpdateDetails1Click(Sender: TObject);             //nav to update details
begin
  frmadminMain.Hide;
  frmUPDATE.Show;

end;

procedure TfrmadminMain.ViewAll1Click(Sender: TObject);                 //nav to sponsor
begin
frmadminMain.Hide;
frmsponsor.show;
end;

procedure TfrmadminMain.ViewMembersBeachcleanup1Click(Sender: TObject);         //nav to member details
begin
  frmadminMain.Hide;
  frmViewMemberDetails.Show;
end;

end.
