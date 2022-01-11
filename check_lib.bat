@echo off

cd lib
setlocal enabledelayedexpansion
set /A total=0
set /A success=0
for %%a in (*.*) do (
    set t=%%a
    if "!t:~-4!"==".txt" (
        
        for /f %%i in ('type !t!') do (
            if "%%i"=="" (
                echo The content of %%a is empty.
            ) else (
                set /A success=!success!+1
            )
            set /A total=!total!+1
        )
    )  
)
set /A fail=!total!-!success!
echo The number of files is !total!.
echo The number of valid files is !success!.
echo The number of invalid files is !fail!.
endlocal

cd %~dp0