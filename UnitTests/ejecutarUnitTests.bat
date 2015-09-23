rem PATH de MSBuild para compilar el proyecto
SET MSBuild="C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"
rem PATH para la salida de la compilacion
SET OUTPUT_PATH="..\..\..\Output"
SET SEARCH_PATH="..\..\..\Output"
SET OUTPUT_COVERAGE_PATH="..\..\CoverageReports"
rem PATH para RSVARS -necesario-
SET RSVARS="C:\Program Files (x86)\Embarcadero\Studio\14.0\bin\rsvars.bat"
rem llamada a rsvars.bat
CALL %RSVARS%
%MSBuild% %1 /t:Build /p:Config=Debug;Platform=Win32;DCC_DcuOutput=%OUTPUT_PATH%;DCC_UnitSearchPath=%SEARCH_PATH%
%MSBuild% %2 /t:Build /p:Config=Debug;Platform=Win32;DCC_UnitSearchPath=%SEARCH_PATH%

rem ".\UnitTests\Win32\Debug\%3"
rem ejecuta la libreria de metricas y genera los resultados
%CodeCoverage% -e ".\UnitTests\Win32\Debug\%3" -u %1 -od %OUTPUT_COVERAGE_PATH% -html -xml -emma -lt