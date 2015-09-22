unit ModuloIOUnitTest;

interface

uses
  Classes,
  DUnitX.TestFramework,
  SysUtils,
  StrUtils,
  InterfaceIO
  ;

type
  [TestFixture]
  TestModuloIO = class(TObject)
    private
      FModuloIO : IModuloIO;

    public
      [Setup]
        procedure Setup;
      [TearDown]
        procedure TearDown;
      [Test]
        [TestCase('caso 1', '10')]
        procedure TestLecturaEscritura(pValor : String);

  end;

implementation

uses
  ModuloIO
  ;

{ TestModuloIO }

procedure TestModuloIO.Setup;
begin
  FModuloIO := TModuloIOArchivo.Create;
end;

procedure TestModuloIO.TearDown;
begin
  FModuloIO := nil;
end;

procedure TestModuloIO.TestLecturaEscritura(pValor: String);
var
  output : String;
begin
  FModuloIO.Escribir(pValor);
  output := FModuloIO.Leer;
  Assert.AreEqual(FModuloIO.Leer, pValor, 'Se esperaba '+pValor+', se obtuvo ' + output)
end;


initialization
  TDUnitX.RegisterTestFixture(TestModuloIO);
end.
