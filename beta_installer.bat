@echo [off]
title TypeGreek installer

if not exist "%UserProfile%\.typegreek_beta" mkdir %UserProfile%\.typegreek_beta

cd %UserProfile%\.typegreek_beta
del -f typegreek_EN.ahk
del -f typegreek_NL.ahk

del -f AutoHotkeyU32.exe
del -f AutoHotKeyU64.exe

del -f TypeGreek Windows 32 bit.bat
del -f TypeGreek Windows 64 bit.bat

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/main/TypeGreek_EN.ahk" -o typegreek_EN.ahk
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/main/TypeGrieks_NL.ahk" -o typegreek_NL.ahk

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/MrStickyPiston/typegreek-windows/blob/installer/Beta/AutoHotkeyU32.exe?raw=True" -o AutoHotkeyU32.exe
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://github.com/MrStickyPiston/typegreek-windows/blob/installer/Beta/AutoHotkeyU64.exe?raw=True" -o AutoHotKeyU64.exe

cd %AppData%\Microsoft\Windows\Start Menu\Programs\
mklink /h "TypeGreek windows (EN).exe" "%UserProfile%\.typegreek\typegreek_EN.exe"
mklink /h "TypeGreek windows (NL).exe" "%UserProfile%\.typegreek\typegreek_NL.exe"

cd %UserProfile%\Desktop
mklink /h "TypeGreek Windows (EN).exe" "%UserProfile%\.typegreek\typegreek_EN.exe"
mklink /h "TypeGreek Windows (NL).exe" "%UserProfile%\.typegreek\typegreek_NL.exe"

echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "TypeGreek windows and AutoHotKey have been installed!" ,10 ,"TypeGreek windows installer", 0)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs

cd %UserProfile%\downloads
