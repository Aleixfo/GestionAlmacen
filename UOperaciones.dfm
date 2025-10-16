object FOperaciones: TFOperaciones
  Left = 0
  Top = 0
  Caption = 'Sistema de Operaciones'
  ClientHeight = 587
  ClientWidth = 708
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
    Width = 708
    Height = 587
    ActivePage = tsConfirmacion
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 713
    object tsSeleccionTipo: TTabSheet
      Caption = 'Selecci'#243'n'
      ExplicitWidth = 608
      ExplicitHeight = 418
      object pnlMain: TPanel
        Left = 0
        Top = 0
        Width = 700
        Height = 559
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 608
        ExplicitHeight = 418
        object gbxSeleccion: TGroupBox
          Left = 148
          Top = 154
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
          Top = 499
          Width = 700
          Height = 60
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitTop = 358
          ExplicitWidth = 608
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
      ExplicitWidth = 608
      ExplicitHeight = 418
      object pnlDatosMain: TPanel
        Left = 0
        Top = 0
        Width = 700
        Height = 559
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 608
        ExplicitHeight = 418
        object gbxDatosOperacion: TGroupBox
          Left = 90
          Top = 118
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
            TextHint = '-- Seleccione --'
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
          Top = 499
          Width = 700
          Height = 60
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitTop = 358
          ExplicitWidth = 608
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
      ExplicitWidth = 608
      ExplicitHeight = 418
      object pnlProductosMain: TPanel
        Left = 0
        Top = 0
        Width = 700
        Height = 559
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 608
        ExplicitHeight = 418
        object pnlIzquierda: TPanel
          Left = 0
          Top = 0
          Width = 300
          Height = 499
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitHeight = 358
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
              Columns = <
                item
                  Expanded = False
                  FieldName = 'id'
                  Title.Caption = 'ID'
                  Width = 32
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'codigo'
                  Title.Caption = 'C'#243'digo'
                  Width = 84
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nombre'
                  Title.Caption = 'Nombre'
                  Width = 84
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'precio_compra'
                  Title.Caption = 'Precio Com.'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'precio_venta'
                  Title.Caption = 'Precio Vent.'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'stock_actual'
                  Title.Caption = 'Stock'
                  Visible = True
                end>
            end
          end
          object gbxDetalleProducto: TGroupBox
            Left = 10
            Top = 359
            Width = 284
            Height = 138
            Caption = 'Detalles del Producto '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
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
              Width = 44
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
              Width = 4
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
            end
            object btnAgregarProducto: TButton
              Left = 195
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
        end
        object pnlDerecha: TPanel
          Left = 300
          Top = 0
          Width = 400
          Height = 499
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitLeft = 306
          ExplicitTop = -6
          ExplicitWidth = 465
          ExplicitHeight = 521
          object GroupBox1: TGroupBox
            Left = 6
            Top = 10
            Width = 387
            Height = 487
            Caption = 'Productos Agregados '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label1: TLabel
              Left = 120
              Top = 454
              Width = 64
              Height = 16
              Caption = 'Subtotal :'
            end
            object CRDBGrid1: TCRDBGrid
              Left = 15
              Top = 25
              Width = 354
              Height = 410
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
                  Title.Caption = 'ID'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nombre'
                  Title.Caption = 'Nombre'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'cantidad'
                  Title.Caption = 'Cantidad'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'precio'
                  Title.Caption = 'Precio'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'subtotal'
                  Title.Caption = 'Subtotal'
                  Width = 64
                  Visible = True
                end>
            end
            object btnQuitarProducto: TButton
              Left = 15
              Top = 449
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
              Top = 451
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
          Top = 499
          Width = 700
          Height = 60
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          ExplicitTop = 358
          ExplicitWidth = 608
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
    object tsConfirmacion: TTabSheet
      Caption = 'Confirmaci'#243'n'
      ImageIndex = 3
      ExplicitWidth = 705
      object pnlConfirmacionMain: TPanel
        Left = 0
        Top = 0
        Width = 700
        Height = 559
        Align = alClient
        BevelOuter = bvNone
        Caption = 'TGroupBox'
        TabOrder = 0
        ExplicitLeft = 264
        ExplicitTop = 256
        ExplicitWidth = 185
        ExplicitHeight = 41
        object gbxResumenCabecera: TGroupBox
          Left = 20
          Top = 20
          Width = 661
          Height = 141
          Caption = 'Datos de la operaci'#243'n '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object lblResumenTipoTexto: TLabel
            Left = 20
            Top = 30
            Width = 35
            Height = 16
            Caption = 'Tipo :'
          end
          object lblResumenProveedorClienteTexto: TLabel
            Left = 20
            Top = 55
            Width = 77
            Height = 16
            Caption = 'Proveedor :'
          end
          object lblResumenReferenciaTexto: TLabel
            Left = 370
            Top = 30
            Width = 79
            Height = 16
            Caption = 'Referencia :'
          end
          object lblResumenFechaTexto: TLabel
            Left = 370
            Top = 55
            Width = 46
            Height = 16
            Caption = 'Fecha :'
          end
          object lblResumenObservacionesTexto: TLabel
            Left = 20
            Top = 80
            Width = 104
            Height = 16
            Caption = 'Observaciones :'
          end
          object lblResumenTipo: TLabel
            Left = 130
            Top = 30
            Width = 53
            Height = 16
            Caption = '[VALUE]'
          end
          object lblResumenProveedorCliente: TLabel
            Left = 130
            Top = 55
            Width = 53
            Height = 16
            Caption = '[VALUE]'
          end
          object lblResumenReferencia: TLabel
            Left = 470
            Top = 30
            Width = 120
            Height = 16
            Caption = '[VALUE]'
          end
          object lblResumenFecha: TLabel
            Left = 470
            Top = 55
            Width = 53
            Height = 16
            Caption = '[VALUE]'
          end
          object lblResumenObservaciones: TLabel
            Left = 130
            Top = 80
            Width = 53
            Height = 16
            Caption = '[VALUE]'
          end
        end
        object gbxResumenDetalles: TGroupBox
          Left = 20
          Top = 167
          Width = 661
          Height = 229
          Caption = 'Detalles de Productos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object DBGridResumen: TDBGrid
            Left = 15
            Top = 25
            Width = 634
            Height = 184
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
                FieldName = 'nombre'
                Title.Caption = 'Nombre'
                Width = 124
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
                FieldName = 'precio'
                Title.Caption = 'Precio'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'subtotal'
                Title.Caption = 'Subtotal'
                Visible = True
              end>
          end
        end
        object gbxResumenTotales: TGroupBox
          Left = 20
          Top = 402
          Width = 665
          Height = 80
          Caption = 'Totales '
          Color = clBtnFace
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentColor = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          object lblSubtotalResumen: TLabel
            Left = 300
            Top = 20
            Width = 64
            Height = 16
            Caption = 'Subtotal :'
          end
          object lblTotalResumen: TLabel
            Left = 300
            Top = 50
            Width = 41
            Height = 16
            Caption = 'Total :'
          end
          object edtTotalResumen: TEdit
            Left = 370
            Top = 47
            Width = 100
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = '0.00'
          end
          object edtSubtotalResumen: TEdit
            Left = 370
            Top = 17
            Width = 100
            Height = 24
            TabOrder = 1
            Text = '0.00'
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 499
          Width = 700
          Height = 60
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 3
          ExplicitTop = 518
          object btnAtrasResumen: TButton
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
            OnClick = btnAtrasResumenClick
          end
          object btnConfirmarOperacion: TButton
            Left = 472
            Top = 15
            Width = 100
            Height = 30
            Caption = 'Confirmar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = btnConfirmarOperacionClick
          end
        end
      end
    end
  end
  object dsDetallesTemp: TDataSource
    DataSet = dm.tdetalles_temp
    Left = 32
    Top = 536
  end
end
