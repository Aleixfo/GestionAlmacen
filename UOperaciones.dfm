object FOperaciones: TFOperaciones
  Left = 0
  Top = 0
  Caption = 'Sistema de Operaciones'
  ClientHeight = 446
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcOperaciones: TPageControl
    Left = 0
    Top = 0
    Width = 616
    Height = 446
    ActivePage = tsAgregarProductos
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 600
    ExplicitHeight = 400
    object tsSeleccionTipo: TTabSheet
      Caption = 'Selecci'#243'n'
      ExplicitWidth = 592
      ExplicitHeight = 372
      object pnlMain: TPanel
        Left = 0
        Top = 0
        Width = 608
        Height = 418
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 592
        ExplicitHeight = 372
        object gbxSeleccion: TGroupBox
          Left = 100
          Top = 50
          Width = 392
          Height = 200
          Caption = 'Seleccione el tipo de operaci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object rgTipoOperacion: TRadioGroup
            Left = 20
            Top = 30
            Width = 352
            Height = 155
            Columns = 2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -14
            Font.Name = 'Tahoma'
            Font.Style = []
            Items.Strings = (
              'COMPRA'
              'VENTA')
            ParentFont = False
            TabOrder = 0
          end
        end
        object pnlBotones: TPanel
          Left = 0
          Top = 358
          Width = 608
          Height = 60
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitTop = 312
          ExplicitWidth = 592
          object btnContinuar: TButton
            Left = 472
            Top = 15
            Width = 100
            Height = 30
            Caption = 'Continuar '#8594
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = btnContinuarClick
          end
        end
      end
    end
    object tsDatosOperacion: TTabSheet
      Caption = 'Datos Operaci'#243'n'
      ImageIndex = 1
      ExplicitWidth = 592
      ExplicitHeight = 372
      object pnlDatosMain: TPanel
        Left = 0
        Top = 0
        Width = 608
        Height = 418
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        ExplicitLeft = 208
        ExplicitTop = 168
        ExplicitWidth = 185
        ExplicitHeight = 41
        object gbxDatosOperacion: TGroupBox
          Left = 50
          Top = 30
          Width = 492
          Height = 280
          Caption = 'Datos de la Operaci'#243'n '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object lblProveedorCliente: TLabel
            Left = 40
            Top = 50
            Width = 129
            Height = 16
            Caption = 'Proveedor/Cliente :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblFecha: TLabel
            Left = 40
            Top = 90
            Width = 46
            Height = 16
            Caption = 'Fecha :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblReferencia: TLabel
            Left = 40
            Top = 130
            Width = 79
            Height = 16
            Caption = 'Referencia :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblObservaciones: TLabel
            Left = 40
            Top = 170
            Width = 104
            Height = 16
            Caption = 'Observaciones :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cbxProveedorCliente: TComboBox
            Left = 180
            Top = 47
            Width = 250
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = 'cbxProveedorCliente'
          end
          object dtpFecha: TDateTimePicker
            Left = 180
            Top = 87
            Width = 150
            Height = 24
            Date = 45945.000000000000000000
            Time = 0.463598495371115900
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object edtReferencia: TEdit
            Left = 180
            Top = 127
            Width = 250
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            Text = 'edtReferencia'
          end
          object memObservaciones: TMemo
            Left = 180
            Top = 167
            Width = 250
            Height = 80
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 3
          end
        end
        object pnlBotonesDatos: TPanel
          Left = 0
          Top = 358
          Width = 608
          Height = 60
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitTop = 312
          ExplicitWidth = 592
          object btnAtras: TButton
            Left = 362
            Top = 15
            Width = 100
            Height = 30
            Caption = 'Atras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = btnAtrasClick
          end
          object btnSiguienteDatos: TButton
            Left = 468
            Top = 15
            Width = 100
            Height = 30
            Caption = 'Continuar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = btnSiguienteDatosClick
          end
        end
      end
    end
    object tsAgregarProductos: TTabSheet
      Caption = 'Productos'
      ImageIndex = 2
      ExplicitWidth = 592
      ExplicitHeight = 372
      object pnlProductosMain: TPanel
        Left = 0
        Top = 0
        Width = 608
        Height = 418
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 208
        ExplicitTop = 168
        ExplicitWidth = 185
        ExplicitHeight = 41
        object pnlIzquierda: TPanel
          Left = 0
          Top = 0
          Width = 300
          Height = 358
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitHeight = 312
          object gbxBuscarProductos: TGroupBox
            Left = 10
            Top = 10
            Width = 280
            Height = 335
            Caption = 'Buscar Productos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object lblBuscarProducto: TLabel
              Left = 15
              Top = 30
              Width = 47
              Height = 16
              Caption = 'Buscar :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtBuscarProducto: TEdit
              Left = 15
              Top = 52
              Width = 180
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = 'edtBuscarProducto'
              TextHint = 'Nombre del producto ...'
            end
            object btnBuscarProducto: TButton
              Left = 205
              Top = 52
              Width = 60
              Height = 24
              Caption = #55357#56589
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = btnBuscarProductoClick
            end
            object DBGrid1: TDBGrid
              Left = 15
              Top = 90
              Width = 250
              Height = 231
              DataSource = dm.dsproductos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = [fsBold]
              OnCellClick = DBGrid1CellClick
            end
          end
        end
        object pnlDerecha: TPanel
          Left = 300
          Top = 0
          Width = 308
          Height = 358
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitLeft = 208
          ExplicitWidth = 292
          ExplicitHeight = 312
          object gbxDetalleProducto: TGroupBox
            Left = 10
            Top = 10
            Width = 270
            Height = 140
            Caption = 'Detalles del Producto '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object lblProductoSeleccionado: TLabel
              Left = 15
              Top = 30
              Width = 59
              Height = 16
              Caption = 'Producto :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblCantidad: TLabel
              Left = 15
              Top = 70
              Width = 59
              Height = 16
              Caption = 'Cantidad :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblPrecio: TLabel
              Left = 15
              Top = 110
              Width = 43
              Height = 16
              Caption = 'Precio :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblNombreProducto: TLabel
              Left = 100
              Top = 30
              Width = 150
              Height = 16
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtCantidad: TEdit
              Left = 100
              Top = 67
              Width = 80
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = '1'
              OnChange = edtCantidadChange
            end
            object edtPrecio: TEdit
              Left = 100
              Top = 107
              Width = 80
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              Text = 'edtPrecio'
            end
            object btnAgregarProducto: TButton
              Left = 190
              Top = 67
              Width = 70
              Height = 64
              Caption = 'Agregar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = btnAgregarProductoClick
            end
          end
          object GroupBox1: TGroupBox
            Left = 10
            Top = 160
            Width = 270
            Height = 185
            Caption = 'Productos Agregados '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label1: TLabel
              Left = 120
              Top = 150
              Width = 64
              Height = 16
              Caption = 'Subtotal :'
            end
            object CRDBGrid1: TCRDBGrid
              Left = 15
              Top = 25
              Width = 242
              Height = 104
              DataSource = dsDetallesTemp
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'producto_id'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nombre'
                  Width = 304
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cantidad'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'precio'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'subtotal'
                  Width = 64
                  Visible = True
                end>
            end
            object btnQuitarProducto: TButton
              Left = 15
              Top = 145
              Width = 70
              Height = 25
              Caption = 'Quitar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = btnQuitarProductoClick
            end
            object edtSubtotal: TEdit
              Left = 180
              Top = 147
              Width = 77
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              Text = '0.00'
            end
          end
        end
        object pnlBotonesProductos: TPanel
          Left = 0
          Top = 358
          Width = 608
          Height = 60
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          ExplicitTop = 312
          ExplicitWidth = 592
          object btnAtrasProductos: TButton
            Left = 362
            Top = 15
            Width = 100
            Height = 30
            Caption = 'Atras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = btnAtrasProductosClick
          end
          object btnSiguienteProductos: TButton
            Left = 472
            Top = 15
            Width = 100
            Height = 30
            Caption = 'Continuar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = btnSiguienteProductosClick
          end
        end
      end
    end
  end
  object dsDetallesTemp: TDataSource
    DataSet = dm.tdetalles_temp
    Left = 64
    Top = 512
  end
end
