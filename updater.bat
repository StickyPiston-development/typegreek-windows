@echo off
title TypeGreek host
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit

cd %UserProfile%\.typegreek
del -f typegreek_EN.exe
del -f typegreek_NL.exe

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/MrStickyPiston/typegreek-windows/blob/installer/TypeGreek_EN.exe?raw=true" -o typegreek_EN.exe
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/MrStickyPiston/typegreek-windows/blob/installer/TypeGrieks_NL.exe?raw=true" -o typegreek_NL.exe

cd %appdata%\Microsoft\Windows\Start Menu\Programs\Startup
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/updater.bat" > TypeGreek_windows_updater.bat

exit