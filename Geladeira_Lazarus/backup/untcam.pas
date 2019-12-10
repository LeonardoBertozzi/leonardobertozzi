unit untcam;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { Tfrmcam }

  Tfrmcam = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    smartfreezer: TStaticText;
  private

  public

  end;

var
  frmcam: Tfrmcam;

implementation
 uses  untdeserto, ulogs, untcam, untdesenho;
{$R *.lfm}

{ Tfrmcam }

end.


