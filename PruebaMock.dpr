program PruebaMock;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Spring.Container,
  Spring.Services,
  InterfaceModeloX,
  ModeloX // registra clases
  ;

type
	{$M+}
	{$TYPEINFO ON}
	{$METHODINFO ON}

  TPruebaModeloConMock = class
    private
      FModelo : IModeloX;
    public
      constructor Create;
  end;

  TPruebaModeloSinMock = class
    private
      FModelo : IModeloX;
    public
      constructor Create;
  end;

{ TPruebaModeloConMock }

constructor TPruebaModeloConMock.Create;
begin
  inherited;
  FModelo := ServiceLocator.GetService<IModeloX>('ModeloXMock');
end;

{ TPruebaModeloSinMock }

constructor TPruebaModeloSinMock.Create;
begin
  FModelo := ServiceLocator.GetService<IModeloX>('ModeloX');
end;

var
  FModeloConMock : TPruebaModeloConMock;
  FModeloSinMock : TPruebaModeloSinMock;
begin
  try
    FModeloConMock := TPruebaModeloConMock.Create;
    writeln(FModeloConMock.FModelo.FuncionGestor);

    FModeloSinMock := TPruebaModeloSinMock.Create;
    writeln(FModeloSinMock.FModelo.FuncionGestor);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  readln;
end.
