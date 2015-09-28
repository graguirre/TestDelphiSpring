rem PATH de MSBuild para compilar el proyecto
SET MSBuild="C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"
rem PATH para la salida de la compilacion
SET OUTPUT_PATH="..\..\Output"
SET SEARCH_PATH="..\..\Output"
SET OUTPUT_BPL_PATH="Coverage"
SET COVERAGE_EXE_PATH="..\..\DelphiCodeCoverage"
SET OUTPUT_COVERAGE_PATH="..\..\CoverageReports"
SET OUTPUT_EMMA_FILENAME="emma\coverage.xml"

SET COVERAGE_OUTPUT_FILENAME="CodeCoverage_Summary.xml"
rem PATH para RSVARS -necesario-
SET RSVARS="C:\Program Files (x86)\Embarcadero\Studio\14.0\bin\rsvars.bat"
rem PATH para CodeCoverage
SET CodeCoverage="%COVERAGE_EXE_PATH%\CodeCoverage.exe"
rem llamada a rsvars.bat
CALL %RSVARS%
%MSBuild% %1 /t:Build /p:Config=Debug;Platform=Win32;DCC_DcuOutput=%OUTPUT_PATH%;DCC_UnitSearchPath=%SEARCH_PATH%
%MSBuild% %2 /t:Build /p:Config=Debug;Platform=Win32;DCC_UnitSearchPath=%SEARCH_PATH%

rem Mueve el fichero map del proyecto a la ruta del proyecto para la generacion de las metricas
move %OUTPUT_BPL_PATH%\*.map %5
rem ".\UnitTests\Win32\Debug\%3"
rem ejecuta la libreria de metricas y genera los resultados
%CodeCoverage% -e ".\UnitTests\Win32\Debug\%3" -u %4 -od %OUTPUT_COVERAGE_PATH% -html -xml -emma -lt
mkdir emma
move %OUTPUT_COVERAGE_PATH%\%COVERAGE_OUTPUT_FILENAME% %5\%OUTPUT_EMMA_FILENAME%
