unit UMovimientos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, UDm;

type
  TFMovimientos = class(TForm)

    // Componentes de UMovimientos.dfm
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    BtnNuevo: TButton;
    BtnEditar: TButton;
    BtnEliminar: TButton;
    DBGrid1: TDBGrid;

    // Procedimientos de UMovimientos
    procedure FormShow(Sender: TObject); // Logica al cargar el formulario de movimientos
    procedure BtnNuevoClick(Sender: TObject); // Boton de nuevo movimiento
    procedure BtnEditarClick(Sender: TObject); // Boton de editar movimiento
    procedure BtnEliminarClick(Sender: TObject); // Boton de eliminar movimiento

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMovimientos: TFMovimientos;

implementation

{$R *.dfm}

procedure TFMovimientos.FormShow(Sender: TObject);
begin
  // ¡IMPORTANTE! Asignar DataSources a los componentes
  //DBGrid1.DataSource := dm.dsmovimientos;
  //DBNavigator1.DataSource := dm.dsmovimientos;

  // Asegurar que la tabla está abierta
  if not dm.tmovimientos.Active then
    dm.tmovimientos.Open;
end;

procedure TFMovimientos.BtnNuevoClick(Sender: TObject);
begin
  dm.tmovimientos.Append;
  // Aquí luego abriremos un formulario de edición
  ShowMessage('Nuevo movimiento - Por implementar');
end;

procedure TFMovimientos.BtnEditarClick(Sender: TObject);
begin
  if not dm.tmovimientos.IsEmpty then
    dm.tmovimientos.Edit
  else
    ShowMessage('No hay movimientos para editar');
end;

procedure TFMovimientos.BtnEliminarClick(Sender: TObject);
begin
  if not dm.tmovimientos.IsEmpty then
  begin
    if MessageDlg('¿Eliminar este movimiento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      dm.tmovimientos.Delete;
  end
  else
    ShowMessage('No hay movimientos para eliminar');
end;

end.
