unit UPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, UDm;

type
  TFPedidos = class(TForm)

    pnlGeneral: TPanel;
    cbxReferencias: TComboBox;
    grdMovimientos: TDBGrid;
    pnlFiltros: TPanel;
    lblCliente: TLabel;
    lblProveedor: TLabel;
    cbxClientes: TComboBox;
    cbxProveedores: TComboBox;
    btnFiltrar: TButton;
    btnLimpiar: TButton;
    gbxFiltros: TGroupBox;

    procedure FormShow(Sender: TObject);
    procedure CargarReferencias(Sender: TObject);
    procedure CargarDetallePedido(Referencia: string);
    procedure cbxReferenciasChange(Sender: TObject);

    procedure CargarClientes;
    procedure CargarProveedores;
    procedure cbxClientesChange(Sender: TObject);
    procedure cbxProveedoresChange(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedidos: TFPedidos;

implementation

{$R *.dfm}

procedure TFPedidos.FormShow(Sender: TObject);
begin
  CargarClientes;
  CargarProveedores;
  CargarReferencias(Sender);
end;

procedure TFPedidos.btnFiltrarClick(Sender: TObject);
begin
  CargarReferencias(Sender);
end;

procedure TFPedidos.btnLimpiarClick(Sender: TObject);
begin
  // Limpiar todos los filtros
  cbxClientes.ItemIndex := 0;
  cbxProveedores.ItemIndex := 0;
  cbxReferencias.Clear;
  cbxReferencias.Items.Add('');
  cbxReferencias.ItemIndex := 0;

  // Opcional: limpiar el grid de detalle
  DM.qryDetallePedido.Close;
end;

procedure TFPedidos.CargarClientes;
begin
  cbxClientes.Clear;
  cbxClientes.Items.Add('');

  DM.tclientes.First;
  while not DM.tclientes.EOF do
  begin
    // Guardar el ID en el Objects del ComboBox
    cbxClientes.Items.AddObject(
      DM.tclientes.FieldByName('nombre').AsString,
      TObject(DM.tclientes.FieldByName('id').AsInteger)
    );
    DM.tclientes.Next;
  end;
  cbxClientes.ItemIndex := 0;
end;

procedure TFPedidos.CargarProveedores;
begin
  cbxProveedores.Clear;
  cbxProveedores.Items.Add('');

  // Usar tu TTable existente de proveedores
  DM.tProveedores.First;
  while not DM.tProveedores.EOF do
  begin
    // Guardar el ID en el Objects del ComboBox
    cbxProveedores.Items.AddObject(
      DM.tProveedores.FieldByName('nombre').AsString,
      TObject(DM.tProveedores.FieldByName('id').AsInteger)
    );
    DM.tProveedores.Next;
  end;

  // No cerramos la tabla
  // DM.tblProveedores.Close; ← NO cerrar
  cbxProveedores.ItemIndex := 0;
end;

procedure TFPedidos.CargarReferencias(Sender: TObject);
var
  ClienteId: Integer;
  ProveedorId: Integer;
begin

  cbxReferencias.Clear;
  cbxReferencias.Items.Add('');

  //Primero hay definir que filtro vamos a aplicar, si ciente o proveedor.
  //Parte de cliente
  //Miramos si me han seleccionado algun cliente
  if cbxClientes.ItemIndex > 0 then
    ClienteId := Integer(cbxClientes.Items.Objects[cbxClientes.ItemIndex])
  else
    ClienteId := 0;

  if cbxProveedores.ItemIndex > 0 then
    ProveedorId := Integer(cbxProveedores.Items.Objects[cbxProveedores.ItemIndex])
  else
    ProveedorId := 0;

  // Asignar parámetros a la query (que ya tiene la SQL definida)
  DM.qryReferencias.Close;

  // Asegurarse de que los parámetros existen antes de asignarlos
  try
    DM.qryReferencias.ParamByName('cliente_id').AsInteger := ClienteId;
  except
    // Si el parámetro no existe, lo ignoramos
  end;

  try
    DM.qryReferencias.ParamByName('proveedor_id').AsInteger := ProveedorId;
  except
    // Si el parámetro no existe, lo ignoramos
  end;

  DM.qryReferencias.Open;

  while not DM.qryReferencias.EOF do
  begin
    cbxReferencias.Items.Add(DM.qryReferencias.FieldByName('referencia').AsString);
    DM.qryReferencias.Next;
  end;
  DM.qryReferencias.Close;

end;

procedure TFPedidos.cbxClientesChange(Sender: TObject);
begin
  // Cuando cambia el cliente, limpiar proveedor y actualizar referencias
  if cbxClientes.ItemIndex > 0 then
  begin
    cbxProveedores.ItemIndex := 0; // Limpiar proveedor si se selecciona cliente
  end;
  CargarReferencias(Sender);
end;

procedure TFPedidos.cbxProveedoresChange(Sender: TObject);
begin
  // Cuando cambia el proveedor, limpiar cliente y actualizar referencias
  if cbxProveedores.ItemIndex > 0 then
  begin
    cbxClientes.ItemIndex := 0; // Limpiar cliente si se selecciona proveedor
  end;
  CargarReferencias(Sender);
end;

procedure TFPedidos.cbxReferenciasChange(Sender: TObject);
var
  Referencia: string;
begin

  // Tomar el valor del ComboBox
  Referencia := cbxReferencias.Text;

  if Referencia <> '' then
  begin
    DM.qryDetallePedido.Close;
    DM.qryDetallePedido.ParamByName('referencia').AsString := Referencia;
    DM.qryDetallePedido.Open;
  end
  else
    ShowMessage('Seleccione una referencia');

end;

procedure TFPedidos.CargarDetallePedido(Referencia: string);
begin
  DM.qryDetallePedido.Close;
  DM.qryDetallePedido.ParamByName('referencia').AsString := Referencia;
  DM.qryDetallePedido.Open;
end;

end.
