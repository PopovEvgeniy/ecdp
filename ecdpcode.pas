unit ecdpcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MPlayer, ExtCtrls, mmsystem;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    MediaPlayer1: TMediaPlayer;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure device_setup();
begin
 Form1.MediaPlayer1.Visible:=false;
 Form1.MediaPlayer1.DeviceType:=dtCDAudio;
 Form1.MediaPlayer1.TimeFormat:=tfTMSF;
 Form1.MediaPlayer1.Notify:=false;
 Form1.MediaPlayer1.AutoOpen:=false;
 Form1.MediaPlayer1.Open();
end;

procedure window_setup();
begin
 Application.Title:='EASY CD PLAYER';
 Form1.Caption:='EASY CD PLAYER 0.8.5';
 Form1.Font.Name:='Tahoma';
 Form1.Font.Size:= 14;
 Form1.BorderStyle:=bsDialog;
end;

procedure interface_setup();
begin
 Form1.Button1.Caption:='Play';
 Form1.Button2.Caption:='Pause';
 Form1.Button3.Caption:='Next';
 Form1.Button4.Caption:='Back';
 Form1.Button5.Caption:='Eject';
 Form1.Label1.Caption:='';
 Form1.Label2.Caption:='';
end;

procedure timer_setup();
begin
 Form1.Timer1.Interval:=1000;
 Form1.Timer1.Enabled:=false;
end;

procedure setup();
begin
 device_setup();
 window_setup();
 interface_setup();
 timer_setup();
end;

procedure show_track();
var track:LongWord;
begin
 track:=MCI_TMSF_TRACK(Form1.MediaPlayer1.Position);
 Form1.Label1.Caption:=IntToStr(track)+'\'+IntToStr(Form1.MediaPlayer1.Tracks);
end;

procedure show_time();
var minutes,seconds:LongWord;
begin
  minutes:=MCI_TMSF_MINUTE(Form1.MediaPlayer1.Position);
  seconds:=MCI_TMSF_SECOND(Form1.MediaPlayer1.Position);
  Form1.Label2.Caption:=IntToStr(minutes)+':'+IntToStr(seconds);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Form1.Timer1.Enabled:=True;
 Form1.MediaPlayer1.Play();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 Form1.Timer1.Enabled:=False;
 Form1.MediaPlayer1.Pause();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 Form1.Timer1.Enabled:=True;
 Form1.MediaPlayer1.Next();
 Form1.MediaPlayer1.Play();
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 Form1.Timer1.Enabled:=True;
 Form1.MediaPlayer1.Previous();
 Form1.MediaPlayer1.Play();
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 Form1.Timer1.Enabled:=False;
 Form1.MediaPlayer1.Stop();
 Form1.MediaPlayer1.Eject();
 Form1.Label1.Caption:='';
 Form1.Label2.Caption:='';
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Form1.MediaPlayer1.Stop();
 Form1.MediaPlayer1.Close();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 setup();
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 show_track();
 show_time();
end;

end.