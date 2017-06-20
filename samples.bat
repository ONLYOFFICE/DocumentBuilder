@echo off

set SAMPLES_PATH=TESTFILES

cd %~dp0

if not exist %SAMPLES_PATH% mkdir %SAMPLES_PATH%

for /r %%i in (samples\*.docbuilder) do docbuilder.exe "%%i"
