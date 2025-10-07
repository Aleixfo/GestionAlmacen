unit UProveedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, UDm, CRGrid, Vcl.Mask, UMovimientosProveedor;

type
  TFProveedores = class(TForm)

    // Componentes de UProveedores.dfm
    DBNavigator1: TDBNavigator;
    pnlBotones: TPanel;
    BtnNuevo: TButton;
    BtnEditar: TButton;
    BtnEliminar: TButton;
    pnlGrid: TPanel;
    CRDBGrid1: TCRDBGrid;
    pnlDatos: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    GroupBox1: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Button1: TButton;

    // Procedimientos de UProveedores
    procedure FormShow(Sender: TObject); // Logica al cargar el formulario de proveedores
    procedure BtnNuevoClick(Sender: TObject); // Boton de nuevo proveedor
    procedure BtnEditarClick(Sender: TObject); // Boton de editar proveedor
    procedure BtnEliminarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject); // Boton de eliminar proveedor

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
  CRDBGrid1.DataSource := dm.dsproveedores;
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

procedure TFProveedores.Button1Click(Sender: TObject);
begin
if not dm.tproveedores.IsEmpty then
  begin
    // Crear y mostrar el formulario de movimientos
    with TFMovimientosProveedor.Create(Self) do
    try
      // Pasar el ID y nombre del cliente seleccionado
      ProveedorID := dm.tproveedores.FieldByName('id').AsInteger;
      ProveedorNombre := dm.tproveedores.FieldByName('nombre').AsString;
      ShowModal;
    finally
      Free;
    end;
  end
  else
    ShowMessage('Por favor, seleccione un proveedor primero');
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
