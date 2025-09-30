program gestion_almacen;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {FMain},
  UDm in 'UDm.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
