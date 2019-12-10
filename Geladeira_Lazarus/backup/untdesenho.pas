unit untdesenho;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { Tfrmdesenho }

  Tfrmdesenho = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    smartfreezer: TStaticText;
  private

  public

  end;

var
  frmdesenho: Tfrmdesenho;

implementation
uses untdeserto, ulogs, untcam, untdesenho;
{$R *.lfm}

{ Tfrmdesenho }
end.


