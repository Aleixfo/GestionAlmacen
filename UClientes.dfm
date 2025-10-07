object FClientes: TFClientes
  Left = 0
  Top = 0
  Caption = 'Gesti'#243'n de Clientes'
  ClientHeight = 623
  ClientWidth = 892
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
    Width = 892
    Height = 623
    Align = alClient
    TabOrder = 0
    object pnlGrid: TPanel
      Left = 1
      Top = 367
      Width = 890
      Height = 255
      Align = alBottom
      TabOrder = 0
      object Label5: TLabel
        Left = 1
        Top = 1
        Width = 888
        Height = 13
        Align = alTop
        Caption = 'Lista de Clientes'
        ExplicitWidth = 78
      end
      object DBGrid1: TDBGrid
        Left = 1
        Top = 14
        Width = 888
        Height = 240
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nombre'
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'contacto'
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefono'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'email'
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'direccion'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fecha_alta'
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'activo'
            Visible = True
          end>
      end
    end
    object pnlDatos: TPanel
      Left = 1
      Top = 1
      Width = 890
      Height = 328
      Align = alTop
      TabOrder = 1
      object GroupBox1: TGroupBox
        Left = 1
        Top = 1
        Width = 888
        Height = 326
        Align = alClient
        Caption = 'Informaci'#243'n del Cliente'
        TabOrder = 0
        ExplicitLeft = 0
        ExplicitTop = 4
        object Label1: TLabel
          Left = 16
          Top = 32
          Width = 40
          Height = 13
          Caption = 'C'#243'digo :'
        end
        object Label2: TLabel
          Left = 16
          Top = 80
          Width = 44
          Height = 13
          Caption = 'Nombre :'
        end
        object Label3: TLabel
          Left = 16
          Top = 134
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
          Left = 237
          Top = 80
          Width = 49
          Height = 13
          Caption = 'Tel'#233'fono :'
        end
        object Label7: TLabel
          Left = 237
          Top = 134
          Width = 37
          Height = 13
          Caption = 'Activo :'
        end
        object Label8: TLabel
          Left = 22
          Top = 229
          Width = 50
          Height = 13
          Caption = 'Direcci'#243'n :'
        end
        object Label9: TLabel
          Left = 16
          Top = 184
          Width = 57
          Height = 13
          Caption = 'Fecha alta: '
        end
        object DBEdit1: TDBEdit
          Left = 79
          Top = 29
          Width = 121
          Height = 21
          DataField = 'id'
          DataSource = dm.dsclientes
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 79
          Top = 77
          Width = 121
          Height = 21
          DataField = 'nombre'
          DataSource = dm.dsclientes
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 79
          Top = 131
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
          Top = 77
          Width = 121
          Height = 21
          DataField = 'telefono'
          DataSource = dm.dsclientes
          TabOrder = 4
        end
        object DBCheckBox1: TDBCheckBox
          Left = 318
          Top = 133
          Width = 97
          Height = 17
          DataField = 'activo'
          DataSource = dm.dsclientes
          TabOrder = 5
        end
        object DBMemo1: TDBMemo
          Left = 16
          Top = 248
          Width = 421
          Height = 57
          DataField = 'direccion'
          DataSource = dm.dsclientes
          TabOrder = 6
        end
        object btnMovimientos: TButton
          Left = 464
          Top = 32
          Width = 385
          Height = 273
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
          Top = 181
          Width = 121
          Height = 21
          DataField = 'fecha_alta'
          DataSource = dm.dsclientes
          TabOrder = 8
        end
      end
    end
    object pnlBotones: TPanel
      Left = 1
      Top = 329
      Width = 890
      Height = 38
      Align = alClient
      TabOrder = 2
      object BtnGuardar: TButton
        Left = 171
        Top = 8
        Width = 62
        Height = 25
        Caption = 'Guardar'
        TabOrder = 0
      end
      object BtnNuevo: TButton
        Left = 9
        Top = 8
        Width = 64
        Height = 25
        Caption = 'Nuevo'
        TabOrder = 1
        OnClick = BtnNuevoClick
      end
      object BtnEliminar: TButton
        Left = 252
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Eliminar'
        TabOrder = 2
        OnClick = BtnEliminarClick
      end
      object BtnEditar: TButton
        Left = 90
        Top = 8
        Width = 63
        Height = 25
        Caption = 'Editar'
        TabOrder = 3
        OnClick = BtnEditarClick
      end
      object BtnCancelar: TButton
        Left = 341
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 4
        OnClick = BtnEliminarClick
      end
      object BtnBuscar: TButton
        Left = 429
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Buscar'
        TabOrder = 5
        OnClick = BtnEliminarClick
      end
      object DBNavigator1: TDBNavigator
        Left = 623
        Top = 8
        Width = 240
        Height = 25
        TabOrder = 6
      end
    end
  end
end
