unit ModuloUtils;

interface
uses
  SysUtils,
  InterfaceUtils
  ;

type

  TModuloUtils = class(TInterfacedObject, IModuloUtils)
    public
      constructor Create;
      destructor Destroy; override;
      function Calcular(pValor : Integer): Integer;
  end;

implementation
uses
  Spring.Container,
  Spring.Services
  ;

{ TModuloUtils }
constructor TModuloUtils.Create;
begin

end;

destructor TModuloUtils.Destroy;
begin
  inherited;
end;

function TModuloUtils.Calcular(pValor : Integer): Integer;
begin
  Result := 5;
end;

initialization
  GlobalContainer.RegisterType<TModuloUtils>.Implements<IModuloUtils>;
end.
