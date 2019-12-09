unit untconsumo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, untdesenho;

type

  { Tfrmconsumo }

  Tfrmconsumo = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    smartfreezer: TStaticText;
    procedure BitBtn1Click(Sender: TObject);
  private

  public

  end;

var
  frmconsumo: Tfrmconsumo;

implementation

{$R *.lfm}

{ Tfrmconsumo }

procedure Tfrmconsumo.BitBtn1Click(Sender: TObject);
begin
  frmdesenho.Show
end;

end.

