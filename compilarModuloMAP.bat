rem PATH de MSBuild para compilar el proyecto
SET MSBuild="C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"
rem PATH para la salida de la compilacion
SET OUTPUT_PATH="..\..\Output"
SET OUTPUT_MAP_PATH="..\..\Coverage"
SET OUTPUT_COVERAGE_PATH="..\..\CoverageReports"
rem PATH para RSVARS -necesario-
SET RSVARS="C:\Program Files (x86)\Embarcadero\Studio\14.0\bin\rsvars.bat"
rem PATH para CodeCoverage
SET CodeCoverage="%OUTPUT_MAP_PATH%\CodeCoverage.exe"
rem llamada a rsvars.bat
CALL %RSVARS%
rem Compila el proyecto y genera los archivos de la BPL en el %OUTPUT_MAP_PATH%
%MSBuild% %1.dproj /t:Build /p:Config=Debug;Platform=Win32;DCC_DcuOutput=%OUTPUT_PATH%;DCC_BplOutput=%OUTPUT_MAP_PATH%
rem Mueve el fichero map del proyecto a la ruta del proyecto para la generacion de las metricas
move %OUTPUT_MAP_PATH%\*.map %2
rem ejecuta la libreria de metricas y genera los resultados
rem %CodeCoverage% -e %3 -u %1 -od %OUTPUT_COVERAGE_PATH% -html -xml -emma -lt
