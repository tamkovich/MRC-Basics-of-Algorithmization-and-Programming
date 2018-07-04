object Form1: TForm1
  Left = 191
  Top = 210
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 368
    Top = 40
    Width = 101
    Height = 13
    Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1084#1072#1089#1089#1080#1074' : '
  end
  object Label2: TLabel
    Left = 240
    Top = 160
    Width = 153
    Height = 13
    Caption = #1055#1086#1074#1090#1086#1088#1103#1102#1097#1080#1077#1089#1103' '#1101#1083#1083#1077#1084#1077#1085#1090#1099' : '
  end
  object Button1: TButton
    Left = 48
    Top = 88
    Width = 131
    Height = 25
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 48
    Top = 160
    Width = 131
    Height = 25
    Caption = #1053#1072#1081#1090#1080' '#1087#1086#1074#1090#1086#1088#1103#1102#1097#1080#1077#1089#1103
    TabOrder = 1
    OnClick = Button2Click
  end
  object BitBtn1: TBitBtn
    Left = 48
    Top = 240
    Width = 131
    Height = 25
    TabOrder = 2
    Kind = bkClose
  end
  object StringGrid1: TStringGrid
    Left = 232
    Top = 64
    Width = 337
    Height = 73
    FixedCols = 0
    RowCount = 2
    TabOrder = 3
  end
  object StringGrid2: TStringGrid
    Left = 232
    Top = 192
    Width = 337
    Height = 73
    FixedCols = 0
    RowCount = 2
    TabOrder = 4
    ColWidths = (
      64
      65
      64
      64
      64)
  end
  object OpenDialog1: TOpenDialog
    Left = 48
    Top = 336
  end
end
