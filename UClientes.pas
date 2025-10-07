unit UClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, UDm, UMovimientosCliente;

type
  TFClientes = class(TForm)

    // Componentes de UClientes.dfm
    DBGrid1: TDBGrid; //Grid
    DBNavigator1: TDBNavigator;
    pnlDatos: TPanel; // Panel
    BtnNuevo: TButton; // Boton de nuevo cliente
    BtnEditar: TButton; // Boton de editar cliente existente
    BtnEliminar: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    pnlBotones: TPanel;
    BtnGuardar: TButton;
    BtnCancelar: TButton;
    BtnBuscar: TButton;
    pnlGrid: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBMemo1: TDBMemo;
    btnMovimientos: TButton;
    pnlPrincipal: TPanel;
    Label9: TLabel;
    DBEdit6: TDBEdit;

    // Procedimientos de UClientes
    procedure FormShow(Sender: TObject); // Logica al cargar el formulario de clientes
    procedure BtnNuevoClick(Sender: TObject); // Boton de nuevo cliente
    procedure BtnEditarClick(Sender: TObject); // Boton de editar cliente
    procedure BtnEliminarClick(Sender: TObject);
    procedure btnMovimientosClick(Sender: TObject); // Boton de eliminar cliente

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClientes: TFClientes;

implementation

{$R *.dfm}

procedure TFClientes.FormShow(Sender: TObject);
begin
  // ¡IMPORTANTE! Asignar DataSources a los componentes
  DBGrid1.DataSource := dm.dsclientes;
  DBNavigator1.DataSource := dm.dsclientes;

  // Asegurar que la tabla está abierta
  if not dm.tclientes.Active then
    dm.tclientes.Open;
end;

procedure TFClientes.BtnNuevoClick(Sender: TObject);
begin
  dm.tclientes.Append;
  // Aquí luego abriremos un formulario de edición
  ShowMessage('Nuevo cliente - Por implementar');
end;

procedure TFClientes.BtnEditarClick(Sender: TObject);
begin
  if not dm.tclientes.IsEmpty then
    dm.tclientes.Edit
  else
    ShowMessage('No hay clientes para editar');
end;

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

{
procedure TFClientes.btnMovimientosClick(Sender: TObject);
begin
  // Crear y mostrar el formulario de clientes
  if not Assigned(FMovimientosCliente) then
    FMovimientosCliente := TFMovimientosCliente.Create(Self);
  FMovimientosCliente.Show;
end;
}

procedure TFClientes.BtnMovimientosClick(Sender: TObject);
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

end.
