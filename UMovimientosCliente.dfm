object FMovimientosCliente: TFMovimientosCliente
  Left = 0
  Top = 0
  Caption = 'Movimientos del cliente'
  ClientHeight = 473
  ClientWidth = 661
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
    Width = 661
    Height = 473
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 176
    object GroupBox1: TGroupBox
      Left = 1
      Top = 256
      Width = 659
      Height = 216
      Align = alBottom
      Caption = 'Movimientos del cliente '
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 248
      object DBGrid1: TDBGrid
        Left = 2
        Top = 21
        Width = 655
        Height = 193
        Align = alBottom
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'fecha_movimiento'
            Title.Caption = 'Fecha'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipo_movimiento'
            Title.Caption = 'Tipo'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'producto_nombre'
            Title.Caption = 'Producto'
            Width = 150
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'cantidad'
            Title.Caption = 'Cant.'
            Width = 50
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
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'total'
            Title.Caption = 'Total'
            Width = 70
            Visible = True
          end>
      end
    end
    object btnAceptar: TButton
      Left = 568
      Top = 247
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      ModalResult = 1
      TabOrder = 1
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 659
      Height = 240
      Align = alTop
      Caption = 'Informaci'#243'n del Movimiento Seleccionado'
      TabOrder = 2
      ExplicitLeft = 0
      object Label1: TLabel
        Left = 24
        Top = 32
        Width = 36
        Height = 13
        Caption = 'Fecha: '
      end
      object Label2: TLabel
        Left = 24
        Top = 66
        Width = 50
        Height = 13
        Caption = 'Producto: '
      end
      object Label3: TLabel
        Left = 24
        Top = 104
        Width = 59
        Height = 13
        Caption = 'Referencia: '
      end
      object Label4: TLabel
        Left = 272
        Top = 32
        Width = 27
        Height = 13
        Caption = 'Tipo: '
      end
      object Label5: TLabel
        Left = 272
        Top = 66
        Width = 50
        Height = 13
        Caption = 'Cantidad: '
      end
      object Label6: TLabel
        Left = 272
        Top = 104
        Width = 31
        Height = 13
        Caption = 'Total: '
      end
      object Label7: TLabel
        Left = 24
        Top = 152
        Width = 78
        Height = 13
        Caption = 'Observaciones: '
      end
      object DBEdit1: TDBEdit
        Left = 112
        Top = 29
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 112
        Top = 63
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 112
        Top = 101
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 352
        Top = 29
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 352
        Top = 63
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 352
        Top = 101
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object DBMemo1: TDBMemo
        Left = 16
        Top = 171
        Width = 457
        Height = 53
        TabOrder = 6
      end
    end
  end
end
