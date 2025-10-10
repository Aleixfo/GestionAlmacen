unit UProductos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, UDm, Vcl.Mask;

type
  TFProductos = class(TForm)
    navGrid: TDBNavigator;
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

    // Procedimientos de UProductos
    procedure FormShow(Sender: TObject); // Logica al cargar el formulario de productos

    // Logica botones
    procedure btnNuevoClick(Sender: TObject); // Boton de nuevo producto
    procedure btnDesactivarClick(Sender: TObject); // Boton de eliminar producto
    procedure btnGuardarClick(Sender: TObject);
    procedure btnActivarClick(Sender: TObject);

  private

    { Private declarations }
    function ObtenerProximoIDProducto: Integer;

  public
    { Public declarations }
  end;

var
  FProductos: TFProductos;

implementation

{$R *.dfm}

procedure TFProductos.FormShow(Sender: TObject);
begin
  // ¡IMPORTANTE! Asignar DataSources a los componentes
  grdProductos.DataSource := dm.dsproductos;
  navGrid.DataSource := dm.dsproductos;

  // Asegurar que la tabla está abierta
  if not dm.tproductos.Active then
    dm.tproductos.Open;
end;

procedure TFProductos.btnNuevoClick(Sender: TObject);
var
  ProximoID: Integer;
begin
  try

    // Obtener el próximo ID autoincremental
    ProximoID := ObtenerProximoIDProducto;

    // Iniciar inserción de nuevo registro
    dm.tproductos.Append;

    // Aquí luego abriremos un formulario de edición
    {ShowMessage('Nuevo proveedor - Por implementar');}

    // Establecer valores por defecto
    dm.tproductos.FieldByName('id').AsInteger := ProximoID; // ← Esto es SOLO visual
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

function TFProductos.ObtenerProximoIDProducto: Integer;
begin
  Result := 0;

  try
    with dm.qryAutoIncrement do  // Usa una query auxiliar de tu DataModule
    begin

      Close;
      Open;

      // Consulta para MySQL - obtiene el próximo AUTO_INCREMENT
      {SQL.Text := 'SELECT AUTO_INCREMENT ' +
                  'FROM information_schema.TABLES ' +
                  'WHERE TABLE_SCHEMA = DATABASE() ' +
                  'AND TABLE_NAME = ''productos''';}

      if not IsEmpty then
        Result := FieldByName('AUTO_INCREMENT').AsInteger
      else
        Result := 0;

      Close;
    end;

    // Si no se pudo obtener, mostrar 0
    if Result = 0 then
      Result := 0; // O podrías calcularlo de otra forma

  except
    on E: Exception do
    begin
      ShowMessage('Advertencia: No se pudo obtener el próximo ID. ' + E.Message);
      Result := 0;
    end;
  end;
end;

end.// END OF .PAS

