rem PATH de MSBuild para compilar el proyecto
SET MSBuild="C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"
rem PATH para la salida de la compilacion
SET OUTPUT_PATH="..\..\Output"
SET OUTPUT_BPL_PATH="..\..\Coverage"
rem PATH para RSVARS -necesario-
SET RSVARS="C:\Program Files (x86)\Embarcadero\Studio\14.0\bin\rsvars.bat"
rem llamada a rsvars.bat
CALL %RSVARS%
rem Compila el proyecto y genera los archivos de la BPL en el %OUTPUT_MAP_PATH%
%MSBuild% %1 /t:Build /p:Config=Debug;Platform=Win32;DCC_DcuOutput=%OUTPUT_PATH%;DCC_BplOutput=%OUTPUT_BPL_PATH%
