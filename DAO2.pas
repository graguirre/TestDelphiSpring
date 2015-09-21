unit DAO2;
interface

uses
  DTOX,
  InterfaceDAO2,
  InterfaceUtils
  ;

type
  TDAO2 = class(TInterfacedObject, IDAO2)
   strict private
     FDatos : TXDTO;
     FUtils : IModuloUtils;

    public
      constructor Create;

      // CRUD
      procedure Delete(pDatos: TXDTO);
      function Insert(pDatos: TXDTO): TXDTO;
      function Select(pDatos: TXDTO): TXDTO;
      function Update(pDatos: TXDTO): TXDTO;
  end;

implementation

uses
  Spring.Container,
  Spring.Services,
  ModuloUtils
  ;

{ TXDAO }

constructor TDAO2.Create;
begin
  FUtils := ServiceLocator.GetService<IModuloUtils>;
end;

procedure TDAO2.Delete(pDatos: TXDTO);
begin
  // no implmentada
end;

function TDAO2.Insert(pDatos: TXDTO): TXDTO;
begin
  // descarto pDatos.FNumero
  pDatos.FNumero := FUtils.Calcular(pDatos.FNumero);
  Result := pDatos;
end;

function TDAO2.Select(pDatos: TXDTO): TXDTO;
var
  dto : TXDTO;
begin
  // pDatos no se tiene en cuenta
  dto := TXDTO.Create;
  dto.FCadena := '';
  Result := dto;
end;

function TDAO2.Update(pDatos: TXDTO): TXDTO;
begin
  // no implementada
end;

initialization
  GlobalContainer.RegisterType<TDAO2>.Implements<IDAO2>('DAO2');
end.
