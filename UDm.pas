unit UDm;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MemDS, DBAccess, MyAccess, Vcl.Dialogs;

type
  Tdm = class(TDataModule)

    // Componente TMyConnection --> Componente principal
    db: TMyConnection;

    // Componentes TMyTable
    tproveedores: TMyTable; //Tabla --> Proveedores
    tclientes: TMyTable; //Tabla --> Clientes
    tproductos: TMyTable; //Tabla --> Productos
    tmovimientos: TMyTable; //Tabla --> Movimientos

    // Componentes TDataSource
    dsproveedores: TDataSource; //Tabla --> Proveedores
    dsclientes: TDataSource; //Tabla --> Clientes
    dsproductos: TDataSource; //Tabla --> Productos
    dsmovimientos: TDataSource; //Tabla --> Movimientos

    // Campos dados de alta de la tabla --> Proveedores
    tproveedoresid: TIntegerField;
    tproveedoresnombre: TStringField;
    tproveedorescontacto: TStringField;
    tproveedorestelefono: TStringField;
    tproveedoresemail: TStringField;
    tproveedoresdireccion: TMemoField;
    tproveedoresactivo: TBooleanField;
    tproveedoresfecha_alta: TDateTimeField;

    // Campos dados de alta de la tabla --> Clientes
    tclientesid: TIntegerField;
    tclientesnombre: TStringField;
    tclientescontacto: TStringField;
    tclientestelefono: TStringField;
    tclientesemail: TStringField;
    tclientesdireccion: TMemoField;
    tclientesactivo: TBooleanField;
    tclientesfecha_alta: TDateTimeField;

    // Campos dados de alta de la tabla --> Productos
    tproductosid: TIntegerField;
    tproductoscodigo: TStringField;
    tproductosnombre: TStringField;
    tproductosdescripcion: TMemoField;
    tproductosprecio_compra: TFloatField;
    tproductosprecio_venta: TFloatField;
    tproductosstock_actual: TIntegerField;
    tproductosactivo: TBooleanField;
    tproductosfecha_alta: TDateTimeField;
    tproductosfecha_actualizacion: TDateTimeField;

    // Campos dados de alta de la tabla --> Movimientos
    tmovimientosid: TIntegerField;
    tmovimientosproducto_id: TIntegerField;
    tmovimientostipo_movimiento: TStringField;
    tmovimientoscantidad: TIntegerField;
    tmovimientosproveedor_id: TIntegerField;
    tmovimientoscliente_id: TIntegerField;
    tmovimientosfecha_movimiento: TDateTimeField;
    tmovimientosreferencia: TStringField;
    tmovimientosobservaciones: TMemoField;

  private
    { Private declarations }
  public
    { Public declarations }

    // Procedimientos
    procedure ConectarBD; //  Establece la conexión con MySQL
    procedure DesconectarBD; // Desconecta de la base de datos MySQL

    procedure AbrirTablas; // Abre todas las tablas juntas
    procedure CerrarTablas; // Cierra todas las tablas juntas

    // Funciones
    function EstaConectado: Boolean;

  end;

var
  dm: Tdm; // Variable global que representa tu DataModule

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

// Procedimiento de conexion con la BBDD
procedure Tdm.ConectarBD;
begin
  if not db.Connected then
  begin
    try
      // Configuración de conexión
      db.Server := 'localhost';
      db.Database := 'gestion_almacen';
      db.Username := 'root';
      db.Password := 'root';
      db.Connected := True;

      // Opcional: Mensaje de éxito en consola para debugging
      // WriteLn('Conectado a MySQL correctamente');

    except
      on E: Exception do
      begin
        ShowMessage('No se pudo conectar a la base de datos:' + #13#10 +
                   'Error: ' + E.Message + #13#10 +
                   'Verifique:' + #13#10 +
                   '- Servidor MySQL está ejecutándose' + #13#10 +
                   '- Credenciales correctas' + #13#10 +
                   '- Base de datos existe');
      end;
    end;
  end;
end;

// Procedimiento de desconexion con la BBDD
procedure Tdm.DesconectarBD;
begin
  CerrarTablas; // Primero cerramos tablas
  db.Connected := False;
end;

// Procedimiento de abrir todas las tablas a la vez
procedure Tdm.AbrirTablas;
var
  TablasAbiertas: Integer;
begin
  TablasAbiertas := 0;

  if not db.Connected then
  begin
    ShowMessage('No hay conexión a la base de datos');
    Exit;
  end;

  try
    if not tproveedores.Active then
    begin
      tproveedores.Open;
      Inc(TablasAbiertas);
    end;

    if not tclientes.Active then
    begin
      tclientes.Open;
      Inc(TablasAbiertas);
    end;

    if not tproductos.Active then
    begin
      tproductos.Open;
      Inc(TablasAbiertas);
    end;

    if not tmovimientos.Active then
    begin
      tmovimientos.Open;
      Inc(TablasAbiertas);
    end;

    // Opcional: Mostrar éxito
    // if TablasAbiertas > 0 then
    //   WriteLn(Format('Se abrieron %d tablas', [TablasAbiertas]));

  except
    on E: Exception do
    begin
      ShowMessage('Error cargando datos:' + #13#10 + E.Message);
      // Limpiar tablas que pudieron abrirse
      CerrarTablas;
    end;
  end;
end;

// Procedimiento de cerrar todas las tablas a la vez
procedure Tdm.CerrarTablas;
begin
  tproveedores.Close;
  tclientes.Close;
  tproductos.Close;
  tmovimientos.Close;
end;

// Funcion de chequear si se esta conectado a la base de datos
function Tdm.EstaConectado: Boolean;
begin
  Result := db.Connected;
end;

end. // End final de la unidad
