object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 499
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object edtUser: TEdit
    Left = 24
    Top = 96
    Width = 161
    Height = 21
    TabOrder = 0
  end
  object edtPassword: TEdit
    Left = 24
    Top = 123
    Width = 161
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object edtTo: TEdit
    Left = 24
    Top = 168
    Width = 161
    Height = 21
    TabOrder = 2
  end
  object edtSubject: TEdit
    Left = 24
    Top = 195
    Width = 161
    Height = 21
    TabOrder = 3
    Text = 'Este '#233' um teste'
  end
  object mBody: TMemo
    Left = 8
    Top = 283
    Width = 353
    Height = 177
    Lines.Strings = (
      'Corpo da mensagem')
    TabOrder = 4
  end
  object Button1: TButton
    Left = 8
    Top = 466
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
    OnClick = Button1Click
  end
  object rgHost: TRadioGroup
    Left = 24
    Top = 28
    Width = 234
    Height = 53
    Caption = 'rgHost'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'GMAIL'
      'OUTLOOK')
    TabOrder = 6
  end
  object Button2: TButton
    Left = 232
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Config1'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 232
    Top = 152
    Width = 75
    Height = 25
    Caption = 'config2'
    TabOrder = 8
    OnClick = Button3Click
  end
  object edtAnexo: TEdit
    Left = 24
    Top = 237
    Width = 337
    Height = 21
    TabOrder = 9
    Text = 'file.png'
  end
end
