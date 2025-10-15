unit UProductos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, UDm, Vcl.Mask;

type
  TFProductos = class(TForm)
    pnlMain: TPanel;
    grdProductos: TDBGrid;
    pnlBotones: TPanel;
    btnNuevo: TButton;
    btnDesactivar: TButton;

    btnActivar: TButton;
    btnGuardar: TButton;
    pnlGrid: TPanel;
    pnlDatos: TPanel;
    lblPrecioCompra: TLabel;
    lblPrecioVenta: TLabel;
    lblStock: TLabel;
    lblActivo: TLabel;
    lblID: TLabel;
    lblCodigo: TLabel;
    lblNombre: TLabel;
    lblObservaciones: TLabel;
    lblFechaAlta: TLabel;
    lblFechaMod: TLabel;
    dbeID: TDBEdit;
    dbeCodigo: TDBEdit;
    dbeNombre: TDBEdit;
    dbePrecioCompra: TDBEdit;
    dbePrecioVenta: TDBEdit;
    dbeStock: TDBEdit;
    dbeFechaAlta: TDBEdit;
    dbeFechaMod: TDBEdit;
    dbmDescripcion: TDBMemo;
    dbcbActivo: TDBCheckBox;
    btnEliminar: TButton;
    lblBuscarID: TLabel;
    lblBuscarNombre: TLabel;
    btnBuscar: TButton;
    btnLimpiarFiltros: TButton;
    edtBuscarID: TEdit;
    edtBuscarNombre: TEdit;

    // Procedimientos de UProductos
    procedure FormShow(Sender: TObject); // Logica al cargar el formulario de productos

    // Logica botones
    procedure btnNuevoClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnDesactivarClick(Sender: TObject);
    procedure btnActivarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnLimpiarFiltrosClick(Sender: TObject);
    procedure edtBuscarIDKeyPress(Sender: TObject; var Key: Char);
    procedure edtBuscarNombreKeyPress(Sender: TObject; var Key: Char);

  private

    { Private declarations }
    procedure AplicarFiltros;
    procedure LimpiarFiltros;

  public
    { Public declarations }
  end;

var
  FProductos: TFProductos;

implementation

{$R *.dfm}

// -----------------------------------------------------------------------------
// ---------------- Logica Inicial Formulario (FormShow) -----------------------
// -----------------------------------------------------------------------------

procedure TFProductos.FormShow(Sender: TObject);
begin
  // Asegurar que la tabla está abierta
  if not dm.tproductos.Active then
    dm.tproductos.Open;
end;

// -----------------------------------------------------------------------------
// -------------------- SISTEMA DE FILTRADO ------------------------------------
// -----------------------------------------------------------------------------

procedure TFProductos.AplicarFiltros;
var
  Filtro: string;
begin
  Filtro := '';

  // Filtro por ID (solo si se ingresó un valor)
  if Trim(edtBuscarID.Text) <> '' then
  begin
    try
      // Validar que sea un número válido
      StrToInt(edtBuscarID.Text);
      Filtro := 'id = ' + edtBuscarID.Text;
    except
      on E: EConvertError do
      begin
        ShowMessage('Por favor, ingrese un ID válido (número entero)');
        edtBuscarID.SetFocus;
        edtBuscarID.SelectAll;
        Exit;
      end;
    end;
  end;

  // Filtro por nombre (solo si se ingresó un valor)
  if Trim(edtBuscarNombre.Text) <> '' then
  begin
    if Filtro <> '' then
      Filtro := Filtro + ' AND ';

    Filtro := Filtro + 'nombre LIKE ' + QuotedStr('%' + edtBuscarNombre.Text + '%');
  end;

  // Aplicar el filtro al dataset
  dm.tproductos.Filtered := False;
  dm.tproductos.Filter := Filtro;

  if Filtro <> '' then
    dm.tproductos.Filtered := True;
end;

procedure TFProductos.LimpiarFiltros;
begin
  edtBuscarID.Clear;
  edtBuscarNombre.Clear;

  dm.tproductos.Filtered := False;
  dm.tproductos.Filter := '';
end;

procedure TFProductos.btnBuscarClick(Sender: TObject);
begin
  AplicarFiltros;
end;

procedure TFProductos.btnLimpiarFiltrosClick(Sender: TObject);
begin
  LimpiarFiltros;
end;

procedure TFProductos.edtBuscarIDKeyPress(Sender: TObject; var Key: Char);
begin
  // Permitir solo números, backspace y enter
  if not (Key in ['0'..'9', #8, #13]) then
    Key := #0
  else if Key = #13 then  // Presionó Enter
    AplicarFiltros;
end;

procedure TFProductos.edtBuscarNombreKeyPress(Sender: TObject; var Key: Char);
begin
  // Permitir búsqueda con Enter
  if Key = #13 then
    AplicarFiltros;
end;

// -----------------------------------------------------------------------------
// ---------------- Lógica Nuevo (Botón Nuevo) ---------------------------------
// -----------------------------------------------------------------------------

procedure TFProductos.btnNuevoClick(Sender: TObject);
begin
  try

    // Iniciar inserción de nuevo registro
    dm.tproductos.Append;

    // Establecer valores por defecto
    dm.tproductos.FieldByName('id').AsInteger := dm.ProximoIDProducto;
    dm.tproductos.FieldByName('activo').AsBoolean := True;
    dm.tproductos.FieldByName('stock_actual').AsInteger := 0;
    dm.tproductos.FieldByName('precio_compra').AsFloat := 0.00;
    dm.tproductos.FieldByName('precio_venta').AsFloat := 0.00;
    dm.tproductos.FieldByName('fecha_alta').AsDateTime := Now;

    // Poner foco en el primer campo
    dbeCodigo.SetFocus;

  except
    on E: Exception do
    begin
      ShowMessage('Error al crear nuevo producto: ' + E.Message);
      dm.tproductos.Cancel;
    end;
  end;

end;

// -----------------------------------------------------------------------------
// ---------------- Lógica Guardar (Botón Guardar) -----------------------------
// -----------------------------------------------------------------------------

procedure TFProductos.btnGuardarClick(Sender: TObject);
begin
  if dm.tproductos.State in [dsEdit, dsInsert] then
  begin
    try
      // Validaciones básicas antes de guardar
      if Trim(dm.tproductos.FieldByName('codigo').AsString) = '' then
      begin
        ShowMessage('El código es obligatorio');
        dbeCodigo.SetFocus;
        Exit;
      end;

      if Trim(dm.tproductos.FieldByName('nombre').AsString) = '' then
      begin
        ShowMessage('El nombre es obligatorio');
        dbeNombre.SetFocus;
        Exit;
      end;

      // Guardar los cambios
      dm.tproductos.Post;


      ShowMessage('Producto guardado correctamente');

    except
      on E: Exception do
      begin
        ShowMessage('Error al guardar: ' + E.Message);
        dm.tproductos.Cancel;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------
// ---------------- Lógica Eliminar (Botón Eliminar) ---------------------------
// -----------------------------------------------------------------------------

procedure TFProductos.BtnEliminarClick(Sender: TObject);
begin
  if not dm.tproductos.IsEmpty then
  begin
    if MessageDlg('¿Eliminar este producto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      dm.tproductos.Delete;
  end
  else
    ShowMessage('No hay productos para eliminar');
end;

// -----------------------------------------------------------------------------
// ---------------- Lógica Activar (Botón Activar) -----------------------------
// -----------------------------------------------------------------------------

procedure TFProductos.btnActivarClick(Sender: TObject);
begin
  if not dm.tproductos.IsEmpty then
  begin

    if dm.tproductos.FieldByName('activo').AsBoolean then
    begin
      ShowMessage('Este producto ya está activo');
      Exit;
    end;

    if MessageDlg('¿Activar el producto: ' + dm.tproductos.FieldByName('nombre').AsString + '?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        dm.tproductos.Edit;
        dm.tproductos.FieldByName('activo').AsBoolean := True;
        dm.tproductos.FieldByName('fecha_actualizacion').AsDateTime := Now;
        dm.tproductos.Post;

        ShowMessage('Producto activado correctamente');

      except
        on E: Exception do
          ShowMessage('Error al activar: ' + E.Message);
      end;
    end;
  end
  else
    ShowMessage('No hay productos para activar');
end;

// -----------------------------------------------------------------------------
// ---------------- Lógica Desactivar (Botón Desactivar) -----------------------
// -----------------------------------------------------------------------------

procedure TFProductos.btnDesactivarClick(Sender: TObject);
begin
  if not dm.tproductos.IsEmpty then
  begin

    if not dm.tproductos.FieldByName('activo').AsBoolean then
    begin
      ShowMessage('Este producto ya está dado de baja');
      Exit;
    end;

    if MessageDlg('¿Dar de baja el producto: ' + dm.tproductos.FieldByName('nombre').AsString + '?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        dm.tproductos.Edit;
        dm.tproductos.FieldByName('activo').AsBoolean := False;
        dm.tproductos.FieldByName('fecha_actualizacion').AsDateTime := Now;
        dm.tproductos.Post;

        ShowMessage('Producto dado de baja correctamente');

      except
        on E: Exception do
          ShowMessage('Error al dar de baja: ' + E.Message);
      end;
    end;
  end
  else
    ShowMessage('No hay productos para eliminar');
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

end.// END OF .PAS

