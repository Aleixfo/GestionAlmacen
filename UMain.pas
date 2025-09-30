unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDm, Vcl.StdCtrls;  // IMPORTANTE: Agregar UDm

type
  TFMain = class(TForm)

    // Botones de Menu
    BtnClientes: TButton;
    BtnProveedores: TButton;
    BtnProductos: TButton;
    BtnMovimientos: TButton;

    // Procedimientos
    procedure FormCreate(Sender: TObject);
    procedure BtnClientesClick(Sender: TObject);
    procedure BtnProveedoresClick(Sender: TObject);
    procedure BtnProductosClick(Sender: TObject);
    procedure BtnMovimientosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

uses UClientes, UProveedores, UProductos;

// Procedimiento de la logica al pulsar el boton de clientes (Boton Clientes --> OnClick)
procedure TFMain.BtnClientesClick(Sender: TObject);
begin
  // Crear y mostrar el formulario de clientes
  if not Assigned(FClientes) then
    FClientes := TFClientes.Create(Self);
  FClientes.Show;
end;

// Procedimiento de la logica al pulsar el boton de proveedores (Boton Proveedores --> OnClick)
procedure TFMain.BtnProveedoresClick(Sender: TObject);
begin
  if not Assigned(FProveedores) then
    FProveedores := TFProveedores.Create(Self);
  FProveedores.Show;
end;

// Procedimiento de la logica al pulsar el boton de productos (Boton Productos --> OnClick)
procedure TFMain.BtnProductosClick(Sender: TObject);
begin
  if not Assigned(FProductos) then
    FProductos := TFProductos.Create(Self);
  FProductos.Show;
end;

// Procedimiento de la logica al pulsar el boton de movimientos (Boton Movimientos --> OnClick)
procedure TFMain.BtnMovimientosClick(Sender: TObject);
begin
  ShowMessage('Abriendo gestión de movimientos...');
end;

// Procedimiento con la logica que se ejecuta cuando se crea el formulario principal (UMain)
procedure TFMain.FormCreate(Sender: TObject);
begin
  // Probamos la conexión y carga de datos
  dm.ConectarBD;

  if dm.EstaConectado then
  begin
    dm.AbrirTablas;
    { ShowMessage('Conexión exitosa a la base de datos' + #13#10 +
                'Tablas cargadas correctamente'); }
  end
  else
  begin
    ShowMessage('No se pudo conectar a la base de datos');
  end;
end;

end.
