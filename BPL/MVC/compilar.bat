rem PATH de MSBuild para compilar el proyecto
SET MSBuild="C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"
rem PATH para la salida de la compilacion
SET SEARCH_PATH="..\Gestores\Win32\Debug;..\DAOs\Win32\Debug;..\DTOs\Win32\Debug;..\ModulosBasicos\Win32\Debug"
rem PATH para RSVARS -necesario-
SET RSVARS="C:\Program Files (x86)\Embarcadero\Studio\14.0\bin\rsvars.bat"
rem llamada a rsvars.bat
CALL %RSVARS%
%MSBuild% %1 /t:Build /p:Config=Debug;Platform=Win32;DCC_UnitSearchPath=%SEARCH_PATH%
