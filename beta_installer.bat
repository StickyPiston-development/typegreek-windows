@echo [off]
title TypeGreek installer

if not exist "%UserProfile%\.typegreek_beta" mkdir %UserProfile%\.typegreek_beta

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

curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/Beta/Launch_Scripts/TypeGreek%20Windows%2032%20bit.bat" -o "TypeGreek Windows Beta 32 bit.bat"
curl -A "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64)" -L "https://raw.githubusercontent.com/MrStickyPiston/typegreek-windows/installer/Beta/Launch_Scripts/TypeGreek%20Windows%2064%20bit.bat" -o "TypeGreek Windows Beta 64 bit.bat"

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

echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "TypeGreek windows and AutoHotKey have been installed!" ,10 ,"TypeGreek windows installer", 0)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
del %tmp%\tmp.vbs

cd %UserProfile%\downloads
