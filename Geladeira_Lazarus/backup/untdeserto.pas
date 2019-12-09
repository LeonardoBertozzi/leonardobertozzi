unit untdeserto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TfrmPrinc }

  TfrmPrinc = class(TForm)
    Button1: TButton;
    img_background: TImage;
    lblsmartfreezer1: TLabel;
    lbltempambiente: TLabel;
    lblcidade: TLabel;
    lblsmartfreezer: TLabel;
    lbltempambiente1: TLabel;
    lbltempambiente2: TLabel;
    lbl_tempfreezer: TLabel;
    lbl_teminterna: TLabel;
    lbl_tempambiente: TLabel;
    lbl_hora: TLabel;
    lbl_data: TLabel;
    Hora_Data: TTimer;
    Req: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure Hora_DataTimer(Sender: TObject);
    procedure ReqTimer(Sender: TObject);
  private

  public

  end;

var
  frmPrinc: TfrmPrinc;

implementation

uses uDm,ulogs;
{$R *.lfm}

{ TfrmPrinc }



procedure TfrmPrinc.Hora_DataTimer(Sender: TObject);
begin
  lbl_hora.Caption := FormatDateTime('hh:mm',now);
  lbl_data.Caption := DateToStr (Date);
end;





procedure TfrmPrinc.Button1Click(Sender: TObject);
begin
  dm.LazSerial1.WriteData('*SR,HD,SENSORES,00#');
end;

procedure TfrmPrinc.FormKeyPress(Sender: TObject; var Key: char);
begin
   if key =  #27 then
  frmLogs.show;
end;


end.
