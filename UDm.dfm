object dm: Tdm
  OldCreateOrder = False
  Height = 517
  Width = 757
  object db: TMyConnection
    Database = 'gestion_almacen'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    Left = 96
    Top = 48
    EncryptedPassword = '8DFF90FF90FF8BFF'
  end
  object tproveedores: TMyTable
    TableName = 'proveedores'
    Connection = db
    Options.FieldOrigins = foNone
    Left = 56
    Top = 192
    object tproveedoresid: TIntegerField
      FieldName = 'id'
    end
    object tproveedoresnombre: TStringField
      FieldName = 'nombre'
      Size = 100
    end
    object tproveedorescontacto: TStringField
      FieldName = 'contacto'
      Size = 100
    end
    object tproveedorestelefono: TStringField
      FieldName = 'telefono'
    end
    object tproveedoresemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object tproveedoresdireccion: TMemoField
      FieldName = 'direccion'
      BlobType = ftMemo
    end
    object tproveedoresactivo: TBooleanField
      FieldName = 'activo'
    end
    object tproveedoresfecha_alta: TDateTimeField
      FieldName = 'fecha_alta'
    end
  end
  object tclientes: TMyTable
    TableName = 'clientes'
    Connection = db
    Options.FieldOrigins = foNone
    Left = 56
    Top = 120
    object tclientesid: TIntegerField
      FieldName = 'id'
    end
    object tclientesnombre: TStringField
      FieldName = 'nombre'
      Size = 100
    end
    object tclientescontacto: TStringField
      FieldName = 'contacto'
      Size = 100
    end
    object tclientestelefono: TStringField
      FieldName = 'telefono'
    end
    object tclientesemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object tclientesdireccion: TMemoField
      FieldName = 'direccion'
      BlobType = ftMemo
    end
    object tclientesactivo: TBooleanField
      FieldName = 'activo'
    end
    object tclientesfecha_alta: TDateTimeField
      FieldName = 'fecha_alta'
    end
  end
  object tproductos: TMyTable
    TableName = 'productos'
    Connection = db
    Options.FieldOrigins = foNone
    Left = 56
    Top = 264
    object tproductosid: TIntegerField
      FieldName = 'id'
    end
    object tproductoscodigo: TStringField
      FieldName = 'codigo'
      Size = 50
    end
    object tproductosnombre: TStringField
      FieldName = 'nombre'
      Size = 100
    end
    object tproductosdescripcion: TMemoField
      FieldName = 'descripcion'
      BlobType = ftMemo
    end
    object tproductosprecio_compra: TFloatField
      FieldName = 'precio_compra'
    end
    object tproductosprecio_venta: TFloatField
      FieldName = 'precio_venta'
    end
    object tproductosstock_actual: TIntegerField
      FieldName = 'stock_actual'
    end
    object tproductosactivo: TBooleanField
      FieldName = 'activo'
    end
    object tproductosfecha_alta: TDateTimeField
      FieldName = 'fecha_alta'
    end
    object tproductosfecha_actualizacion: TDateTimeField
      FieldName = 'fecha_actualizacion'
    end
  end
  object tmovimientos: TMyTable
    TableName = 'movimientos'
    MasterFields = 'id'
    DetailFields = 'cliente_id'
    MasterSource = dsclientes
    Connection = db
    Options.FieldOrigins = foNone
    Left = 56
    Top = 336
    object tmovimientosid: TIntegerField
      FieldName = 'id'
    end
    object tmovimientosproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object tmovimientostipo_movimiento: TStringField
      FieldName = 'tipo_movimiento'
      FixedChar = True
      Size = 7
    end
    object tmovimientoscantidad: TIntegerField
      FieldName = 'cantidad'
    end
    object tmovimientosproveedor_id: TIntegerField
      FieldName = 'proveedor_id'
    end
    object tmovimientoscliente_id: TIntegerField
      FieldName = 'cliente_id'
    end
    object tmovimientosfecha_movimiento: TDateTimeField
      FieldName = 'fecha_movimiento'
    end
    object tmovimientosreferencia: TStringField
      FieldName = 'referencia'
      Size = 100
    end
    object tmovimientosobservaciones: TMemoField
      FieldName = 'observaciones'
      BlobType = ftMemo
    end
  end
  object dsproveedores: TDataSource
    DataSet = tproveedores
    Left = 136
    Top = 192
  end
  object dsclientes: TDataSource
    DataSet = tclientes
    Left = 136
    Top = 120
  end
  object dsproductos: TDataSource
    DataSet = tproductos
    Left = 136
    Top = 264
  end
  object dsmovimientos: TDataSource
    DataSet = tmovimientos
    Left = 136
    Top = 336
  end
  object qryMovimientosCliente: TMyQuery
    Connection = db
    Options.FieldOrigins = foNone
    Left = 296
    Top = 56
  end
  object dsMovimientosCliente: TDataSource
    DataSet = qryMovimientosCliente
    Left = 424
    Top = 56
  end
  object MyQuery1: TMyQuery
    Connection = db
    SQL.Strings = (
      'select * from movimientos')
    OnCalcFields = MyQuery1CalcFields
    Options.FieldOrigins = foNone
    Left = 456
    Top = 352
    object MyQuery1id: TIntegerField
      FieldName = 'id'
    end
    object MyQuery1producto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object MyQuery1tipo_movimiento: TStringField
      FieldName = 'tipo_movimiento'
      FixedChar = True
      Size = 7
    end
    object MyQuery1cantidad: TIntegerField
      FieldName = 'cantidad'
    end
    object MyQuery1proveedor_id: TIntegerField
      FieldName = 'proveedor_id'
    end
    object MyQuery1cliente_id: TIntegerField
      FieldName = 'cliente_id'
    end
    object MyQuery1fecha_movimiento: TDateTimeField
      FieldName = 'fecha_movimiento'
    end
    object MyQuery1referencia: TStringField
      FieldName = 'referencia'
      Size = 100
    end
    object MyQuery1observaciones: TMemoField
      FieldName = 'observaciones'
      BlobType = ftMemo
    end
    object MyQuery1nomcli: TStringField
      FieldKind = fkLookup
      FieldName = 'nomcli'
      LookupDataSet = tclientes
      LookupKeyFields = 'id'
      LookupResultField = 'nombre'
      KeyFields = 'cliente_id'
      Size = 40
      Lookup = True
    end
    object MyQuery1nompro: TStringField
      FieldKind = fkLookup
      FieldName = 'nompro'
      LookupDataSet = tproveedores
      LookupKeyFields = 'id'
      LookupResultField = 'nombre'
      KeyFields = 'proveedor_id'
      Size = 40
      Lookup = True
    end
    object MyQuery1import: TFloatField
      FieldKind = fkCalculated
      FieldName = 'import'
      Calculated = True
    end
    object MyQuery1preucompra: TFloatField
      FieldKind = fkLookup
      FieldName = 'preucompra'
      LookupDataSet = tproductos
      LookupKeyFields = 'id'
      LookupResultField = 'precio_compra'
      KeyFields = 'producto_id'
      Lookup = True
    end
  end
  object DataSource1: TDataSource
    DataSet = MyQuery1
    Left = 536
    Top = 352
  end
end
