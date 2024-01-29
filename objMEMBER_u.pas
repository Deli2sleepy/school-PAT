unit objMEMBER_u;

interface

type
  TMember = class(tobject)
  private
    fUsername: String;
    fBalance: integer;
    fID: integer;

  public
    constructor create(sUsername: string; iBalance, iID: integer);
    function getbalance: integer;
    function getusername: string;
    function getID: integer;
    procedure updatebalance(coupon: integer);
    function SufficientFunds(coupon: integer): Boolean;
    function ErrorMsg: string;
    function tostring(sFname, sSname, sgender: string): string;
    procedure reward;
  end;

implementation

uses sysutils;
{ TMember }

constructor TMember.create(sUsername: string; iBalance, iID: integer);  //constructor, makes object
begin
  fUsername := sUsername;
  fBalance := iBalance;
  fID := iID;
end;

function TMember.ErrorMsg: string; //quick error message
begin
  result := 'user not found or data entered is invalid';
end;

function TMember.getbalance: integer;  //returns the credit balance
begin
  result := fBalance;
end;

function TMember.getID: integer;       //returns the member ID
begin
  result := fID;
end;

function TMember.getusername: string;      //returnd the member Username
begin
  result := fUsername;
end;

procedure TMember.reward;                //gifts the member 100 credits for joining an event
begin
fbalance:= fbalance + 100;
end;

function TMember.SufficientFunds(coupon: integer): Boolean;  //checks if there is enough credits in the member's balance to subtract the correct amount for  the coupon they want to buy and returns true if it has enough credits
begin
  if fBalance - coupon < 0 then
    result := false
  else
    result := true;
end;

function TMember.tostring(sFname, sSname, sgender: string): string;    //to string for the report
begin
  result := 'Username:' + fUsername + #13 + 'ID: ' + inttostr(fID)
    + #13 + 'Full name: ' + sFname + ' ' + sSname + #13 + 'balance: ' +
    inttostr(fBalance)+#13+'Gender: '+sgender;
end;

procedure TMember.updatebalance(coupon: integer); //removes the correct amount from the credit balance
begin
  fBalance := fBalance - coupon;
end;

end.
