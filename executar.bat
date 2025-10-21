@echo off
chcp 65001 > nul
cls

REM Verificar se o Node.js portavel existe
if not exist "nodejs-portable\node.exe" (
    echo ERRO: Node.js portavel nao encontrado!
    echo.
    echo Por favor, baixe o Node.js portavel e extraia na pasta "nodejs-portable"
    echo Download: https://nodejs.org/dist/v22.20.0/node-v22.20.0-win-x64.zip
    echo.
    pause
    exit /b 1
)

REM Definir variaveis de ambiente
set NODE_PATH=%~dp0nodejs-portable
set PATH=%NODE_PATH%;%PATH%

REM Verificar se as dependencias estao instaladas
if not exist "nodejs-portable\node_modules" (
    echo Instalando dependencias pela primeira vez...
    echo.
    "%NODE_PATH%\node.exe" "%NODE_PATH%\npm" install --prefix "%~dp0"
    echo.
)

REM Executar a aplicacao
echo Iniciando aplicacao...
echo.
"%NODE_PATH%\node.exe" "%~dp0src\index.js"

echo.
pause