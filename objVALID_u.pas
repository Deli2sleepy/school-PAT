unit objVALID_u;

interface

type
  TValidator = class(tobject)
  private
    fPass1: string;
    fpass2: string;
    fMobile: string;
    fEmail: string;
    fDOB: tdate;

  public
    constructor create(sPass1, sPass2, sMobile, sEmail: string; dob: tdate);
    function passmatch: Boolean;
    function ismobile: Boolean;
    function emailvalid: Boolean;
    function ErrorMsg: string;
    function allvalid: Boolean;
    function oldenough: Boolean;
    function correctformat(sname: string; checkFor: string = '?><-()*&^%$#!;=')
      : Boolean;
  end;

implementation

uses dateutils;

{ TValidator }
function TValidator.allvalid: Boolean; // check if any of the validators returned false
begin
  if (emailvalid = false) or (ismobile = false) or (passmatch = false) or
    (oldenough = false) then
    result := false
  else
    result := true;
end;

function TValidator.correctformat(sname: string;
  checkFor: string = '?><-()*&^%$#!;='): Boolean; // code sir added, checks if the text entered contains any of the characters listed
var
  i, ierrors: integer;
begin
  ierrors := 0;
  for i := 1 to 16 do
  begin
    if (pos(checkFor[i], sname) > 1) then
      inc(ierrors);
  end;
  if (ierrors = 0) then
    result := true;
end;

constructor TValidator.create(sPass1, sPass2, sMobile, sEmail: string;
  // constructor
  dob: tdate);
begin
  fPass1 := sPass1;
  fpass2 := sPass2;
  fMobile := sMobile;
  fEmail := sEmail;
  fDOB := dob;
end;

function TValidator.emailvalid: Boolean; // checks if the email contains atleast 1 '@' sign and '.' sign
begin
  if (pos('@', fEmail) > 0) and (pos('.', fEmail) > 0) then
  begin
    result := true;
  end
  else
  begin
    result := false;
  end;

end;

function TValidator.ErrorMsg: string; // shortcut error message
begin
  result := 'The information entered is invalid'
end;

function TValidator.ismobile: Boolean; // checks if the length of the number is = to 10 characters
begin
  if length(fMobile) = 10 then
  begin
    result := true;
  end
  else
  begin
    result := false;
  end;
end;

function TValidator.oldenough: Boolean; // check if the date entered has the number of years between now and the date is greater than 10 years
var
  parm: tdate;
begin
  parm := today;
  if yearsbetween(fDOB, parm) < 10 then
    result := false
  else
    result := true;

end;

function TValidator.passmatch: Boolean; // checks if the password entered is matched with the confirmed password
begin
  if fPass1 <> fpass2 then
  begin
    result := false;
  end
  else
  begin
    result := true;
  end;
end;

end.
