@echo off
title TypeGreek host
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
echo You can close this window.
%UserProfile%\.typegreek_beta\AutoHotkeyU64 %UserProfile%\.typegreek_beta\typegreek_EN.ahk
exit