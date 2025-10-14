object FClientes: TFClientes
  Left = 0
  Top = 0
  Caption = 'Gesti'#243'n de Clientes'
  ClientHeight = 635
  ClientWidth = 842
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
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 842
    Height = 635
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 875
    ExplicitHeight = 627
    object pnlGrid: TPanel
      Left = 1
      Top = 262
      Width = 840
      Height = 372
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 254
      ExplicitWidth = 873
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 838
        Height = 370
        Align = alClient
        DataSource = dm.dsclientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
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
            FieldName = 'nombre'
            Title.Caption = 'Nombre'
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'contacto'
            Title.Caption = 'Contacto'
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefono'
            Title.Caption = 'Telef'#243'no'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'email'
            Title.Caption = 'Email'
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'direccion'
            Title.Caption = 'Direcci'#243'n'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fecha_alta'
            Title.Caption = 'Fecha Alta'
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'activo'
            Title.Caption = 'Activo'
            Width = 64
            Visible = True
          end>
      end
    end
    object pnlDatos: TPanel
      Left = 1
      Top = 1
      Width = 840
      Height = 216
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 873
      object gbxDatos: TGroupBox
        Left = 1
        Top = 1
        Width = 838
        Height = 214
        Align = alClient
        Caption = 'Informaci'#243'n del Cliente'
        TabOrder = 0
        ExplicitLeft = 25
        ExplicitTop = 17
        ExplicitWidth = 871
        object Label1: TLabel
          Left = 20
          Top = 32
          Width = 40
          Height = 13
          Caption = 'C'#243'digo :'
        end
        object Label2: TLabel
          Left = 16
          Top = 64
          Width = 44
          Height = 13
          Caption = 'Nombre :'
        end
        object Label3: TLabel
          Left = 29
          Top = 94
          Width = 31
          Height = 13
          Caption = 'Email :'
        end
        object Label4: TLabel
          Left = 237
          Top = 32
          Width = 51
          Height = 13
          Caption = 'Contacto :'
        end
        object Label6: TLabel
          Left = 239
          Top = 64
          Width = 49
          Height = 13
          Caption = 'Tel'#233'fono :'
        end
        object Label7: TLabel
          Left = 251
          Top = 108
          Width = 37
          Height = 13
          Caption = 'Activo :'
        end
        object Label8: TLabel
          Left = 470
          Top = 32
          Width = 50
          Height = 13
          Caption = 'Direcci'#243'n :'
        end
        object Label9: TLabel
          Left = 7
          Top = 128
          Width = 57
          Height = 13
          Caption = 'Fecha alta: '
        end
        object dbeID: TDBEdit
          Left = 79
          Top = 29
          Width = 121
          Height = 21
          DataField = 'id'
          DataSource = dm.dsclientes
          ReadOnly = True
          TabOrder = 0
        end
        object dbeNombre: TDBEdit
          Left = 79
          Top = 61
          Width = 121
          Height = 21
          DataField = 'nombre'
          DataSource = dm.dsclientes
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 79
          Top = 91
          Width = 121
          Height = 21
          DataField = 'email'
          DataSource = dm.dsclientes
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 316
          Top = 29
          Width = 121
          Height = 21
          DataField = 'contacto'
          DataSource = dm.dsclientes
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 316
          Top = 61
          Width = 121
          Height = 21
          DataField = 'telefono'
          DataSource = dm.dsclientes
          TabOrder = 4
        end
        object cbxActivo: TDBCheckBox
          Left = 316
          Top = 107
          Width = 97
          Height = 17
          DataField = 'activo'
          DataSource = dm.dsclientes
          ReadOnly = True
          TabOrder = 5
        end
        object DBMemo1: TDBMemo
          Left = 526
          Top = 23
          Width = 299
          Height = 118
          DataField = 'direccion'
          DataSource = dm.dsclientes
          TabOrder = 6
        end
        object btnMovimientos: TButton
          Left = 526
          Top = 160
          Width = 299
          Height = 37
          Caption = '&Ver Movimientos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -20
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnClick = btnMovimientosClick
        end
        object DBEdit6: TDBEdit
          Left = 79
          Top = 125
          Width = 121
          Height = 21
          DataField = 'fecha_alta'
          DataSource = dm.dsclientes
          ReadOnly = True
          TabOrder = 8
        end
        object btnActivar: TButton
          Left = 362
          Top = 88
          Width = 75
          Height = 25
          Caption = 'Activar'
          TabOrder = 9
          OnClick = btnActivarClick
        end
        object btnDesactivar: TButton
          Left = 362
          Top = 119
          Width = 75
          Height = 25
          Caption = 'Desactivar'
          TabOrder = 10
          OnClick = btnDesactivarClick
        end
        object btnEliminar: TButton
          Left = 274
          Top = 172
          Width = 75
          Height = 25
          Caption = 'Eliminar'
          TabOrder = 11
          OnClick = BtnEliminarClick
        end
        object btnGuardar: TButton
          Left = 206
          Top = 172
          Width = 62
          Height = 25
          Caption = 'Guardar'
          TabOrder = 12
          OnClick = btnGuardarClick
        end
        object btnNuevo: TButton
          Left = 136
          Top = 172
          Width = 64
          Height = 25
          Caption = 'Nuevo'
          TabOrder = 13
          OnClick = btnNuevoClick
        end
      end
    end
    object pnlBotones: TPanel
      Left = 1
      Top = 217
      Width = 840
      Height = 45
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 65
      ExplicitTop = 223
      ExplicitWidth = 873
      ExplicitHeight = 37
      object lblBuscarID: TLabel
        Left = 20
        Top = 16
        Width = 72
        Height = 13
        Caption = 'Buscar por ID :'
      end
      object lblBuscarNombre: TLabel
        Left = 247
        Top = 16
        Width = 97
        Height = 13
        Caption = 'Buscar por nombre :'
      end
      object btnBuscar: TButton
        Left = 569
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Buscar'
        TabOrder = 0
        OnClick = btnBuscarClick
      end
      object edtBuscarID: TEdit
        Left = 98
        Top = 13
        Width = 121
        Height = 21
        TabOrder = 1
        OnKeyPress = edtBuscarIDKeyPress
      end
      object edtBuscarNombre: TEdit
        Left = 350
        Top = 13
        Width = 121
        Height = 21
        TabOrder = 2
        OnKeyPress = edtBuscarNombreKeyPress
      end
      object btnLimpiarFiltros: TButton
        Left = 650
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Limpiar'
        TabOrder = 3
        OnClick = btnLimpiarFiltrosClick
      end
    end
  end
end
