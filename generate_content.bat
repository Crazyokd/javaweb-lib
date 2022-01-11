@echo off

@REM dir /s /B *.jar > .\lib.txt

@REM input head.md
type README\head.md > README.md
cd lib
setlocal enabledelayedexpansion
for %%a in (*.*) do (
    
    set t=%%a
    if "!t:~-4!"==".txt" (
        set t=!t:~0,-4!.jar
        >>..\README.md set /p="- [!t!](" <nul
        type %%a >>..\README.md
        >>..\README.md set /p=")" <nul
        @rem output new line
        echo. >> ..\README.md
    )  
)
echo. >> ..\README.md  

endlocal

cd %~dp0

@REM input foot.md
type README\foot.md >> README.md

if exist push.bat (
    call push.bat
    echo Push Succeeded!
) else (
    echo Please push manually!
)