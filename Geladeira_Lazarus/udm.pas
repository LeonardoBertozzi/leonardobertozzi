unit udm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, LazSerial;

type

  { Tdm  }

   Tdm = class(TDataModule)
    LazSerial1: TLazSerial;
    Serial: TLazSerial;
    Timer1: TTimer;
    procedure DataModuleCreate(Sender: TObject);
    procedure LazSerial1RxData(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    { private declarations }

  public
    { public declarations }
   function AnalyzeReceivedData(Data: string; var ReturnMessage: String) : String ;
  end;

var
  dm: Tdm;
  MsgRetorno, FTempStr, Payload : string;
  cod_req : integer = 0;
  tela_ativa : integer = 1;

implementation

uses untdeserto, ulogs, untcam, untdesenho;
{$R *.lfm}

{ Tdm }


procedure Tdm.LazSerial1RxData(Sender: TObject);
var
   Response: TStringList;
   Payload: TStringList;
   tela_background : Double ;
   tela : integer = 1;

begin

if (AnalyzeReceivedData(LazSerial1.ReadData,MsgRetorno) <> '') then
 begin
  Response := TStringList.Create;
  Payload := TStringList.Create;

  try
    Response.Delimiter := ',';
    frmLogs.Memo1.Lines.Add(timetostr(now) + ' - ' + MsgRetorno);

    Delete (MsgRetorno,1,1);
    Delete (MsgRetorno,MsgRetorno.Length-1,1);
    Response.DelimitedText := MsgRetorno;

    frmLogs.Memo1.Lines.Add(timetostr(now) + ' - ' + MsgRetorno);
    frmLogs.Memo1.Lines.Add('Remente:' + ' - ' + Response[0]);
    frmLogs.Memo1.Lines.Add('Requisitante:' + ' - ' + Response[1]);
    frmLogs.Memo1.Lines.Add('Payload' + ' - ' + Response[2]);
    frmLogs.Memo1.Lines.Add('CodReq' + ' - ' + Response[3]);

    Payload.Delimiter := '/';
    Payload.DelimitedText := Response[2];
    case Payload[0] of
    'BTNF': begin
            LazSerial1.WriteData('*SD,HD,BTNFOK,' + Response[3] + '#' );
            frmLogs.Memo1.Lines.add('RESPONDI') ;
            frmLogs.Memo1.Lines.add('*SD,HD,BTNFOK,' + Response[3] + '#') ;
            tela := tela + 1 ;
            end;
    'BTNV': begin
            LazSerial1.WriteData('*SD,HD,BTNVOK,' + Response[3] + '#' );
            frmLogs.Memo1.Lines.add('RESPONDI') ;
            frmLogs.Memo1.Lines.add('*SD,HD,BTNVOK,' + Response[3] + '#') ;
            tela := tela - 1 ;
            end;
    'PIR': begin
            LazSerial1.WriteData('*SD,HD,PIROK,' + Response[3] + '#' );
            frmLogs.Memo1.Lines.add('RESPONDI') ;
            frmLogs.Memo1.Lines.add('*SD,HD,PIROK,' + Response[3] + '#') ;
            end;
    'FDC': begin
            LazSerial1.WriteData('*SD,HD,FDCOK,' + Response[3] + '#' );
            frmLogs.Memo1.Lines.add('RESPONDI') ;
            frmLogs.Memo1.Lines.add('*SD,HD,FDCOK,' + Response[3] + '#') ;
            end;
    end;



    if (Payload.Count > 1) then
     begin
    LazSerial1.WriteData('*SD,HD,SENSORESOK,' + Response[3] + '#' );
    frmLogs.Memo1.Lines.add('RESPONDI') ;
    frmLogs.Memo1.Lines.add('*SD,HD,SENSORESOK,' + Response[3] + '#') ;
    frmPrinc.lbl_tempambiente.Caption := (Payload[0] + ' °C');
    frmPrinc.lbl_teminterna.Caption := (Payload[1] + ' °C');
    frmPrinc.lbl_tempfreezer.Caption := (Payload[2] + ' °C');
    tela_background := StrToFloat(StringReplace(Payload[0], '.', ',', [rfReplaceAll]));
     end;

    if (tela_background < 5) then
     begin
     frmPrinc.img_background.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\img\neve.png');
     end;

    if (tela_background > 5) then
     begin
     frmPrinc.img_background.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\img\ensolarado.png');
     end;

    if (tela_background > 34) then
     begin
     frmPrinc.img_background.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\img\deserto.png');
     end;



    finally
    Response.Free;
    Payload.Free;
    end;

end;

end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  LazSerial1.Device := 'COM4';
  LazSerial1.Active := True;
end;

procedure Tdm.Timer1Timer(Sender: TObject);
begin
   tela_ativa := tela_ativa + 1;
   if tela_ativa = 5 then
    tela_ativa := 1 ;

   case tela_ativa of
   //1 : frmPrinc.ShowModal;
   //2 : frmdesenho.ShowModal;
   //3 : frmPrinc.img_background.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\img\neve.png');
   //4 : frmPrinc.img_background.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\img\telaazul.png');

   end;
end;

function Tdm.AnalyzeReceivedData(Data: string; var ReturnMessage: String): String;
var
char_start, char_end : char;
begin
   char_start := '*';
   char_end := '#';
   Result := '';
   //FIND START AND END
   if ( Pos(char_start,Data) <> 0 ) and ( Pos(char_end,Data) <> 0 ) then
   begin
   ReturnMessage := Copy(Data,Pos(char_start,Data),Length(Data)-1);
   Result := ReturnMessage;
   //ReturnMessage := '';
   exit;
   end;
   //FIND JUST START
   if ( Pos(char_start,Data) <> 0 ) and ( Pos(char_end,Data) = 0 ) then
   begin
   ReturnMessage := Copy(Data,Pos(char_start,Data),Length(Data));
   exit;
   end;
   //FIND JUST END
   if ( Pos(char_start,Data) = 0 ) and ( Pos(char_end,Data) <> 0 ) then
   begin
   ReturnMessage := ReturnMessage + Copy(Data,1,Length(Data));
   if (ReturnMessage[1] = char_start) then
   begin
   Result := ReturnMessage;
   exit;
   end
   else
   begin
   ReturnMessage:='';
   end;

   end;
   //NOT FIND START AND NOT FIND END
   if (Pos(char_end,Data) = 0) and (Pos(char_start,Data) = 0) then
   if (ReturnMessage <> '') then
   if (ReturnMessage[1] = char_start) then
   begin
   ReturnMessage := ReturnMessage + Data;
   exit;
   end
   else
   ReturnMessage := '';





end;

end.

