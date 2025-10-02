object FClientes: TFClientes
  Left = 0
  Top = 0
  Caption = 'Gesti'#243'n de Clientes'
  ClientHeight = 452
  ClientWidth = 872
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
  object DBGrid1: TDBGrid
    Left = 24
    Top = 256
    Width = 825
    Height = 169
    DataSource = dm.dsclientes
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
  object DBNavigator1: TDBNavigator
    Left = 609
    Top = 225
    Width = 240
    Height = 25
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 408
    Top = 64
    Width = 185
    Height = 41
    Caption = 'Panel1'
    TabOrder = 2
  end
  object BtnNuevo: TButton
    Left = 56
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Nuevo'
    TabOrder = 3
    OnClick = BtnNuevoClick
  end
  object BtnEditar: TButton
    Left = 160
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 4
    OnClick = BtnEditarClick
  end
  object BtnEliminar: TButton
    Left = 256
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Eliminar'
    TabOrder = 5
    OnClick = BtnEliminarClick
  end
end
