object Form1: TForm1
  Left = 192
  Top = 107
  Caption = 'EASY CD PLAYER'
  ClientHeight = 194
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 8
    Top = 88
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object MediaPlayer1: TMediaPlayer
    Left = 8
    Top = 8
    Width = 253
    Height = 20
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 136
    Width = 81
    Height = 33
    Caption = 'Play'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 116
    Top = 136
    Width = 81
    Height = 33
    Caption = 'Pause'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 217
    Top = 136
    Width = 73
    Height = 33
    Caption = 'Next'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 313
    Top = 136
    Width = 73
    Height = 33
    Caption = 'Back'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 416
    Top = 136
    Width = 73
    Height = 33
    Caption = 'Eject'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 272
    Top = 8
  end
end
