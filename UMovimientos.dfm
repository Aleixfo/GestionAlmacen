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
    ExplicitLeft = -8
    object pnlHeader: TPanel
      Left = 1
      Top = 1
      Width = 793
      Height = 104
      Align = alTop
      TabOrder = 0
      object gbxBuscar: TGroupBox
        Left = 8
        Top = -1
        Width = 177
        Height = 98
        Caption = 'Buscar Ref. '
        TabOrder = 0
        object lblReferencia: TLabel
          Left = 18
          Top = 21
          Width = 59
          Height = 13
          Caption = 'Referencia :'
        end
        object btnBuscar: TButton
          Left = 18
          Top = 64
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
          Text = 'Buscar referencia ...'
          OnKeyPress = edtReferenciaKeyPress
        end
      end
      object gbxEstadisticas: TGroupBox
        Left = 607
        Top = -1
        Width = 178
        Height = 98
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
          Top = 27
          Width = 31
          Height = 13
          Caption = 'Total :'
        end
      end
      object gbxFiltros: TGroupBox
        Left = 191
        Top = -1
        Width = 410
        Height = 98
        Caption = 'Filtros'
        TabOrder = 2
        object lblCliente: TLabel
          Left = 16
          Top = 21
          Width = 40
          Height = 13
          Caption = 'Cliente :'
        end
        object lblProveedor: TLabel
          Left = 143
          Top = 21
          Width = 57
          Height = 13
          Caption = 'Proveedor :'
        end
        object lblTipo: TLabel
          Left = 270
          Top = 21
          Width = 27
          Height = 13
          Caption = 'Tipo :'
        end
        object edtCliente: TEdit
          Left = 16
          Top = 40
          Width = 121
          Height = 21
          TabOrder = 0
          Text = 'Seleccione el cliente ...'
        end
        object edtProveedor: TEdit
          Left = 143
          Top = 40
          Width = 121
          Height = 21
          TabOrder = 1
          Text = 'Seleccione el proveedor ...'
        end
        object Edit4: TEdit
          Left = 270
          Top = 40
          Width = 121
          Height = 21
          TabOrder = 2
          Text = 'Seleccione el tipo ...'
        end
        object btnAplicar: TButton
          Left = 80
          Top = 67
          Width = 75
          Height = 25
          Caption = 'Aplicar'
          TabOrder = 3
        end
        object btnLimpiar: TButton
          Left = 248
          Top = 67
          Width = 75
          Height = 25
          Caption = 'Limpiar'
          TabOrder = 4
        end
      end
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 111
      Width = 793
      Height = 493
      Align = alBottom
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = -397
      ExplicitWidth = 173
      object grdMovimientos: TDBGrid
        Left = 1
        Top = 1
        Width = 791
        Height = 491
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
            Width = 64
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
