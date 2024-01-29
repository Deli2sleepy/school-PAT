unit sponsor_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,dmbeachcleanup_u, StdCtrls;

type
  TfrmSPONSOR = class(TForm)
    tblsponsors: TDBGrid;
    RBmost: TRadioButton;
    RBmodal: TRadioButton;
    btnBack: TButton;
    RBlatest: TRadioButton;
    RBearliest: TRadioButton;
    function SelectSql(ssql: string): string;
    procedure RBmostClick(Sender: TObject);
    procedure RBmodalClick(Sender: TObject);
    procedure RBlatestClick(Sender: TObject);
    procedure RBearliestClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSPONSOR: TfrmSPONSOR;
  ssql: string;
implementation
  uses adminmain_u;
{$R *.dfm}
{ TfrmSPONSOR }

procedure TfrmSPONSOR.btnBackClick(Sender: TObject);            //nav back to admin main
begin
frmadminmain.show;
frmSPONSOR.hide;
end;

procedure TfrmSPONSOR.RBearliestClick(Sender: TObject);        //selects all the records ordering them by the newest sponsor to the oldest sponsor
begin
ssql:='select * from tblsponsors order by datesponsored asc';
selectsql(ssql);
end;

procedure TfrmSPONSOR.RBlatestClick(Sender: TObject);     //sorts all records from the oldest sponsor to the newest
begin
ssql:='select * from tblsponsors order by datesponsored desc';
selectsql(ssql);
end;

procedure TfrmSPONSOR.RBmodalClick(Sender: TObject);    //shows the sponsor who sponsored the most
begin
ssql:='select distinct(sponsor),count(sponsor) from tblsponsors group by sponsor';
selectsql(ssql);
end;

procedure TfrmSPONSOR.RBmostClick(Sender: TObject);     //orders sponsors with the highest sponsored amount
begin
ssql:='select * from tblsponsors order by Amount desc';
selectsql(ssql);
end;

function TfrmSPONSOR.SelectSql(ssql: string): string;
begin
dm.qry.Active:=false;
dm.qry.SQL.Text:=ssql;
dm.qry.Active:=true;
end;



end.
