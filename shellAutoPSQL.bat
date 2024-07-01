@echo off
REM Define las variables con las credenciales de tu base de datos
set SERVER=localhost
set DATABASE=postgres
set PORT=5432
set USERNAME=postgres

REM Ejecuta el comando psql con las credenciales
psql -h %SERVER% -d %DATABASE% -p %PORT% -U %USERNAME%
