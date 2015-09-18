unit InterfaceDAOX;

interface

uses
  DTOX;

type
{$M+}
IXDAO = interface
['{C3C071AF-BDCF-4C59-8A0C-4FFDB332E3EA}']
  // CRUD
  procedure Delete(pDatos: TXDTO);
  function Insert(pDatos: TXDTO): TXDTO;
  function Select(pDatos: TXDTO): TXDTO;
  function Update(pDatos: TXDTO): TXDTO;
end;
{$M-}

implementation

end.
