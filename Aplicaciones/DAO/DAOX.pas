unit DAOX;

interface


uses
  DTOX,
  InterfaceDAOX,
  InterfaceIO
  ;

type
  TXDAO = class(TInterfacedObject, IXDAO)
   strict private
     FDatos : TXDTO;
     FIO : IModuloIO;

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
  ModuloIO
  ;

{ TXDAO }

constructor TXDAO.Create;
begin
  FIO := ServiceLocator.GetService<IModuloIO>;
end;

procedure TXDAO.Delete(pDatos: TXDTO);
begin
  // no implmentada
end;

function TXDAO.Insert(pDatos: TXDTO): TXDTO;
begin
  // descarto pDatos.FNumero
  FIO.Escribir(pDatos.FCadena);
  Result := pDatos;
end;

function TXDAO.Select(pDatos: TXDTO): TXDTO;
var
  dto : TXDTO;
begin
  // pDatos no se tiene en cuenta
  dto := TXDTO.Create;
  dto.FCadena := FIO.Leer;
  Result := dto;
end;

function TXDAO.Update(pDatos: TXDTO): TXDTO;
begin
  // no implementada
end;

initialization
  GlobalContainer.RegisterType<TXDAO>.Implements<IXDAO>('DAOX');
end.
