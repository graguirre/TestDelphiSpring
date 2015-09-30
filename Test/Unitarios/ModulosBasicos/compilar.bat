rem PATH de MSBuild para compilar el proyecto
SET MSBuild="C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe"
rem PATH para RSVARS -necesario-
CALL "C:\Program Files (x86)\Embarcadero\Studio\14.0\bin\rsvars.bat"
rem PATH para la salida de la compilacion
SET SEARCH_PATH="Win32\Debug;..\..\..\BPL\ModulosBasicos\Win32\Debug;
#set SEARCH_PATH=%SEARCH_PATH%C:\Program Files (x86)\Embarcadero\Studio\14.0\Componentes\spring4d\Source\Base;
#set SEARCH_PATH=%SEARCH_PATH%C:\Program Files (x86)\Embarcadero\Studio\14.0\Componentes\spring4d\Source\Base\Collections;C:\Program Files (x86)\Embarcadero\Studio\14.0\Componentes\spring4d\Source\Base\Reflection;
#set SEARCH_PATH=%SEARCH_PATH%C:\Program Files (x86)\Embarcadero\Studio\14.0\Componentes\spring4d\Source\Core\Container;C:\Program Files (x86)\Embarcadero\Studio\14.0\Componentes\spring4d\Source\Core\Services;
#set SEARCH_PATH=%SEARCH_PATH%C:\Program Files (x86)\Embarcadero\Studio\14.0\Componentes\spring4d\Source\Extensions\Cryptography;C:\Program Files (x86)\Embarcadero\Studio\14.0\Componentes\spring4d\Source\Extensions\Utils"

SET OUTPUT_PATH="Win32\Debug"

%MSBuild% %1 /t:Build /p:Config=Debug;Platform=Win32;DCC_DcuOutput=%OUTPUT_PATH%;DCC_UnitSearchPath=%SEARCH_PATH%
