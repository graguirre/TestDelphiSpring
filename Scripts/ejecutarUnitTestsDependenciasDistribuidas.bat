rem PATH de MSBuild para compilar el proyecto
SET MSBuild="C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"
rem PATH para la salida de la compilacion
SET OUTPUT_PATH=Output
SET SEARCH_PATH_ARTIFACTS=artifacts
SET SEARCH_PATH_DELPHI=ThirdParty\spring4d
SET COVERAGE_EXE_PATH=C:\jenkins\DelphiCodeCoverage
SET OUTPUT_COVERAGE_PATH="CoverageReports"
SET OUTPUT_TESTS_PATH="TestsReports"
SET OUTPUT_TESTS_FILENAME="dunitx-results.xml"
SET OUTPUT_EMMA_PATH="EmmaReports"
SET OUTPUT_EMMA_FILENAME="coverage.xml"

SET COVERAGE_OUTPUT_FILENAME="CodeCoverage_Summary.xml"
rem PATH para RSVARS -necesario-
SET RSVARS="C:\Program Files (x86)\Embarcadero\Studio\14.0\bin\rsvars.bat"
rem PATH para CodeCoverage
SET CodeCoverage=%COVERAGE_EXE_PATH%\CodeCoverage.exe
rem llamada a rsvars.bat
CALL %RSVARS%
%MSBuild% %1 /t:Build /p:Config=Debug;Platform=Win32;DCC_DcuOutput=..\..\\%OUTPUT_PATH%;DCC_UnitSearchPath="..\..\\%SEARCH_PATH_ARTIFACTS%;..\..\\%SEARCH_PATH_DELPHI%"
%MSBuild% %2 /t:Build /p:Config=Debug;Platform=Win32;DCC_ExeOutput=..\..\\%OUTPUT_PATH%;DCC_BplOutput=..\..\\%OUTPUT_PATH%;DCC_UnitSearchPath="..\..\\%OUTPUT_PATH%;..\..\\%SEARCH_PATH_DELPHI%"

rem ejecuta la libreria de metricas y genera los resultados
dir
move artifacts\* Output
cd Output 
%CodeCoverage% -e %3 -u %4 -od "..\%OUTPUT_COVERAGE_PATH%" -html -xml -emma -lt
cd ..
rem Mueve el fichero de los resultados de los tests
mkdir %OUTPUT_TESTS_PATH%;
move %OUTPUT_PATH%\dunitx-results.xml %OUTPUT_TESTS_PATH%\%OUTPUT_TESTS_FILENAME% 
rem Mueve el fichero de los resultados de la cobertura
mkdir %OUTPUT_EMMA_PATH%;
move %OUTPUT_COVERAGE_PATH%\%COVERAGE_OUTPUT_FILENAME% %OUTPUT_EMMA_PATH%\%OUTPUT_EMMA_FILENAME%
