//---------------------------------------------------------------------------

#include <vcl.h>
#include <mmsystem.h>
#pragma hdrstop
#include "ecdpcode.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;

void device_setup()
{
 Form1->MediaPlayer1->Visible=false;
 Form1->MediaPlayer1->DeviceType=dtCDAudio;
 Form1->MediaPlayer1->TimeFormat=tfTMSF;
 Form1->MediaPlayer1->Notify=false;
 Form1->MediaPlayer1->AutoOpen=false;
 Form1->MediaPlayer1->Open();
}

void window_setup()
{
 Form1->Font->Name="Tahoma";
 Form1->Font->Size=14;
 Form1->BorderStyle=bsDialog;
}

void interface_setup()
{
 Form1->Caption="EASY CD PLAYER 0.8.2";
 Form1->Button1->Caption="Play";
 Form1->Button2->Caption="Pause";
 Form1->Button3->Caption="Next";
 Form1->Button4->Caption="Back";
 Form1->Button5->Caption="Eject";
 Form1->Label1->Caption="Tape:";
 Form1->Label5->Caption="Elapsed time:";
}

void label_setup()
{
 Form1->Label3->Caption="/";
 Form1->Label2->Caption=" ";
 Form1->Label4->Caption=" ";
 Form1->Label7->Caption=":";
 Form1->Label6->Caption=" ";
 Form1->Label8->Caption=" ";
}

void timer_setup()
{
 Form1->Timer1->Interval=1000;
 Form1->Timer1->Enabled=false;
}

void setup()
{
 device_setup();
 window_setup();
 interface_setup();
 label_setup();
 timer_setup();
}

void show_track()
{
 unsigned long int track;
 track=MCI_TMSF_TRACK(Form1->MediaPlayer1->Position);
 Form1->Label2->Caption=IntToStr(track);
 Form1->Label4->Caption=IntToStr(Form1->MediaPlayer1->Tracks);
}

void show_time()
{
  unsigned long int current;
  current=MCI_TMSF_MINUTE(Form1->MediaPlayer1->Position);
  Form1->Label6->Caption=IntToStr(current);
  current=MCI_TMSF_SECOND(Form1->MediaPlayer1->Position);
  Form1->Label8->Caption=IntToStr(current);
}

void do_play()
{
 Form1->Timer1->Enabled=true;
 Form1->MediaPlayer1->Play();
}

void do_pause()
{
 Form1->Timer1->Enabled=false;
 Form1->MediaPlayer1->Pause();
}

void do_eject()
{
 Form1->Timer1->Enabled=false;
 Form1->MediaPlayer1->Stop();
 Form1->MediaPlayer1->Eject();
}

void go_next()
{
 Form1->Timer1->Enabled=true;
 Form1->MediaPlayer1->Next();
 Form1->MediaPlayer1->Play();
}

void go_back()
{
 Form1->Timer1->Enabled=true;
 Form1->MediaPlayer1->Previous();
 Form1->MediaPlayer1->Previous();
 Form1->MediaPlayer1->Play();
}

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
		: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
 setup();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
 do_play();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
 do_pause();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button3Click(TObject *Sender)
{
 go_next();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button4Click(TObject *Sender)
{
 go_back();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button5Click(TObject *Sender)
{
 do_eject();
 label_setup();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
 MediaPlayer1->Stop();
 MediaPlayer1->Close();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
 show_track();
 show_time();
}
//---------------------------------------------------------------------------