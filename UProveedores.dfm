object FProveedores: TFProveedores
  Left = 0
  Top = 0
  Caption = 'FProveedores'
  ClientHeight = 472
  ClientWidth = 844
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 96
    Top = 64
    Width = 240
    Height = 25
    DataSource = dm.dsproveedores
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 256
    Width = 793
    Height = 193
    DataSource = dm.dsproveedores
    TabOrder = 1
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
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'contacto'
        Width = 124
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
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'direccion'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'activo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha_alta'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 128
    Top = 112
    Width = 185
    Height = 41
    Caption = 'Panel1'
    TabOrder = 2
  end
  object BtnNuevo: TButton
    Left = 72
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Nuevo'
    TabOrder = 3
    OnClick = BtnNuevoClick
  end
  object BtnEditar: TButton
    Left = 176
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 4
    OnClick = BtnEditarClick
  end
  object BtnEliminar: TButton
    Left = 280
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Eliminar'
    TabOrder = 5
    OnClick = BtnEliminarClick
  end
end
