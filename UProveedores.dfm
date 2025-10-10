object FProveedores: TFProveedores
  Left = 0
  Top = 0
  Caption = 'FProveedores'
  ClientHeight = 525
  ClientWidth = 665
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
    Top = 289
    Width = 665
    Height = 52
    Align = alClient
    TabOrder = 0
    object BtnNuevo: TButton
      Left = 16
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Nuevo'
      TabOrder = 0
      OnClick = BtnNuevoClick
    end
    object BtnEliminar: TButton
      Left = 216
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Eliminar'
      TabOrder = 1
      OnClick = BtnEliminarClick
    end
    object BtnEditar: TButton
      Left = 112
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 2
      OnClick = BtnEditarClick
    end
    object DBNavigator1: TDBNavigator
      Left = 416
      Top = 21
      Width = 240
      Height = 25
      DataSource = dm.dsproveedores
      TabOrder = 3
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 341
    Width = 665
    Height = 184
    Align = alBottom
    TabOrder = 1
    object CRDBGrid1: TCRDBGrid
      Left = 1
      Top = 1
      Width = 663
      Height = 182
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
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nombre'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'contacto'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'telefono'
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'email'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'fecha_alta'
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'activo'
          Width = 34
          Visible = True
        end>
    end
  end
  object pnlDatos: TPanel
    Left = 0
    Top = 0
    Width = 665
    Height = 289
    Align = alTop
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 663
      Height = 287
      Align = alClient
      Caption = 'Informaci'#243'n del proveedor '
      TabOrder = 0
      object Label1: TLabel
        Left = 31
        Top = 32
        Width = 43
        Height = 13
        Caption = 'C'#243'digo : '
      end
      object Label2: TLabel
        Left = 29
        Top = 72
        Width = 44
        Height = 13
        Caption = 'Nombre :'
      end
      object Label3: TLabel
        Left = 20
        Top = 112
        Width = 54
        Height = 13
        Caption = 'Contacto : '
      end
      object Label4: TLabel
        Left = 24
        Top = 152
        Width = 49
        Height = 13
        Caption = 'Telefono :'
      end
      object Label5: TLabel
        Left = 304
        Top = 32
        Width = 31
        Height = 13
        Caption = 'Email :'
      end
      object Label6: TLabel
        Left = 278
        Top = 72
        Width = 57
        Height = 13
        Caption = 'Fecha alta :'
      end
      object Label7: TLabel
        Left = 295
        Top = 112
        Width = 40
        Height = 13
        Caption = 'Activo : '
      end
      object Label8: TLabel
        Left = 23
        Top = 196
        Width = 50
        Height = 13
        Caption = 'Direcci'#243'n :'
      end
      object DBMemo1: TDBMemo
        Left = 15
        Top = 215
        Width = 301
        Height = 59
        DataField = 'direccion'
        DataSource = dm.dsproveedores
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 96
        Top = 29
        Width = 121
        Height = 21
        DataField = 'id'
        DataSource = dm.dsproveedores
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 96
        Top = 69
        Width = 121
        Height = 21
        DataField = 'nombre'
        DataSource = dm.dsproveedores
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 96
        Top = 109
        Width = 121
        Height = 21
        DataField = 'contacto'
        DataSource = dm.dsproveedores
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 96
        Top = 149
        Width = 121
        Height = 21
        DataField = 'telefono'
        DataSource = dm.dsproveedores
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 376
        Top = 29
        Width = 121
        Height = 21
        DataField = 'email'
        DataSource = dm.dsproveedores
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 376
        Top = 69
        Width = 121
        Height = 21
        DataField = 'fecha_alta'
        DataSource = dm.dsproveedores
        TabOrder = 6
      end
      object DBCheckBox1: TDBCheckBox
        Left = 376
        Top = 111
        Width = 97
        Height = 17
        DataField = 'activo'
        DataSource = dm.dsproveedores
        TabOrder = 7
      end
      object Button1: TButton
        Left = 336
        Top = 149
        Width = 305
        Height = 125
        Caption = 'Ver Movimientos'
        TabOrder = 8
        OnClick = Button1Click
      end
    end
  end
end
