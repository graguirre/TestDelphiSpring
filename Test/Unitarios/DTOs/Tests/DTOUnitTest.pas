unit DTOUnitTest;

interface

uses
  Classes,
  DUnitX.TestFramework,
  SysUtils,
  StrUtils,
  DTOX
  ;

type
  [TestFixture]
  TestModuloUtils = class(TObject)
    private
      FDTO : TXDTO;

    public
      [Setup]
        procedure Setup;
      [TearDown]
        procedure TearDown;
      [Test]
        [TestCase('TestCrearDTO','')]
        procedure TestCrearDTO;
  end;

implementation


{ TestModuloUtils }

procedure TestModuloUtils.Setup;
begin

end;

procedure TestModuloUtils.TearDown;
begin

end;

procedure TestModuloUtils.TestCrearDTO;
begin
  FDTO := TXDTO.Create;
  if not Assigned(FDTO) then
    Assert.IsTrue(False);
end;

initialization
  TDUnitX.RegisterTestFixture(TestModuloUtils);
end.
