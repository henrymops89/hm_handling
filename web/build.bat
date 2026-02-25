@echo off
echo ══════════════════════════════════════════════
echo   HM Handling — Build (Obfuscate app.js)
echo ══════════════════════════════════════════════
echo.

cd /d "%~dp0"

if not exist "app.src.js" (
    echo [ERROR] app.src.js nicht gefunden!
    pause
    exit /b 1
)

echo [1/2] Obfuskiere app.src.js ...
javascript-obfuscator app.src.js --output app.js --compact true --string-array true --string-array-encoding base64

if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Obfuskierung fehlgeschlagen!
    pause
    exit /b 1
)

echo [2/2] Fertig!
echo.
for %%A in (app.src.js) do echo   Quelle:  %%~nxA (%%~zA Bytes)
for %%A in (app.js) do echo   Output:  %%~nxA (%%~zA Bytes)
echo.
echo app.js wurde erfolgreich erstellt.
pause
