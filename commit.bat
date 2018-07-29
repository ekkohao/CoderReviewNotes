@echo off

:reinput

set /p input=ÇëÊäÈë commit ĞÅÏ¢£º

if "%input%"=="" goto reinput

git add . && git commit -m "%input%" && git push

pause