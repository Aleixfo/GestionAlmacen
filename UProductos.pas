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
    btnNuevo: TButton;
    btnEditar: TButton;
    btnEliminar: TButton;
    grdProductos: TDBGrid;
    pnlBotones: TPanel;
    btnActivar: TButton;
    btnCerrar: TButton;
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
    procedure btnNuevoClick(Sender: TObject); // Boton de nuevo producto
    procedure btnEditarClick(Sender: TObject); // Boton de editar producto
    procedure btnEliminarClick(Sender: TObject); // Boton de eliminar producto

  private
    { Private declarations }
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
begin
  dm.tproductos.Append;
  // Aquí luego abriremos un formulario de edición
  ShowMessage('Nuevo proveedor - Por implementar');
end;

procedure TFProductos.btnEditarClick(Sender: TObject);
begin
  if not dm.tproductos.IsEmpty then
    dm.tproveedores.Edit
  else
    ShowMessage('No hay proveedores para editar');
end;

procedure TFProductos.btnEliminarClick(Sender: TObject);
begin
  if not dm.tproductos.IsEmpty then
  begin
    if MessageDlg('¿Eliminar este proveedor?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      dm.tproductos.Delete;
  end
  else
    ShowMessage('No hay proveedores para eliminar');
end;

end.

