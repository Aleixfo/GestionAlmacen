unit UOperaciones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, System.StrUtils, Data.DB, Vcl.Grids, Vcl.DBGrids, CRGrid;

type
  TTipoOperacion = (toCompra, toVenta);

  TFOperaciones = class(TForm)
    pcOperaciones: TPageControl;
    tsSeleccionTipo: TTabSheet;
    pnlMain: TPanel;
    gbxSeleccion: TGroupBox;
    rgTipoOperacion: TRadioGroup;
    pnlBotones: TPanel;
    btnContinuar: TButton;
    tsDatosOperacion: TTabSheet;
    pnlDatosMain: TPanel;
    gbxDatosOperacion: TGroupBox;
    lblProveedorCliente: TLabel;
    lblFecha: TLabel;
    lblReferencia: TLabel;
    lblObservaciones: TLabel;
    cbxProveedorCliente: TComboBox;
    dtpFecha: TDateTimePicker;
    edtReferencia: TEdit;
    memObservaciones: TMemo;
    pnlBotonesDatos: TPanel;
    btnAtras: TButton;
    btnSiguienteDatos: TButton;
    tsAgregarProductos: TTabSheet;
    pnlProductosMain: TPanel;
    pnlIzquierda: TPanel;
    gbxBuscarProductos: TGroupBox;
    lblBuscarProducto: TLabel;
    edtBuscarProducto: TEdit;
    btnBuscarProducto: TButton;
    DBGrid1: TDBGrid;
    pnlDerecha: TPanel;
    gbxDetalleProducto: TGroupBox;
    lblProductoSeleccionado: TLabel;
    lblCantidad: TLabel;
    lblPrecio: TLabel;
    edtCantidad: TEdit;
    edtPrecio: TEdit;
    btnAgregarProducto: TButton;
    lblNombreProducto: TLabel;
    GroupBox1: TGroupBox;
    CRDBGrid1: TCRDBGrid;
    btnQuitarProducto: TButton;
    Label1: TLabel;
    edtSubtotal: TEdit;
    pnlBotonesProductos: TPanel;
    btnAtrasProductos: TButton;
    btnSiguienteProductos: TButton;
    dsDetallesTemp: TDataSource;
    tsConfirmacion: TTabSheet;
    pnlConfirmacionMain: TPanel;
    gbxResumenCabecera: TGroupBox;
    lblResumenTipoTexto: TLabel;
    lblResumenProveedorClienteTexto: TLabel;
    lblResumenReferenciaTexto: TLabel;
    lblResumenFechaTexto: TLabel;
    lblResumenObservacionesTexto: TLabel;
    lblResumenTipo: TLabel;
    lblResumenProveedorCliente: TLabel;
    lblResumenReferencia: TLabel;
    lblResumenFecha: TLabel;
    lblResumenObservaciones: TLabel;
    gbxResumenDetalles: TGroupBox;
    DBGridResumen: TDBGrid;
    gbxResumenTotales: TGroupBox;
    lblSubtotalResumen: TLabel;
    lblTotalResumen: TLabel;
    edtTotalResumen: TEdit;
    edtSubtotalResumen: TEdit;
    Panel1: TPanel;
    btnAtrasResumen: TButton;
    btnConfirmarOperacion: TButton;

    procedure btnContinuarClick(Sender: TObject);
    procedure btnAtrasClick(Sender: TObject);
    procedure btnSiguienteDatosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnAgregarProductoClick(Sender: TObject);
    procedure btnQuitarProductoClick(Sender: TObject);
    procedure btnAtrasProductosClick(Sender: TObject);
    procedure btnSiguienteProductosClick(Sender: TObject);
    procedure btnBuscarProductoClick(Sender: TObject);
    procedure edtCantidadChange(Sender: TObject);

    procedure btnAtrasResumenClick(Sender: TObject);
    procedure btnConfirmarOperacionClick(Sender: TObject);

  private
    { Private declarations }

    // Variables Globales
    FTipoOperacion: TTipoOperacion;
    FReferenciaBase: string;//Variable que se empieza a formar en el FormShow
    FProductoSeleccionadoID: Integer;
    FProductoSeleccionadoNombre: string;
    FProductoSeleccionadoPrecio: Double;
    FProveedorClienteID: Integer;
    FProveedorClienteNombre: string;

    // Métodos para la segunda pestaña
    procedure ConfigurarInterfazDatos;
    procedure CargarProveedores;
    procedure CargarClientes;
    procedure GenerarReferencia;
    function ValidarDatosOperacion: Boolean;

    // Métodos para la tercera pestaña
    procedure ConfigurarInterfazProductos;
    procedure CargarProductos;
    procedure BuscarProductos(const Texto: string);
    procedure ActualizarProductoSeleccionado;
    procedure AgregarProductoALista;
    procedure QuitarProductoDeLista;
    procedure CalcularSubtotal;
    function ProductoYaEnLista(ProductoID: Integer): Boolean;
    function ValidarProductosAgregados: Boolean;

    // Métodos para la cuarta pestaña
    procedure ConfigurarInterfazConfirmacion;
    procedure MostrarResumenCabecera;
    procedure CalcularTotalesResumen;
    procedure ProcesarOperacion;
    function ValidarStockParaVenta: Boolean;

  public
    { Public declarations }
    property TipoOperacion: TTipoOperacion read FTipoOperacion;
  end;

var
  FOperaciones: TFOperaciones;

implementation

{$R *.dfm}

uses UDm;

// -----------------------------------------------------------------------------
// ---------------- Logica Inicial Formulario (FormShow) -----------------------
// -----------------------------------------------------------------------------

procedure TFOperaciones.FormShow(Sender: TObject);
begin
  // Forzar la pestaña inicial
  pcOperaciones.ActivePageIndex := 0;

  // Selección por defecto: COMPRA
  rgTipoOperacion.ItemIndex := 0;
  FTipoOperacion := toCompra;

  // Configurar fecha actual
  dtpFecha.Date := Now;

  // Generar referencia base
  GenerarReferencia;
end;

procedure TFOperaciones.GenerarReferencia;
var
  Fecha: string;
begin
  Fecha := FormatDateTime('yymmdd', Now);
  FReferenciaBase := Fecha + '-';
end;

// -----------------------------------------------------------------------------
// ------------------- LOGICA PRIMERA PESTAÑA ----------------------------------
// -----------------------------------------------------------------------------

// BOTÓN (Continuar) de navegacion de la primera pestaña (pasa a la segunda)
procedure TFOperaciones.btnContinuarClick(Sender: TObject);
begin
  // Validar que se seleccionó una opción
  if rgTipoOperacion.ItemIndex = -1 then
  begin
    ShowMessage('Por favor, seleccione un tipo de operación');
    Exit;
  end;

  // Determinar el tipo de operación seleccionado
  case rgTipoOperacion.ItemIndex of
    0: FTipoOperacion := toCompra;
    1: FTipoOperacion := toVenta;
  else
    ShowMessage('Selección no válida');
    Exit;
  end;

  // Configurar interfaz de la segunda pantalla
  ConfigurarInterfazDatos;

  // Ir a la segunda pestaña
  pcOperaciones.ActivePage := tsDatosOperacion;
end;

// -----------------------------------------------------------------------------
// ------------------- LOGICA SEGUNDA PESTAÑA ----------------------------------
// -----------------------------------------------------------------------------

procedure TFOperaciones.btnSiguienteDatosClick(Sender: TObject);
begin
  if not ValidarDatosOperacion then
    Exit;

  // Configurar y cargar productos
  ConfigurarInterfazProductos;

  // Ir a la tercera pestaña
  pcOperaciones.ActivePage := tsAgregarProductos;
end;

procedure TFOperaciones.btnAtrasClick(Sender: TObject);
begin
  // Volver a la primera pestaña
  pcOperaciones.ActivePage := tsSeleccionTipo;
end;

procedure TFOperaciones.ConfigurarInterfazDatos;
begin
  case FTipoOperacion of
    toCompra:
    begin
      gbxDatosOperacion.Caption := 'Datos de Compra a Proveedor';
      lblProveedorCliente.Caption := 'Proveedor:';
      CargarProveedores;
      edtReferencia.Text := FReferenciaBase + 'COMP-001';
    end;
    toVenta:
    begin
      gbxDatosOperacion.Caption := 'Datos de Venta a Cliente';
      lblProveedorCliente.Caption := 'Cliente:';
      CargarClientes;
      edtReferencia.Text := FReferenciaBase + 'VENT-001';
    end;
  end;
end;

procedure TFOperaciones.CargarProveedores;
begin
  cbxProveedorCliente.Clear;
  cbxProveedorCliente.Items.Add('-- Seleccione un proveedor --');

  with dm do
  begin
    if not tproveedores.Active then
      tproveedores.Open;

    tproveedores.First;
    while not tproveedores.Eof do
    begin
      if tproveedores.FieldByName('activo').AsBoolean then
        cbxProveedorCliente.Items.AddObject(
          tproveedores.FieldByName('nombre').AsString + ' - ' +
          tproveedores.FieldByName('contacto').AsString,
          TObject(tproveedores.FieldByName('id').AsInteger)
        );
      tproveedores.Next;
    end;
  end;

  cbxProveedorCliente.ItemIndex := 0;
end;

procedure TFOperaciones.CargarClientes;
begin
  cbxProveedorCliente.Clear;
  cbxProveedorCliente.Items.Add('-- Seleccione un cliente --');

  with dm do
  begin
    if not tclientes.Active then
      tclientes.Open;

    tclientes.First;
    while not tclientes.Eof do
    begin
      if tclientes.FieldByName('activo').AsBoolean then
        cbxProveedorCliente.Items.AddObject(
          tclientes.FieldByName('nombre').AsString + ' - ' +
          tclientes.FieldByName('contacto').AsString,
          TObject(tclientes.FieldByName('id').AsInteger)
        );
      tclientes.Next;
    end;
  end;

  cbxProveedorCliente.ItemIndex := 0;
end;

function TFOperaciones.ValidarDatosOperacion: Boolean;
begin
  Result := False;

  // Validar proveedor/cliente seleccionado
  if cbxProveedorCliente.ItemIndex <= 0 then
  begin
    ShowMessage('Por favor, seleccione un ' +
      IfThen(FTipoOperacion = toCompra, 'proveedor', 'cliente'));
    cbxProveedorCliente.SetFocus;
    Exit;
  end;

  // Validar fecha (no puede ser futura)
  if dtpFecha.Date > Now then
  begin
    ShowMessage('La fecha no puede ser futura');
    dtpFecha.SetFocus;
    Exit;
  end;

  // Validar referencia
  if Trim(edtReferencia.Text) = '' then
  begin
    ShowMessage('La referencia es obligatoria');
    edtReferencia.SetFocus;
    Exit;
  end;

  Result := True;
end;

// -----------------------------------------------------------------------------
// ------------------- LOGICA TERCERA PESTAÑA ----------------------------------
// -----------------------------------------------------------------------------

//BOTÓN (Atras) tercera pestaña, te envia a la segunda (anterior)
procedure TFOperaciones.btnAtrasProductosClick(Sender: TObject);
begin
  // Volver a datos de operación
  pcOperaciones.ActivePage := tsDatosOperacion;
end;

//BOTÓN (Continuar) tercera pestaña, te envia a la cuarta (siguiente)
procedure TFOperaciones.btnSiguienteProductosClick(Sender: TObject);
begin
  if not ValidarProductosAgregados then
    Exit;

  // Guardar datos del proveedor/cliente seleccionado
  if cbxProveedorCliente.ItemIndex > 0 then
  begin
    FProveedorClienteID := Integer(cbxProveedorCliente.Items.Objects[cbxProveedorCliente.ItemIndex]);
    FProveedorClienteNombre := cbxProveedorCliente.Text;
  end;

  // Configurar y mostrar resumen
  ConfigurarInterfazConfirmacion;

  // Ir a la cuarta pestaña
  pcOperaciones.ActivePage := tsConfirmacion;
end;

// -----------------------------------------------------------------------------

procedure TFOperaciones.ConfigurarInterfazProductos;
begin
  // Limpiar selección anterior
  FProductoSeleccionadoID := 0;
  FProductoSeleccionadoNombre := '';
  FProductoSeleccionadoPrecio := 0;
  lblNombreProducto.Caption := '';
  edtPrecio.Text := '';
  edtCantidad.Text := '1';

  // Verificar y preparar la tabla temporal
  if not Assigned(dm.tdetalles_temp) then
    dm.CrearTablaTemporal;

  if not dm.tdetalles_temp.Active then
    dm.tdetalles_temp.Active := True;

  // Limpiar lista
  if not dm.tdetalles_temp.IsEmpty then
    dm.tdetalles_temp.EmptyDataSet;

  // Cargar productos disponibles
  CargarProductos;

  CalcularSubtotal;
end;

procedure TFOperaciones.CargarProductos;
begin
  // Cargar todos los productos activos
  with dm do
  begin
    if not tproductos.Active then
      tproductos.Open;

    tproductos.Filter := 'activo = True';
    tproductos.Filtered := True;
  end;
end;

procedure TFOperaciones.btnBuscarProductoClick(Sender: TObject);
begin
  BuscarProductos(Trim(edtBuscarProducto.Text));
end;

procedure TFOperaciones.BuscarProductos(const Texto: string);
begin
  with dm.tproductos do
  begin
    Filtered := False;
    if Texto <> '' then
    begin
      Filter := 'nombre LIKE ''%' + Texto + '%'' AND activo = True';
      Filtered := True;
    end
    else
    begin
      Filter := 'activo = True';
      Filtered := True;
    end;
  end;
end;

procedure TFOperaciones.DBGrid1CellClick(Column: TColumn);
begin
  ActualizarProductoSeleccionado;
end;

procedure TFOperaciones.ActualizarProductoSeleccionado;
begin
  if not dm.tproductos.IsEmpty then
  begin
    FProductoSeleccionadoID := dm.tproductos.FieldByName('id').AsInteger;
    FProductoSeleccionadoNombre := dm.tproductos.FieldByName('nombre').AsString;

    // Determinar precio según tipo de operación
    case FTipoOperacion of
      toCompra:
        FProductoSeleccionadoPrecio := dm.tproductos.FieldByName('precio_compra').AsFloat;
      toVenta:
        FProductoSeleccionadoPrecio := dm.tproductos.FieldByName('precio_venta').AsFloat;
    end;

    // Actualizar interfaz
    lblNombreProducto.Caption := FProductoSeleccionadoNombre;
    edtPrecio.Text := FormatFloat('#,##0.00', FProductoSeleccionadoPrecio);
  end;
end;

procedure TFOperaciones.btnAgregarProductoClick(Sender: TObject);
begin
  if FProductoSeleccionadoID = 0 then
  begin
    ShowMessage('Por favor, seleccione un producto primero');
    Exit;
  end;

  try
    if StrToInt(edtCantidad.Text) <= 0 then
    begin
      ShowMessage('La cantidad debe ser mayor a 0');
      Exit;
    end;
  except
    ShowMessage('Cantidad no válida');
    Exit;
  end;

  AgregarProductoALista;
end;


procedure TFOperaciones.AgregarProductoALista;
var
  Cantidad: Integer;
  SubtotalProducto: Double;
begin
  Cantidad := StrToInt(edtCantidad.Text);
  SubtotalProducto := Cantidad * FProductoSeleccionadoPrecio;

  if ProductoYaEnLista(FProductoSeleccionadoID) then
  begin
    // Sumar a la cantidad existente
    with dm.tdetalles_temp do
    begin
      First;
      while not Eof do
      begin
        if FieldByName('producto_id').AsInteger = FProductoSeleccionadoID then
        begin
          Edit;
          FieldByName('cantidad').AsInteger := FieldByName('cantidad').AsInteger + Cantidad;
          FieldByName('subtotal').AsFloat := FieldByName('subtotal').AsFloat + SubtotalProducto;
          Post;
          Break;
        end;
        Next;
      end;
    end;
  end
  else
  begin
    // Agregar nuevo registro
    dm.tdetalles_temp.Append;
    dm.tdetalles_temp.FieldByName('producto_id').AsInteger := FProductoSeleccionadoID;
    dm.tdetalles_temp.FieldByName('nombre').AsString := FProductoSeleccionadoNombre;
    dm.tdetalles_temp.FieldByName('cantidad').AsInteger := Cantidad;
    dm.tdetalles_temp.FieldByName('precio').AsFloat := FProductoSeleccionadoPrecio;
    dm.tdetalles_temp.FieldByName('subtotal').AsFloat := SubtotalProducto;
    dm.tdetalles_temp.Post;
  end;

  // ✅ SOLUCIÓN: Aplicar cambios y refrescar correctamente
  if dm.tdetalles_temp.ChangeCount > 0 then
    dm.tdetalles_temp.MergeChangeLog;

  // Refrescar el grid de forma más simple
  dsDetallesTemp.DataSet := nil;
  dsDetallesTemp.DataSet := dm.tdetalles_temp;

  CalcularSubtotal;

  // Limpiar para siguiente producto
  edtCantidad.Text := '1';
end;

function TFOperaciones.ProductoYaEnLista(ProductoID: Integer): Boolean;
begin
  Result := False;
  with dm.tdetalles_temp do
  begin
    First;
    while not Eof do
    begin
      if FieldByName('producto_id').AsInteger = ProductoID then
      begin
        Result := True;
        Exit;
      end;
      Next;
    end;
  end;
end;

procedure TFOperaciones.btnQuitarProductoClick(Sender: TObject);
begin
  QuitarProductoDeLista;
end;

procedure TFOperaciones.QuitarProductoDeLista;
begin
  if not dm.tdetalles_temp.IsEmpty then
  begin
    dm.tdetalles_temp.Delete;

    // ✅ FORZAR ACTUALIZACIÓN DEL GRID
    dm.tdetalles_temp.Refresh;

    CalcularSubtotal;
  end
  else
    ShowMessage('No hay productos para quitar');
end;

procedure TFOperaciones.CalcularSubtotal;
var
  Subtotal: Double;
begin
  Subtotal := 0;

  with dm.tdetalles_temp do
  begin
    First;
    while not Eof do
    begin
      Subtotal := Subtotal + FieldByName('subtotal').AsFloat;
      Next;
    end;
  end;

  edtSubtotal.Text := FormatFloat('#,##0.00', Subtotal);
end;

procedure TFOperaciones.edtCantidadChange(Sender: TObject);
begin
  // Validación básica en tiempo real
  // Puedes agregar validaciones aquí si necesitas
end;

function TFOperaciones.ValidarProductosAgregados: Boolean;
begin
  Result := False;

  if dm.tdetalles_temp.IsEmpty then
  begin
    ShowMessage('Debe agregar al menos un producto');
    Exit;
  end;

  Result := True;
end;

// -----------------------------------------------------------------------------
// ------------------- LOGICA CUARTA PESTAÑA -----------------------------------
// -----------------------------------------------------------------------------

procedure TFOperaciones.btnConfirmarOperacionClick(Sender: TObject);
begin
  if MessageDlg('¿Confirmar la operación? Esta acción no se puede deshacer.',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // Validar stock para ventas
    if FTipoOperacion = toVenta then
    begin
      if not ValidarStockParaVenta then
        Exit;
    end;

    // Procesar la operación
    ProcesarOperacion;

    ShowMessage('Operación realizada correctamente');
    Close;
  end;
end;

procedure TFOperaciones.btnAtrasResumenClick(Sender: TObject);
begin
  // Volver a productos
  pcOperaciones.ActivePage := tsAgregarProductos;
end;

procedure TFOperaciones.ConfigurarInterfazConfirmacion;
begin
  // Mostrar datos de cabecera
  MostrarResumenCabecera;

  // Calcular y mostrar totales
  CalcularTotalesResumen;
end;

procedure TFOperaciones.MostrarResumenCabecera;
begin
  // Configurar según tipo de operación
  case FTipoOperacion of
    toCompra:
    begin
      lblResumenTipo.Caption := 'COMPRA';
      lblResumenProveedorClienteTexto.Caption := 'Proveedor:';
    end;
    toVenta:
    begin
      lblResumenTipo.Caption := 'VENTA';
      lblResumenProveedorClienteTexto.Caption := 'Cliente:';
    end;
  end;

  // Mostrar datos
  lblResumenProveedorCliente.Caption := FProveedorClienteNombre;
  lblResumenReferencia.Caption := edtReferencia.Text;
  lblResumenFecha.Caption := DateToStr(dtpFecha.Date);

  if Trim(memObservaciones.Text) <> '' then
    lblResumenObservaciones.Caption := memObservaciones.Text
  else
    lblResumenObservaciones.Caption := '(Sin observaciones)';
end;

procedure TFOperaciones.CalcularTotalesResumen;
var
  Subtotal: Double;
begin
  Subtotal := 0;

  with dm.tdetalles_temp do
  begin
    First;
    while not Eof do
    begin
      Subtotal := Subtotal + FieldByName('subtotal').AsFloat;
      Next;
    end;
  end;

  // Mostrar totales (por ahora sin IVA)
  edtSubtotalResumen.Text := FormatFloat('#,##0.00', Subtotal);
  edtTotalResumen.Text := FormatFloat('#,##0.00', Subtotal);
end;

function TFOperaciones.ValidarStockParaVenta: Boolean;
var
  StockDisponible, CantidadRequerida: Integer;
begin
  Result := True;

  with dm.tdetalles_temp do
  begin
    First;
    while not Eof do
    begin
      // Buscar el producto en la base de datos
      if dm.tproductos.Locate('id', FieldByName('producto_id').AsInteger, []) then
      begin
        StockDisponible := dm.tproductos.FieldByName('stock_actual').AsInteger;
        CantidadRequerida := FieldByName('cantidad').AsInteger;

        if CantidadRequerida > StockDisponible then
        begin
          ShowMessage('Stock insuficiente para: ' + FieldByName('nombre').AsString +
                     '. Stock disponible: ' + IntToStr(StockDisponible) +
                     ', Cantidad requerida: ' + IntToStr(CantidadRequerida));
          Result := False;
          Exit;
        end;
      end;
      Next;
    end;
  end;
end;

procedure TFOperaciones.ProcesarOperacion;
var
  ContactoID: Integer;
  TipoMovimiento: string;
begin
  // Determinar tipo de movimiento y contacto
  case FTipoOperacion of
    toCompra:
    begin
      TipoMovimiento := 'ENTRADA';
      ContactoID := FProveedorClienteID;
    end;
    toVenta:
    begin
      TipoMovimiento := 'SALIDA';
      ContactoID := FProveedorClienteID;
    end;
  end;

  // Procesar cada producto
  with dm.tdetalles_temp do
  begin
    First;
    while not Eof do
    begin
      // 1. Crear movimiento
      dm.tmovimientos.Append;
      dm.tmovimientos.FieldByName('producto_id').AsInteger := FieldByName('producto_id').AsInteger;
      dm.tmovimientos.FieldByName('tipo_movimiento').AsString := TipoMovimiento;
      dm.tmovimientos.FieldByName('cantidad').AsInteger := FieldByName('cantidad').AsInteger;

      // Asignar proveedor o cliente según el tipo
      if FTipoOperacion = toCompra then
      begin
        dm.tmovimientos.FieldByName('proveedor_id').AsInteger := ContactoID;
        dm.tmovimientos.FieldByName('cliente_id').Clear;
      end
      else
      begin
        dm.tmovimientos.FieldByName('cliente_id').AsInteger := ContactoID;
        dm.tmovimientos.FieldByName('proveedor_id').Clear;
      end;

      dm.tmovimientos.FieldByName('referencia').AsString := edtReferencia.Text;
      dm.tmovimientos.FieldByName('observaciones').AsString := memObservaciones.Text;
      dm.tmovimientos.FieldByName('fecha_movimiento').AsDateTime := dtpFecha.Date;
      dm.tmovimientos.Post;

      // 2. Actualizar stock del producto
      if dm.tproductos.Locate('id', FieldByName('producto_id').AsInteger, []) then
      begin
        dm.tproductos.Edit;
        if FTipoOperacion = toCompra then
          dm.tproductos.FieldByName('stock_actual').AsInteger :=
            dm.tproductos.FieldByName('stock_actual').AsInteger + FieldByName('cantidad').AsInteger
        else
          dm.tproductos.FieldByName('stock_actual').AsInteger :=
            dm.tproductos.FieldByName('stock_actual').AsInteger - FieldByName('cantidad').AsInteger;
        dm.tproductos.Post;
      end;

      Next;
    end;
  end;

  // Limpiar tabla temporal
  dm.tdetalles_temp.EmptyDataSet;
end;



end.//END of FILE (.pas)
