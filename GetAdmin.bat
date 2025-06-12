: BatchGotAdmin
REM  --> Check for permissions
REM -- Optional suppress output -- 
REM >nul 2>&1
"%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    if '%1'=='UACdone' (shift & goto gotAdmin)
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "cmd.exe", "/k %~s0 UACdone", "", "runas", 1 >> "%temp%\getadmin.vbs"

    REM -- Use this if you do not need to keep the terminal open --
    REM echo UAC.ShellExecute "%~0", "UACdone", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    REM pushd "%CD%"
    REM CD /D "%~dp0"
	
REM https://stackoverflow.com/questions/15604640/windows-batch-script-requesting-uac-admin-rights-in-a-log-friendly-way
:--------------------------------------
REM How to use: Add batch code at the bottom here to run after permissions are granted
