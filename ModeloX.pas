unit ModeloX;

interface

uses
  InterfaceGestorX,
  InterfaceModeloX,
  GestorX // registra clases
  ;

type

TModeloX = class(TInterfacedObject, IModeloX)
  private
    FGestor : IGestorX;
    function FuncionGestor : String;
  public
    constructor Create; overload;
    constructor Create(pGestor: IGestorX); overload;
end;

implementation

uses
  Spring.Container,
  Spring.Services
  ;

{ TModeloX }

constructor TModeloX.Create;
begin
  FGestor := ServiceLocator.GetService<IGestorX>('GestorX');
end;

constructor TModeloX.Create(pGestor: IGestorX);
begin
  FGestor := pGestor;
end;

function TModeloX.FuncionGestor: String;
begin
  Result := FGestor.FuncionX;
end;

initialization
  GlobalContainer.RegisterType<TModeloX>.Implements<IModeloX>('ModeloX');
  GlobalContainer.RegisterType<TModeloX>.Implements<IModeloX>('ModeloXMock').InjectConstructor(['GestorXMock']);
  GlobalContainer.Build;
end.
