object Form1: TForm1
  Left = 321
  Top = 189
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 136
    Top = 56
    Width = 160
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1074' '#1084#1072#1089#1089#1080#1074#1077' = '
  end
  object Label2: TLabel
    Left = 232
    Top = 120
    Width = 106
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1077' '#1084#1072#1089#1089#1080#1074#1099
  end
  object Label3: TLabel
    Left = 664
    Top = 120
    Width = 52
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
  end
  object Edit1: TEdit
    Left = 304
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1Change
  end
  object StringGrid1: TStringGrid
    Left = 216
    Top = 152
    Width = 137
    Height = 169
    ColCount = 2
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 1
    OnKeyPress = StringGrid1Click
  end
  object StringGrid2: TStringGrid
    Left = 616
    Top = 152
    Width = 137
    Height = 169
    ColCount = 2
    FixedCols = 0
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 248
    Top = 376
    Width = 75
    Height = 25
    Caption = '&'#1042#1099#1093#1086#1076
    TabOrder = 3
    Kind = bkClose
  end
  object Button1: TButton
    Left = 648
    Top = 384
    Width = 75
    Height = 25
    Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
    TabOrder = 4
    OnClick = Button1Click
  end
end
