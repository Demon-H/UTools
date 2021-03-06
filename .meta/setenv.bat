@echo off

rem Don't write here, if needed, call from another batch file
rem setlocal EnableDelayedExpansion
rem if errorlevel 1 (
rem   echo Unable to enable delay extensions
rem )

: trim trailing slash or backslash
if "%UTOOLS:~-1%" == "\" set UTOOLS=%UTOOLS:~0,-1%
if "%UTOOLS:~-1%" == "/" set UTOOLS=%UTOOLS:~0,-1%

: adding batch tools folder to PATH
set PATH=%UTOOLS%;%PATH%

: set some variables
set _META=%UTOOLS%\.meta
set _META_IMPL=%UTOOLS%\.meta\impl
set UTOOLS_CONFIG=%UTOOLS%\config
set TOOLS_ALIASES=tools_aliases


: simulate shebang
assoc .pysh=shebang
ftype shebang="%_META%\shebang.bat" "%%1" %%*
set PATHEXT=.pysh;%PATHEXT%

: make temp folder in current dir
set _TEMPDIR=%UTOOLS%\temp
if not exist "%_TEMPDIR%" mkdir "%_TEMPDIR%"
attrib +h +s "%_TEMPDIR%" /D /S

rem Here is alias already defined by Cmder: %CMDER_ROOT%\config\user-aliases.cmd
call "%_META%\make_alias.bat"

rem should be clear when all succeed, keep error msg vise verse.
cls
