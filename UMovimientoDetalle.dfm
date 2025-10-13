object FMovimientoDetalle: TFMovimientoDetalle
  Left = 0
  Top = 0
  Caption = 'FMovimientoDetalle'
  ClientHeight = 313
  ClientWidth = 598
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
    Width = 598
    Height = 313
    Align = alClient
    TabOrder = 0
    ExplicitTop = 8
    ExplicitHeight = 459
    object gbxDatos: TGroupBox
      Left = 13
      Top = 8
      Width = 569
      Height = 289
      Caption = 'Detalle Movimiento '
      TabOrder = 0
      object lblCodigo: TLabel
        Left = 57
        Top = 32
        Width = 43
        Height = 13
        Caption = 'C'#243'digo  :'
      end
      object lblProducto: TLabel
        Left = 50
        Top = 65
        Width = 50
        Height = 13
        Caption = 'Producto :'
      end
      object lblFecha: TLabel
        Left = 64
        Top = 99
        Width = 36
        Height = 13
        Caption = 'Fecha :'
      end
      object lblReferencia: TLabel
        Left = 41
        Top = 133
        Width = 59
        Height = 13
        Caption = 'Referencia :'
      end
      object lblTipo: TLabel
        Left = 272
        Top = 65
        Width = 83
        Height = 13
        Caption = 'Entrada / Salida :'
      end
      object lblCantidad: TLabel
        Left = 305
        Top = 32
        Width = 50
        Height = 13
        Caption = 'Cantidad :'
      end
      object lblCliente: TLabel
        Left = 315
        Top = 99
        Width = 40
        Height = 13
        Caption = 'Cliente :'
      end
      object lblProveedor: TLabel
        Left = 298
        Top = 133
        Width = 57
        Height = 13
        Caption = 'Proveedor :'
      end
      object lblObservaciones: TLabel
        Left = 22
        Top = 163
        Width = 78
        Height = 13
        Caption = 'Observaciones :'
      end
      object dbmObservaciones: TDBMemo
        Left = 14
        Top = 182
        Width = 539
        Height = 89
        DataField = 'observaciones'
        DataSource = dm.dsmovimientos
        TabOrder = 0
      end
      object dbeCantidad: TDBEdit
        Left = 369
        Top = 62
        Width = 121
        Height = 21
        DataField = 'cantidad'
        DataSource = dm.dsmovimientos
        ReadOnly = True
        TabOrder = 1
      end
      object dbeCliente: TDBEdit
        Left = 369
        Top = 96
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object dbeCodigo: TDBEdit
        Left = 114
        Top = 29
        Width = 121
        Height = 21
        DataField = 'id'
        DataSource = dm.dsmovimientos
        ReadOnly = True
        TabOrder = 3
      end
      object dbeFecha: TDBEdit
        Left = 114
        Top = 96
        Width = 121
        Height = 21
        DataField = 'fecha_movimiento'
        DataSource = dm.dsmovimientos
        ReadOnly = True
        TabOrder = 4
      end
      object dbeProducto: TDBEdit
        Left = 114
        Top = 62
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 5
      end
      object dbeProveedor: TDBEdit
        Left = 369
        Top = 131
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 6
      end
      object dbeReferencia: TDBEdit
        Left = 114
        Top = 130
        Width = 121
        Height = 21
        DataField = 'referencia'
        DataSource = dm.dsmovimientos
        ReadOnly = True
        TabOrder = 7
      end
      object dbeTipo: TDBEdit
        Left = 369
        Top = 30
        Width = 121
        Height = 21
        DataField = 'tipo_movimiento'
        DataSource = dm.dsmovimientos
        ReadOnly = True
        TabOrder = 8
      end
    end
  end
end
