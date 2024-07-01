@echo off
:menu
cls
echo =========================
echo       Menú Principal
echo =========================
echo 1. Instalar dependencias (npm install)
echo 2. Iniciar la aplicación en desarrollo (npm run start)
echo 3. Salir
echo =========================
set /p opcion="Selecciona una opción: "

if "%opcion%"=="1" goto instalar_dependencias
if "%opcion%"=="2" goto iniciar_desarrollo
if "%opcion%"=="3" goto salir

echo Opción no válida. Por favor, elige una opción del 1 al 10.
pause
goto menu

:instalar_dependencias
echo Instalando dependencias...
npm install
pause
goto menu

:iniciar_desarrollo
echo Iniciando la aplicación en desarrollo...
npm run start
pause
goto menu

:salir
echo Saliendo...
exit
