object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 432
  ClientWidth = 635
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
    Left = 8
    Top = 8
    Width = 265
    Height = 129
    Hint = 'Gesti'#243'n de clientes'
    Caption = '&Clientes'
    TabOrder = 0
    OnClick = BtnClientesClick
  end
  object BtnProveedores: TButton
    Left = 8
    Top = 143
    Width = 265
    Height = 130
    Hint = 'Gesti'#243'n de proveedores'
    Caption = '&Proveedores'
    TabOrder = 1
    OnClick = BtnProveedoresClick
  end
  object BtnProductos: TButton
    Left = 360
    Top = 8
    Width = 265
    Height = 129
    Hint = 'Gesti'#243'n de productos'
    Caption = '&Productos'
    TabOrder = 2
    OnClick = BtnProductosClick
  end
  object BtnMovimientos: TButton
    Left = 8
    Top = 279
    Width = 265
    Height = 138
    Hint = 'Registro de movimientos'
    Caption = '&Movimientos'
    TabOrder = 3
    OnClick = BtnMovimientosClick
  end
  object btnPedidos: TButton
    Left = 360
    Top = 143
    Width = 265
    Height = 130
    Caption = '&Pedidos'
    TabOrder = 4
    OnClick = btnPedidosClick
  end
end
