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
    Top = 200
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
    Top = 128
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
    Top = 272
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
    Connection = db
    Options.FieldOrigins = foNone
    Left = 56
    Top = 344
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
    Top = 200
  end
  object dsclientes: TDataSource
    DataSet = tclientes
    Left = 136
    Top = 128
  end
  object dsproductos: TDataSource
    DataSet = tproductos
    Left = 136
    Top = 272
  end
  object dsmovimientos: TDataSource
    DataSet = tmovimientos
    Left = 144
    Top = 344
  end
  object qryMovimientosCliente: TMyQuery
    Connection = db
    Left = 248
    Top = 136
  end
  object dsMovimientosCliente: TDataSource
    DataSet = qryMovimientosCliente
    Left = 328
    Top = 136
  end
end
