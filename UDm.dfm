object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 517
  Width = 757
  object db: TMyConnection
    Database = 'gestion_almacen'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    Left = 336
    Top = 32
    EncryptedPassword = '8DFF90FF90FF8BFF'
  end
  object tproveedores: TMyTable
    TableName = 'proveedores'
    Connection = db
    Options.FieldOrigins = foNone
    Left = 136
    Top = 216
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
    Left = 136
    Top = 144
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
    Left = 136
    Top = 288
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
    Left = 136
    Top = 352
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
    Left = 216
    Top = 216
  end
  object dsclientes: TDataSource
    DataSet = tclientes
    Left = 216
    Top = 144
  end
  object dsproductos: TDataSource
    DataSet = tproductos
    Left = 216
    Top = 288
  end
  object dsmovimientos: TDataSource
    DataSet = tmovimientos
    Left = 216
    Top = 352
  end
  object qryMovimientosCliente: TMyQuery
    Connection = db
    SQL.Strings = (
      'SELECT m.id,'
      'm.fecha_movimiento,'
      'm.tipo_movimiento,'
      'p.precio_venta as producto_precio,'
      'p.nombre as producto_nombre,'
      'm.cantidad,'
      'm.referencia,'
      'm.observaciones, '
      '(p.precio_venta * m.cantidad) as total'
      'FROM movimientos m'
      'JOIN productos p'
      'ON m.producto_id = p.id'
      'WHERE m.cliente_id = :cliente_id'
      'ORDER BY m.fecha_movimiento DESC')
    Options.FieldOrigins = foNone
    MasterSource = dsclientes
    Left = 400
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cliente_id'
        ParamType = ptInput
        Value = nil
      end>
    object qryMovimientosClienteid: TIntegerField
      FieldName = 'id'
    end
    object qryMovimientosClientefecha_movimiento: TDateTimeField
      FieldName = 'fecha_movimiento'
    end
    object qryMovimientosClientetipo_movimiento: TStringField
      FieldName = 'tipo_movimiento'
      FixedChar = True
      Size = 7
    end
    object qryMovimientosClienteproducto_precio: TFloatField
      FieldName = 'producto_precio'
      OnGetText = qryMovimientosClienteproducto_precioGetText
    end
    object qryMovimientosClienteproducto_nombre: TStringField
      FieldName = 'producto_nombre'
      Size = 100
    end
    object qryMovimientosClientecantidad: TIntegerField
      FieldName = 'cantidad'
    end
    object qryMovimientosClientereferencia: TStringField
      FieldName = 'referencia'
      Size = 100
    end
    object qryMovimientosClienteobservaciones: TMemoField
      FieldName = 'observaciones'
      BlobType = ftMemo
    end
    object qryMovimientosClientetotal: TFloatField
      FieldName = 'total'
      OnGetText = qryMovimientosClientetotalGetText
    end
  end
  object dsMovimientosCliente: TDataSource
    DataSet = qryMovimientosCliente
    Left = 528
    Top = 144
  end
  object qryMovimientosProveedor: TMyQuery
    Connection = db
    SQL.Strings = (
      'SELECT m.id,'
      'm.fecha_movimiento,'
      'm.tipo_movimiento,'
      'm.proveedor_id as id_proveedor,'
      'p.precio_compra as producto_precio,'
      'p.nombre as producto_nombre,'
      'm.cantidad,'
      'm.referencia,'
      'm.observaciones, '
      '(p.precio_venta * m.cantidad) as total'
      'FROM movimientos m'
      'JOIN productos p'
      'ON m.producto_id = p.id'
      'WHERE m.proveedor_id = :proveedor_id '
      'ORDER BY m.fecha_movimiento DESC')
    OnCalcFields = qryMovimientosProveedorCalcFields
    Options.FieldOrigins = foNone
    MasterSource = dsproveedores
    DetailFields = 'proveedor_id'
    Left = 400
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'proveedor_id'
        ParamType = ptInput
        Value = nil
      end>
    object qryMovimientosProveedorid: TIntegerField
      FieldName = 'id'
    end
    object qryMovimientosProveedorfecha_movimiento: TDateTimeField
      FieldName = 'fecha_movimiento'
    end
    object qryMovimientosProveedortipo_movimiento: TStringField
      FieldName = 'tipo_movimiento'
      FixedChar = True
      Size = 7
    end
    object qryMovimientosProveedorproducto_precio: TFloatField
      FieldName = 'producto_precio'
    end
    object qryMovimientosProveedorproducto_nombre: TStringField
      FieldName = 'producto_nombre'
      Size = 100
    end
    object qryMovimientosProveedorcantidad: TIntegerField
      FieldName = 'cantidad'
    end
    object qryMovimientosProveedorreferencia: TStringField
      FieldName = 'referencia'
      Size = 100
    end
    object qryMovimientosProveedorobservaciones: TMemoField
      FieldName = 'observaciones'
      BlobType = ftMemo
    end
    object qryMovimientosProveedortotal: TFloatField
      FieldName = 'total'
    end
    object qryMovimientosProveedorid_proveedor: TIntegerField
      FieldName = 'id_proveedor'
    end
    object qryMovimientosProveedornompro: TStringField
      FieldKind = fkLookup
      FieldName = 'nompro'
      LookupDataSet = tproveedores
      LookupKeyFields = 'id'
      LookupResultField = 'nombre'
      KeyFields = 'id_proveedor'
      Size = 40
      Lookup = True
    end
  end
  object dsMovimientosProveedor: TDataSource
    DataSet = qryMovimientosProveedor
    Left = 528
    Top = 216
  end
  object qryReferencias: TMyQuery
    Connection = db
    SQL.Strings = (
      'SELECT DISTINCT referencia '
      'FROM movimientos '
      'WHERE referencia IS NOT NULL '
      '  AND referencia != '#39#39
      '  AND (:cliente_id = 0 OR cliente_id = :cliente_id)'
      '  AND (:proveedor_id = 0 OR proveedor_id = :proveedor_id)'
      'ORDER BY referencia DESC')
    Options.FieldOrigins = foNone
    Left = 400
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'cliente_id'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'proveedor_id'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'proveedor_id'
        Value = nil
      end>
  end
  object qryDetallePedido: TMyQuery
    Connection = db
    SQL.Strings = (
      'SELECT '
      '  p.codigo,'
      '  p.nombre as producto,'
      '  m.cantidad,'
      '  m.tipo_movimiento,'
      '  p.precio_compra,'
      '  p.precio_venta,'
      '  CASE WHEN m.tipo_movimiento = '#39'ENTRADA'#39' '
      '       THEN m.cantidad * p.precio_compra'
      '       ELSE m.cantidad * p.precio_venta'
      '  END as total_linea,'
      '  prov.nombre as proveedor,'
      '  cli.nombre as cliente'
      'FROM movimientos m'
      'INNER JOIN productos p ON m.producto_id = p.id'
      'LEFT JOIN proveedores prov ON m.proveedor_id = prov.id'
      'LEFT JOIN clientes cli ON m.cliente_id = cli.id'
      'WHERE m.referencia = :referencia'
      'ORDER BY p.nombre')
    Options.FieldOrigins = foNone
    Left = 400
    Top = 280
    ParamData = <
      item
        DataType = ftString
        Name = 'referencia'
        ParamType = ptInput
        Value = nil
      end>
    object qryDetallePedidocodigo: TStringField
      FieldName = 'codigo'
      Size = 50
    end
    object qryDetallePedidoproducto: TStringField
      FieldName = 'producto'
      Size = 100
    end
    object qryDetallePedidocantidad: TIntegerField
      FieldName = 'cantidad'
    end
    object qryDetallePedidotipo_movimiento: TStringField
      FieldName = 'tipo_movimiento'
      FixedChar = True
      Size = 7
    end
    object qryDetallePedidoprecio_compra: TFloatField
      FieldName = 'precio_compra'
    end
    object qryDetallePedidoprecio_venta: TFloatField
      FieldName = 'precio_venta'
    end
    object qryDetallePedidototal_linea: TFloatField
      FieldName = 'total_linea'
    end
    object qryDetallePedidoproveedor: TStringField
      FieldName = 'proveedor'
      Size = 100
    end
    object qryDetallePedidocliente: TStringField
      FieldName = 'cliente'
      Size = 100
    end
  end
  object dsDetallePedido: TDataSource
    DataSet = qryDetallePedido
    Left = 528
    Top = 280
  end
  object qryAutoIncrement: TMyQuery
    Connection = db
    SQL.Strings = (
      'SELECT auto_increment'
      'FROM information_schema.TABLES'
      'WHERE TABLE_SCHEMA = DATABASE()'
      'AND TABLE_NAME = '#39'productos'#39)
    Options.FieldOrigins = foNone
    Left = 560
    Top = 408
  end
  object tdetalles_temp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 48
    object tdetalles_tempproducto_id: TIntegerField
      FieldName = 'producto_id'
    end
    object tdetalles_tempnombre: TStringField
      FieldName = 'nombre'
      Size = 50
    end
    object tdetalles_tempcantidad: TIntegerField
      FieldName = 'cantidad'
    end
    object tdetalles_tempprecio: TFloatField
      FieldName = 'precio'
    end
    object tdetalles_tempsubtotal: TFloatField
      FieldName = 'subtotal'
    end
  end
end
