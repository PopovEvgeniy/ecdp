object MainWindow: TMainWindow
  Left = 192
  Top = 107
  Caption = 'Easy CD player'
  ClientHeight = 133
  ClientWidth = 454
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
  object MusicStatus: TLabel
    Left = 8
    Top = 48
    Width = 58
    Height = 13
    Caption = 'MusicStatus'
  end
  object CDPlayer: TMediaPlayer
    Left = 8
    Top = 8
    Width = 253
    Height = 20
    TabOrder = 0
  end
  object PlayButton: TButton
    Left = 8
    Top = 88
    Width = 81
    Height = 33
    Caption = 'Play'
    TabOrder = 1
    OnClick = PlayButtonClick
  end
  object PauseButton: TButton
    Left = 95
    Top = 88
    Width = 81
    Height = 33
    Caption = 'Pause'
    TabOrder = 2
    OnClick = PauseButtonClick
  end
  object NextButton: TButton
    Left = 182
    Top = 88
    Width = 73
    Height = 33
    Caption = 'Next'
    TabOrder = 3
    OnClick = NextButtonClick
  end
  object BackButton: TButton
    Left = 261
    Top = 88
    Width = 73
    Height = 33
    Caption = 'Back'
    TabOrder = 4
    OnClick = BackButtonClick
  end
  object EjectButton: TButton
    Left = 340
    Top = 88
    Width = 73
    Height = 33
    Caption = 'Eject'
    TabOrder = 5
    OnClick = EjectButtonClick
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 272
    Top = 8
  end
end
