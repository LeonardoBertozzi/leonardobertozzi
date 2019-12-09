program Geladeira;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, LazSerialPort, untdeserto, untcam,
  untdesenho, untconsumo, udm;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfrmPrinc, frmPrinc);
  Application.CreateForm(Tfrmcam, frmcam);
  Application.CreateForm(Tfrmdesenho, frmdesenho);
  Application.CreateForm(Tfrmconsumo, frmconsumo);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.

