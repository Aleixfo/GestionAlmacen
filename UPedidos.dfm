object FPedidos: TFPedidos
  Left = 0
  Top = 0
  Caption = 'FPedidos'
  ClientHeight = 495
  ClientWidth = 825
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
  object pnlGeneral: TPanel
    Left = 0
    Top = 0
    Width = 825
    Height = 495
    Align = alClient
    TabOrder = 0
    ExplicitTop = 8
    object grdMovimientos: TDBGrid
      Left = 24
      Top = 288
      Width = 785
      Height = 193
      DataSource = dm.dsDetallePedido
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Caption = 'C'#243'digo'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'producto'
          Title.Caption = 'Producto'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cantidad'
          Title.Caption = 'Cantidad'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo_movimiento'
          Title.Caption = 'Compra/Venta'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'precio_compra'
          Title.Caption = 'Precio Compra'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'precio_venta'
          Title.Caption = 'Precio Venta'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total_linea'
          Title.Caption = 'Total Mov.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'proveedor'
          Title.Caption = 'Proveedor'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cliente'
          Title.Caption = 'Cliente'
          Width = 100
          Visible = True
        end>
    end
    object pnlFiltros: TPanel
      Left = 24
      Top = 16
      Width = 345
      Height = 225
      TabOrder = 1
      object gbxFiltros: TGroupBox
        Left = 16
        Top = 8
        Width = 313
        Height = 201
        Caption = 'gbxFiltros'
        TabOrder = 0
        object lblCliente: TLabel
          Left = 24
          Top = 24
          Width = 38
          Height = 13
          Caption = 'Clientes'
        end
        object lblProveedor: TLabel
          Left = 24
          Top = 92
          Width = 50
          Height = 13
          Caption = 'Proveedor'
        end
        object btnFiltrar: TButton
          Left = 24
          Top = 160
          Width = 75
          Height = 25
          Caption = 'Filtrar'
          TabOrder = 0
          OnClick = btnFiltrarClick
        end
        object btnLimpiar: TButton
          Left = 214
          Top = 160
          Width = 75
          Height = 25
          Caption = 'Limpiar'
          TabOrder = 1
          OnClick = btnLimpiarClick
        end
        object cbxClientes: TComboBox
          Left = 112
          Top = 21
          Width = 177
          Height = 21
          TabOrder = 2
          Text = 'Selecciona un cliente...'
          OnChange = cbxClientesChange
        end
        object cbxProveedores: TComboBox
          Left = 112
          Top = 89
          Width = 177
          Height = 21
          TabOrder = 3
          Text = 'Selecciona un proveedor...'
          OnChange = cbxProveedoresChange
        end
      end
    end
  end
  object cbxReferencias: TComboBox
    Left = 24
    Top = 261
    Width = 161
    Height = 21
    TabOrder = 1
    Text = 'Selecciona una referencia...'
    OnChange = cbxReferenciasChange
  end
end
