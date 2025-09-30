object FProveedores: TFProveedores
  Left = 0
  Top = 0
  Caption = 'FProveedores'
  ClientHeight = 472
  ClientWidth = 844
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 96
    Top = 64
    Width = 240
    Height = 25
    DataSource = dm.dsproveedores
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 256
    Width = 793
    Height = 193
    DataSource = dm.dsproveedores
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 128
    Top = 112
    Width = 185
    Height = 41
    Caption = 'Panel1'
    TabOrder = 2
  end
  object BtnNuevo: TButton
    Left = 72
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Nuevo'
    TabOrder = 3
    OnClick = BtnNuevoClick
  end
  object BtnEditar: TButton
    Left = 176
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 4
    OnClick = BtnEditarClick
  end
  object BtnEliminar: TButton
    Left = 280
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Eliminar'
    TabOrder = 5
    OnClick = BtnEliminarClick
  end
end
