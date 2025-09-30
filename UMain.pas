unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UDm;  // IMPORTANTE: Agregar UDm

type
  TFMain = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

procedure TFMain.FormCreate(Sender: TObject);
begin
  // Probamos la conexión y carga de datos
  dm.ConectarBD;

  if dm.EstaConectado then
  begin
    dm.AbrirTablas;
    ShowMessage('Conexión exitosa a la base de datos' + #13#10 +
                'Tablas cargadas correctamente');
  end
  else
  begin
    ShowMessage('No se pudo conectar a la base de datos');
  end;
end;

end.
