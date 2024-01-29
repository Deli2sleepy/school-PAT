unit login_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage, dmbeachcleanup_u, mainui, objMEMBER_u;

type
  Tfrmlogin = class(TForm)
    rbtnAdmin: TRadioButton;
    rbtnMember: TRadioButton;
    rbtnREGISTER: TRadioButton;
    pnladmin: TPanel;
    edtpassword: TEdit;
    imgLOGO: TImage;
    edtUsername: TEdit;
    Chkbox: TCheckBox;
    btnValidateAdmin: TButton;
    procedure rbtnAdminClick(Sender: TObject);
    procedure btnValidateAdminClick(Sender: TObject);
    procedure rbtnMemberClick(Sender: TObject);
    procedure rbtnREGISTERClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ChkboxClick(Sender: TObject);

  private
    { Private declarations }
    procedure btnMemberloginclick(Sender: TObject); // -shaun roselt (youtube)
  public
    { Public declarations }

  end;

var
  frmlogin: Tfrmlogin;
  btnMemberlogin: TButton;
  iTYPE, iID, icredits,icheck: integer;
  sname: string;

implementation

uses
  adminmain_u, memberregister_u;
{$R *.dfm}

procedure Tfrmlogin.btnMemberloginclick(Sender: TObject);
// dynamically created button
var

  bfound, bflag: boolean;
  spass: string;

begin
  if rbtnMember.Checked = true then // member login
  begin
    sname := edtUsername.Text;
    spass := edtpassword.Text;
    bfound := false;
    bflag := false;

    dm.tblMembers.First;                                //finds the username and assigns the id the username is found with to a variable
    while not dm.tblMembers.eof do
    begin
      if (sname = dm.tblMembers['username']) then
      begin
        bfound := true;
        iID := dm.tblMembers['MemberID'];
        icredits := dm.tblMembers['Credits'];
      end;
      if (spass = dm.tblMembers['Password']) and ( iID = dm.tblMembers['MemberID'] ) then //checks if the password is found and is found at the correct ID
      begin
        bflag := true;
      end;
      dm.tblMembers.Next;
    end;
    if (bflag = true) and (bfound = true) then   //checks if both are true and allows the user to login if true
    begin
      inc(iTYPE);

      showmessage('welcome ' + sname);
      frmMainUI.Show;
      frmlogin.Hide;
    end;

  end; // if rbtn member

end;

procedure Tfrmlogin.btnValidateAdminClick(Sender: TObject);
var
  tfile, tf: textfile;
  sline, sline2, sname, spass, spasstxt: string;
  bfound, bflag: boolean;

begin
  if rbtnAdmin.Checked = true then // if the radio button admin is checked, it will do the following
  begin
    bfound := false;
    spass := edtpassword.Text;

    if FileExists('pwd.txt') then // checking if the file exists
    begin
      assignfile(tfile, 'pwd.txt');
      reset(tfile);

      while not eof(tfile) do
      begin
        readln(tfile, sline);
        sname := copy(sline, 1, pos('#', sline) - 1);
        spasstxt := copy(sline, pos('#', sline) + 1);
        // validate password
        if spass = spasstxt then
        begin
          bfound := true;
          edtpassword.Clear;
          // move to form
          frmlogin.Hide;
          frmadminMain.Show;

          frmadminMain.lbladmin.Caption := sname;
          // logging admin login
          timeAMstring := 'AM'; // setting system settings for am and pm; was orginally 'am' and now is 'AM' etc.
          timePMstring := 'PM';
          assignfile(tf, 'loginTrace.txt');
          append(tf);
          sline2 := sname + #9#9 + formatdatetime
            ('yyyy/mm/dd      hh:mm:ss ampm', (now));
          writeln(tf, sline2);

          closefile(tf);

        end;

        // if not valid
        if bfound = false then
        begin
          showmessage('Invalid password...re-enter...');
          edtpassword.Clear;
          edtpassword.SetFocus;
        end;
      end; // while tfile
      closefile(tfile);
    end
    else // if fileexists
    begin
      showmessage('File not found!');
    end;
  end; // if rbtn admin

end;

procedure Tfrmlogin.ChkboxClick(Sender: TObject);   //disguises the Password to ensure privacy if the checkbox is unchecked
begin
  if Chkbox.Checked = true then
  begin
    edtpassword.PasswordChar := #0;
  end
  else
  begin
    edtpassword.PasswordChar := '*';
  end
end;

procedure Tfrmlogin.FormActivate(Sender: TObject);  //setting the form sizes and clearing any old data
begin
  frmlogin.width := 201;
  iTYPE := 0;
  edtUsername.visible := true;
  edtpassword.Clear;
  edtUsername.Clear;
end;

procedure Tfrmlogin.rbtnAdminClick(Sender: TObject);   // selecting option to be an admin
begin
if icheck > 0 then
begin
  btnMemberlogin.Hide;
end;
  frmlogin.width := 485;
  edtUsername.visible := false;
  btnValidateAdmin.Visible:=true;
end;

procedure Tfrmlogin.rbtnREGISTERClick(Sender: TObject);   //selects option to be a member
begin
icheck:=1;
  frmlogin.width := 201;
  frmregister.Show;
  frmlogin.Close;
end;

procedure Tfrmlogin.rbtnMemberClick(Sender: TObject);     //selects an option to be member
begin
icheck:=0;
  frmlogin.width := 485;
  edtUsername.visible := true;
  btnValidateAdmin.Hide;

  btnMemberlogin := TButton.create(self); // code from shaun roselt (youtube) dynamic create
  btnMemberlogin.Parent := frmlogin; //
  // not exact copy but still referenced
  btnMemberlogin.Caption := 'Continue'; //
  btnMemberlogin.top := 143; //
  btnMemberlogin.height := 25; //
  btnMemberlogin.Left := 288; //
  btnMemberlogin.width := 105; //
  //
  btnMemberlogin.onClick := btnMemberloginclick; //
inc(icheck);
end;

end.
