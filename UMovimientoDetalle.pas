unit UMovimientoDetalle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, UDm;

type
  TFMovimientoDetalle = class(TForm)
    pnlContainer: TPanel;
    gbxDatos: TGroupBox;
    lblCodigo: TLabel;
    lblProducto: TLabel;
    lblFecha: TLabel;
    lblReferencia: TLabel;
    lblTipo: TLabel;
    lblCantidad: TLabel;
    lblCliente: TLabel;
    lblProveedor: TLabel;
    lblObservaciones: TLabel;
    dbmObservaciones: TDBMemo;
    dbeCodigo: TDBEdit;
    dbeProducto: TDBEdit;
    dbeFecha: TDBEdit;
    dbeReferencia: TDBEdit;
    dbeTipo: TDBEdit;
    dbeCantidad: TDBEdit;
    dbeCliente: TDBEdit;
    dbeProveedor: TDBEdit;

    procedure FormShow(Sender: TObject);

  private

    { Private declarations }
    procedure ConfigurarSoloLectura;
    procedure FormatearCamposRelacionales;
    procedure MostrarCamposSegunTipo;

  public
    { Public declarations }
    ModoEdicion: Boolean;  // ← AGREGAR ESTA PROPIEDAD
  end;

var
  FMovimientoDetalle: TFMovimientoDetalle;

implementation

{$R *.dfm}

// -----------------------------------------------------------------------------

procedure TFMovimientoDetalle.FormShow(Sender: TObject);
begin
  ConfigurarSoloLectura;
  FormatearCamposRelacionales;
  MostrarCamposSegunTipo;
end;

// -----------------------------------------------------------------------------

procedure TFMovimientoDetalle.ConfigurarSoloLectura;
begin
  // Todos los campos en modo solo lectura
  dbeCodigo.ReadOnly := True;
  dbeCodigo.Color := clBtnFace;

  dbeProducto.ReadOnly := True;
  dbeProducto.Color := clBtnFace;

  dbeFecha.ReadOnly := True;
  dbeFecha.Color := clBtnFace;

  dbeReferencia.ReadOnly := True;
  dbeReferencia.Color := clBtnFace;

  dbeTipo.ReadOnly := True;
  dbeTipo.Color := clBtnFace;

  dbeCantidad.ReadOnly := True;
  dbeCantidad.Color := clBtnFace;

  dbeCliente.ReadOnly := True;
  dbeCliente.Color := clBtnFace;

  dbeProveedor.ReadOnly := True;
  dbeProveedor.Color := clBtnFace;

  dbmObservaciones.ReadOnly := True;
  dbmObservaciones.Color := clBtnFace;
end;

// -----------------------------------------------------------------------------

procedure TFMovimientoDetalle.FormatearCamposRelacionales;
var
  ProductoID, ClienteID, ProveedorID: Integer;
  ProductoNombre, ClienteNombre, ProveedorNombre: string;
begin
  // Formatear Producto: "ID - Nombre"
  ProductoID := dm.tmovimientos.FieldByName('producto_id').AsInteger;
  if dm.tproductos.Locate('id', ProductoID, []) then
    ProductoNombre := dm.tproductos.FieldByName('nombre').AsString
  else
    ProductoNombre := 'No encontrado';

  dbeProducto.Text := Format('%d - %s', [ProductoID, ProductoNombre]);

  // Formatear Cliente: "ID - Nombre" (si existe)
  if not dm.tmovimientos.FieldByName('cliente_id').IsNull then
  begin
    ClienteID := dm.tmovimientos.FieldByName('cliente_id').AsInteger;
    if dm.tclientes.Locate('id', ClienteID, []) then
      ClienteNombre := dm.tclientes.FieldByName('nombre').AsString
    else
      ClienteNombre := 'No encontrado';

    dbeCliente.Text := Format('%d - %s', [ClienteID, ClienteNombre]);
  end
  else
    dbeCliente.Text := '';

  // Formatear Proveedor: "ID - Nombre" (si existe)
  if not dm.tmovimientos.FieldByName('proveedor_id').IsNull then
  begin
    ProveedorID := dm.tmovimientos.FieldByName('proveedor_id').AsInteger;
    if dm.tproveedores.Locate('id', ProveedorID, []) then
      ProveedorNombre := dm.tproveedores.FieldByName('nombre').AsString
    else
      ProveedorNombre := 'No encontrado';

    dbeProveedor.Text := Format('%d - %s', [ProveedorID, ProveedorNombre]);
  end
  else
    dbeProveedor.Text := '';
end;

// -----------------------------------------------------------------------------

procedure TFMovimientoDetalle.MostrarCamposSegunTipo;
var
  EsEntrada: Boolean;
begin
  EsEntrada := (dm.tmovimientos.FieldByName('tipo_movimiento').AsString = 'ENTRADA');

  if EsEntrada then
  begin
    // ENTRADA: Mostrar proveedor, ocultar cliente
    lblProveedor.Visible := True;
    dbeProveedor.Visible := True;

    lblCliente.Visible := False;
    dbeCliente.Visible := False;

    pnlContainer.Color := $00E6F4E6; // Verde claro
    Caption := 'Detalle de Movimiento - ENTRADA';
  end
  else
  begin
    // SALIDA: Mostrar cliente, ocultar proveedor
    lblCliente.Visible := True;
    dbeCliente.Visible := True;

    lblProveedor.Visible := False;
    dbeProveedor.Visible := False;

    pnlContainer.Color := $00E6E6F4; // Azul claro
    Caption := 'Detalle de Movimiento - SALIDA';
  end;
end;

end. //END of UNIT (.pas)
