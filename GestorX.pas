unit GestorX;

interface

uses
  InterfaceDAOX,
  InterfaceGestorX
  ;

type
TGestorX = class(TInterfacedObject, IGestorX)
  private
    FDAO : IXDAO; // inyección de dependencia
  public
    constructor Create;
    function FuncionX: String;
end;

implementation

uses
  System.SysUtils,
  Delphi.Mocks,
  Rtti,
  Spring.Container,
  Spring.Services,
  DAOX,
  DTOX
  ;

{ TGestorX }

constructor TGestorX.Create;
begin
  FDAO := ServiceLocator.GetService<IXDAO>('DAOX');
end;

function TGestorX.FuncionX: String;
var
  dto : TXDTO;
begin
  dto := TXDTO.Create; //ServiceLocator.GetService<TXDTO>;
  dto := FDAO.Select(dto);
  result := dto.FCadena;
end;

var
  FMockGestorX : TMock<IGestorX>;

initialization
  GlobalContainer.RegisterType<TGestorX>.Implements<IGestorX>('GestorX');
  FMockGestorX := TMock<IGestorX>.Create;
  FMockGestorX.Setup.WillExecute('FuncionX',
    function (const args : TArray<TValue>; const ReturnType : TRttiType) : TValue
    begin
      Result := 'Dato ficticio (mockeado)';
    end
    );
  GlobalContainer.RegisterType<IGestorX>.Implements<IGestorX>('GestorXMock').DelegateTo(FMockGestorX.Instance);

end.
