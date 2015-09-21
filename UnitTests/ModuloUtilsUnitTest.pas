unit ModuloUtilsUnitTest;

interface

uses
  Classes,
  DUnitX.TestFramework,
  SysUtils,
  StrUtils,
  InterfaceUtils
  ;

type
  [TestFixture]
  TestModuloUtils = class(TObject)
    private
      FModuloUtils : IModuloUtils;

    public
      [Setup]
        procedure Setup;
      [TearDown]
        procedure TearDown;
      [Test]
        [TestCase('TestCalcular1', '10')]
        procedure TestCalcular(pValor : Integer);
  end;

implementation

uses
  ModuloUtils
  ;
{ TestModuloUtils }

procedure TestModuloUtils.Setup;
begin
  FModuloUtils := TModuloUtils.Create;
end;

procedure TestModuloUtils.TearDown;
begin
  FModuloUtils := nil;
end;

procedure TestModuloUtils.TestCalcular(pValor: Integer);
begin
  if pValor = 0 then
    Assert.AreEqual(FModuloUtils.Calcular(pValor), 0, 'Se esperaba 0');


end;

initialization
  TDUnitX.RegisterTestFixture(TestModuloUtils);
end.
