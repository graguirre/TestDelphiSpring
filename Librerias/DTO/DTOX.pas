unit DTOX;

interface

type

TXDTO = class
  public
    FNumero : Integer;
    FCadena : String;

    constructor Create; overload;
    constructor Create(pDatos : TXDTO); overload;
end;

implementation

uses
  Spring.Container
  ;

{ TDTOX }
constructor TXDTO.Create;
begin
  FNumero := 1234;
  FCadena := 'Cadena por defecto';
end;

constructor TXDTO.Create(pDatos: TXDTO);
begin
  FNumero := pDatos.FNumero;
  FCadena := pDatos.FCadena;
end;

initialization
  GlobalContainer.RegisterType<TXDTO>;

end.
