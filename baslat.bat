@echo off
set PYTHONIOENCODING=utf-8
set PYTHONUTF8=1
chcp 65001 > nul

title SecuAsist Yonetim Paneli Sunucusu
echo ==========================================
echo SecuAsist Sunucusu (V1.0.2) Baslatiliyor...
echo ==========================================

:: 1. Python Kontrolu
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [HATA] Python bulunamadi! Lutfen Python'un yuklu oldugundan emin olun.
    pause
    exit /b
)

:: 2. Baslatma
echo.
echo Sunucu aktif ediliyor...
python server_web.py

echo.
echo ------------------------------------------
echo Sunucu kapandi. Pencerenin kapanmamasi icin:
echo.
pause
