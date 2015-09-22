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
        [TestCase('TestCalcular1', '10')]
        procedure TestEscribir(pValor : String);
        procedure TestLeer;
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

procedure TestModuloIO.TestEscribir(pValor: String);
begin
  FModuloIO.Escribir(pValor);
end;

procedure TestModuloIO.TestLeer;
var
  output : String;
begin
  TestEscribir('1234');
  output := FModuloIO.Leer;
  Assert.AreEqual(FModuloIO.Leer, '1234', 'Se esperaba 1234, reasultado ' + output)
end;

initialization
  TDUnitX.RegisterTestFixture(TestModuloIO);
end.
