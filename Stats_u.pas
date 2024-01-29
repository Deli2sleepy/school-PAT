unit Stats_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmSTATS = class(TForm)
    redout: TRichEdit;
    btnDisplay: TButton;
    btnAVGm: TButton;
    btnAVGt: TButton;
    btnTOTAL: TButton;
    btnBack: TButton;
    procedure btnDisplayClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnAVGtClick(Sender: TObject);
    procedure headings;
    procedure btnAVGmClick(Sender: TObject);
    procedure btnTOTALClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSTATS: TfrmSTATS;
  arrmonths: array [1 .. 6] of string = (
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun'
  );
  arrTemp: array [1 .. 3] of string = (
    'Hot',
    'Cold',
    'Cool'
  );
  arrTrash: array [1 .. 3, 1 .. 6] of integer = ((218, 197, 123, 285,
      // all in KGs
      124, 114), (245, 124, 114, 123, 145, 185), (124, 134, 125, 478, 124,
      102));
  i, R, C, itotal, isum: integer;
  sline: string;
  ravg: real;

implementation

uses adminmain_u;
{$R *.dfm}

procedure TfrmSTATS.btnAVGmClick(Sender: TObject);   //displays the average trash collected per month
begin
  redout.Clear;
  headings;
  sline := #9;
  for C := 1 to 6 do
  begin
    isum := 0;
    ravg := 0;
    for R := 1 to 3 do
    begin
      isum := isum + arrTrash[R, C];
    end;
    ravg := isum / 3;
    sline := sline + #9 + floattostrf(ravg, fffixed, 6, 3);
  end;
  redout.Lines.Add(sline)
end;

procedure TfrmSTATS.btnAVGtClick(Sender: TObject);    //displays the average trash collected per temperature
begin
  redout.Clear;

  for R := 1 to 3 do
  begin
    isum := 0;
    ravg := 0;
    sline := '';
    for C := 1 to 6 do
    begin
      isum := isum + arrTrash[R, C];
    end;
    ravg := isum / 6;
    sline := arrTemp[R] + #9#9 + floattostrf(ravg, fffixed, 6, 3);
    redout.Lines.Add(sline)
  end;
end;

procedure TfrmSTATS.btnBackClick(Sender: TObject);         //nav to admin main
begin
  frmSTATS.Hide;
  frmadminMain.Show;
end;

procedure TfrmSTATS.btnDisplayClick(Sender: TObject);        //displays all the trash collected over 6 months and the temperatures over the 6 months
begin
  redout.Clear;
  headings;
  for R := 1 to 3 do
  begin
    sline := arrTemp[R];
    for C := 1 to 6 do
    begin
      sline := sline + #9#9 + inttostr(arrTrash[R, C]);
    end;
    redout.Lines.Add(sline)
  end;
end;

procedure TfrmSTATS.btnTOTALClick(Sender: TObject);  //shows the total amount of trash collected over 6 months
begin
  redout.Clear;
  itotal := 0;
  for R := 1 to 3 do
  begin
    isum := 0;

    for C := 1 to 6 do
    begin
      isum := isum + arrTrash[R, C];

    end;
      itotal := itotal + isum;
  end;
  redout.Lines.Add('Total trash collected over 6 months: '+inttostr(itotal)+'KG')

end;

procedure TfrmSTATS.FormActivate(Sender: TObject);

begin
  sline := '';
  ravg := 0;
  itotal := 0;

end;

procedure TfrmSTATS.headings;           //procedure to quick load the headings
begin
  sline := #9#9;
  for i := 1 to 6 do
  begin
    sline := sline + arrmonths[i] + #9#9;
  end;
  redout.Clear;
  redout.Lines.Add(sline)
end;

end.
