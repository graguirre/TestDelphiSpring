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
        [TestCase('TestCalcular2', '100')]
        [TestCase('TestCalcular3', '1000')]
        [TestCase('TestCalcular4', '1000')]
        [TestCase('TestCalcular5', '10000')]
        [TestCase('TestCalcular6', '10000000')]
        [TestCase('TestCalcular7', '10000')]
        [TestCase('TestCalcular8', '1000000')]
        [TestCase('TestCalcular9', '10000')]
        [TestCase('TestCalcular10', '10000')]
        [TestCase('TestCalcular11', '100000')]
        [TestCase('TestCalcular12', '1000')]
        [TestCase('TestCalcular13', '10000')]
        [TestCase('TestCalcular14', '10000')]
        [TestCase('TestCalcular15', '1000000')]
        [TestCase('TestCalcular16', '100000')]
        [TestCase('TestCalcular17', '10000')]
        [TestCase('TestCalcular18', '1000000')]
        [TestCase('TestCalcular19', '1000')]
        [TestCase('TestCalcular20', '100000')]
        [TestCase('TestCalcular21', '100000')]
        [TestCase('TestCalcular22', '100')]
        [TestCase('TestCalcular23', '1000')]
        [TestCase('TestCalcular24', '1000')]
        [TestCase('TestCalcular25', '1000000')]
        [TestCase('TestCalcular26', '10000')]
        [TestCase('TestCalcular27', '100000')]
        [TestCase('TestCalcular28', '1000000')]
        [TestCase('TestCalcular29', '1000')]
        [TestCase('TestCalcular30', '10000')]
        [TestCase('TestCalcular31', '10000')]
        [TestCase('TestCalcular32', '100')]
        [TestCase('TestCalcular33', '1000')]
        [TestCase('TestCalcular34', '100000')]
        [TestCase('TestCalcular35', '10000')]
        [TestCase('TestCalcular36', '10000')]
        [TestCase('TestCalcular37', '10000')]
        [TestCase('TestCalcular38', '100000')]
        [TestCase('TestCalcular39', '1000')]
        [TestCase('TestCalcular40', '10000')]
        [TestCase('TestCalcular41', '10000')]
        [TestCase('TestCalcular42', '100')]
        [TestCase('TestCalcular43', '1000')]
        [TestCase('TestCalcular44', '1000')]
        [TestCase('TestCalcular45', '10000')]
        [TestCase('TestCalcular46', '10000')]
        [TestCase('TestCalcular47', '10000')]
        [TestCase('TestCalcular48', '100000')]
        [TestCase('TestCalcular49', '1000')]
        [TestCase('TestCalcular50', '10000')]
        [TestCase('TestCalcular51', '10000')]
        [TestCase('TestCalcular52', '100')]
        [TestCase('TestCalcular53', '1000')]
        [TestCase('TestCalcular54', '1000')]
        [TestCase('TestCalcular55', '10000')]
        [TestCase('TestCalcular56', '10000')]
        [TestCase('TestCalcular57', '10000')]
        [TestCase('TestCalcular58', '100000')]
        [TestCase('TestCalcular59', '1000')]
        [TestCase('TestCalcular60', '10000')]
        [TestCase('TestCalcular61', '10000')]
        [TestCase('TestCalcular62', '100')]
        [TestCase('TestCalcular63', '1000')]
        [TestCase('TestCalcular64', '1000')]
        [TestCase('TestCalcular65', '10000')]
        [TestCase('TestCalcular66', '10000')]
        [TestCase('TestCalcular67', '10000')]
        [TestCase('TestCalcular68', '100000')]
        [TestCase('TestCalcular69', '1000')]
        [TestCase('TestCalcular70', '10000')]
        [TestCase('TestCalcular71', '10000')]
        [TestCase('TestCalcular72', '100')]
        [TestCase('TestCalcular73', '1000')]
        [TestCase('TestCalcular74', '1000')]
        [TestCase('TestCalcular75', '10000')]
        [TestCase('TestCalcular76', '10000')]
        [TestCase('TestCalcular77', '10000')]
        [TestCase('TestCalcular78', '100000')]
        [TestCase('TestCalcular79', '1000')]
        [TestCase('TestCalcular80', '10000')]
        [TestCase('TestCalcular81', '10000')]
        [TestCase('TestCalcular82', '100')]
        [TestCase('TestCalcular83', '1000')]
        [TestCase('TestCalcular84', '1000')]
        [TestCase('TestCalcular85', '10000')]
        [TestCase('TestCalcular86', '10000')]
        [TestCase('TestCalcular87', '10000')]
        [TestCase('TestCalcular88', '100000')]
        [TestCase('TestCalcular89', '1000')]
        [TestCase('TestCalcular90', '10000')]
        [TestCase('TestCalcular91', '10000')]
        [TestCase('TestCalcular92', '100')]
        [TestCase('TestCalcular93', '1000')]
        [TestCase('TestCalcular94', '1000')]
        [TestCase('TestCalcular95', '10000')]
        [TestCase('TestCalcular96', '10000')]
        [TestCase('TestCalcular97', '10000')]
        [TestCase('TestCalcular98', '100000')]
        [TestCase('TestCalcular99', '1000')]
        [TestCase('TestCalcular100', '10000')]
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
var
  Result : Integer;
begin
  Result := pValor * pValor;
  Assert.AreEqual(FModuloUtils.Calcular(pValor), Result, 'Se esperaba otro valor');
end;

initialization
  TDUnitX.RegisterTestFixture(TestModuloUtils);
end.
