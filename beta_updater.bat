@echo off
title TypeGreek host
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit

cd %UserProfile%\.typegreek_beta
del -f typegreek_EN.ahk
del -f typegreek_NL.ahk

del -f AutoHotkeyU32.exe
del -f AutoHotKeyU64.exe

del -f "TypeGreek Windows Beta 32 bit.bat"
del -f "TypeGreek Windows Beta 64 bit.bat"

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/main/TypeGreek_EN.ahk" -o typegreek_EN.ahk
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/main/TypeGrieks_NL.ahk" -o typegreek_NL.ahk

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/MrStickyPiston/typegreek-windows/blob/installer/Beta/AutoHotkeyU32.exe?raw=True" -o AutoHotkeyU32.exe
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/MrStickyPiston/typegreek-windows/blob/installer/Beta/AutoHotkeyU64.exe?raw=True" -o AutoHotKeyU64.exe

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/Beta/Launch_Scripts/TypeGreek_Windows_32_bit.bat" -o "TypeGreek Windows Beta 32 bit.bat"
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/Beta/Launch_Scripts/TypeGreek_Windows_64_bit.bat" -o "TypeGreek Windows Beta 64 bit.bat"

cd %AppData%\Microsoft\Windows\Start Menu\Programs\
del "TypeGreek Windows Beta 32 Bit.bat"
del "TypeGreek Windows Beta 64 Bit.bat"

mklink /h "TypeGreek Windows Beta 32 Bit.bat" "%UserProfile%\.typegreek_beta\TypeGreek Windows Beta 32 bit.bat"
mklink /h "TypeGreek Windows Beta 64 Bit.bat" "%UserProfile%\.typegreek_beta\TypeGreek Windows Beta 64 bit.bat"

cd %UserProfile%\Desktop
del "TypeGreek Windows Beta 32 Bit.bat"
del "TypeGreek Windows Beta 64 Bit.bat"

mklink /h "TypeGreek Windows Beta 32 Bit.bat" "%UserProfile%\.typegreek_beta\TypeGreek Windows Beta 32 bit.bat"
mklink /h "TypeGreek Windows Beta 64 Bit.bat" "%UserProfile%\.typegreek_beta\TypeGreek Windows Beta 64 bit.bat"

cd %appdata%\Microsoft\Windows\Start Menu\Programs\Startup
del TypeGreek_windows_beta_updater.bat
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/beta_updater.bat" -o TypeGreek_windows_beta_updater.bat

exit