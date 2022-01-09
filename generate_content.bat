@echo off

@REM dir /s /B *.jar > .\lib.txt

@REM input head.md
type README\head.md > README.md
cd lib

for %%i in (*.*) do (
    >>..\README.md set /p="- [%%i](lib/%%i)" <nul
    @rem output new line
    echo. >> ..\README.md  
)
echo. >> ..\README.md
cd %~dp0

@REM input foot.md
type README\foot.md >> README.md