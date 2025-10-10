unit UPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, UDm;

type
  TFPedidos = class(TForm)

    // Componentes
    pnlGeneral: TPanel;
    grdMovimientos: TDBGrid;
    pnlFiltros: TPanel;
    lblCliente: TLabel;
    lblProveedor: TLabel;
    cbxClientes: TComboBox;
    cbxProveedores: TComboBox;
    btnLimpiar: TButton;
    gbxFiltros: TGroupBox;
    ListBox1: TListBox;
    editBuscar: TEdit;
    lblReferencias: TLabel;
    pnlListBox: TPanel;

    // Procedimientos de carga
    procedure FormShow(Sender: TObject);
    procedure CargarReferencias(Sender: TObject);
    procedure CargarDetallePedido(Referencia: string);
    procedure CargarClientes;
    procedure CargarProveedores;

    // Acciones componentes
    procedure cbxClientesChange(Sender: TObject);
    procedure cbxProveedoresChange(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure editBuscarChange(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedidos: TFPedidos;

implementation

{$R *.dfm}

// ----------------------------- FORM SHOW -------------------------------------

procedure TFPedidos.FormShow(Sender: TObject);
begin
  CargarClientes;
  CargarProveedores;
  CargarReferencias(Sender);
end;

// ------------------------ CARGAR REFERENCIAS ---------------------------------

procedure TFPedidos.CargarReferencias(Sender: TObject);
var
  ClienteId, ProveedorId: Integer;
begin
  ListBox1.Clear;
  EditBuscar.Text := '';

  // Obtener IDs (mismo código que antes)
  if cbxClientes.ItemIndex > 0 then
    ClienteId := Integer(cbxClientes.Items.Objects[cbxClientes.ItemIndex])
  else
    ClienteId := 0;

  if cbxProveedores.ItemIndex > 0 then
    ProveedorId := Integer(cbxProveedores.Items.Objects[cbxProveedores.ItemIndex])
  else
    ProveedorId := 0;

  DM.qryReferencias.Close;
  DM.qryReferencias.ParamByName('cliente_id').AsInteger := ClienteId;
  DM.qryReferencias.ParamByName('proveedor_id').AsInteger := ProveedorId;
  DM.qryReferencias.Open;

  try
    while not DM.qryReferencias.EOF do
    begin
      ListBox1.Items.Add(DM.qryReferencias.FieldByName('referencia').AsString);
      DM.qryReferencias.Next;
    end;
  finally
    DM.qryReferencias.Close;
  end;

  lblReferencias.Caption := Format('Referencias (%d)', [ListBox1.Items.Count]);
end;

// ----------------------- CARGAR CLIENTES -------------------------------------

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

// ----------------------- CARGAR PROVEEDORES ----------------------------------

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

// ------------------------------ PEDIDO ---------------------------------------

procedure TFPedidos.CargarDetallePedido(Referencia: string);
begin
  DM.qryDetallePedido.Close;
  DM.qryDetallePedido.ParamByName('referencia').AsString := Referencia;
  DM.qryDetallePedido.Open;
end;

// -----------------------------------------------------------------------------

procedure TFPedidos.ListBox1Click(Sender: TObject);
begin
  if ListBox1.ItemIndex >= 0 then
  begin
    DM.qryDetallePedido.Close;
    DM.qryDetallePedido.ParamByName('referencia').AsString := ListBox1.Items[ListBox1.ItemIndex];
    DM.qryDetallePedido.Open;
  end;
end;

procedure TFPedidos.btnLimpiarClick(Sender: TObject);
begin
  // Limpiar todos los filtros
  cbxClientes.ItemIndex := 0;
  cbxProveedores.ItemIndex := 0;
  EditBuscar.Text := '';

  // Recargar referencias sin filtros
  CargarReferencias(Sender);

  // Limpiar el grid de detalle
  DM.qryDetallePedido.Close;
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

procedure TFPedidos.editBuscarChange(Sender: TObject);
var
  I: Integer;
  TextoBuscar: string;
  FoundIndex: Integer;
begin
  TextoBuscar := UpperCase(Trim(EditBuscar.Text));

  // Si el texto está vacío, mostrar todos los items
  if TextoBuscar = '' then
  begin
    for I := 0 to ListBox1.Items.Count - 1 do
      ListBox1.Items[I] := ListBox1.Items[I]; // Esto fuerza a mostrar todos
    Exit;
  end;

  // Buscar la primera coincidencia y seleccionarla
  FoundIndex := -1;
  for I := 0 to ListBox1.Items.Count - 1 do
  begin
    if Pos(TextoBuscar, UpperCase(ListBox1.Items[I])) > 0 then
    begin
      FoundIndex := I;
      Break;
    end;
  end;

  if FoundIndex >= 0 then
  begin
    ListBox1.ItemIndex := FoundIndex;
    // Opcional: hacer scroll al item seleccionado
    ListBox1.TopIndex := FoundIndex;
  end
  else
    ListBox1.ItemIndex := -1;
end;

end.// End of .pas
