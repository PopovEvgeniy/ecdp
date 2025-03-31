unit ecdpcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPlayer, ExtCtrls, mmsystem;

type
  TMainWindow = class(TForm)
    PlayButton: TButton;
    PauseButton: TButton;
    NextButton: TButton;
    BackButton: TButton;
    EjectButton: TButton;
    MusicStatus: TLabel;
    Timer: TTimer;
    CDPlayer: TMediaPlayer;
    procedure FormCreate(Sender: TObject);
    procedure PlayButtonClick(Sender: TObject);
    procedure PauseButtonClick(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
    procedure EjectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var MainWindow: TMainWindow;

implementation

{$R *.dfm}

procedure device_setup();
begin
 MainWindow.CDPlayer.DeviceType:=dtCDAudio;
 MainWindow.CDPlayer.TimeFormat:=tfTMSF;
 MainWindow.CDPlayer.Visible:=False;
 MainWindow.CDPlayer.Notify:=False;
 MainWindow.CDPlayer.AutoOpen:=False;
 MainWindow.CDPlayer.Open();
end;

procedure window_setup();
begin
 Application.Title:='Easy CD player';
 MainWindow.Caption:='Easy CD player 0.9';
 MainWindow.Font.Assign(Screen.MenuFont);
 MainWindow.Font.Size:= 14;
 MainWindow.BorderStyle:=bsDialog;
end;

procedure interface_setup();
begin
 MainWindow.PlayButton.Caption:='Play';
 MainWindow.PauseButton.Caption:='Pause';
 MainWindow.NextButton.Caption:='Next';
 MainWindow.BackButton.Caption:='Back';
 MainWindow.EjectButton.Caption:='Eject';
 MainWindow.MusicStatus.Caption:='';
end;

procedure timer_setup();
begin
 MainWindow.Timer.Interval:=1000;
 MainWindow.Timer.Enabled:=false;
end;

procedure setup();
begin
 device_setup();
 window_setup();
 interface_setup();
 timer_setup();
end;

function show_music_status(var player:TMediaPlayer): string;
var minutes,seconds,track:LongWord;
begin
 minutes:=MCI_TMSF_MINUTE(player.Position);
 seconds:=MCI_TMSF_SECOND(player.Position);
 track:=MCI_TMSF_TRACK(player.Position);
 Result:=IntToStr(track)+'\'+IntToStr(player.Tracks)+' '+IntToStr(minutes)+':'+IntToStr(seconds);
end;

procedure TMainWindow.PlayButtonClick(Sender: TObject);
begin
 MainWindow.Timer.Enabled:=True;
 MainWindow.CDPlayer.Play();
end;

procedure TMainWindow.PauseButtonClick(Sender: TObject);
begin
 MainWindow.Timer.Enabled:=False;
 MainWindow.CDPlayer.Pause();
end;

procedure TMainWindow.NextButtonClick(Sender: TObject);
begin
 MainWindow.Timer.Enabled:=True;
 MainWindow.CDPlayer.Next();
 MainWindow.CDPlayer.Play();
end;

procedure TMainWindow.BackButtonClick(Sender: TObject);
begin
 MainWindow.Timer.Enabled:=True;
 MainWindow.CDPlayer.Previous();
 MainWindow.CDPlayer.Play();
end;

procedure TMainWindow.EjectButtonClick(Sender: TObject);
begin
 MainWindow.Timer.Enabled:=False;
 MainWindow.CDPlayer.Stop();
 MainWindow.CDPlayer.Eject();
 MainWindow.MusicStatus.Caption:='';
end;

procedure TMainWindow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 MainWindow.CDPlayer.Stop();
 MainWindow.CDPlayer.Close();
end;

procedure TMainWindow.FormCreate(Sender: TObject);
begin
 setup();
end;

procedure TMainWindow.TimerTimer(Sender: TObject);
begin
 MainWindow.MusicStatus.Caption:=show_music_status(MainWindow.CDPlayer);
end;

end.