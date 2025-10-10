object FPedidos: TFPedidos
  Left = 0
  Top = 0
  Caption = 'FPedidos'
  ClientHeight = 495
  ClientWidth = 819
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
    Width = 819
    Height = 495
    Margins.Top = 10
    Align = alClient
    TabOrder = 0
    object grdMovimientos: TDBGrid
      Left = 255
      Top = 14
      Width = 546
      Height = 467
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
        end>
    end
    object pnlFiltros: TPanel
      Left = 16
      Top = 13
      Width = 233
      Height = 193
      TabOrder = 1
      object gbxFiltros: TGroupBox
        Left = 1
        Top = 1
        Width = 231
        Height = 191
        Margins.Left = 30
        Margins.Top = 30
        Margins.Right = 30
        Margins.Bottom = 30
        Align = alClient
        Padding.Left = 30
        Padding.Bottom = 30
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
          Top = 80
          Width = 61
          Height = 13
          Caption = 'Proveedores'
        end
        object btnLimpiar: TButton
          Left = 24
          Top = 142
          Width = 185
          Height = 25
          Caption = 'Limpiar filtros'
          TabOrder = 0
          OnClick = btnLimpiarClick
        end
        object cbxClientes: TComboBox
          Left = 23
          Top = 43
          Width = 186
          Height = 21
          TabOrder = 1
          Text = 'Selecciona un cliente...'
          OnChange = cbxClientesChange
        end
        object cbxProveedores: TComboBox
          Left = 24
          Top = 99
          Width = 185
          Height = 21
          TabOrder = 2
          Text = 'Selecciona un proveedor...'
          OnChange = cbxProveedoresChange
        end
      end
    end
    object pnlListBox: TPanel
      Left = 16
      Top = 212
      Width = 233
      Height = 269
      TabOrder = 2
      object lblReferencias: TLabel
        Left = 16
        Top = 245
        Width = 52
        Height = 13
        Caption = 'N'#186' Pedidos'
      end
      object ListBox1: TListBox
        Left = 16
        Top = 38
        Width = 201
        Height = 201
        ItemHeight = 13
        TabOrder = 0
        OnClick = ListBox1Click
      end
      object editBuscar: TEdit
        Left = 16
        Top = 11
        Width = 201
        Height = 21
        TabOrder = 1
        Text = 'Buscar'
        OnChange = editBuscarChange
      end
    end
  end
end
