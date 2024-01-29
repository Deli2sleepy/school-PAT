unit other_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,dmbeachCleanup_u, Grids, DBGrids, ExtCtrls;

type
  TfrmOther = class(TForm)
    btnback: TButton;
    DBGrid1: TDBGrid;
    pnlSEARCH: TPanel;
    edtSearch: TEdit;
    lblINFO: TLabel;
    pnlOPTIONS: TPanel;
    rbtnCount: TRadioButton;
    rbtnsortYear: TRadioButton;
    rbtnsortSurname: TRadioButton;
    rbtnsortcredits: TRadioButton;
    procedure btnbackClick(Sender: TObject);
    function SelectSql(ssql:string):string;
    procedure edtSearchChange(Sender: TObject);
    procedure rbtnsortYearClick(Sender: TObject);
    procedure rbtnsortSurnameClick(Sender: TObject);
    procedure rbtnsortcreditsClick(Sender: TObject);
    procedure rbtnCountClick(Sender: TObject);
    procedure FormResize(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOther: TfrmOther;
  ssql:string;

implementation
USES
adminMain_u;

{$R *.dfm}

procedure TfrmOther.btnbackClick(Sender: TObject);        //nav back to admin main
begin
frmOther.Hide;
frmadminMain.Show;
end;



procedure TfrmOther.edtSearchChange(Sender: TObject);        // shows the possible user the admin is searching for
var
 ssur:string;
begin
ssur:=edtsearch.text;
ssql:='select surname,[first_name/s],mobile,email from tblmembers where  surname like "'+ssur+'%"';
SelectSql(ssql);
end;

procedure TfrmOther.FormResize(Sender: TObject);   //resizing the dbgrid with the form if the admin decides to use full screen
begin
if frmOther.Width = 712 then
begin
dbgrid1.Width:= 383;
end
else
begin
dbgrid1.Width:= 1200;
end;
end;

procedure TfrmOther.rbtnCountClick(Sender: TObject);     //selects all the members and counts them
begin
   ssql:='select count(*) as [Number of members] from tblmembers';
SelectSql(ssql);
end;

procedure TfrmOther.rbtnsortcreditsClick(Sender: TObject);   //sorts the users by amount of credits they have in descending order
begin
 ssql:='select * from tblmembers order by credits desc';
SelectSql(ssql);
end;

procedure TfrmOther.rbtnsortSurnameClick(Sender: TObject);  //sorts the users by their surname in ascending order
begin
 ssql:='select * from tblmembers order by surname asc';
SelectSql(ssql);
end;

procedure TfrmOther.rbtnsortYearClick(Sender: TObject);     //sort members from the oldest member to the youngest member
begin
 ssql:='select * from tblmembers order by year(dob) desc';
SelectSql(ssql);
end;

function TfrmOther.SelectSql(ssql: string): string;  //user defined
begin
dm.qry.Active:=false;
dm.qry.SQL.Text:=ssql;
dm.qry.Active:=true;
end;

end.
