@echo off
REM =============================
REM Configuração do MySQL com log
REM =============================

SET MYSQL_USER=root
SET MYSQL_PASS=
SET MYSQL_HOST=127.0.0.1
SET MYSQL_PORT=3306
SET DB_NAME=meubanco
SET SQL_FILE=install_database.sql
SET LOG_FILE=database_installer.log

REM Limpar log antigo
if exist %LOG_FILE% del /f /q %LOG_FILE%

REM Verificar se o banco já existe
mysql -u %MYSQL_USER% -p%MYSQL_PASS% -h %MYSQL_HOST% -P %MYSQL_PORT% -e "USE %DB_NAME%;" >nul 2>&1

IF %ERRORLEVEL% EQU 0 (
    echo %DATE% %TIME% | Database já existe >> %LOG_FILE%
) ELSE (
    REM Criar banco e tabelas
    echo %DATE% %TIME% | Criando database... >> %LOG_FILE%
    mysql -u %MYSQL_USER% -p%MYSQL_PASS% -h %MYSQL_HOST% -P %MYSQL_PORT% < %SQL_FILE% >> %LOG_FILE% 2>&1

    IF %ERRORLEVEL% EQU 0 (
        echo %DATE% %TIME% | Database Criado com sucesso >> %LOG_FILE%
    ) ELSE (
        echo %DATE% %TIME% | ERRO: Falha ao criar database >> %LOG_FILE%
        pause
        exit /b 1
    )
)

echo Configuração concluída.
pause
