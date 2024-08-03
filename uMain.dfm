object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
  ClientHeight = 315
  ClientWidth = 237
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object btnStart: TButton
    Left = 24
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = btnStartClick
  end
  object mmConsole: TMemo
    Left = 24
    Top = 8
    Width = 187
    Height = 222
    ScrollBars = ssVertical
    TabOrder = 1
    OnClick = mmConsoleClick
  end
  object btnStop: TButton
    Left = 136
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Stop'
    Enabled = False
    TabOrder = 2
    OnClick = btnStopClick
  end
  object chkIsModal: TCheckBox
    Left = 24
    Top = 236
    Width = 97
    Height = 17
    Caption = 'Mostrar modal'
    TabOrder = 3
  end
end
