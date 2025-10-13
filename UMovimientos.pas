unit UMovimientos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, UDm, Vcl.ComCtrls;

type
  TFMovimientos = class(TForm)
    pnlContainer: TPanel;
    grdMovimientos: TDBGrid;
    pnlHeader: TPanel;
    pnlGrid: TPanel;
    gbxBuscar: TGroupBox;
    gbxEstadisticas: TGroupBox;
    gbxFiltros: TGroupBox;
    lblReferencia: TLabel;
    btnBuscar: TButton;
    edtReferencia: TEdit;
    lblMovimientosHoy: TLabel;
    lblProductos: TLabel;
    lblCliente: TLabel;
    lblProveedor: TLabel;
    lblTipo: TLabel;
    btnAplicar: TButton;
    btnLimpiar: TButton;
    cbxTipoMovimiento: TComboBox;
    cbxClientes: TComboBox;
    cbxProveedores: TComboBox;
    cbxProducto: TComboBox;
    dtpFechaInicio: TDateTimePicker;
    dtpFechaFin: TDateTimePicker;
    lblFechaInicio: TLabel;
    lblFechaFin: TLabel;
    lblTotalMovimientos: TLabel;

    // Procedimientos de UMovimientos
    procedure FormShow(Sender: TObject); // Logica al cargar el formulario de movimientos
    procedure BtnNuevoClick(Sender: TObject); // Boton de nuevo movimiento
    procedure BtnEditarClick(Sender: TObject); // Boton de editar movimiento
    procedure BtnEliminarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtReferenciaKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpiarClick(Sender: TObject); // Boton de eliminar movimiento

  private

    { Private declarations }
    procedure ConfigurarGrid;
    procedure CargarCombosFiltros;
    procedure AplicarFiltros;
    procedure LimpiarFiltros;
    function GenerarWhereFiltros: string;

  public
    { Public declarations }
  end;

var
  FMovimientos: TFMovimientos;

implementation

{$R *.dfm}

procedure TFMovimientos.FormShow(Sender: TObject);
begin

  // Asegurar que la tabla está abierta
  if not dm.tmovimientos.Active then
    dm.tmovimientos.Open;

  ConfigurarGrid;
  CargarCombosFiltros;
  LimpiarFiltros;

end;

procedure TFMovimientos.LimpiarFiltros;
begin
  edtReferencia.Text := '';
  cbxTipoMovimiento.ItemIndex := 0;
  cbxProducto.ItemIndex := 0;
  cbxProveedores.ItemIndex := 0;
  cbxClientes.ItemIndex := 0;
  dtpFechaInicio.Date := Now - 30;
  dtpFechaFin.Date := Now;

  AplicarFiltros;
end;

procedure TFMovimientos.ConfigurarGrid;
begin
  with grdMovimientos do
  begin

    // Hacer el grid de solo lectura
    ReadOnly := True;
    Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines,
                dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack];

    // Remover opción de edición
    Options := Options - [dgEditing];

  end;
end;

procedure TFMovimientos.CargarCombosFiltros;
begin

  // Combo Tipo Movimiento Default Values
  cbxTipoMovimiento.Clear;
  cbxTipoMovimiento.Items.Add('Todos');
  cbxTipoMovimiento.Items.Add('ENTRADA');
  cbxTipoMovimiento.Items.Add('SALIDA');
  cbxTipoMovimiento.ItemIndex := 0;

  // Combo Productos
  cbxProducto.Clear;
  cbxProducto.Items.Add('Todos');
  if dm.tproductos.Active then
  begin
    dm.tproductos.First;
    while not dm.tproductos.Eof do
    begin
      cbxProducto.Items.AddObject(
        dm.tproductos.FieldByName('nombre').AsString,
        TObject(dm.tproductos.FieldByName('id').AsInteger)
      );
      dm.tproductos.Next;
    end;
  end;
  cbxProducto.ItemIndex := 0;

  // Combo Proveedores
  cbxProveedores.Clear;
  cbxProveedores.Items.Add('Todos');
  if dm.tproveedores.Active then
  begin
    dm.tproveedores.First;
    while not dm.tproveedores.Eof do
    begin
      cbxProveedores.Items.AddObject(
        dm.tproveedores.FieldByName('nombre').AsString,
        TObject(dm.tproveedores.FieldByName('id').AsInteger)
      );
      dm.tproveedores.Next;
    end;
  end;
  cbxProveedores.ItemIndex := 0;

  // Combo Clientes
  cbxClientes.Clear;
  cbxClientes.Items.Add('Todos');
  if dm.tclientes.Active then
  begin
    dm.tclientes.First;
    while not dm.tclientes.Eof do
    begin
      cbxClientes.Items.AddObject(
        dm.tclientes.FieldByName('nombre').AsString,
        TObject(dm.tclientes.FieldByName('id').AsInteger)
      );
      dm.tclientes.Next;
    end;
  end;
  cbxClientes.ItemIndex := 0;

  // Fechas por defecto (últimos 30 días)
  dtpFechaInicio.Date := Now - 30;
  dtpFechaFin.Date := Now;
end;

function TFMovimientos.GenerarWhereFiltros: string;
var
  WhereConditions: TStringList;
  i: Integer;
begin
  WhereConditions := TStringList.Create;
  try
    // Filtro por referencia
    if Trim(edtReferencia.Text) <> '' then
      WhereConditions.Add('referencia LIKE ' + QuotedStr('*' + Trim(edtReferencia.Text) + '*'));

    // Filtro por tipo de movimiento
    if cbxTipoMovimiento.ItemIndex > 0 then
      WhereConditions.Add('tipo_movimiento = ' + QuotedStr(cbxTipoMovimiento.Text));

    // Filtro por producto
    if cbxProducto.ItemIndex > 0 then
      WhereConditions.Add('producto_id = ' + IntToStr(Integer(cbxProducto.Items.Objects[cbxProducto.ItemIndex])));

    // Filtro por proveedor
    if cbxProveedores.ItemIndex > 0 then
      WhereConditions.Add('proveedor_id = ' + IntToStr(Integer(cbxProveedores.Items.Objects[cbxProveedores.ItemIndex])));

    // Filtro por cliente
    if cbxClientes.ItemIndex > 0 then
      WhereConditions.Add('cliente_id = ' + IntToStr(Integer(cbxClientes.Items.Objects[cbxClientes.ItemIndex])));

    // Filtros de fecha
    WhereConditions.Add('fecha_movimiento >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtpFechaInicio.Date)));
    WhereConditions.Add('fecha_movimiento <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtpFechaFin.Date + 1)));

    // Combinar condiciones CORRECTAMENTE
    if WhereConditions.Count > 0 then
    begin
      Result := '';
      for i := 0 to WhereConditions.Count - 1 do
      begin
        if i > 0 then
          Result := Result + ' AND ';
        Result := Result + WhereConditions[i];
      end;
    end
    else
      Result := '';

  finally
    WhereConditions.Free;
  end;
end;

procedure TFMovimientos.AplicarFiltros;
var
  SQLWhere: string;
begin
  SQLWhere := GenerarWhereFiltros;

  ShowMessage('Filtros actuales ----->   ' + SQLWhere);

  dm.tmovimientos.DisableControls;
  try
    dm.tmovimientos.Filtered := False;

    // Solo aplicar filtro si hay condiciones
    if SQLWhere <> '' then
    begin
      dm.tmovimientos.Filter := SQLWhere;
      dm.tmovimientos.Filtered := True;
    end;
  finally
    dm.tmovimientos.EnableControls;
  end;

  // Actualizar estadísticas
  lblTotalMovimientos.Caption := 'Total: ' + IntToStr(dm.tmovimientos.RecordCount) + ' movimientos';
end;

procedure TFMovimientos.edtReferenciaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then // Tecla Enter
  begin
    btnBuscarClick(Sender);
    Key := #0; // Evitar el sonido del sistema
  end;
end;

procedure TFMovimientos.btnBuscarClick(Sender: TObject);
begin
  AplicarFiltros;
end;

procedure TFMovimientos.BtnNuevoClick(Sender: TObject);
begin
  dm.tmovimientos.Append;
  // Aquí luego abriremos un formulario de edición
  ShowMessage('Nuevo movimiento - Por implementar');
end;

procedure TFMovimientos.BtnEditarClick(Sender: TObject);
begin
  if not dm.tmovimientos.IsEmpty then
    dm.tmovimientos.Edit
  else
    ShowMessage('No hay movimientos para editar');
end;

procedure TFMovimientos.BtnEliminarClick(Sender: TObject);
begin
  if not dm.tmovimientos.IsEmpty then
  begin
    if MessageDlg('¿Eliminar este movimiento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      dm.tmovimientos.Delete;
  end
  else
    ShowMessage('No hay movimientos para eliminar');
end;

procedure TFMovimientos.btnLimpiarClick(Sender: TObject);
begin
  LimpiarFiltros;
end;

end.
