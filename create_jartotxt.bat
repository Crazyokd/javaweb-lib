@echo off

cd lib
setlocal enabledelayedexpansion
for %%a in (*.*) do (
    set t=%%a
    if "!t:~-4!"==".jar" (
        set t=!t:~0,-4!.txt
        > !t! set /p="" <nul
    )  
)
endlocal

cd %~dp0