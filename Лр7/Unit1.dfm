object Form1: TForm1
  Left = 114
  Top = 153
  Width = 438
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 248
    Width = 105
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1095#1077#1090#1085#1099#1093' '#1087#1072#1088' = '
  end
  object Label2: TLabel
    Left = 56
    Top = 88
    Width = 151
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1084#1072#1089#1089#1080#1074#1072' = '
  end
  object Button1: TButton
    Left = 56
    Top = 8
    Width = 153
    Height = 25
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1084#1072#1089#1089#1080#1074#1072' '#1040
    TabOrder = 0
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 288
    Top = 48
    Width = 113
    Height = 25
    TabOrder = 1
    Kind = bkClose
  end
  object StringGrid1: TStringGrid
    Left = 56
    Top = 112
    Width = 336
    Height = 120
    RowCount = 3
    TabOrder = 2
  end
  object Button2: TButton
    Left = 288
    Top = 8
    Width = 113
    Height = 25
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 56
    Top = 48
    Width = 153
    Height = 25
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1084#1072#1089#1089#1080#1074#1072' '#1042
    TabOrder = 4
    OnClick = Button3Click
  end
  object OpenDialog1: TOpenDialog
    Left = 368
    Top = 248
  end
end
