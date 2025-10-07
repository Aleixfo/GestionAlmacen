object FMovimientosProveedor: TFMovimientosProveedor
  Left = 0
  Top = 0
  Caption = 'FMovimientosProveedor'
  ClientHeight = 468
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 468
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 288
    ExplicitTop = 184
    ExplicitWidth = 185
    ExplicitHeight = 41
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 624
      Height = 242
      Align = alTop
      Caption = 'Informaci'#243'n del Movimiento Seleccionado'
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 0
      object Label1: TLabel
        Left = 48
        Top = 48
        Width = 36
        Height = 13
        Caption = 'Fecha :'
      end
      object Label2: TLabel
        Left = 48
        Top = 112
        Width = 59
        Height = 13
        Caption = 'Referencia :'
      end
      object Label3: TLabel
        Left = 48
        Top = 80
        Width = 50
        Height = 13
        Caption = 'Producto :'
      end
      object Label4: TLabel
        Left = 264
        Top = 48
        Width = 67
        Height = 13
        Caption = 'Precio Venta :'
      end
      object Label5: TLabel
        Left = 281
        Top = 80
        Width = 50
        Height = 13
        Caption = 'Cantidad :'
      end
      object Label6: TLabel
        Left = 300
        Top = 112
        Width = 31
        Height = 13
        Caption = 'Total :'
      end
      object Label7: TLabel
        Left = 48
        Top = 144
        Width = 78
        Height = 13
        Caption = 'Observaciones :'
      end
      object DBText1: TDBText
        Left = 144
        Top = 48
        Width = 65
        Height = 17
        DataField = 'fecha_movimiento'
        DataSource = dm.dsMovimientosProveedor
      end
      object DBText2: TDBText
        Left = 144
        Top = 80
        Width = 65
        Height = 17
        DataField = 'nompro'
        DataSource = dm.dsMovimientosProveedor
      end
      object DBText3: TDBText
        Left = 144
        Top = 112
        Width = 65
        Height = 17
        DataField = 'referencia'
        DataSource = dm.dsMovimientosProveedor
      end
      object DBText4: TDBText
        Left = 416
        Top = 48
        Width = 65
        Height = 17
        DataField = 'producto_precio'
        DataSource = dm.dsMovimientosProveedor
      end
      object DBText5: TDBText
        Left = 416
        Top = 80
        Width = 65
        Height = 17
        DataField = 'cantidad'
        DataSource = dm.dsMovimientosProveedor
      end
      object DBText6: TDBText
        Left = 416
        Top = 112
        Width = 65
        Height = 17
        DataField = 'total'
        DataSource = dm.dsMovimientosProveedor
      end
      object DBMemo1: TDBMemo
        Left = 48
        Top = 163
        Width = 505
        Height = 62
        DataField = 'observaciones'
        DataSource = dm.dsMovimientosProveedor
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 264
      Width = 624
      Height = 203
      Align = alBottom
      Caption = 'Movimientos del proveedor '
      TabOrder = 1
      ExplicitLeft = 0
      ExplicitTop = 265
      ExplicitWidth = 534
      object CRDBGrid1: TCRDBGrid
        Left = 2
        Top = 15
        Width = 620
        Height = 186
        Align = alClient
        DataSource = dm.dsMovimientosProveedor
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
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producto_nombre'
            Title.Caption = 'Producto'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cantidad'
            Title.Caption = 'Cant.'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nompro'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fecha_movimiento'
            Title.Caption = 'Fecha'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'referencia'
            Title.Caption = 'Referencia'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producto_precio'
            Title.Caption = 'Precio U.'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'total'
            Title.Caption = 'Imp.'
            Width = 60
            Visible = True
          end>
      end
    end
  end
end
