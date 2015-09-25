unit GestorX;

interface

uses
  InterfaceDAOX,
  InterfaceDAO2,
  InterfaceGestorX
  ;

type
TGestorX = class(TInterfacedObject, IGestorX)
  private
    FDAO : IXDAO; // inyección de dependencia
    FDAO2 : IDAO2;
  public
    constructor Create;
    function FuncionX: String;
end;

implementation

uses
  System.SysUtils,
//  Delphi.Mocks,
  Rtti,
  Spring.Container,
  Spring.Services,
  DAOX,
  DAO2,
  DTOX
  ;

{ TGestorX }

constructor TGestorX.Create;
begin
  FDAO := ServiceLocator.GetService<IXDAO>('DAOX');
  FDAO2 := ServiceLocator.GetService<IDAO2>('DAO2');
end;

function TGestorX.FuncionX: String;
var
  dto : TXDTO;
  dto2 : TXDTO;
begin
  dto := TXDTO.Create; //ServiceLocator.GetService<TXDTO>;
  dto := FDAO.Select(dto);
  dto2 := FDAO2.Insert(dto);
  result := dto2.FCadena;
end;

//var
//  FMockGestorX : TMock<IGestorX>;

initialization
  GlobalContainer.RegisterType<TGestorX>.Implements<IGestorX>('GestorX');
//  FMockGestorX := TMock<IGestorX>.Create;
//  FMockGestorX.Setup.WillExecute('FuncionX',
//    function (const args : TArray<TValue>; const ReturnType : TRttiType) : TValue
//    begin
//      Result := 'Dato ficticio (mockeado)';
//    end
//    );
//  GlobalContainer.RegisterType<IGestorX>.Implements<IGestorX>('GestorXMock').DelegateTo(FMockGestorX.Instance);

end.
