unit ModuloIOUnitTest;

interface

uses
  Classes,
  DUnitX.TestFramework,
  SysUtils,
  system.Diagnostics,
  StrUtils,
  InterfaceIO
  ;

type
  [TestFixture]
  TestModuloIO = class(TObject)
    private
      FModuloIO : IModuloIO;
      Stopwatch : TStopwatch;
    public
      [Setup]
        procedure Setup;
      [TearDown]
        procedure TearDown;
      [Test]
        [TestCase('caso E/S 1', '10')]
        [TestCase('caso E/S 2', '20')]
        procedure TestLecturaEscritura(pValor : String);

      [Test]
        [TestCase('caso 500 E/S','500')]
        procedure TestTiempos(pValor: Integer);

  end;

implementation

uses
  ModuloIO
  ;

{ TestModuloIO }

procedure TestModuloIO.Setup;
begin
  FModuloIO := TModuloIOArchivo.Create;
  Stopwatch := TStopWatch.StartNew;
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


procedure TestModuloIO.TestTiempos(pValor: Integer);
var
  i : Integer;
  Elapsed : int64;
begin
  for i := 0 to pValor do
    TestLecturaEscritura(i.ToString);
  Elapsed := Stopwatch.ElapsedMilliseconds;
  Assert.IsTrue(Elapsed < 1000, 'Tiempo excesivo ' + Elapsed.ToString + 'ms');
end;

initialization
  TDUnitX.RegisterTestFixture(TestModuloIO);
end.
