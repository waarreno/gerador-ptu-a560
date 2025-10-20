```batch
@echo off
chcp 65001 > nul
cls

REM Verificar se o Node.js portável existe
if not exist "nodejs-portable\node.exe" (
    echo ❌ ERRO: Node.js portátil não encontrado!
    echo.
    echo Por favor, baixe o Node.js portátil e extraia na pasta "nodejs-portable"
    echo Download: https://nodejs.org/dist/v20.11.0/node-v20.11.0-win-x64.zip
    echo.
    pause
    exit /b 1
)

REM Definir variáveis de ambiente
set NODE_PATH=%~dp0nodejs-portable
set PATH=%NODE_PATH%;%PATH%

REM Verificar se as dependências estão instaladas
if not exist "nodejs-portable\node_modules" (
    echo 📦 Instalando dependências pela primeira vez...
    echo.
    "%NODE_PATH%\node.exe" "%NODE_PATH%\npm" install --prefix "%~dp0"
    echo.
)

REM Executar a aplicação
echo 🚀 Iniciando aplicação...
echo.
"%NODE_PATH%\node.exe" "%~dp0src\index.js"

echo.
pause
```