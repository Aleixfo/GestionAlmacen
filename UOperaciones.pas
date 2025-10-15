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

  private
    { Private declarations }

    // Variables Globales
    FTipoOperacion: TTipoOperacion;
    FReferenciaBase: string;//Variable que se empieza a formar en el FormShow
    FProductoSeleccionadoID: Integer;
    FProductoSeleccionadoNombre: string;
    FProductoSeleccionadoPrecio: Double;

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

  ShowMessage('Productos validados. Próximo: Confirmación');
  // Aquí iríamos a la cuarta pestaña (confirmación)
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





end.//END of FILE (.pas)
