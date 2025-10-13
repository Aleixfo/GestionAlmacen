unit UMovimientos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, UDm, Vcl.ComCtrls;

type
  TFMovimientos = class(TForm)

    // Componentes TPanel para la estructura de la vista del formulario
    pnlContainer: TPanel;
    pnlHeader: TPanel;
    pnlGrid: TPanel;

    // Componente Grid de movimientos
    grdMovimientos: TDBGrid;

    // Componentes de agrupación GroupBox
    gbxEstadisticas: TGroupBox;
    gbxFiltros: TGroupBox;

    // Componentes de titulo TLabel
    lblReferencia: TLabel;
    lblMovimientosHoy: TLabel;
    lblProductos: TLabel;
    lblCliente: TLabel;
    lblProveedor: TLabel;
    lblTipo: TLabel;
    lblFechaInicio: TLabel;
    lblFechaFin: TLabel;
    lblTotalMovimientos: TLabel;

    // Componentes TComboBox para los desplegables de el apartado de filtros
    cbxTipoMovimiento: TComboBox;
    cbxClientes: TComboBox;
    cbxProveedores: TComboBox;
    cbxProducto: TComboBox;

    // Tedit del campo referencia para la busqueda de movimientos
    edtReferencia: TEdit;

    // Botones de buscar y limpiar filtros
    btnBuscar: TButton;
    btnLimpiar: TButton;

    // Componentes TDateTimePicker para las fechas
    dtpFechaInicio: TDateTimePicker;
    dtpFechaFin: TDateTimePicker;


    // Procedimientos de UMovimientos
    procedure FormShow(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure cbxTipoMovimientoChange(Sender: TObject);
    procedure OnFiltrosChange(Sender: TObject);

    procedure edtReferenciaKeyPress(
      Sender: TObject;
      var Key: Char);

    procedure edtReferenciaKeyDown(
      Sender: TObject;
      var Key: Word;
      Shift: TShiftState);
    procedure grdMovimientosDblClick(Sender: TObject);

  private

    { Private declarations }
    procedure ConfigurarGrid;
    procedure CargarCombosFiltros;
    procedure AplicarFiltros;
    procedure LimpiarFiltros;
    procedure GestionarEstadoCombos;
    function GenerarWhereFiltros: string;
    procedure AbrirDetalleMovimiento(EsNuevo: Boolean);

  public
    { Public declarations }
  end;

var
  FMovimientos: TFMovimientos;

implementation

{$R *.dfm}

uses UMovimientoDetalle;

// -----------------------------------------------------------------------------

procedure TFMovimientos.FormShow(Sender: TObject);
begin

  if not dm.tmovimientos.Active then
    dm.tmovimientos.Open;

  // Lógica inicial
  ConfigurarGrid;
  CargarCombosFiltros; // Configurar estado inicial de los combos
  LimpiarFiltros;
  GestionarEstadoCombos; // Bloqueo de combobox de cliente o proveedor

  // Inicializar labels de estadisitica
  lblTotalMovimientos.Caption := 'Total: '
  + IntToStr(dm.tmovimientos.RecordCount) + ' movimientos';

end;

// -----------------------------------------------------------------------------

procedure TFMovimientos.ConfigurarGrid;
begin
  grdMovimientos.ReadOnly := True; // Hacer el grid de solo lectura
  grdMovimientos.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines,
              dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack];
  grdMovimientos.Options := grdMovimientos.Options - [dgEditing]; // Remover opción de edición
  grdMovimientos.OnDblClick := grdMovimientosDblClick;
end;

// -----------------------------------------------------------------------------

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

// -----------------------------------------------------------------------------

procedure TFMovimientos.LimpiarFiltros;
begin
  // Limpiar controles visuales
  edtReferencia.Text := '';
  cbxTipoMovimiento.ItemIndex := 0;
  cbxProducto.ItemIndex := 0;
  cbxProveedores.ItemIndex := 0;
  cbxClientes.ItemIndex := 0;
  dtpFechaInicio.Date := Now - 30;
  dtpFechaFin.Date := Now;

  // Actualizar estado de combos
  GestionarEstadoCombos;

  // Quitar filtros
  dm.tmovimientos.DisableControls;
  try
    dm.tmovimientos.Filtered := False;
    dm.tmovimientos.Filter := '';
  finally
    dm.tmovimientos.EnableControls;
  end;

  lblTotalMovimientos.Caption := 'Total: ' + IntToStr(dm.tmovimientos.RecordCount) + ' movimientos';
end;

// -----------------------------------------------------------------------------

procedure TFMovimientos.GestionarEstadoCombos;
begin
  case cbxTipoMovimiento.ItemIndex of
    1: // ENTRADA
    begin
      // Habilitar proveedor, deshabilitar cliente
      cbxProveedores.Enabled := True;
      cbxProveedores.Color := clWindow;
      cbxProveedores.Style := csDropDownList;

      cbxClientes.Enabled := False;
      cbxClientes.Color := clBtnFace;
      cbxClientes.Style := csSimple;
      cbxClientes.ItemIndex := 0; // Volver a "Todos"

      // Tooltips
      cbxProveedores.Hint := 'Seleccione proveedor para movimientos de ENTRADA';
      cbxClientes.Hint := 'No disponible para movimientos de ENTRADA';
    end;

    2: // SALIDA
    begin
      // Habilitar cliente, deshabilitar proveedor
      cbxClientes.Enabled := True;
      cbxClientes.Color := clWindow;
      cbxClientes.Style := csDropDownList;

      cbxProveedores.Enabled := False;
      cbxProveedores.Color := clBtnFace;
      cbxProveedores.Style := csSimple;
      cbxProveedores.ItemIndex := 0; // Volver a "Todos"

      // Tooltips
      cbxClientes.Hint := 'Seleccione cliente para movimientos de SALIDA';
      cbxProveedores.Hint := 'No disponible para movimientos de SALIDA';
    end;

    else // TODOS (0) u otros
    begin
      // Ambos habilitados
      cbxProveedores.Enabled := True;
      cbxProveedores.Color := clWindow;
      cbxProveedores.Style := csDropDownList;

      cbxClientes.Enabled := True;
      cbxClientes.Color := clWindow;
      cbxClientes.Style := csDropDownList;

      // Tooltips normales
      cbxProveedores.Hint := 'Seleccione proveedor';
      cbxClientes.Hint := 'Seleccione cliente';
    end;
  end;

  // Actualizar hints
  cbxProveedores.ShowHint := True;
  cbxClientes.ShowHint := True;
end;

// -----------------------------------------------------------------------------

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

// -----------------------------------------------------------------------------

procedure TFMovimientos.AplicarFiltros;
var
  SQLWhere: string;
begin
  SQLWhere := GenerarWhereFiltros;

  {ShowMessage('Filtros actuales ----->   ' + SQLWhere);}

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

// -----------------------------------------------------------------------------

procedure TFMovimientos.edtReferenciaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then // Tecla Enter
  begin
    OnFiltrosChange(Sender);
    Key := #0; // Evitar el sonido del sistema
  end;
end;

procedure TFMovimientos.edtReferenciaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_TAB then // Tecla Tab
  begin
    AplicarFiltros;
  end;
end;

procedure TFMovimientos.cbxTipoMovimientoChange(Sender: TObject);
begin
  GestionarEstadoCombos; // Primero gestionar el estado de los combos
  AplicarFiltros; // Luego aplicar los filtros
end;

procedure TFMovimientos.OnFiltrosChange(Sender: TObject);
begin
  AplicarFiltros;
end;

procedure TFMovimientos.btnLimpiarClick(Sender: TObject);
begin
  LimpiarFiltros;
end;

// -----------------------------------------------------------------------------

procedure TFMovimientos.grdMovimientosDblClick(Sender: TObject);
begin
  // Verificar que hay un registro seleccionado
  if not dm.tmovimientos.IsEmpty then
  begin
    // Abrir el formulario de detalle en modo EDICIÓN (visualización)
    AbrirDetalleMovimiento(False); // False = no es nuevo, es edición/visualización
  end
  else
  begin
    ShowMessage('No hay movimientos para visualizar');
  end;
end;

procedure TFMovimientos.AbrirDetalleMovimiento(EsNuevo: Boolean);
begin
  FMovimientoDetalle := TFMovimientoDetalle.Create(Self);
  try
    FMovimientoDetalle.ModoEdicion := not EsNuevo;

    if EsNuevo then
    begin
      // Modo nuevo movimiento
      dm.tmovimientos.Append;
      // Establecer valores por defecto para nuevo
      dm.tmovimientos.FieldByName('fecha_movimiento').AsDateTime := Now;
      dm.tmovimientos.FieldByName('tipo_movimiento').AsString := 'ENTRADA';
      FMovimientoDetalle.Caption := 'Nuevo Movimiento';
    end
    else
    begin
      // Modo visualización/edición - el registro ya está seleccionado en el grid
      // No necesitamos hacer dm.tmovimientos.Edit porque es solo lectura
      FMovimientoDetalle.Caption := 'Detalle de Movimiento - ' +
        dm.tmovimientos.FieldByName('referencia').AsString;
    end;

    // Mostrar el formulario modal
    FMovimientoDetalle.ShowModal;

  finally
    FMovimientoDetalle.Free;
  end;
end;

end. // END of UNIT (.pas)
