object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 379
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
    Left = 8
    Top = 24
    Width = 161
    Height = 21
    TabOrder = 0
    Text = 'alissonsp05@gmail.com'
  end
  object edtPassword: TEdit
    Left = 8
    Top = 51
    Width = 161
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = 'ali1236SP'
  end
  object edtTo: TEdit
    Left = 8
    Top = 96
    Width = 161
    Height = 21
    TabOrder = 2
    Text = 'alisson_sp12@hotmail.com'
  end
  object edtSubject: TEdit
    Left = 8
    Top = 123
    Width = 161
    Height = 21
    TabOrder = 3
    Text = 'Este '#233' um teste'
  end
  object mBody: TMemo
    Left = 8
    Top = 160
    Width = 353
    Height = 177
    Lines.Strings = (
      'Corpo da mensagem')
    TabOrder = 4
  end
  object Button1: TButton
    Left = 8
    Top = 346
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
    OnClick = Button1Click
  end
end
