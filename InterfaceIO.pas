unit InterfaceIO;

interface

type
  IModuloIO = interface
  ['{7A33F29E-FB56-42D2-BF7A-AB772311E3E2}']

    procedure Escribir(pValor : String);
    function Leer : String;
  end;

implementation

end.
