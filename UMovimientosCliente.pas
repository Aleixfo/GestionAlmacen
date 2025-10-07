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
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBMemo1: TDBMemo;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
    FClienteID: Integer;
    FClienteNombre: string;
    procedure CargarMovimientos;

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

  // Cargar los movimientos
  CargarMovimientos;
end;

procedure TFMovimientosCliente.CargarMovimientos;
begin
  with dm.qryMovimientosCliente do
  begin
    Close;

    {
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
    }

    // Asignar el parámetro :cliente_id - IMPORTANTE: usa el nombre exacto del parámetro
    // Si en la query gráfica usaste :cliente_id, así se llama el parámetro
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
