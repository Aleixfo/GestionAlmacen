unit UClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, UDm;

type
  TFClientes = class(TForm)

    // Componentes de UClientes.dfm
    DBGrid1: TDBGrid; //Grid
    DBNavigator1: TDBNavigator; // Barra de navegacion
    Panel1: TPanel; // Panel
    BtnNuevo: TButton; // Boton de nuevo cliente
    BtnEditar: TButton; // Boton de editar cliente existente
    BtnEliminar: TButton;

    // Procedimientos de UClientes
    procedure FormShow(Sender: TObject); // Logica al cargar el formulario de clientes
    procedure BtnNuevoClick(Sender: TObject); // Boton de nuevo cliente
    procedure BtnEditarClick(Sender: TObject); // Boton de editar cliente
    procedure BtnEliminarClick(Sender: TObject); // Boton de eliminar cliente

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

end.
