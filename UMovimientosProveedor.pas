unit UMovimientosProveedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, CRGrid,
  Vcl.StdCtrls, Vcl.ExtCtrls, UDm, Vcl.DBCtrls;

type
  TFMovimientosProveedor = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    CRDBGrid1: TCRDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBMemo1: TDBMemo;
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }

    FProveedorID: Integer;
    FProveedorNombre: string;
    procedure CargarMovimientos;

  public
    { Public declarations }

    property ProveedorID: Integer read FProveedorID write FProveedorID;
    property ProveedorNombre: string read FProveedorNombre write FProveedorNombre;

  end;

var
  FMovimientosProveedor: TFMovimientosProveedor;

implementation

{$R *.dfm}

procedure TFMovimientosProveedor.FormActivate(Sender: TObject);
begin

  // Configurar el título con el nombre del proveedor
  Caption := 'Movimientos del Proveedor: ' + FProveedorNombre;

  // Configurar DataSource del grid
  CRDBGrid1.DataSource := dm.dsMovimientosProveedor;

  CargarMovimientos;
end;

procedure TFMovimientosProveedor.CargarMovimientos;
begin
  with dm.qryMovimientosProveedor do
  begin
    Close;

    ParamByName('proveedor_id').Value := FProveedorID;

    try
      Open;
    except
      on E: Exception do
        ShowMessage('Error al ejecutar query: ' + E.Message);
    end;
  end;
end;

end.
