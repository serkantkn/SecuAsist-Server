@echo off
title SecuAsist Yönetim Paneli Sunucusu
echo ==========================================
echo SecuAsist Sunucusu Başlatılıyor...
echo ==========================================
echo.

:: 1. Python Kontrolü
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [HATA] Python bulunamadı! 
    echo Lütfen Python'un yüklü olduğundan ve 'Add Python to PATH' seçeneğinin işaretli olduğundan emin olun.
    pause
    exit /b
)

echo 1. PIP Aracı Güncelleniyor...
python -m pip install --upgrade pip --quiet

echo 2. Kütüphaneler Yükleniyor... (Lütfen bekleyin)
:: 'python -m pip' kullanmak daha güvenlidir
python -m pip install -r requirements.txt

if %errorlevel% neq 0 (
    echo.
    echo [HATA] Kütüphaneler yüklenirken bir sorun oluştu.
    echo 'pydantic-core' hatası alıyorsanız, lütfen 64-bit Python 3.10+ kullandığınızdan emin olun.
    echo.
    pause
    exit /b
)

echo.
echo 3. Web Arayüzü Tarayıcıda Açılıyor...
start http://localhost:8000

echo.
echo 4. Sunucu Aktif!
echo ------------------------------------------
echo UYARI: Bu siyah pencere sunucunun kendisidir.
echo Sunucunun çalışması için bu pencerenin AÇIK kalması gerekir.
echo Web sayfasını kapatsanız bile sunucu çalışmaya devam eder.
echo ------------------------------------------
echo.

python server_web.py
pause
