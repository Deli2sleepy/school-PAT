unit report_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, dmbeachcleanup_u, objmember_u,
  adminmain_u;

type
  Tfrmreport = class(TForm)
    pnlREPORT: TPanel;
    lblREPORT: TLabel;
    redout: TRichEdit;
    btnFIND: TButton;
    edtUNAME: TEdit;
    btnPRINT: TButton;
    BtnBACK: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnFINDClick(Sender: TObject);
    procedure BtnBACKClick(Sender: TObject);
    procedure btnPRINTClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmreport: Tfrmreport;
  sUname: string;
  objmember: tmember;

implementation

{$R *.dfm}

procedure Tfrmreport.BtnBACKClick(Sender: TObject); // nav to admin main
begin
  frmadminMain.show;
  frmreport.hide

end;

procedure Tfrmreport.btnFINDClick(Sender: TObject); // finds the user and displays their details in a richedit to show an example of what the generated report will look like
begin
  sUname := edtUNAME.text;
  dm.tblMembers.First;
  while not dm.tblMembers.Eof do
  begin
    if sUname = dm.tblMembers['Username'] then
    begin
      objmember := tmember.create(dm.tblMembers['Username'],
        dm.tblMembers['Credits'], dm.tblMembers['MemberID']);
      redout.lines.Add(objmember.tostring(dm.tblMembers['First_name/s'],
          dm.tblMembers['surname'], dm.tblMembers['gender']));

    end;

    dm.tblMembers.Next
  end;
end;

procedure Tfrmreport.btnPRINTClick(Sender: TObject);       //outputs the report into a textfile;
var
  tf: textfile;
begin
  filecreate('UserReport.txt');
  sUname := edtUNAME.text;
  dm.tblMembers.First;
  while not dm.tblMembers.Eof do
  begin
    if sUname = dm.tblMembers['Username'] then
    begin

      assignfile(tf, 'UserReport.txt');
      append(tf);
      writeln(objmember.tostring(dm.tblMembers['First_name/s'],
          dm.tblMembers['surname'], dm.tblMembers['gender']));
    end;
  end;
  dm.tblMembers.Next
end;

procedure Tfrmreport.FormActivate(Sender: TObject);
begin
  redout.Clear;

end;

end.
