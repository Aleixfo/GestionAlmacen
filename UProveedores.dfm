object FProveedores: TFProveedores
  Left = 0
  Top = 0
  Caption = 'FProveedores'
  ClientHeight = 525
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotones: TPanel
    Left = 0
    Top = 233
    Width = 802
    Height = 43
    Align = alClient
    TabOrder = 0
    ExplicitTop = 289
    ExplicitWidth = 665
    ExplicitHeight = 52
    object lblBuscarID: TLabel
      Left = 33
      Top = 15
      Width = 72
      Height = 13
      Caption = 'Buscar por ID :'
    end
    object lblBuscarNombre: TLabel
      Left = 295
      Top = 15
      Width = 97
      Height = 13
      Caption = 'Buscar por nombre :'
    end
    object edtBuscarID: TEdit
      Left = 111
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyPress = edtBuscarIDKeyPress
    end
    object edtBuscarNombre: TEdit
      Left = 398
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 1
      OnKeyPress = edtBuscarNombreKeyPress
    end
    object btnBuscar: TButton
      Left = 599
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 2
      OnClick = btnBuscarClick
    end
    object btnLimpiar: TButton
      Left = 680
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Limpiar'
      TabOrder = 3
      OnClick = btnLimpiarClick
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 276
    Width = 802
    Height = 249
    Align = alBottom
    TabOrder = 1
    object CRDBGrid1: TCRDBGrid
      Left = 1
      Top = 1
      Width = 800
      Height = 247
      Align = alClient
      DataSource = dm.dsproveedores
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
          Title.Caption = 'C'#243'digo'
          Width = 64
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
          FieldName = 'contacto'
          Title.Caption = 'Contacto'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'telefono'
          Title.Caption = 'Telef'#243'no'
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'email'
          Title.Caption = 'Email'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fecha_alta'
          Title.Caption = 'Fecha Alta'
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'activo'
          Title.Caption = 'Activo'
          Width = 34
          Visible = True
        end>
    end
  end
  object pnlDatos: TPanel
    Left = 0
    Top = 0
    Width = 802
    Height = 233
    Align = alTop
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 800
      Height = 231
      Align = alClient
      Caption = 'Informaci'#243'n del proveedor '
      TabOrder = 0
      ExplicitHeight = 272
      object Label1: TLabel
        Left = 32
        Top = 32
        Width = 40
        Height = 13
        Caption = 'C'#243'digo :'
      end
      object Label2: TLabel
        Left = 28
        Top = 66
        Width = 44
        Height = 16
        Caption = 'Nombre :'
      end
      object Label3: TLabel
        Left = 266
        Top = 32
        Width = 51
        Height = 13
        Caption = 'Contacto :'
      end
      object Label4: TLabel
        Left = 268
        Top = 66
        Width = 49
        Height = 13
        Caption = 'Telefono :'
      end
      object Label5: TLabel
        Left = 41
        Top = 100
        Width = 31
        Height = 13
        Caption = 'Email :'
      end
      object Label6: TLabel
        Left = 16
        Top = 137
        Width = 57
        Height = 13
        Caption = 'Fecha alta :'
      end
      object Label7: TLabel
        Left = 280
        Top = 112
        Width = 37
        Height = 13
        Caption = 'Activo :'
      end
      object Label8: TLabel
        Left = 503
        Top = 32
        Width = 50
        Height = 13
        Caption = 'Direcci'#243'n :'
      end
      object DBMemo1: TDBMemo
        Left = 559
        Top = 29
        Width = 218
        Height = 123
        DataField = 'direccion'
        DataSource = dm.dsproveedores
        TabOrder = 0
      end
      object dbeID: TDBEdit
        Left = 86
        Top = 29
        Width = 121
        Height = 21
        DataField = 'id'
        DataSource = dm.dsproveedores
        ReadOnly = True
        TabOrder = 1
      end
      object dbeNombre: TDBEdit
        Left = 86
        Top = 63
        Width = 121
        Height = 21
        DataField = 'nombre'
        DataSource = dm.dsproveedores
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 336
        Top = 29
        Width = 121
        Height = 21
        DataField = 'contacto'
        DataSource = dm.dsproveedores
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 336
        Top = 63
        Width = 121
        Height = 21
        DataField = 'telefono'
        DataSource = dm.dsproveedores
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 86
        Top = 97
        Width = 121
        Height = 21
        DataField = 'email'
        DataSource = dm.dsproveedores
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 86
        Top = 134
        Width = 121
        Height = 21
        DataField = 'fecha_alta'
        DataSource = dm.dsproveedores
        ReadOnly = True
        TabOrder = 6
      end
      object cbxActivo: TDBCheckBox
        Left = 336
        Top = 111
        Width = 97
        Height = 17
        DataField = 'activo'
        DataSource = dm.dsproveedores
        ReadOnly = True
        TabOrder = 7
      end
      object btnMovimientos: TButton
        Left = 559
        Top = 172
        Width = 218
        Height = 38
        Caption = 'Ver Movimientos'
        TabOrder = 8
        OnClick = btnMovimientosClick
      end
      object btnGuardar: TButton
        Left = 213
        Top = 185
        Width = 75
        Height = 25
        Caption = 'Guardar'
        TabOrder = 9
        OnClick = btnGuardarClick
      end
      object btnEliminar: TButton
        Left = 294
        Top = 185
        Width = 75
        Height = 25
        Caption = 'Eliminar'
        TabOrder = 10
        OnClick = btnEliminarClick
      end
      object btnNuevo: TButton
        Left = 132
        Top = 185
        Width = 75
        Height = 25
        Caption = 'Nuevo'
        TabOrder = 11
        OnClick = btnNuevoClick
      end
      object btnActivar: TButton
        Left = 382
        Top = 90
        Width = 75
        Height = 25
        Caption = 'Activar'
        TabOrder = 12
        OnClick = btnActivarClick
      end
      object btnDesactivar: TButton
        Left = 382
        Top = 121
        Width = 75
        Height = 25
        Caption = 'Desactivar'
        TabOrder = 13
        OnClick = btnDesactivarClick
      end
    end
  end
end
