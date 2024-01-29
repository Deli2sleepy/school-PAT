unit memberREGISTER_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, ComCtrls, objVALID_u, dateutils,
  dmbeachcleanup_u, mainUI, objMEMBER_u;

type
  TfrmREGISTER = class(TForm)
    pnlREGISTER: TPanel;
    edtUSERNAME: TEdit;
    edtFIRSTNAME: TEdit;
    edtSURNAME: TEdit;
    edtEMAIL: TEdit;
    edtMOBILE: TEdit;
    edtPASS1: TEdit;
    edtPASS2: TEdit;
    imgLOGO: TImage;
    cmbGENDER: TComboBox;
    dtpDOB: TDateTimePicker;
    btnCONTINUE: TButton;
    btnBACK: TButton;
    procedure btnBACKClick(Sender: TObject);
    procedure btnCONTINUEClick(Sender: TObject);
    procedure edtMOBILEKeyPress(Sender: TObject; var Key: Char);
    function correctform: boolean;
  private
    { Private declarations }
    objvalid: TValidator;

  public
    { Public declarations }
  end;

var
  frmREGISTER: TfrmREGISTER;
  sUname, sFname, sSname, sEmail, sMobile, sPass1, sPass2, sGender: string;
  dob: Tdate;

implementation

uses
  login_U;
{$R *.dfm}

procedure TfrmREGISTER.btnBACKClick(Sender: TObject); // nav back to login
begin
  frmLogin.Show;
  frmREGISTER.Hide;
end;

procedure TfrmREGISTER.btnCONTINUEClick(Sender: TObject); // nav to mainscreen + validation + adding data to database
var
  iid: integer;
  bfound: boolean;
  procedure setComponentColorBasedOnState(item: TEdit; state: boolean); // changes colour of editbox based on the state of the validation function;
  begin // code sir added
    if state = true then
    begin
      item.Color := clWhite;
    end
    else
    begin
      item.Color := clRed;
      showmessage(objvalid.ErrorMsg);
    end;
  end;

begin // collecting data from editboxes, etc into variables
  sUname := edtUSERNAME.Text;
  sFname := edtFIRSTNAME.Text;
  sSname := edtSURNAME.Text;
  sEmail := edtEMAIL.Text;
  sMobile := edtMOBILE.Text;
  sPass1 := edtPASS1.Text;
  sPass2 := edtPASS2.Text;
  sGender := cmbGENDER.Text;
  dob := dtpDOB.Date;

  objvalid := TValidator.create(sPass1, sPass2, sMobile, sEmail, dob);
  // obj instantiate

  if (sUname = '') or (sFname = '') or (sSname = '') or (sEmail = '') or
    (sMobile = '') or (sPass1 = '') or (sPass2 = '') or (sGender = '') or
    (dob = now) then
  begin
    showmessage('data missing, please fill in all text boxes');
    // checks if the variables are not empty
  end
  else
  begin // validation
    objvalid.passmatch;
    objvalid.ismobile;
    objvalid.emailvalid;
    objvalid.oldenough;
    objvalid.correctformat(sUname);
    objvalid.correctformat(sFname);
    objvalid.correctformat(sSname);
    objvalid.correctformat(sPass1);
    objvalid.correctformat(sPass2);

    if correctform = false then // return error message based on function
    begin
      showmessage(
        'Data does not contain only numbers and letters, please correxr this');
    end;
    if objvalid.oldenough = false then // checks the age of the participant
    begin
      dtpDOB.Color := clRed;
      showmessage(objvalid.ErrorMsg + ', Too young');
    end
    else
    begin
      dtpDOB.Color := clWhite;
    end;
    // validation
    setComponentColorBasedOnState(edtPASS2, objvalid.passmatch);
    setComponentColorBasedOnState(edtMOBILE, objvalid.ismobile);
    setComponentColorBasedOnState(edtEMAIL, objvalid.emailvalid);
    objvalid.allvalid;
    if (objvalid.allvalid = true) and (correctform = true) then
    begin
      dm.tblMembers.first;
      while not dm.tblMembers.Eof do
      begin
        if sUname = dm.tblMembers['Username'] then
        begin
          bfound := true;
        end; // if
        dm.tblMembers.Next;
      end; // while

      if bfound = true then
      begin
        showmessage('username already exists please, choose another');
      end
      else
      begin
        dm.tblMembers.Sort := 'MemberID ASC'; // sorts table in assending order based on the member ID
        dm.tblMembers.Last;
        iid := dm.tblMembers['MemberID'];
        inc(iid);
        // creating new id

        dm.tblMembers.Insert; // putting the table into insert mode

        // adding new member details to table
        dm.tblMembers['MemberID'] := iid;
        dm.tblMembers['Username'] := sUname;
        dm.tblMembers['Password'] := sPass1;
        dm.tblMembers['First_Name/s'] := sFname;
        dm.tblMembers['Surname'] := sSname;
        dm.tblMembers['Email'] := sEmail;
        dm.tblMembers['Mobile'] := sMobile;
        dm.tblMembers['DOB'] := datetostr(dob);
        dm.tblMembers['Credits'] := 100;
        if sGender = 'Male' then
        begin
          dm.tblMembers['Gender'] := 'M';
        end;
        if sGender = 'Female' then
        begin
          dm.tblMembers['Gender'] := 'F';
        end;

        dm.tblMembers.Post;
        dm.tblMembers.Refresh;
        itype := 0; // to help differentiate between a member and a new member for the object
        showmessage('Successful regesteration, Welcome ' + sUname);
        frmREGISTER.Close;
        frmMainui.Show;
        // clear all components

      end;
    end;

  end;

end;

function TfrmREGISTER.correctform: boolean; // checks if all the variables are in the correct format , found in object, then returns true or false depending on the result
begin
  if (objvalid.correctformat(sUname) = false) or
    (objvalid.correctformat(sFname) = false) or
    (objvalid.correctformat(sSname) = false) or
    (objvalid.correctformat(sPass1) = false) or
    (objvalid.correctformat(sPass2) = false) then
    result := false
  else
    result := true;

end;

procedure TfrmREGISTER.edtMOBILEKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', '+', #8]) then // restricts user to only input numbers , + character and backspace
    Key := #0 // #8 = backspace button

end;

end.
