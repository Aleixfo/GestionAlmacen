object FProductos: TFProductos
  Left = 0
  Top = 0
  Caption = 'FProductos'
  ClientHeight = 524
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 524
    Align = alClient
    TabOrder = 0
    object pnlBotones: TPanel
      Left = 1
      Top = 225
      Width = 702
      Height = 47
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 17
      ExplicitTop = 220
      object lblBuscarID: TLabel
        Left = 28
        Top = 18
        Width = 72
        Height = 13
        Caption = 'Buscar por ID :'
      end
      object lblBuscarNombre: TLabel
        Left = 256
        Top = 18
        Width = 97
        Height = 13
        Caption = 'Buscar por nombre :'
      end
      object btnBuscar: TButton
        Left = 507
        Top = 12
        Width = 75
        Height = 25
        Caption = 'Buscar'
        TabOrder = 0
        OnClick = btnBuscarClick
      end
      object btnLimpiarFiltros: TButton
        Left = 588
        Top = 12
        Width = 75
        Height = 25
        Caption = 'Limpiar'
        TabOrder = 1
        OnClick = btnLimpiarFiltrosClick
      end
      object edtBuscarID: TEdit
        Left = 106
        Top = 15
        Width = 121
        Height = 21
        TabOrder = 2
        OnKeyPress = edtBuscarIDKeyPress
      end
      object edtBuscarNombre: TEdit
        Left = 359
        Top = 15
        Width = 121
        Height = 21
        TabOrder = 3
        OnKeyPress = edtBuscarNombreKeyPress
      end
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 272
      Width = 702
      Height = 251
      Align = alBottom
      TabOrder = 1
      object grdProductos: TDBGrid
        Left = 1
        Top = 1
        Width = 700
        Height = 249
        Align = alClient
        DataSource = dm.dsproductos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codigo'
            Title.Caption = 'C'#243'digo'
            Width = 60
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
            FieldName = 'stock_actual'
            Title.Caption = 'Stock'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'activo'
            Title.Caption = 'Activo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fecha_alta'
            Title.Caption = 'Fecha Alta'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fecha_actualizacion'
            Title.Caption = 'Fecha Ult. Act.'
            Visible = True
          end>
      end
    end
    object pnlDatos: TPanel
      Left = 1
      Top = 1
      Width = 702
      Height = 224
      Align = alTop
      TabOrder = 2
      ExplicitTop = 3
      object lblPrecioCompra: TLabel
        Left = 222
        Top = 24
        Width = 76
        Height = 13
        Caption = 'Precio Compra :'
      end
      object lblPrecioVenta: TLabel
        Left = 231
        Top = 64
        Width = 67
        Height = 13
        Caption = 'Precio Venta :'
      end
      object lblStock: TLabel
        Left = 231
        Top = 104
        Width = 66
        Height = 13
        Caption = 'Stock Actual :'
      end
      object lblActivo: TLabel
        Left = 499
        Top = 116
        Width = 37
        Height = 13
        Caption = 'Activo :'
      end
      object lblFechaAlta: TLabel
        Left = 478
        Top = 24
        Width = 58
        Height = 13
        Caption = 'Fecha Alta :'
      end
      object lblFechaMod: TLabel
        Left = 435
        Top = 64
        Width = 101
        Height = 13
        Caption = 'Fecha Actualizaci'#243'n :'
      end
      object lblID: TLabel
        Left = 54
        Top = 24
        Width = 18
        Height = 13
        Caption = 'ID :'
      end
      object lblCodigo: TLabel
        Left = 32
        Top = 64
        Width = 40
        Height = 13
        Caption = 'C'#243'digo :'
      end
      object lblNombre: TLabel
        Left = 28
        Top = 104
        Width = 44
        Height = 13
        Caption = 'Nombre :'
      end
      object lblObservaciones: TLabel
        Left = 32
        Top = 136
        Width = 61
        Height = 13
        Caption = 'Descripci'#243'n :'
      end
      object dbeID: TDBEdit
        Left = 78
        Top = 21
        Width = 121
        Height = 21
        DataField = 'id'
        DataSource = dm.dsproductos
        ReadOnly = True
        TabOrder = 0
      end
      object dbeCodigo: TDBEdit
        Left = 78
        Top = 61
        Width = 121
        Height = 21
        DataField = 'codigo'
        DataSource = dm.dsproductos
        TabOrder = 1
      end
      object dbeNombre: TDBEdit
        Left = 78
        Top = 101
        Width = 121
        Height = 21
        DataField = 'nombre'
        DataSource = dm.dsproductos
        TabOrder = 2
      end
      object dbePrecioCompra: TDBEdit
        Left = 304
        Top = 21
        Width = 121
        Height = 21
        DataField = 'precio_compra'
        DataSource = dm.dsproductos
        TabOrder = 3
      end
      object dbePrecioVenta: TDBEdit
        Left = 304
        Top = 61
        Width = 121
        Height = 21
        DataField = 'precio_venta'
        DataSource = dm.dsproductos
        TabOrder = 4
      end
      object dbeStock: TDBEdit
        Left = 303
        Top = 101
        Width = 121
        Height = 21
        DataField = 'stock_actual'
        DataSource = dm.dsproductos
        ReadOnly = True
        TabOrder = 5
      end
      object dbeFechaAlta: TDBEdit
        Left = 542
        Top = 21
        Width = 121
        Height = 21
        DataField = 'fecha_alta'
        DataSource = dm.dsproductos
        ReadOnly = True
        TabOrder = 6
      end
      object dbeFechaMod: TDBEdit
        Left = 542
        Top = 61
        Width = 121
        Height = 21
        DataField = 'fecha_actualizacion'
        DataSource = dm.dsproductos
        ReadOnly = True
        TabOrder = 7
      end
      object dbmDescripcion: TDBMemo
        Left = 28
        Top = 155
        Width = 301
        Height = 54
        DataField = 'descripcion'
        DataSource = dm.dsproductos
        TabOrder = 8
      end
      object dbcbActivo: TDBCheckBox
        Left = 542
        Top = 115
        Width = 97
        Height = 17
        DataField = 'activo'
        DataSource = dm.dsproductos
        ReadOnly = True
        TabOrder = 9
      end
      object btnActivar: TButton
        Left = 588
        Top = 88
        Width = 75
        Height = 25
        Caption = 'Activar'
        TabOrder = 10
        OnClick = btnActivarClick
      end
      object btnDesactivar: TButton
        Left = 588
        Top = 119
        Width = 75
        Height = 25
        Caption = 'Desactivar'
        TabOrder = 11
        OnClick = btnDesactivarClick
      end
      object btnGuardar: TButton
        Left = 462
        Top = 166
        Width = 75
        Height = 25
        Caption = 'Guardar'
        TabOrder = 12
        OnClick = btnGuardarClick
      end
      object btnNuevo: TButton
        Left = 381
        Top = 166
        Width = 75
        Height = 25
        Caption = 'Nuevo'
        TabOrder = 13
        OnClick = btnNuevoClick
      end
      object btnEliminar: TButton
        Left = 543
        Top = 166
        Width = 75
        Height = 25
        Caption = 'Eliminar'
        TabOrder = 14
        OnClick = btnEliminarClick
      end
    end
  end
end
