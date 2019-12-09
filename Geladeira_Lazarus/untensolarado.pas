unit untensolarado;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, untchuva;

type

  { Tfrmensolarado }

  Tfrmensolarado = class(TForm)
    aracatuba: TStaticText;
    BitBtn1: TBitBtn;
    ensolarado: TImage;
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
    procedure lbl_horaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  frmensolarado: Tfrmensolarado;

implementation

{$R *.lfm}

{ Tfrmensolarado }

procedure Tfrmensolarado.lbl_horaClick(Sender: TObject);
begin

end;

procedure Tfrmensolarado.BitBtn1Click(Sender: TObject);
begin
  frmchuva.Show
end;

procedure Tfrmensolarado.Timer1Timer(Sender: TObject);
begin
  lbl_hora.Caption := FormatDateTime('hh:mm',now);
  lbl_data.Caption := DateToStr (Date);
end;

end.

