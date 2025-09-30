unit UProveedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, UDm;

type
  TFProveedores = class(TForm)

    // Componentes de UProveedores.dfm
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BtnNuevo: TButton;
    BtnEditar: TButton;
    BtnEliminar: TButton;

    // Procedimientos de UProveedores
    procedure FormShow(Sender: TObject); // Logica al cargar el formulario de proveedores
    procedure BtnNuevoClick(Sender: TObject); // Boton de nuevo proveedor
    procedure BtnEditarClick(Sender: TObject); // Boton de editar proveedor
    procedure BtnEliminarClick(Sender: TObject); // Boton de eliminar proveedor

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProveedores: TFProveedores;

implementation

{$R *.dfm}

procedure TFProveedores.FormShow(Sender: TObject);
begin
  // ¡IMPORTANTE! Asignar DataSources a los componentes
  DBGrid1.DataSource := dm.dsproveedores;
  DBNavigator1.DataSource := dm.dsproveedores;

  // Asegurar que la tabla está abierta
  if not dm.tproveedores.Active then
    dm.tproveedores.Open;
end;

procedure TFProveedores.BtnNuevoClick(Sender: TObject);
begin
  dm.tproveedores.Append;
  // Aquí luego abriremos un formulario de edición
  ShowMessage('Nuevo proveedor - Por implementar');
end;

procedure TFProveedores.BtnEditarClick(Sender: TObject);
begin
  if not dm.tproveedores.IsEmpty then
    dm.tproveedores.Edit
  else
    ShowMessage('No hay proveedores para editar');
end;

procedure TFProveedores.BtnEliminarClick(Sender: TObject);
begin
  if not dm.tproveedores.IsEmpty then
  begin
    if MessageDlg('¿Eliminar este proveedor?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      dm.tproveedores.Delete;
  end
  else
    ShowMessage('No hay proveedores para eliminar');
end;

end.
