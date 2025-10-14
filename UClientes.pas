unit UClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, UDm, UMovimientosCliente;

type
  TFClientes = class(TForm)

    // Componentes de UClientes.dfm
    DBGrid1: TDBGrid;
    pnlDatos: TPanel;
    btnNuevo: TButton;
    gbxDatos: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbeID: TDBEdit;
    dbeNombre: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    pnlBotones: TPanel;
    btnGuardar: TButton;
    btnBuscar: TButton;
    pnlGrid: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    cbxActivo: TDBCheckBox;
    DBMemo1: TDBMemo;
    btnMovimientos: TButton;
    pnlPrincipal: TPanel;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    btnActivar: TButton;
    btnDesactivar: TButton;
    btnEliminar: TButton;
    edtBuscar: TEdit;

    // Procedimientos de UClientes
    procedure FormShow(Sender: TObject);
    procedure btnMovimientosClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure BtnEliminarClick(Sender: TObject);
    procedure btnDesactivarClick(Sender: TObject);
    procedure btnActivarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClientes: TFClientes;

implementation

{$R *.dfm}

// -----------------------------------------------------------------------------
// ---------------- Logica Inicial Formulario (FormShow) -----------------------
// -----------------------------------------------------------------------------

procedure TFClientes.FormShow(Sender: TObject);
begin

  // Asegurar que la tabla está abierta
  if not dm.tclientes.Active then
    dm.tclientes.Open;
end;

// -----------------------------------------------------------------------------
// -------------------- Logica Ver Movimientos (Linkeo) ------------------------
// -----------------------------------------------------------------------------

procedure TFClientes.btnMovimientosClick(Sender: TObject);
begin
  if not dm.tclientes.IsEmpty then
  begin
    // Crear y mostrar el formulario de movimientos
    with TFMovimientosCliente.Create(Self) do
    try
      // Pasar el ID y nombre del cliente seleccionado
      ClienteID := dm.tclientes.FieldByName('id').AsInteger;
      ClienteNombre := dm.tclientes.FieldByName('nombre').AsString;
      ShowModal;
    finally
      Free;
    end;
  end
  else
    ShowMessage('Por favor, seleccione un cliente primero');
end;

// -----------------------------------------------------------------------------
// ------------------ Logica Crear (Boton Nuevo) -------------------------------
// -----------------------------------------------------------------------------

procedure TFClientes.btnNuevoClick(Sender: TObject);
begin
  try

    // Iniciar inserción de nuevo registro
    dm.tclientes.Append;

    // Establecer valores por defecto
    dm.tclientes.FieldByName('id').AsInteger := dm.ProximoIDCliente;
    dm.tclientes.FieldByName('activo').AsBoolean := True;
    dm.tclientes.FieldByName('fecha_alta').AsDateTime := Now;

    // Poner foco en el primer campo
    dbeNombre.SetFocus;

  except
    on E: Exception do
    begin
      ShowMessage('Error al crear nuevo cliente: ' + E.Message);
      dm.tclientes.Cancel;
    end;
  end;
end;

// -----------------------------------------------------------------------------
// ---------------- Lógica Guardar (Botón Guardar) -----------------------------
// -----------------------------------------------------------------------------

procedure TFClientes.btnGuardarClick(Sender: TObject);
begin
  if dm.tclientes.State in [dsEdit, dsInsert] then
  begin
    try
      // Validaciones básicas antes de guardar
      if Trim(dm.tclientes.FieldByName('id').AsString) = '' then
      begin
        ShowMessage('El código es obligatorio');
        dbeID.SetFocus;
        Exit;
      end;

      if Trim(dm.tproductos.FieldByName('nombre').AsString) = '' then
      begin
        ShowMessage('El nombre es obligatorio');
        dbeNombre.SetFocus;
        Exit;
      end;

      // Guardar los cambios
      dm.tclientes.Post;

      ShowMessage('Cliente guardado correctamente');

    except
      on E: Exception do
      begin
        ShowMessage('Error al guardar: ' + E.Message);
        dm.tclientes.Cancel;
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------
// ---------------- Lógica Eliminar (Botón Eliminar) ---------------------------
// -----------------------------------------------------------------------------

procedure TFClientes.BtnEliminarClick(Sender: TObject);
begin
  if not dm.tclientes.IsEmpty then
  begin
    if MessageDlg('¿Eliminar este cliente?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      dm.tclientes.Delete;
  end
  else
    ShowMessage('No hay clientes para eliminar');
end;

// -----------------------------------------------------------------------------
// ---------------- Lógica Activar (Botón Activar) -----------------------------
// -----------------------------------------------------------------------------

procedure TFClientes.btnActivarClick(Sender: TObject);
begin
  if not dm.tclientes.IsEmpty then
  begin

    if dm.tclientes.FieldByName('activo').AsBoolean then
    begin
      ShowMessage('Este cliente ya está activo');
      Exit;
    end;

    if MessageDlg('¿Activar el cliente: '
                  + dm.tclientes.FieldByName('nombre').AsString + '?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        dm.tclientes.Edit;
        dm.tclientes.FieldByName('activo').AsBoolean := True;
        dm.tclientes.Post;

        ShowMessage('Cliente activado correctamente');

      except
        on E: Exception do
          ShowMessage('Error al activar: ' + E.Message);
      end;
    end;
  end
  else
    ShowMessage('No hay clientes para activar');
end;

// -----------------------------------------------------------------------------
// ---------------- Lógica Desactivar (Botón Desactivar) -----------------------
// -----------------------------------------------------------------------------

procedure TFClientes.btnDesactivarClick(Sender: TObject);
begin
  if not dm.tclientes.IsEmpty then
  begin

    if not dm.tclientes.FieldByName('activo').AsBoolean then
    begin
      ShowMessage('Este cliente ya está dado de baja');
      Exit;
    end;

    if MessageDlg('¿Dar de baja el cliente: '
                  + dm.tclientes.FieldByName('nombre').AsString + '?',
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        dm.tclientes.Edit;
        dm.tclientes.FieldByName('activo').AsBoolean := False;
        dm.tclientes.Post;

        ShowMessage('Cliente dado de baja correctamente');

      except
        on E: Exception do
          ShowMessage('Error al dar de baja: ' + E.Message);
      end;
    end;
  end
  else
    ShowMessage('No hay clientes para dar de baja');
end;

end. // END of FILE (.pas)
