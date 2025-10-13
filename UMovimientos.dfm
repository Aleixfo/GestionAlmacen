object FMovimientos: TFMovimientos
  Left = 0
  Top = 0
  Caption = 'FMovimientos'
  ClientHeight = 605
  ClientWidth = 795
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
  object pnlContainer: TPanel
    Left = 0
    Top = 0
    Width = 795
    Height = 605
    Align = alClient
    TabOrder = 0
    object pnlHeader: TPanel
      Left = 1
      Top = 1
      Width = 793
      Height = 168
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 2
      object gbxEstadisticas: TGroupBox
        Left = 631
        Top = 0
        Width = 154
        Height = 161
        Caption = 'Estad'#237'sticas '
        TabOrder = 0
        object lblMovimientosHoy: TLabel
          Left = 19
          Top = 64
          Width = 26
          Height = 13
          Caption = 'Hoy :'
        end
        object lblTotalMovimientos: TLabel
          Left = 19
          Top = 26
          Width = 31
          Height = 13
          Caption = 'Total :'
        end
      end
      object gbxFiltros: TGroupBox
        Left = 8
        Top = 0
        Width = 617
        Height = 161
        Caption = 'Filtros'
        TabOrder = 1
        object lblCliente: TLabel
          Left = 57
          Top = 64
          Width = 40
          Height = 13
          Caption = 'Cliente :'
        end
        object lblProveedor: TLabel
          Left = 40
          Top = 98
          Width = 57
          Height = 13
          Caption = 'Proveedor :'
        end
        object lblTipo: TLabel
          Left = 70
          Top = 26
          Width = 27
          Height = 13
          Caption = 'Tipo :'
        end
        object lblFechaInicio: TLabel
          Left = 294
          Top = 26
          Width = 68
          Height = 13
          Caption = 'Fecha desde :'
        end
        object lblFechaFin: TLabel
          Left = 296
          Top = 64
          Width = 66
          Height = 13
          Caption = 'Fecha hasta :'
        end
        object lblProductos: TLabel
          Left = 44
          Top = 133
          Width = 53
          Height = 13
          Caption = 'Producto : '
        end
        object lblReferencia: TLabel
          Left = 303
          Top = 98
          Width = 59
          Height = 13
          Caption = 'Referencia :'
        end
        object btnLimpiar: TButton
          Left = 296
          Top = 122
          Width = 122
          Height = 26
          Caption = 'Limpiar'
          TabOrder = 0
          OnClick = btnLimpiarClick
        end
        object cbxTipoMovimiento: TComboBox
          Left = 103
          Top = 23
          Width = 145
          Height = 21
          TabOrder = 1
          Text = 'Seleccione el tipo de mov...'
          OnChange = cbxTipoMovimientoChange
        end
        object cbxClientes: TComboBox
          Left = 103
          Top = 61
          Width = 145
          Height = 21
          TabOrder = 2
          Text = 'Seleccione el cliente...'
          OnChange = OnFiltrosChange
        end
        object cbxProveedores: TComboBox
          Left = 103
          Top = 96
          Width = 145
          Height = 21
          TabOrder = 3
          Text = 'Seleccione el proveedor...'
          OnChange = OnFiltrosChange
        end
        object dtpFechaInicio: TDateTimePicker
          Left = 368
          Top = 23
          Width = 186
          Height = 21
          Date = 45943.000000000000000000
          Time = 0.386668275459669500
          TabOrder = 4
          OnChange = OnFiltrosChange
        end
        object dtpFechaFin: TDateTimePicker
          Left = 368
          Top = 61
          Width = 186
          Height = 21
          Date = 45943.000000000000000000
          Time = 0.388255150464829100
          TabOrder = 5
          OnChange = OnFiltrosChange
        end
        object btnBuscar: TButton
          Left = 424
          Top = 122
          Width = 130
          Height = 25
          Caption = 'Buscar'
          TabOrder = 6
          OnClick = OnFiltrosChange
        end
        object cbxProducto: TComboBox
          Left = 103
          Top = 130
          Width = 145
          Height = 21
          TabOrder = 7
          Text = 'cbxProducto'
          OnChange = OnFiltrosChange
        end
        object edtReferencia: TEdit
          Left = 368
          Top = 95
          Width = 186
          Height = 21
          TabOrder = 8
          OnKeyDown = edtReferenciaKeyDown
          OnKeyPress = edtReferenciaKeyPress
        end
      end
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 175
      Width = 793
      Height = 429
      Align = alBottom
      TabOrder = 1
      object grdMovimientos: TDBGrid
        Left = 1
        Top = 1
        Width = 791
        Height = 427
        Align = alClient
        DataSource = dm.dsmovimientos
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
            FieldName = 'producto_id'
            Title.Caption = 'Producto'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'referencia'
            Title.Caption = 'Referencia'
            Width = 164
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipo_movimiento'
            Title.Caption = '(E/S)'
            Width = 64
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
            FieldName = 'proveedor_id'
            Title.Caption = 'C'#243'digo Pro.'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cliente_id'
            Title.Caption = 'C'#243'digo Cli.'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fecha_movimiento'
            Title.Caption = 'Fecha'
            Visible = True
          end>
      end
    end
  end
end
