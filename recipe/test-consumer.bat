@echo on
cl /nologo test-consumer.c /I"%LIBRARY_INC%\harfbuzz" "%LIBRARY_LIB%\harfbuzz.lib" /Fe:hb-consumer.exe
if errorlevel 1 exit /b 1
hb-consumer.exe test\api\fonts\Inconsolata-Regular.abc.ttf
if errorlevel 1 exit /b 1
hb-shape test\api\fonts\Inconsolata-Regular.abc.ttf abc
if errorlevel 1 exit /b 1
set "EXPECTED_MACHINE=8664 machine (x64)"
if "%target_platform%" == "win-arm64" set "EXPECTED_MACHINE=AA64 machine (ARM64)"
for %%F in ("hb-consumer.exe" "%LIBRARY_BIN%\hb-shape.exe" "%LIBRARY_BIN%\hb-view.exe" "%LIBRARY_BIN%\harfbuzz*.dll") do (
    dumpbin /headers "%%~F" | findstr /c:"%EXPECTED_MACHINE%"
    if errorlevel 1 exit /b 1
)
