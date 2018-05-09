object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Demo form'
  ClientHeight = 271
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblItem: TLabel
    Left = 10
    Top = 13
    Width = 22
    Height = 13
    Caption = 'Item'
  end
  object edText: TMemo
    Left = 8
    Top = 39
    Width = 431
    Height = 232
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
  end
  object btnAdd: TButton
    Left = 167
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 1
    OnClick = btnAddClick
  end
  object edScape: TEdit
    Left = 47
    Top = 10
    Width = 34
    Height = 21
    MaxLength = 1
    TabOrder = 2
  end
  object edRepresentation: TEdit
    Left = 87
    Top = 10
    Width = 74
    Height = 21
    TabOrder = 3
  end
  object btnApply: TButton
    Left = 364
    Top = 8
    Width = 75
    Height = 25
    Align = alCustom
    Anchors = [akTop, akRight]
    Caption = 'Apply'
    TabOrder = 4
    OnClick = btnApplyClick
  end
end
