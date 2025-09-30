object FClientes: TFClientes
  Left = 0
  Top = 0
  Caption = 'Gesti'#243'n de Clientes'
  ClientHeight = 452
  ClientWidth = 872
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
  object DBGrid1: TDBGrid
    Left = 400
    Top = 24
    Width = 449
    Height = 401
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 72
    Top = 24
    Width = 240
    Height = 25
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 96
    Top = 88
    Width = 185
    Height = 41
    Caption = 'Panel1'
    TabOrder = 2
  end
  object BtnNuevo: TButton
    Left = 56
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Nuevo'
    TabOrder = 3
    OnClick = BtnNuevoClick
  end
  object BtnEditar: TButton
    Left = 160
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 4
    OnClick = BtnEditarClick
  end
  object BtnEliminar: TButton
    Left = 256
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Eliminar'
    TabOrder = 5
    OnClick = BtnEliminarClick
  end
end
