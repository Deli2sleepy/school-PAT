unit MainUI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, pngimage, StdCtrls, dateutils, Grids, Calendar,
  dmbeachcleanup_u, objmember_u,
  jpeg, DBGrids;

type
  TfrmMainUI = class(TForm)
    PC: TPageControl;
    pHOME: TTabSheet;
    pEVENTS: TTabSheet;
    SBground: TShape;
    imgBAL: TImage;
    pSHOP: TTabSheet;
    imgEVENT: TImage;
    lblEVENT: TLabel;
    btnEVENTjoin: TButton;
    cal1: TCalendar;
    lblDATE: TLabel;
    lblUSERevent: TLabel;
    btnLOGout: TButton;
    imgTESLA: TImage;
    imgSUN: TImage;
    imgTOMS: TImage;
    imgPAT: TImage;
    lblcost: TLabel;
    lblCost2: TLabel;
    lblcost3: TLabel;
    lblcost4: TLabel;
    imgCredits: TImage;
    imgCredits2: TImage;
    imgCredits3: TImage;
    imgCredits4: TImage;
    btnBUY: TButton;
    lblCOUPONS: TLabel;
    lblConfirm: TLabel;
    lblGREET: TLabel;
    pDonation: TTabSheet;
    edtDonator: TEdit;
    edtAMOUNT: TEdit;
    btnDONATE: TButton;
    lblDONATE: TLabel;
    DBGsponsors: TDBGrid;
    lblBal: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure imgTESLAClick(Sender: TObject);
    procedure imgSUNClick(Sender: TObject);
    procedure imgTOMSClick(Sender: TObject);
    procedure imgPATClick(Sender: TObject);
    procedure btnBUYClick(Sender: TObject);
    procedure btnEVENTjoinClick(Sender: TObject);
    procedure btnLOGoutClick(Sender: TObject);
    function SelectSql(ssql:string):string;
    procedure btnDONATEClick(Sender: TObject);
    procedure edtAMOUNTKeyPress(Sender: TObject; var Key: Char);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainUI: TfrmMainUI;
  iCoupon: integer;
  objmember2: TMember;
  sdefault: string;

implementation

uses memberREGISTER_u, login_u, eventupdater_u;
{$R *.dfm}

procedure TfrmMainUI.btnBUYClick(Sender: TObject);            //user buys a coupon and validates whether they can, then updates the DB
begin
  if objmember2.SufficientFunds(iCoupon) = true then
  begin
    objmember2.updatebalance(iCoupon);
    dm.tblMembers.First;
    if dm.tblMembers['MemberID'] = objmember2.getID then
    begin
      dm.tblMembers.Edit;
      dm.tblMembers['Credits'] := objmember2.getbalance;
      dm.tblMembers.Post;
      dm.tblMembers.Refresh;
    end;
    lblBAL.Caption := inttostr(objmember2.getbalance);
  end
  else
  begin
    showmessage('Insufficient funds');
  end;
end;

procedure TfrmMainUI.btnDONATEClick(Sender: TObject);   //allows user to make a donation
var SSQL:STRING;
    sName:string;
    iid,iamount:integer;

begin
 sname:= edtDonator.Text;
 iamount:= strtoint(edtAMOUNT.Text);
 dm.tblSponsors.last;
 iid:= (dm.tblSponsors['id']);
 inc(iid);
if (sname <> '') or (edtAMOUNT.Text <> '') then
begin
 dm.qry.SQL.Text:='insert into tblsponsors(id,sponsor,amount,datesponsored)values('+inttostr(iid)+',"'+sname+'",'+inttostr(iamount)+',#'+datetostr(now)+'#)';
 dm.qry.ExecSQL;
 showmessage('Thank you for your donation, It is greatly appreciated');
end
else
begin
  showmessage('values not entered');
end;
end;

procedure TfrmMainUI.btnEVENTjoinClick(Sender: TObject);   //allows the user to join an event and updates the db and other labels
var iid:integer;
begin
  if updatetext <> '' then    //validate there is an event planned and then adds credits to user account for joining
  begin
    lblUSERevent.Caption := 'you have signed up for the event ' + updatetext;
    btnEVENTjoin.Enabled := false;
    objmember2.reward;
    dm.tblMembers.First;
    while not dm.tblMembers.Eof do
    begin
    if objmember2.getID = dm.tblMembers['MemberID'] then
    begin
      dm.tblMembers.Edit;
      dm.tblMembers['Credits'] := objmember2.getbalance;
      dm.tblMembers.Post;
      dm.tblMembers.Refresh;
     lblBAL.Caption := inttostr(objmember2.getbalance);
    end;
    dm.tblmembers.next;

    end;
    DM.tblBeachCleanup.Last;
    if  DM.tblBeachCleanup['RecordNo'] = null then
    begin
    iid:=1;
    end
    else
    begin
    iid:= DM.tblBeachCleanup['RecordNo'];
    inc(iid);
    end;                         //updates db to show user attended event
    dm.qry.SQL.Text:='insert into tblbeachcleanup (RECORDNO,BEACH,DATOFCLEANUP,MEMBERID,SECTION) values('+inttostr(iid)+',"'+eventupdater_u.sNewbeach+'",#'+datetostr(eventupdater_u.newdate)+'#,'+inttostr(objmember2.getID)+',"'+ssection+'")';
    dm.qry.ExecSQL;
    DM.tblBeachCleanup.refresh;
  end
  else
  begin
    showmessage(
      'The is currently no event planned, please wait until one has been planned');
  end;
end;

procedure TfrmMainUI.btnLOGoutClick(Sender: TObject);  //nav back to login form
begin
  frmMainUI.Hide;
  frmlogin.Show;
end;



procedure TfrmMainUI.edtAMOUNTKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', '+', #8]) then // restricts user to only input numbers , + character and backspace
    Key := #0 // #8 = backspace button
end;

procedure TfrmMainUI.FormActivate(Sender: TObject);
var
  stime: string;
begin

  if itype > 0 then
  begin
    objmember2 := TMember.create(login_u.sname, icredits, iid);
    // instatiating object existing member
  end
  else
  begin
    dm.tblMembers.Last;
    objmember2 := TMember.create(dm.tblMembers['Username'],
      dm.tblMembers['Credits'], dm.tblMembers['MemberID']);
    // instatiating object new member
  end;

  lblUSERevent.Caption := '';

  if time < 12 then                                       //greeting label
  begin
    stime := 'Good evening';
  end
  else
  begin
    stime := 'Good morning'
  end;

  lblGREET.Caption := stime + ' ' + objmember2.getusername;

  sdefault := 'Any upcoming events will be displayed' + #13 +
    'here giving you all the details from what' + #13 +
    'type of event it is to the time and date. ' + #13#13 +
    'Just press the button below if you want' + #13 +
    'the event to be added to your calendar.';

  if updatetext <> '' then
  begin
    lblEVENT.Caption := 'There will be a new beach clean up ' + updatetext;
  end
  else
  begin
    lblEVENT.Caption := sdefault;
  end;
  case cal1.Month of                                          // getting month year
    1:
      lblDATE.Caption := 'January  ' + inttostr(cal1.Year);
    2:
      lblDATE.Caption := 'February  ' + inttostr(cal1.Year);
    3:
      lblDATE.Caption := 'March  ' + inttostr(cal1.Year);
    4:
      lblDATE.Caption := 'April  ' + inttostr(cal1.Year);
    5:
      lblDATE.Caption := 'May  ' + inttostr(cal1.Year);
    6:
      lblDATE.Caption := 'June  ' + inttostr(cal1.Year);
    7:
      lblDATE.Caption := 'July  ' + inttostr(cal1.Year);
    8:
      lblDATE.Caption := 'August  ' + inttostr(cal1.Year);
    9:
      lblDATE.Caption := 'September  ' + inttostr(cal1.Year);
    10:
      lblDATE.Caption := 'October  ' + inttostr(cal1.Year);
    11:
      lblDATE.Caption := 'November  ' + inttostr(cal1.Year);
    12:
      lblDATE.Caption := 'December  ' + inttostr(cal1.Year);
  end;
  lblBAL.Caption := inttostr(objmember2.getbalance);
end;

procedure TfrmMainUI.imgPATClick(Sender: TObject);          // assigning coupon value to a variable
begin
  lblConfirm.Caption := 'patagonia coupon';
  iCoupon := 500;
end;

procedure TfrmMainUI.imgSUNClick(Sender: TObject);         //
begin
  lblConfirm.Caption := 'SUNPOWER coupon';
  iCoupon := 1000;
end;

procedure TfrmMainUI.imgTESLAClick(Sender: TObject);      //
begin
  lblConfirm.Caption := 'TESLA coupon';
  iCoupon := 1000;
end;

procedure TfrmMainUI.imgTOMSClick(Sender: TObject);        //
begin
  lblConfirm.Caption := 'TOMS coupon';
  iCoupon := 500;
end;

function TfrmMainUI.SelectSql(ssql: string): string;    // shortcut for query
begin
dm.qry.Active:=false;
dm.qry.SQL.Text:=ssql;
dm.qry.Active:=true;
end;

end.
