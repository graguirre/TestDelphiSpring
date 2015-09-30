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
      function Calcular2(pValor : Integer): Integer;
  end;

implementation
uses
  Spring.Container;

{ TModuloUtils }
function TModuloUtils.Calcular2(pValor: Integer): Integer;
begin
  Result := 0;
end;

constructor TModuloUtils.Create;
begin

end;

destructor TModuloUtils.Destroy;
begin
  inherited;
end;

function TModuloUtils.Calcular(pValor : Integer): Integer;
begin
  Result := pValor * pValor;
end;

initialization
  GlobalContainer.RegisterType<TModuloUtils>.Implements<IModuloUtils>;
end.
