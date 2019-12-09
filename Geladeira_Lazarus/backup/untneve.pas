unit untneve;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, untensolarado;

type

  { Tfrmneve }

  Tfrmneve = class(TForm)
    aracatuba: TStaticText;
    BitBtn1: TBitBtn;
    lbl_data: TLabel;
    lbl_hora: TLabel;
    lbl_teminterna: TLabel;
    lbl_tempambiente: TLabel;
    lbl_tempfreezer: TLabel;
    neve: TImage;
    smartfreezer: TStaticText;
    tempambiente: TStaticText;
    tempfreezer: TStaticText;
    tempinterna: TStaticText;
    Timer1: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure neveClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  frmneve: Tfrmneve;

implementation

{$R *.lfm}

{ Tfrmneve }

procedure Tfrmneve.neveClick(Sender: TObject);
begin

end;

procedure Tfrmneve.Timer1Timer(Sender: TObject);
begin
  lbl_hora.Caption := FormatDateTime('hh:mm',now);
  lbl_data.Caption := DateToStr (Date);
end;

procedure Tfrmneve.BitBtn1Click(Sender: TObject);
begin
  frmensolarado.Show
end;

end.

