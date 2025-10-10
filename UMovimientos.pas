unit UMovimientos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, UDm;

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
    lblTotalMovimientos: TLabel;
    edtCliente: TEdit;
    edtProveedor: TEdit;
    Edit4: TEdit;
    lblCliente: TLabel;
    lblProveedor: TLabel;
    lblTipo: TLabel;
    btnAplicar: TButton;
    btnLimpiar: TButton;

    // Procedimientos de UMovimientos
    procedure FormShow(Sender: TObject); // Logica al cargar el formulario de movimientos
    procedure BtnNuevoClick(Sender: TObject); // Boton de nuevo movimiento
    procedure BtnEditarClick(Sender: TObject); // Boton de editar movimiento
    procedure BtnEliminarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtReferenciaKeyPress(Sender: TObject; var Key: Char); // Boton de eliminar movimiento

  private

    { Private declarations }
    procedure ConfigurarGrid;

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

  // Configurar grid como solo lectura
  ConfigurarGrid;


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

procedure TFMovimientos.edtReferenciaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then // Tecla Enter
  begin
    btnBuscarClick(Sender);
    Key := #0; // Evitar el sonido del sistema
  end;
end;

// BÚSQUEDA POR REFERENCIA
procedure TFMovimientos.btnBuscarClick(Sender: TObject);
var
  Referencia: string;
begin
  Referencia := Trim(edtReferencia.Text);

  if Referencia = '' then
  begin
    ShowMessage('Por favor, introduce una referencia para buscar');
    edtReferencia.SetFocus;
    Exit;
  end;

  // Intentar localizar la referencia en el dataset
  if dm.tmovimientos.Locate('referencia', Referencia, [loCaseInsensitive, loPartialKey]) then
  begin
    // Éxito - movimiento encontrado
    grdMovimientos.SetFocus;

    // Opcional: resaltar la fila encontrada
    // Puedes agregar código para cambiar el color de la fila seleccionada

    ShowMessage(Format('Movimiento encontrado: %s', [Referencia]));
  end
  else
  begin
    // No encontrado
    ShowMessage(Format('No se encontró ningún movimiento con la referencia: %s', [Referencia]));
    edtReferencia.SetFocus;
    edtReferencia.SelectAll;
  end;
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

end.
