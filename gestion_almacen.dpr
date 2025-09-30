program gestion_almacen;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {FMain},
  UDm in 'UDm.pas' {dm: TDataModule},
  UClientes in 'UClientes.pas' {FClientes},
  UProveedores in 'UProveedores.pas' {FProveedores},
  UProductos in 'UProductos.pas' {FProductos},
  UMovimientos in 'UMovimientos.pas' {FMovimientos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFClientes, FClientes);
  Application.CreateForm(TFProveedores, FProveedores);
  Application.CreateForm(TFProductos, FProductos);
  Application.CreateForm(TFMovimientos, FMovimientos);
  Application.Run;
end.
