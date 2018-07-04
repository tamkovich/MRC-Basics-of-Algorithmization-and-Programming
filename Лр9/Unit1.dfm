object Form1: TForm1
  Left = 196
  Top = 251
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
    Left = 16
    Top = 24
    Width = 171
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1086#1094#1077#1085#1086#1082' '#1085#1072' '#1087#1088#1077#1076#1084#1077#1090' = '
  end
  object Label2: TLabel
    Left = 64
    Top = 56
    Width = 120
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1086' '#1087#1088#1077#1076#1084#1077#1090#1086#1074' ='
  end
  object Label3: TLabel
    Left = 192
    Top = 208
    Width = 242
    Height = 13
    Caption = #1055#1088#1077#1076#1084#1077#1090#1099' , '#1087#1086' '#1082#1086#1090#1086#1088#1099#1084' '#1077#1089#1090#1100' '#1085#1091#1083#1077#1074#1099#1077' '#1086#1094#1077#1085#1082#1080' : '
  end
  object Button1: TButton
    Left = 704
    Top = 48
    Width = 105
    Height = 25
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 704
    Top = 96
    Width = 105
    Height = 25
    Caption = #1040#1085#1072#1083#1080#1079#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = Button2Click
  end
  object BitBtn1: TBitBtn
    Left = 704
    Top = 144
    Width = 105
    Height = 25
    TabOrder = 2
    Kind = bkClose
  end
  object StringGrid1: TStringGrid
    Left = 184
    Top = 80
    Width = 320
    Height = 120
    GridLineWidth = 4
    TabOrder = 3
  end
  object StringGrid2: TStringGrid
    Left = 184
    Top = 232
    Width = 409
    Height = 33
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Left = 728
    Top = 240
  end
end
