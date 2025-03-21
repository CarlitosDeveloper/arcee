@echo off
setlocal ENABLEDELAYEDEXPANSION

REM -------------------------------
REM Configuración de la base de datos
REM -------------------------------
set SERVER=localhost
set DATABASE=arcee
set PORT=5432
set USERNAME=postgres
set PASSWORD=1234

REM Ruta de PostgreSQL (Asegúrate de que sea correcta)
set PGDUMP_PATH=C:\Program Files\PostgreSQL\17\bin\pg_dump.exe

REM Ruta donde se guardarán los backups
set BACKUP_DIR=C:\Users\carlo\Documents\arcee\src\backups

REM Obtener fecha y hora para el nombre del archivo (formato YYYYMMDD_HHMMSS)
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set DATETIME=%%I
set TIMESTAMP=%DATETIME:~0,8%_%DATETIME:~8,6%

REM Nombre del archivo de respaldo
set BACKUP_FILE=%BACKUP_DIR%\arcee%TIMESTAMP%.backup

REM -------------------------------
REM Crear directorio si no existe
REM -------------------------------
if not exist "%BACKUP_DIR%" (
    mkdir "%BACKUP_DIR%"
)

REM -------------------------------
REM Generar backup
REM -------------------------------
echo Generando copia de seguridad...
set PGPASSWORD=%PASSWORD%
"%PGDUMP_PATH%" -h %SERVER% -p %PORT% -U %USERNAME% -F c -b -v -f "%BACKUP_FILE%" %DATABASE%
set PGPASSWORD=

REM Verificación de éxito
if %ERRORLEVEL% neq 0 (
    echo ❌ Error al realizar la copia de seguridad.
) else (
    echo ✅ Copia de seguridad creada: "%BACKUP_FILE%"
)

pause
exit
