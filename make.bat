@echo off
:start
cls
set /p C02choice="Do you want to make this in 65C02 mode? (y/n):"

if /I "%C02choice%"=="y" goto :C02mode
if /I "%C02choice%"=="n" goto :regmode

echo Invalid input.
pause
goto :start

:C02mode
echo 65C02 mode selected
.\ca65 defines.s -D C02
.\ld65 defines.o -C program.cfg
goto :eof

:regmode
echo 6502 mode selected
.\ca65 defines.s
.\ld65 defines.o -C program.cfg
goto :eof
