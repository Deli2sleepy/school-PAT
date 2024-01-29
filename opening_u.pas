unit opening_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Gauges, GIFImg;

type
  Tfrmopening = class(TForm)
    gload: TGauge;
    tload: TTimer;
    Image1: TImage;
    procedure tloadTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmopening: Tfrmopening;

implementation
uses
login_u;

{$R *.dfm}

procedure Tfrmopening.FormCreate(Sender: TObject);
begin
(image1.Picture.Graphic as tgifimage).Animate:=true;  //loading screen gif
end;

procedure Tfrmopening.tloadTimer(Sender: TObject);   // simulating a loading bar
begin
gload.Progress:= gload.Progress + 20;

if gload.Progress = 100 then
begin
  tload.Enabled:=false; //deactivate timer

  frmopening.Hide;
  frmlogin.Show;
end;
end;

end.
