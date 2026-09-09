@echo on
set "CONDA_SUBDIR=win-64"
if not exist C:\harfbuzz-tools\python.exe (
    "%RUNNER_TEMP%\micromamba.exe" create -y -p C:\harfbuzz-tools -c conda-forge conda-build conda-index
    if errorlevel 1 exit /b 1
)
call C:\harfbuzz-tools\condabin\conda.bat activate C:\harfbuzz-tools
if errorlevel 1 exit /b 1
python ci\build.py %1
if errorlevel 1 exit /b 1
