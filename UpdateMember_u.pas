unit UpdateMember_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,dmbeachcleanup_u;

type
  TfrmUPDATE = class(TForm)
    btnBACK: TButton;
    btnSEARCH: TButton;
    edtMEMBER: TEdit;
    pnlDETAILS: TPanel;
    lblID: TLabel;
    lblFNAME: TLabel;
    lblSNAME: TLabel;
    lblEMAIL: TLabel;
    lblMOBILE: TLabel;
    lblDOB: TLabel;
    lblGENDER: TLabel;
    edtUNAME: TEdit;
    edtFNAME: TEdit;
    edtSNAME: TEdit;
    edtEMAIL: TEdit;
    edtMOBILE: TEdit;
    edtDOB: TEdit;
    edtGENDER: TEdit;
    btnUPDATE: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSEARCHClick(Sender: TObject);
    procedure btnUPDATEClick(Sender: TObject);
    procedure btnBACKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUPDATE: TfrmUPDATE;
  sid:string;

implementation
uses
adminmain_u;

{$R *.dfm}

procedure TfrmUPDATE.btnBACKClick(Sender: TObject);        //nav to admin main
begin
frmUPDATE.Hide;
frmadminMain.Show;
end;

procedure TfrmUPDATE.btnSEARCHClick(Sender: TObject);         //will search the db for username then if found, it will enter the values into the edit boxes where one can edit the user's details
var
bfound:boolean;
begin

bfound:= false;

sid:= edtMEMBER.Text;

dm.tblMembers.First;
while not dm.tblMembers.eof do
begin
if sid = dm.tblMembers['Username'] then
 BEGIN
   bfound :=true;
   pnlDETAILS.Show;

edtUNAME.Text:=dm.tblMembers['Username'];
edtFNAME.Text:=dm.tblMembers['First_Name/s'];
edtSNAME.Text:=dm.tblMembers['Surname'];
edtEMAIL.Text:=dm.tblMembers['Email'];
edtMOBILE.Text:=dm.tblMembers['Mobile'];
edtDOB.Text:=datetostr(dm.tblMembers['DOB']);
edtGENDER.Text:= dm.tblMembers['Gender'];




   showmessage('Change the neccessary details:');
 END;



dm.tblMembers.Next;
 end;//while


  if bfound = false then         //if user not found then return an error
   begin

   showmessage('member id not found');
   edtMEMBER.Clear;
   edtMEMBER.SetFocus;
   end;
end;
                                                             // when clicked the newely entered data will be updated in the db
procedure TfrmUPDATE.btnUPDATEClick(Sender: TObject);
begin
   dm.tblMembers.First;
while not dm.tblMembers.eof do
begin
if sid = dm.tblMembers['MemberID'] then
 BEGIN
   dm.tblMembers.Edit;



dm.tblMembers['Username']:= edtUNAME.Text;

dm.tblMembers['First_Name/s']:=edtFNAME.Text;
dm.tblMembers['Surname']:= edtSNAME.Text;
dm.tblMembers['Email']:=strtodate(edtEMAIL.Text);
dm.tblMembers['Mobile']:=edtMOBILE.Text;
dm.tblMembers['DOB']:= strtodate(edtDOB.text);
if edtGENDEr.Text = 'M' then
 begin
dm.tblMembers['Gender']:= 'M';
 end;
 if edtGENDEr.Text = 'F'then
 begin
dm.tblMembers['Gender']:= 'F';
 end;

 dm.tblMembers.Post;
 dm.tblMembers.Refresh;

  SHOWMESSAGE('MEMBER DETAILS UPDATED');


 END;

 dm.tblMembers.Next;
end;//while
end;


procedure TfrmUPDATE.FormCreate(Sender: TObject); //will only show once a user is found
begin
pnlDETAILS.Hide;
end;

end.
