rem PATH de MSBuild para compilar el proyecto
SET MSBuild="C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"
rem PATH para los BUILDS
SET BUILDS=C:\Program Files (x86)\Jenkins\jobs\pruebacompilacionlibreria\builds\
rem PATH para la salida de la compilacion
SET OUTPUT_PATH=".\Output"
rem PATH para RSVARS -necesario-
SET RSVARS="C:\Program Files (x86)\Embarcadero\Studio\14.0\bin\rsvars.bat"
rem llamada a rsvars.bat
CALL %RSVARS%
%MSBuild% DTO.dproj /t:Build /p:Config=Debug;Platform=Win32;DCC_DcuOutput=%OUTPUT_PATH%