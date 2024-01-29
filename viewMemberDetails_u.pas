unit viewMemberDetails_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,dmBeachCleanup_u, Grids, DBGrids;

type
  TfrmViewMemberDetails = class(TForm)
    btnback: TButton;
    DBGmembers: TDBGrid;
    DBGbeachcleanupduty: TDBGrid;
    procedure btnbackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewMemberDetails: TfrmViewMemberDetails;

implementation
uses
adminmain_u;

{$R *.dfm}

procedure TfrmViewMemberDetails.btnbackClick(Sender: TObject);     //nav to admin main
begin
frmViewMemberDetails.Hide;
frmadminMain.Show;
end;

end.
