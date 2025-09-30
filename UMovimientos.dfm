object FMovimientos: TFMovimientos
  Left = 0
  Top = 0
  Caption = 'FMovimientos'
  ClientHeight = 450
  ClientWidth = 867
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
  object DBNavigator1: TDBNavigator
    Left = 184
    Top = 32
    Width = 240
    Height = 25
    DataSource = dm.dsmovimientos
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 216
    Top = 80
    Width = 185
    Height = 41
    Caption = 'Panel1'
    TabOrder = 1
  end
  object BtnNuevo: TButton
    Left = 152
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Nuevo'
    TabOrder = 2
    OnClick = BtnNuevoClick
  end
  object BtnEditar: TButton
    Left = 264
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 3
    OnClick = BtnEditarClick
  end
  object BtnEliminar: TButton
    Left = 376
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Eliminar'
    TabOrder = 4
    OnClick = BtnEliminarClick
  end
  object DBGrid1: TDBGrid
    Left = 19
    Top = 256
    Width = 814
    Height = 160
    DataSource = dm.dsmovimientos
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
