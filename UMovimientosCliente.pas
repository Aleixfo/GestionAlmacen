unit UMovimientosCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, UDm, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFMovimientosCliente = class(TForm)
    pnlGeneral: TPanel;
    DBGrid1: TDBGrid;
    btnAceptar: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
    FClienteID: Integer;
    FClienteNombre: string;
    procedure CargarMovimientos;
    procedure ConfigurarControles;

  public
    { Public declarations }
    property ClienteID: Integer read FClienteID write FClienteID;
    property ClienteNombre: string read FClienteNombre write FClienteNombre;

  end;

var
  FMovimientosCliente: TFMovimientosCliente;

implementation

{$R *.dfm}

procedure TFMovimientosCliente.FormActivate(Sender: TObject);
begin
  // Configurar el título con el nombre del cliente
  Caption := 'Movimientos del Cliente: ' + FClienteNombre;

  // Configurar DataSource del grid
  DBGrid1.DataSource := dm.dsMovimientosCliente;

  // Configurar los controles de edición
  ConfigurarControles;

  // Cargar los movimientos
  CargarMovimientos;
end;

procedure TFMovimientosCliente.ConfigurarControles;
begin
  // Conectar todos los DBEdit al mismo DataSource de la query
  DBEdit1.DataSource := dm.dsMovimientosCliente;
  DBEdit1.DataField := 'fecha_movimiento';

  DBEdit2.DataSource := dm.dsMovimientosCliente;
  DBEdit2.DataField := 'producto_nombre';

  DBEdit3.DataSource := dm.dsMovimientosCliente;
  DBEdit3.DataField := 'referencia';

  DBEdit4.DataSource := dm.dsMovimientosCliente;
  DBEdit4.DataField := 'tipo_movimiento';

  DBEdit5.DataSource := dm.dsMovimientosCliente;
  DBEdit5.DataField := 'cantidad';

  DBEdit6.DataSource := dm.dsMovimientosCliente;
  DBEdit6.DataField := 'total';

  DBMemo1.DataSource := dm.dsMovimientosCliente;
  DBMemo1.DataField := 'observaciones';

  // Hacer algunos campos de solo lectura si quieres
  DBEdit1.ReadOnly := True;
  DBEdit2.ReadOnly := True;
  DBEdit3.ReadOnly := True;
  DBEdit4.ReadOnly := True;
  DBEdit5.ReadOnly := True;
  DBEdit6.ReadOnly := True;
  DBMemo1.ReadOnly := True;
end;

procedure TFMovimientosCliente.CargarMovimientos;
begin
  with dm.qryMovimientosCliente do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT m.id, ' +
      '       m.fecha_movimiento, ' +
      '       m.tipo_movimiento, ' +
      '       p.nombre as producto_nombre, ' +
      '       m.cantidad, ' +
      '       m.referencia, ' +
      '       m.observaciones, ' +
      '       (p.precio_venta * m.cantidad) as total ' +
      'FROM movimientos m ' +
      'JOIN productos p ON m.producto_id = p.id ' +
      'WHERE m.cliente_id = :cliente_id ' +
      'ORDER BY m.fecha_movimiento DESC';

    ParamByName('cliente_id').Value := FClienteID;

    try
      Open;
    except
      on E: Exception do
        ShowMessage('Error al ejecutar query: ' + E.Message);
    end;
  end;
end;

procedure TFMovimientosCliente.btnAceptarClick(Sender: TObject);
begin
  Close;
end;

// Limpiar la query al cerrar
procedure TFMovimientosCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.qryMovimientosCliente.Close;
end;

end.
