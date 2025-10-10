object FMovimientosCliente: TFMovimientosCliente
  Left = 0
  Top = 0
  Caption = 'Movimientos del cliente'
  ClientHeight = 473
  ClientWidth = 537
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
  object pnlGeneral: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 473
    Align = alClient
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 256
      Width = 535
      Height = 216
      Align = alBottom
      Caption = 'Movimientos del cliente '
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 21
        Width = 531
        Height = 193
        Align = alBottom
        DataSource = dm.dsMovimientosCliente
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
            FieldName = 'fecha_movimiento'
            Title.Caption = 'Fecha'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producto_precio'
            Title.Caption = 'Precio P.'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producto_nombre'
            Title.Caption = 'Nombre P.'
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cantidad'
            Title.Caption = 'Cant.'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'referencia'
            Title.Caption = 'Referencia'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'total'
            Title.Caption = 'Imp.'
            Width = 53
            Visible = True
          end>
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 535
      Height = 249
      Align = alTop
      Caption = 'Informaci'#243'n del Movimiento Seleccionado'
      TabOrder = 1
      object Label1: TLabel
        Left = 66
        Top = 32
        Width = 36
        Height = 13
        Caption = 'Fecha: '
      end
      object Label2: TLabel
        Left = 52
        Top = 66
        Width = 50
        Height = 13
        Caption = 'Producto: '
      end
      object Label3: TLabel
        Left = 43
        Top = 104
        Width = 59
        Height = 13
        Caption = 'Referencia: '
      end
      object Label4: TLabel
        Left = 272
        Top = 32
        Width = 74
        Height = 13
        Caption = 'Precio compra: '
      end
      object Label5: TLabel
        Left = 296
        Top = 66
        Width = 50
        Height = 13
        Caption = 'Cantidad: '
      end
      object Label6: TLabel
        Left = 315
        Top = 104
        Width = 31
        Height = 13
        Caption = 'Total: '
      end
      object Label7: TLabel
        Left = 24
        Top = 136
        Width = 78
        Height = 13
        Caption = 'Observaciones: '
      end
      object DBText1: TDBText
        Left = 136
        Top = 32
        Width = 113
        Height = 17
        DataField = 'fecha_movimiento'
        DataSource = dm.dsMovimientosCliente
      end
      object DBText2: TDBText
        Left = 136
        Top = 66
        Width = 113
        Height = 17
        DataField = 'producto_nombre'
        DataSource = dm.dsMovimientosCliente
      end
      object DBText3: TDBText
        Left = 136
        Top = 104
        Width = 113
        Height = 17
        DataField = 'referencia'
        DataSource = dm.dsMovimientosCliente
      end
      object DBText4: TDBText
        Left = 392
        Top = 32
        Width = 81
        Height = 17
        DataField = 'producto_precio'
        DataSource = dm.dsMovimientosCliente
      end
      object DBText5: TDBText
        Left = 392
        Top = 66
        Width = 81
        Height = 17
        DataField = 'cantidad'
        DataSource = dm.dsMovimientosCliente
      end
      object DBText6: TDBText
        Left = 392
        Top = 104
        Width = 81
        Height = 17
        DataField = 'total'
        DataSource = dm.dsMovimientosCliente
      end
      object DBMemo1: TDBMemo
        Left = 16
        Top = 155
        Width = 507
        Height = 78
        DataField = 'observaciones'
        DataSource = dm.dsmovimientos
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
end
