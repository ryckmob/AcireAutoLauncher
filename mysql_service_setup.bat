@echo off
echo ==========================================
echo Instalacao e ativacao do servico MySQL
echo ==========================================

echo.
echo Etapa 1 Instalando servico MySQL
mysqld --install MySQL
if %errorlevel% neq 0 (
    echo ERRO Falha ao instalar o servico MySQL
    pause
    exit /b 1
)
echo SUCESSO Servico MySQL instalado

echo.
echo Etapa 2 Configurando inicio automatico
sc.exe config MySQL start= auto
if %errorlevel% neq 0 (
    echo ERRO Falha ao configurar inicio automatico
    pause
    exit /b 1
)
echo SUCESSO Inicio automatico configurado

echo.
echo Etapa 3 Iniciando servico MySQL
net start MySQL
if %errorlevel% neq 0 (
    echo ERRO Falha ao iniciar o servico MySQL
    pause
    exit /b 1
)
echo SUCESSO Servico MySQL iniciado

echo.
echo ==========================================
echo Tudo certo MySQL ativo e automatico
echo ==========================================
pause
