unit EventUpdater_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmEVENTupdater = class(TForm)
    dtpDATE: TDateTimePicker;
    LBLdate: TLabel;
    lblBEACH: TLabel;
    btnUPDATE: TButton;
    btnBACK: TButton;
    cmbBEACHES: TComboBox;
    dtpTIME: TDateTimePicker;
    cmbDUTY: TComboBox;
    lblDutyArea: TLabel;
    procedure btnUPDATEClick(Sender: TObject);
    procedure btnBACKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEVENTupdater: TfrmEVENTupdater;
  newdate: tdatetime;
  bcTIME: ttime;
  sNewbeach: string;
  updatetext: string;
  sSection:string;

implementation

uses adminmain_u, mainUI;
{$R *.dfm}

procedure TfrmEVENTupdater.btnBACKClick(Sender: TObject);    //nav back to admin main
begin
  frmadminMain.show;
  frmEVENTupdater.hide;
end;

procedure TfrmEVENTupdater.btnUPDATEClick(Sender: TObject);           //prompts the user with a choice on whether or not they want to plan the event and then makes the necessary changes
var
  buttonchoice: integer;
begin
  buttonchoice := messagedlg(
    'Are you sure you want to update the selected fields?', mtcustom,
    [mbYes, mbCancel], 0);
  if buttonchoice = mryes then
  begin
  dtpDATE.DateFormat:= dflong;
    newdate := dtpDATE.Date;
    sNewbeach := cmbBEACHES.Text;
    bcTIME := dtpTIME.Time;
    updatetext :=#13+ 'at: ' + sNewbeach+''+ssection + #13 + ' at: ' + timetostr(bcTIME)
      + #13 + ' on the: ' + datetostr(newdate);
    mainui.frmMainUI.btnEVENTjoin.Enabled:= true;
  end
  ELSE
  begin
    cmbBEACHES.ItemIndex := -1;
  end;
end;

procedure TfrmEVENTupdater.FormActivate(Sender: TObject);
begin
  updatetext := '';
end;

end.
