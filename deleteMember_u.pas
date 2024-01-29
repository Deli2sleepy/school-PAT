unit deleteMember_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dmBeachCleanup_u;

type
  TfrmDELETE = class(TForm)
    btnDELETE: TButton;
    edtSEARCH: TEdit;
    btnBACK: TButton;
    procedure btnDELETEClick(Sender: TObject);
    procedure btnBACKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDELETE: TfrmDELETE;

implementation

uses adminmain_u;
{$R *.dfm}

procedure TfrmDELETE.btnBACKClick(Sender: TObject);       //nav to admin main + clears data in edits
begin
  edtSEARCH.Clear;
  edtSEARCH.SetFocus;
  frmDELETE.Hide;
  frmadminMain.Show;
end;

procedure TfrmDELETE.btnDELETEClick(Sender: TObject);    //deletes user details
var
  suname: string;
  bfound: boolean;
begin

  bfound := false;

  suname := edtSEARCH.Text;

  dm.tblMembers.First;
  while not dm.tblMembers.eof do
  begin
    if suname = dm.tblMembers['Username'] then                //searches for username in db and deletes it if found
    BEGIN
      bfound := true;
      dm.tblMembers.Delete;
      dm.tblMembers.Refresh;
      dm.tblBeachCleanup.Refresh;
      showmessage('member deleted');
    END;

    dm.tblMembers.Next;
  end; // while

  if bfound = false then
  begin

    showmessage('member username not found');
    edtSEARCH.Clear;
    edtSEARCH.SetFocus;
  end;
end;

end.
