unit untchuva;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, untcam;

type

  { Tfrmchuva }

  Tfrmchuva = class(TForm)
    aracatuba: TStaticText;
    BitBtn1: TBitBtn;
    Image1: TImage;
    lbl_data: TLabel;
    lbl_hora: TLabel;
    lbl_teminterna: TLabel;
    lbl_tempambiente: TLabel;
    lbl_tempfreezer: TLabel;
    smartfreezer: TStaticText;
    tempambiente: TStaticText;
    tempfreezer: TStaticText;
    tempinterna: TStaticText;
    Timer1: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  frmchuva: Tfrmchuva;

implementation

{$R *.lfm}

{ Tfrmchuva }

procedure Tfrmchuva.Timer1Timer(Sender: TObject);
begin
  lbl_hora.Caption := FormatDateTime('hh:mm',now);
  lbl_data.Caption := DateToStr (Date);
end;

procedure Tfrmchuva.BitBtn1Click(Sender: TObject);
begin
  frmcam.Show
end;

end.

