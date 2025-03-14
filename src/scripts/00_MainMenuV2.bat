@echo off
REM -------------------------------
REM Configuración de la base de datos
REM -------------------------------
set SERVER=localhost
set DATABASE=arcee
set PORT=5432
set USERNAME=postgres
set PASSWORD=2956939xD

REM Ruta de PostgreSQL (Ajustar según instalación)
set PSQL_PATH="C:\Program Files\PostgreSQL\15\bin\psql.exe"
set PGDUMP_PATH="C:\Program Files\PostgreSQL\15\bin\pg_dump.exe"

REM Ruta de respaldo
set BACKUP_PATH=src\backup\arcee_backup.sql

REM -------------------------------
REM Menú de opciones
REM -------------------------------
echo Selecciona una opción:
echo [1] Conectarse a la base de datos
echo [2] Realizar copia de seguridad
echo [3] Restaurar base de datos desde backup
echo [4] Crear la base de datos si no existe
set /p OPTION="Opción: "

REM Establecer contraseña temporalmente
set PGPASSWORD=%PASSWORD%

REM -------------------------------
REM Opciones del script
REM -------------------------------
if "%OPTION%"=="1" (
    echo Conectando a la base de datos %DATABASE%...
    %PSQL_PATH% -h %SERVER% -p %PORT% -U %USERNAME% -d %DATABASE%
)

if "%OPTION%"=="2" (
    echo Realizando copia de seguridad de la base de datos %DATABASE%...
    %PGDUMP_PATH% -h %SERVER% -p %PORT% -U %USERNAME% -F p -d %DATABASE% -f %BACKUP_PATH%
    if %ERRORLEVEL% equ 0 (
        echo ✅ Copia de seguridad completada exitosamente.
    ) else (
        echo ❌ Error al realizar la copia de seguridad.
    )
)

if "%OPTION%"=="3" (
    echo Restaurando la base de datos desde %BACKUP_PATH%...
    %PSQL_PATH% -h %SERVER% -p %PORT% -U %USERNAME% -d %DATABASE% -f %BACKUP_PATH%
    if %ERRORLEVEL% equ 0 (
        echo ✅ Base de datos restaurada exitosamente.
    ) else (
        echo ❌ Error al restaurar la base de datos.
    )
)

if "%OPTION%"=="4" (
    echo Creando la base de datos %DATABASE% si no existe...
    %PSQL_PATH% -h %SERVER% -p %PORT% -U %USERNAME% -c "CREATE DATABASE %DATABASE%"
    if %ERRORLEVEL% equ 0 (
        echo ✅ Base de datos creada exitosamente.
    ) else (
        echo ❌ Error al crear la base de datos o ya existe.
    )
)

REM -------------------------------
REM Limpieza de seguridad
REM -------------------------------
set PGPASSWORD=

pause
