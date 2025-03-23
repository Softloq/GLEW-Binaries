@setlocal
@for /F "delims== tokens=1,* eol=#" %%i in ('type .env') do @set %%i=%%~j

cmake -S %~dp0Prerequisite -B %~dp0build/Prerequisite
cmake --build %~dp0build/Prerequisite

cmake -S %~dp0Compile -B %~dp0build/Compile -G"Visual Studio 17 2022" -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON
cmake --build %~dp0build/Compile  --config Release
cmake --install %~dp0build/Compile --prefix %~dp0build/Package/glew-%GLEW_VERSION%

cmake -S %~dp0Package -B %~dp0build/Package
cmake --build %~dp0build/Package
@endlocal