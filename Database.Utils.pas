unit Database.Utils;

interface

uses
  System.SysUtils, System.Classes, Data.DB, MyAccess;

type
  TDatabaseUtils = class
  private
    FQuery: TMyQuery;
  public
    constructor Create(AQuery: TMyQuery);
    destructor Destroy; override;

    // Métodos principales
    function ObtenerProximoID(const Tabla: string): Integer;

    // Métodos adicionales que podrías necesitar
    function ExisteRegistro(const Tabla, Campo: string; Valor: Variant): Boolean;
    function ObtenerUltimoIDInsertado: Integer;
    function EjecutarConsulta(const SQL: string): Boolean;

    // Propiedad para acceso directo si necesitas
    property Query: TMyQuery read FQuery;
  end;

implementation

{ TDatabaseUtils }

constructor TDatabaseUtils.Create(AQuery: TMyQuery);
begin
  inherited Create;
  FQuery := AQuery;
end;

destructor TDatabaseUtils.Destroy;
begin
  // No destruimos FQuery porque solo usamos una referencia
  inherited Destroy;
end;

function TDatabaseUtils.ObtenerProximoID(const Tabla: string): Integer;
begin
  Result := 0;
  try
    FQuery.Close;
    FQuery.SQL.Text := 'SELECT AUTO_INCREMENT ' +
                      'FROM information_schema.TABLES ' +
                      'WHERE TABLE_SCHEMA = DATABASE() ' +
                      'AND TABLE_NAME = :Tabla';

    FQuery.ParamByName('Tabla').AsString := Tabla;
    FQuery.Open;

    if not FQuery.IsEmpty then
      Result := FQuery.FieldByName('AUTO_INCREMENT').AsInteger;

    FQuery.Close;
  except
    on E: Exception do
    begin
      raise Exception.Create('Error obteniendo próximo ID para ' + Tabla + ': ' + E.Message);
    end;
  end;
end;

function TDatabaseUtils.ExisteRegistro(const Tabla, Campo: string; Valor: Variant): Boolean;
begin
  Result := False;
  try
    FQuery.Close;
    FQuery.SQL.Text := Format('SELECT COUNT(*) as Total FROM %s WHERE %s = :Valor', [Tabla, Campo]);
    FQuery.ParamByName('Valor').Value := Valor;
    FQuery.Open;

    Result := FQuery.FieldByName('Total').AsInteger > 0;
    FQuery.Close;
  except
    on E: Exception do
    begin
      raise Exception.Create('Error verificando registro: ' + E.Message);
    end;
  end;
end;

function TDatabaseUtils.ObtenerUltimoIDInsertado: Integer;
begin
  try
    FQuery.Close;
    FQuery.SQL.Text := 'SELECT LAST_INSERT_ID() as LastID';
    FQuery.Open;
    Result := FQuery.FieldByName('LastID').AsInteger;
    FQuery.Close;
  except
    on E: Exception do
    begin
      raise Exception.Create('Error obteniendo último ID: ' + E.Message);
    end;
  end;
end;

function TDatabaseUtils.EjecutarConsulta(const SQL: string): Boolean;
begin
  try
    FQuery.Close;
    FQuery.SQL.Text := SQL;
    FQuery.ExecSQL;
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      raise Exception.Create('Error ejecutando consulta: ' + E.Message);
    end;
  end;
end;

end.
