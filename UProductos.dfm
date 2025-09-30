object FProductos: TFProductos
  Left = 0
  Top = 0
  Caption = 'FProductos'
  ClientHeight = 433
  ClientWidth = 840
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
    Left = 152
    Top = 32
    Width = 240
    Height = 25
    DataSource = dm.dsproductos
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 176
    Top = 96
    Width = 185
    Height = 41
    Caption = 'Panel1'
    TabOrder = 1
  end
  object BtnNuevo: TButton
    Left = 112
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Nuevo'
    TabOrder = 2
    OnClick = BtnNuevoClick
  end
  object BtnEditar: TButton
    Left = 240
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 3
    OnClick = BtnEditarClick
  end
  object BtnEliminar: TButton
    Left = 376
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Eliminar'
    TabOrder = 4
    OnClick = BtnEliminarClick
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 240
    Width = 785
    Height = 177
    DataSource = dm.dsproductos
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
