@echo off

:reinput

set /p input=请输入 commit 信息：

if "%input%"=="" goto reinput

:reconfirm

set /p confirm=请确认输入信息【%input%】（Y / N）

if %confirm% == N goto reinput
if %confirm% == n goto reinput
if %confirm% neq Y (if %confirm% neq y goto reconfirm )

git add . && git commit -m "%input%" && git push

pause