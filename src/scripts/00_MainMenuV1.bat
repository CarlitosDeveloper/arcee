@echo off
setlocal

REM Ruta de la base de datos
set DB_PATH=src\database\production.db

REM Ruta base donde se guardarán y buscarán las copias de seguridad
set BACKUP_BASE_DIR=C:\Users\carlo\Documents\arcee\src\backup

REM Obtener la fecha actual en formato YYYYMMDD
for /f "tokens=2 delims==" %%I in ('wmic OS get localdatetime /value') do set DATETIME=%%I
set DATE=%DATETIME:~0,8%

REM Crear una carpeta con la fecha actual para guardar las copias de seguridad
set BACKUP_DIR=%BACKUP_BASE_DIR%\%DATE%
if not exist %BACKUP_DIR% (
    mkdir %BACKUP_DIR%
)

REM Menú de opciones
:MENU
echo Seleccione una opción:
echo 0. Salir
echo 1. Copia de seguridad de solo la estructura de la base de datos
echo 2. Copia de seguridad de solo los datos de la base de datos
echo 3. Copia de seguridad de ambos (estructura y datos) de la base de datos
echo 5. Restaurar solo la estructura de la base de datos
echo 6. Restaurar solo los datos de la base de datos
echo 7. Restaurar ambos (estructura y datos) de la base de datos
set /p OPTION=Ingrese su opción (0, 1, 2, 3, 5, 6, 7): 

if "%OPTION%"=="1" goto BACKUP_SCHEMA
if "%OPTION%"=="2" goto BACKUP_DATA
if "%OPTION%"=="3" goto BACKUP_DB
if "%OPTION%"=="5" goto RESTORE_SCHEMA
if "%OPTION%"=="6" goto RESTORE_DATA
if "%OPTION%"=="7" goto RESTORE_DB
if "%OPTION%"=="0" goto END
goto MENU

:BACKUP_SCHEMA
echo Creando copia de seguridad de la estructura de la base de datos...
sqlite3 %DB_PATH% .schema > %BACKUP_DIR%\schema_%DATE%.sql
echo Copia de seguridad de la estructura completada: %BACKUP_DIR%\schema_%DATE%.sql
goto MENU

:BACKUP_DATA
echo Creando copia de seguridad de los datos de la base de datos...
sqlite3 %DB_PATH% ".mode insert" ".dump" > %BACKUP_DIR%\data_%DATE%.sql
echo Copia de seguridad de los datos completada: %BACKUP_DIR%\data_%DATE%.sql
goto MENU

:BACKUP_DB
echo Creando copia de seguridad completa (estructura y datos) de la base de datos...
sqlite3 %DB_PATH% .dump > %BACKUP_DIR%\backup_%DATE%.sql
echo Copia de seguridad completa completada: %BACKUP_DIR%\backup_%DATE%.sql
goto MENU

:RESTORE_SCHEMA
echo Restaurando solo la estructura de la base de datos...
set /p RESTORE_DATE=Ingrese la fecha de la copia de seguridad (YYYYMMDD):
sqlite3 %DB_PATH% < %BACKUP_BASE_DIR%\%RESTORE_DATE%\schema_%RESTORE_DATE%.sql
echo Restauración de la estructura completada.
goto MENU

:RESTORE_DATA
echo Restaurando solo los datos de la base de datos...
set /p RESTORE_DATE=Ingrese la fecha de la copia de seguridad (YYYYMMDD):
sqlite3 %DB_PATH% < %BACKUP_BASE_DIR%\%RESTORE_DATE%\data_%RESTORE_DATE%.sql
echo Restauración de los datos completada.
goto MENU

:RESTORE_DB
echo Restaurando estructura y datos de la base de datos...
set /p RESTORE_DATE=Ingrese la fecha de la copia de seguridad (YYYYMMDD):
sqlite3 %DB_PATH% < %BACKUP_BASE_DIR%\%RESTORE_DATE%\backup_%RESTORE_DATE%.sql
echo Restauración completa de la base de datos completada.
goto MENU

:END
echo Operación finalizada.
pause
endlocal