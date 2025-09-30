unit UProductos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, UDm;

type
  TFProductos = class(TForm)

    // Componentes de UProductos.dfm
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    BtnNuevo: TButton;
    BtnEditar: TButton;
    BtnEliminar: TButton;
    DBGrid1: TDBGrid;

    // Procedimientos de UProductos
    procedure FormShow(Sender: TObject); // Logica al cargar el formulario de productos
    procedure BtnNuevoClick(Sender: TObject); // Boton de nuevo producto
    procedure BtnEditarClick(Sender: TObject); // Boton de editar producto
    procedure BtnEliminarClick(Sender: TObject); // Boton de eliminar producto

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
  DBGrid1.DataSource := dm.dsproductos;
  DBNavigator1.DataSource := dm.dsproductos;

  // Asegurar que la tabla está abierta
  if not dm.tproductos.Active then
    dm.tproductos.Open;
end;

procedure TFProductos.BtnNuevoClick(Sender: TObject);
begin
  dm.tproductos.Append;
  // Aquí luego abriremos un formulario de edición
  ShowMessage('Nuevo proveedor - Por implementar');
end;

procedure TFProductos.BtnEditarClick(Sender: TObject);
begin
  if not dm.tproductos.IsEmpty then
    dm.tproveedores.Edit
  else
    ShowMessage('No hay proveedores para editar');
end;

procedure TFProductos.BtnEliminarClick(Sender: TObject);
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

