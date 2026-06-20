unit ecdpcode;

{
 This sofware was made by Popov Evgeniy Alekseyevich.
 It is distributed under the GNU GENERAL PUBLIC LICENSE (Version 2 or higher).
}

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, MPlayer, ExtCtrls, mmsystem;

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
    procedure device_setup();
    procedure window_setup();
    procedure interface_setup();
    procedure timer_setup();
    procedure setup();
  public
    { Public declarations }
  end;

var MainWindow: TMainWindow;

implementation

function show_music_status(const Position:LongWord): string;
var minutes,seconds,track:LongWord;
begin
 minutes:=MCI_TMSF_MINUTE(Position);
 seconds:=MCI_TMSF_SECOND(Position);
 track:=MCI_TMSF_TRACK(Position);
 Result:=IntToStr(track)+' - '+IntToStr(minutes)+':'+IntToStr(seconds);
end;

{$R *.dfm}

procedure TMainWindow.device_setup();
begin
 Self.CDPlayer.DeviceType:=dtCDAudio;
 Self.CDPlayer.TimeFormat:=tfTMSF;
 Self.CDPlayer.Visible:=False;
 Self.CDPlayer.Notify:=False;
 Self.CDPlayer.AutoOpen:=False;
 Self.CDPlayer.Open();
end;

procedure TMainWindow.window_setup();
begin
 Application.Title:='Easy CD player';
 Self.Caption:='Easy CD player 0.9.2';
 Self.Font.Assign(Screen.MenuFont);
 Self.Font.Size:= 14;
 Self.BorderStyle:=bsDialog;
end;

procedure TMainWindow.interface_setup();
begin
 Self.PlayButton.Caption:='Play';
 Self.PauseButton.Caption:='Pause';
 Self.NextButton.Caption:='Next';
 Self.BackButton.Caption:='Back';
 Self.EjectButton.Caption:='Eject';
 Self.MusicStatus.Caption:='';
end;

procedure TMainWindow.timer_setup();
begin
 Self.Timer.Interval:=1000;
 Self.Timer.Enabled:=false;
end;

procedure TMainWindow.setup();
begin
 Self.device_setup();
 Self.window_setup();
 Self.interface_setup();
 Self.timer_setup();
end;

procedure TMainWindow.PlayButtonClick(Sender: TObject);
begin
 Self.Timer.Enabled:=True;
 Self.CDPlayer.Play();
end;

procedure TMainWindow.PauseButtonClick(Sender: TObject);
begin
 Self.Timer.Enabled:=False;
 Self.CDPlayer.Pause();
end;

procedure TMainWindow.NextButtonClick(Sender: TObject);
begin
 Self.Timer.Enabled:=True;
 Self.CDPlayer.Next();
 Self.CDPlayer.Play();
end;

procedure TMainWindow.BackButtonClick(Sender: TObject);
begin
 Self.Timer.Enabled:=True;
 Self.CDPlayer.Previous();
 Self.CDPlayer.Play();
end;

procedure TMainWindow.EjectButtonClick(Sender: TObject);
begin
 Self.Timer.Enabled:=False;
 Self.CDPlayer.Stop();
 Self.CDPlayer.Eject();
 Self.MusicStatus.Caption:='';
end;

procedure TMainWindow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Self.CDPlayer.Stop();
 Self.CDPlayer.Close();
end;

procedure TMainWindow.FormCreate(Sender: TObject);
begin
 Self.setup();
end;

procedure TMainWindow.TimerTimer(Sender: TObject);
begin
 Self.MusicStatus.Caption:=show_music_status(Self.CDPlayer.Position);
end;

end.