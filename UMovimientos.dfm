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
      object gbxBuscar: TGroupBox
        Left = 8
        Top = -1
        Width = 177
        Height = 162
        Caption = 'Buscar Ref. '
        TabOrder = 0
        object lblReferencia: TLabel
          Left = 18
          Top = 21
          Width = 59
          Height = 13
          Caption = 'Referencia :'
        end
        object lblProductos: TLabel
          Left = 18
          Top = 78
          Width = 53
          Height = 13
          Caption = 'Producto : '
        end
        object btnBuscar: TButton
          Left = 18
          Top = 134
          Width = 121
          Height = 25
          Caption = 'Buscar'
          TabOrder = 0
          OnClick = btnBuscarClick
        end
        object edtReferencia: TEdit
          Left = 18
          Top = 40
          Width = 121
          Height = 21
          TabOrder = 1
          OnKeyPress = edtReferenciaKeyPress
        end
        object cbxProducto: TComboBox
          Left = 18
          Top = 97
          Width = 145
          Height = 21
          TabOrder = 2
          Text = 'cbxProducto'
        end
      end
      object gbxEstadisticas: TGroupBox
        Left = 631
        Top = -1
        Width = 154
        Height = 162
        Caption = 'Estad'#237'sticas '
        TabOrder = 1
        object lblMovimientosHoy: TLabel
          Left = 27
          Top = 64
          Width = 26
          Height = 13
          Caption = 'Hoy :'
        end
        object lblTotalMovimientos: TLabel
          Left = 27
          Top = 21
          Width = 31
          Height = 13
          Caption = 'Total :'
        end
      end
      object gbxFiltros: TGroupBox
        Left = 191
        Top = -1
        Width = 434
        Height = 162
        Caption = 'Filtros'
        TabOrder = 2
        object lblCliente: TLabel
          Left = 16
          Top = 67
          Width = 40
          Height = 13
          Caption = 'Cliente :'
        end
        object lblProveedor: TLabel
          Left = 16
          Top = 113
          Width = 57
          Height = 13
          Caption = 'Proveedor :'
        end
        object lblTipo: TLabel
          Left = 16
          Top = 21
          Width = 27
          Height = 13
          Caption = 'Tipo :'
        end
        object lblFechaInicio: TLabel
          Left = 216
          Top = 21
          Width = 68
          Height = 13
          Caption = 'Fecha desde :'
        end
        object lblFechaFin: TLabel
          Left = 216
          Top = 67
          Width = 66
          Height = 13
          Caption = 'Fecha hasta :'
        end
        object btnAplicar: TButton
          Left = 328
          Top = 123
          Width = 75
          Height = 25
          Caption = 'Aplicar'
          TabOrder = 0
        end
        object btnLimpiar: TButton
          Left = 216
          Top = 123
          Width = 75
          Height = 25
          Caption = 'Limpiar'
          TabOrder = 1
          OnClick = btnLimpiarClick
        end
        object cbxTipoMovimiento: TComboBox
          Left = 16
          Top = 40
          Width = 145
          Height = 21
          TabOrder = 2
          Text = 'Seleccione el tipo de mov...'
        end
        object cbxClientes: TComboBox
          Left = 16
          Top = 86
          Width = 145
          Height = 21
          TabOrder = 3
          Text = 'Seleccione el cliente...'
        end
        object cbxProveedores: TComboBox
          Left = 16
          Top = 132
          Width = 145
          Height = 21
          TabOrder = 4
          Text = 'Seleccione el proveedor...'
        end
        object dtpFechaInicio: TDateTimePicker
          Left = 216
          Top = 40
          Width = 186
          Height = 21
          Date = 45943.000000000000000000
          Time = 0.386668275459669500
          TabOrder = 5
        end
        object dtpFechaFin: TDateTimePicker
          Left = 216
          Top = 86
          Width = 186
          Height = 21
          Date = 45943.000000000000000000
          Time = 0.388255150464829100
          TabOrder = 6
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producto_id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipo_movimiento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cantidad'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'proveedor_id'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cliente_id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fecha_movimiento'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'referencia'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'observaciones'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nomcli'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nompro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'import'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'preucompra'
            Visible = True
          end>
      end
    end
  end
end
