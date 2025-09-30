object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BtnClientes: TButton
    Left = 168
    Top = 112
    Width = 75
    Height = 25
    Hint = 'Gesti'#243'n de clientes'
    Caption = '&Clientes'
    TabOrder = 0
    OnClick = BtnClientesClick
  end
  object BtnProveedores: TButton
    Left = 352
    Top = 112
    Width = 75
    Height = 25
    Hint = 'Gesti'#243'n de proveedores'
    Caption = '&Proveedores'
    TabOrder = 1
    OnClick = BtnProveedoresClick
  end
  object BtnProductos: TButton
    Left = 168
    Top = 184
    Width = 75
    Height = 25
    Hint = 'Gesti'#243'n de productos'
    Caption = '&Productos'
    TabOrder = 2
    OnClick = BtnProductosClick
  end
  object BtnMovimientos: TButton
    Left = 352
    Top = 184
    Width = 75
    Height = 25
    Hint = 'Registro de movimientos'
    Caption = '&Movimientos'
    TabOrder = 3
    OnClick = BtnMovimientosClick
  end
end
