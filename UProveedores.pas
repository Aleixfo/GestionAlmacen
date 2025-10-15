unit UProveedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, UDm, CRGrid, Vcl.Mask, UMovimientosProveedor;

type
  TFProveedores = class(TForm)
    pnlBotones: TPanel;
    btnNuevo: TButton;
    btnGuardar: TButton;
    btnEliminar: TButton;
    pnlGrid: TPanel;
    CRDBGrid1: TCRDBGrid;
    pnlDatos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    GroupBox1: TGroupBox;
    dbeID: TDBEdit;
    dbeNombre: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    cbxActivo: TDBCheckBox;
    btnMovimientos: TButton;
    btnActivar: TButton;
    btnDesactivar: TButton;
    lblBuscarID: TLabel;
    lblBuscarNombre: TLabel;
    edtBuscarID: TEdit;
    edtBuscarNombre: TEdit;
    btnBuscar: TButton;
    btnLimpiar: TButton;

    // Procedimientos de UProveedores
    procedure FormShow(Sender: TObject);

    procedure btnNuevoClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnMovimientosClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure edtBuscarIDKeyPress(Sender: TObject; var Key: Char);
    procedure edtBuscarNombreKeyPress(Sender: TObject; var Key: Char);
    procedure btnActivarClick(Sender: TObject);
    procedure btnDesactivarClick(Sender: TObject);

  private

    { Private declarations }
    procedure AplicarFiltros;
    procedure LimpiarFiltros;

  public
    { Public declarations }
  end;

var
  FProveedores: TFProveedores;

implementation

{$R *.dfm}

// -----------------------------------------------------------------------------
// ---------------- Logica Inicial Formulario (FormShow) -----------------------
// -----------------------------------------------------------------------------

procedure TFProveedores.FormShow(Sender: TObject);
begin

  // Asegurar que la tabla está abierta
  if not dm.tproveedores.Active then
    dm.tproveedores.Open;
end;

// -----------------------------------------------------------------------------
// -------------------- Logica Ver Movimientos (Linkeo) ------------------------
// -----------------------------------------------------------------------------

procedure TFProveedores.btnMovimientosClick(Sender: TObject);
begin
if not dm.tproveedores.IsEmpty then
  begin
    // Crear y mostrar el formulario de movimientos
    with TFMovimientosProveedor.Create(Self) do
    try
      // Pasar el ID y nombre del proveedor seleccionado
      ProveedorID := dm.tproveedores.FieldByName('id').AsInteger;
      ProveedorNombre := dm.tproveedores.FieldByName('nombre').AsString;
      ShowModal;
    finally
      Free;
    end;
  end
  else
    ShowMessage('Por favor, seleccione un proveedor primero');
end;

// -----------------------------------------------------------------------------
// -------------------- SISTEMA DE FILTRADO ------------------------------------
// -----------------------------------------------------------------------------

procedure TFProveedores.AplicarFiltros;
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
  dm.tproveedores.Filtered := False;
  dm.tproveedores.Filter := Filtro;

  if Filtro <> '' then
    dm.tproveedores.Filtered := True;
end;

procedure TFProveedores.LimpiarFiltros;
begin
  edtBuscarID.Clear;
  edtBuscarNombre.Clear;

  dm.tproveedores.Filtered := False;
  dm.tproveedores.Filter := '';
end;

procedure TFProveedores.btnBuscarClick(Sender: TObject);
begin
  AplicarFiltros;
end;

procedure TFProveedores.btnLimpiarClick(Sender: TObject);
begin
  LimpiarFiltros;
end;

procedure TFProveedores.edtBuscarIDKeyPress(Sender: TObject; var Key: Char);
begin
  // Permitir solo números, backspace y enter
  if not (Key in ['0'..'9', #8, #13]) then
    Key := #0
  else if Key = #13 then  // Presionó Enter
    AplicarFiltros;
end;

procedure TFProveedores.edtBuscarNombreKeyPress(Sender: TObject; var Key: Char);
begin
  // Permitir búsqueda con Enter
  if Key = #13 then
    AplicarFiltros;
end;

// -----------------------------------------------------------------------------
// ------------------ Logica Crear (Boton Nuevo) -------------------------------
// -----------------------------------------------------------------------------

procedure TFProveedores.btnNuevoClick(Sender: TObject);
begin
  try

    // Iniciar inserción de nuevo registro
    dm.tproveedores.Append;

    // Establecer valores por defecto
    dm.tproveedores.FieldByName('id').AsInteger := dm.ProximoIDProveedor;
    dm.tproveedores.FieldByName('activo').AsBoolean := True;
    dm.tproveedores.FieldByName('fecha_alta').AsDateTime := Now;

    // Poner foco en el primer campo
    dbeNombre.SetFocus;

  except
    on E: Exception do
    begin
      ShowMessage('Error al crear nuevo proveedor: ' + E.Message);
      dm.tproveedores.Cancel;
    end;
  end;
end;

// -----------------------------------------------------------------------------
// ---------------- Lógica Guardar (Botón Guardar) -----------------------------
// -----------------------------------------------------------------------------

procedure TFProveedores.btnGuardarClick(Sender: TObject);
begin
  if dm.tproveedores.State in [dsEdit, dsInsert] then
  begin
    try
      // Validaciones básicas antes de guardar
      if Trim(dm.tproveedores.FieldByName('id').AsString) = '' then
      begin
        ShowMessage('El código es obligatorio');
        dbeID.SetFocus;
        Exit;
      end;

      if Trim(dm.tproveedores.FieldByName('nombre').AsString) = '' then
      begin
        ShowMessage('El nombre es obligatorio');
        dbeNombre.SetFocus;
        Exit;
      end;

      // Guardar los cambios
      dm.tproveedores.Post;

      ShowMessage('Proveedor guardado correctamente');

    except
      on E: Exception do
      begin
        ShowMessage('Error al guardar: ' + E.Message);
        dm.tproveedores.Cancel;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------
// ---------------- Lógica Eliminar (Botón Eliminar) ---------------------------
// -----------------------------------------------------------------------------

procedure TFProveedores.BtnEliminarClick(Sender: TObject);
begin
  if not dm.tproveedores.IsEmpty then
  begin
    if MessageDlg('¿Eliminar este proveedor?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      dm.tproveedores.Delete;
  end
  else
    ShowMessage('No hay proveedores para eliminar');
end;

// -----------------------------------------------------------------------------
// ---------------- Lógica Activar (Botón Activar) -----------------------------
// -----------------------------------------------------------------------------

procedure TFProveedores.btnActivarClick(Sender: TObject);
begin
  if not dm.tproveedores.IsEmpty then
  begin

    if dm.tproveedores.FieldByName('activo').AsBoolean then
    begin
      ShowMessage('Este proveedor ya está activo');
      Exit;
    end;

    if MessageDlg('¿Activar el proveedor: '
                  + dm.tproveedores.FieldByName('nombre').AsString + '?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        dm.tproveedores.Edit;
        dm.tproveedores.FieldByName('activo').AsBoolean := True;
        dm.tproveedores.Post;

        ShowMessage('Proveedor activado correctamente');

      except
        on E: Exception do
          ShowMessage('Error al activar: ' + E.Message);
      end;
    end;
  end
  else
    ShowMessage('No hay proveedores para activar');
end;

// -----------------------------------------------------------------------------
// ---------------- Lógica Desactivar (Botón Desactivar) -----------------------
// -----------------------------------------------------------------------------

procedure TFProveedores.btnDesactivarClick(Sender: TObject);
begin
  if not dm.tproveedores.IsEmpty then
  begin

    if not dm.tproveedores.FieldByName('activo').AsBoolean then
    begin
      ShowMessage('Este proveedor ya está dado de baja');
      Exit;
    end;

    if MessageDlg('¿Dar de baja el proveedor: '
                  + dm.tproveedores.FieldByName('nombre').AsString + '?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        dm.tproveedores.Edit;
        dm.tproveedores.FieldByName('activo').AsBoolean := False;
        dm.tproveedores.Post;

        ShowMessage('Proveedor dado de baja correctamente');

      except
        on E: Exception do
          ShowMessage('Error al dar de baja: ' + E.Message);
      end;
    end;
  end
  else
    ShowMessage('No hay proveedores para dar de baja');
end;


end. // END of FILE (.pas)
