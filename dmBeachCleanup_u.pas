unit dmBeachCleanup_u;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  Tdm = class(TDataModule)
    tblMembers: TADOTable;
    tblBeachCleanup: TADOTable;
    tblSponsors: TADOTable;
    dsMembers: TDataSource;
    dsBeach: TDataSource;
    dssponsors: TDataSource;
    dsqry: TDataSource;
    qry: TADOQuery;
    connBeachCleanup: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
