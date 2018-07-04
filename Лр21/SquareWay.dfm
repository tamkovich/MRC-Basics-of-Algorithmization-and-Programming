object Form1: TForm1
  Left = 298
  Top = 199
  Width = 925
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClick = FormClick
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PoleGrid: TStringGrid
    Left = 216
    Top = 56
    Width = 305
    Height = 305
    ColCount = 12
    DefaultColWidth = 24
    FixedCols = 0
    RowCount = 12
    FixedRows = 0
    TabOrder = 0
    OnDrawCell = PoleGridDrawCell
  end
  object vvod: TBitBtn
    Left = 72
    Top = 72
    Width = 75
    Height = 25
    Caption = #1042#1042#1054#1044
    TabOrder = 1
    OnClick = vvodClick
  end
  object proiti: TBitBtn
    Left = 72
    Top = 120
    Width = 75
    Height = 25
    Caption = #1055#1056#1054#1049#1058#1048
    TabOrder = 2
    OnClick = proitiClick
  end
  object CloseBtn: TBitBtn
    Left = 72
    Top = 216
    Width = 75
    Height = 25
    Caption = #1042#1067#1061#1054#1044
    TabOrder = 3
    OnClick = CloseBtnClick
  end
  object Edit1: TEdit
    Left = 600
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 600
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Edit2'
  end
  object GenPole: TButton
    Left = 72
    Top = 168
    Width = 75
    Height = 25
    Caption = #1043#1045#1053#1045#1056#1040#1062#1048#1071
    TabOrder = 6
    OnClick = GenPoleClick
  end
end
