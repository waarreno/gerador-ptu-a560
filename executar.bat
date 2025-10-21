@echo off
chcp 65001 > nul
cls

echo ========================================
echo  Gerador PTU A560 - Inicializacao
echo ========================================
echo.

REM Definir variaveis
set NODE_VERSION=22.20.0
set NODE_URL=https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-win-x64.zip
set NODE_ZIP=node-portable.zip
set NODE_FOLDER=node-v%NODE_VERSION%-win-x64
set NODE_PATH=%~dp0nodejs-portable

REM Verificar se o Node.js portavel existe
if not exist "%NODE_PATH%\node.exe" (
    echo [1/3] Node.js portavel nao encontrado
    echo.
    echo Baixando Node.js v%NODE_VERSION%...
    echo Aguarde, isso pode levar alguns segundos...
    echo.
    
    REM Baixar Node.js usando PowerShell com barra de progresso
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference = 'SilentlyContinue'; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $webClient = New-Object System.Net.WebClient; $webClient.DownloadFile('%NODE_URL%', '%NODE_ZIP%'); Write-Host 'Download concluido!'"
    
    if errorlevel 1 (
        echo.
        echo ERRO: Falha ao baixar Node.js
        echo Por favor, verifique sua conexao com a internet
        echo URL: %NODE_URL%
        echo.
        pause
        exit /b 1
    )
    
    echo.
    echo Extraindo arquivos...
    echo Aguarde...
    echo.
    
    REM Extrair usando PowerShell de forma otimizada
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference = 'SilentlyContinue'; Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('%NODE_ZIP%', '.'); Write-Host 'Extracao concluida!'"
    
    if errorlevel 1 (
        echo.
        echo ERRO: Falha ao extrair Node.js
        echo.
        pause
        exit /b 1
    )
    
    REM Renomear pasta para nodejs-portable
    if exist "%NODE_FOLDER%" (
        if exist "%NODE_PATH%" (
            rmdir /s /q "%NODE_PATH%"
        )
        move "%NODE_FOLDER%" "%NODE_PATH%" >nul
    )
    
    REM Limpar arquivo zip
    if exist "%NODE_ZIP%" (
        del /q "%NODE_ZIP%"
    )
    
    echo.
    echo Node.js instalado com sucesso!
    echo.
) else (
    echo [1/3] Node.js portavel encontrado
    echo.
)

REM Definir variaveis de ambiente
set PATH=%NODE_PATH%;%PATH%

REM Verificar se as dependencias estao instaladas
if not exist "%~dp0node_modules" (
    echo [2/3] Instalando dependencias do projeto...
    echo Aguarde, isso pode levar alguns minutos...
    echo.
    
    REM Usar npm.cmd no Windows
    call "%NODE_PATH%\npm.cmd" install --prefer-offline --no-audit --no-fund --loglevel=error
    
    if errorlevel 1 (
        echo.
        echo ERRO: Falha ao instalar dependencias
        echo Tentando novamente sem cache...
        echo.
        call "%NODE_PATH%\npm.cmd" install --no-audit --no-fund --loglevel=error
        
        if errorlevel 1 (
            echo.
            echo ERRO: Falha ao instalar dependencias
            echo.
            pause
            exit /b 1
        )
    )
    
    echo.
    echo Dependencias instaladas com sucesso!
    echo.
) else (
    echo [2/3] Dependencias ja instaladas
    echo.
)

REM Executar a aplicacao
echo [3/3] Iniciando aplicacao...
echo.
echo ========================================
echo.

"%NODE_PATH%\node.exe" "%~dp0src\index.js"

echo.
echo ========================================
echo  Processamento concluido
echo ========================================
echo.
pause