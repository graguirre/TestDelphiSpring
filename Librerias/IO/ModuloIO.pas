unit ModuloIO;

interface
uses
  Classes,  //  TFileStream
  SysUtils,
  InterfaceIO
  ;

type

  TModuloIOArchivo = class(TInterfacedObject, IModuloIO) // lee/escribe datos en un archivo
    const
      NombreArchivo : String = 'BaseDeDatos.txt';
    private
      DescriptorArchivo : TextFile;
    public
      constructor Create;
      destructor Destroy; override;
      procedure Escribir(pValor : String);
      function Leer : String;
  end;

implementation
uses
  Spring.Container,
  Spring.Services
  ;

{ TModuloIOArchivo }
constructor TModuloIOArchivo.Create;
begin
  AssignFile(DescriptorArchivo,NombreArchivo);
  ReWrite(DescriptorArchivo);
  WriteLn(DescriptorArchivo, 'Un dato de la base de datos');
  CloseFile(DescriptorArchivo);
end;

destructor TModuloIOArchivo.Destroy;
begin
  inherited;
end;

procedure TModuloIOArchivo.Escribir(pValor: String);
begin
  ReWrite(DescriptorArchivo);
  WriteLn(DescriptorArchivo, pValor);
  CloseFile(DescriptorArchivo);
end;

function TModuloIOArchivo.Leer: String;
var
  Salida : String;
begin
  Reset(DescriptorArchivo);
  Read(DescriptorArchivo, Salida);
  CloseFile(DescriptorArchivo);
  Result := Salida;
end;

initialization
  GlobalContainer.RegisterType<TModuloIOArchivo>.Implements<IModuloIO>;
end.
