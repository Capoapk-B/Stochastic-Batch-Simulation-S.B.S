@echo off
title Stochastic Batch Simulation
mode con cols=70 lines=22
setlocal enabledelayedexpansion
chcp 65001 >nul

:start_sbs
set folder=AP

REM Create the base folder "AP" if it does not exist
if not exist "%folder%" (
    mkdir "%folder%"
    echo.
) else (
    echo.
)

REM Create subfolders inside the "AP" folder if they do not exist
if not exist "%folder%\user" (
    mkdir "%folder%\user"
    echo.
) else (
    echo.
)

if not exist "%folder%\knowledge" (
    mkdir "%folder%\knowledge"
    echo.
) else (
    echo.
)

if not exist "%folder%\action" (
    mkdir "%folder%\action"
    echo.
) else (
    echo.
)

REM Create subfolders inside the "knowledge" folder if they do not exist
if not exist "%folder%\knowledge\learned" (
    mkdir "%folder%\knowledge\learned"
    echo.
) else (
    echo.
)

for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

set "RESET=%ESC%[0m"
set "CYAN=%ESC%[96m"
set "YELLOW=%ESC%[93m"
set "GREEN=%ESC%[92m"
set "RED=%ESC%[91m"
set "MAGENTA=%ESC%[95m"
set "WHITE=%ESC%[97m"
echo %ESC%[?25l
set "c[0]=%CYAN%"
set "c[1]=%YELLOW%"
set "c[2]=%GREEN%"
set "c[3]=%RED%"
set "c[4]=%MAGENTA%"
set "c[5]=%WHITE%"

for /l %%A in (1,1,25) do (
    set "temp_line=    "
    for /l %%B in (1,1,39) do (
        set /a randCol=!random! %% 6
        set /a randChar=!random! %% 2
        for %%C in (!randCol!) do set "temp_line=!temp_line!!c[%%C]!!randChar!"
    )
    echo %ESC%[3;1H!temp_line!%RESET%
    
    for /l %%D in (1,1,2000) do rem
)

echo %ESC%[?25h

if not "%~1"=="" goto %~1

for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
set "YELLOW=%ESC%[33m"
set "RESET=%ESC%[0m"

set "padM=                   "
set "padC=                                                                    "

set frame=1

:menu_loop
cls
echo.
echo       %GREEN%T%RESET%OCHASTIC %GREEN%B%RESET%ATCH %GREEN%S%RESET%IMULATION%RESET%                                                by Capoapk
if %frame%==1 goto frame1
if %frame%==2 goto frame2
if %frame%==3 goto frame3
if %frame%==4 goto frame4
if %frame%==5 goto frame5


:frame1
echo.                                                                                                            
echo.
echo.
echo %YELLOW%%padC%   +------+ %RESET%
echo %YELLOW%%padC%   ^|      ^| %RESET%
echo %YELLOW%%padC%   ^|      ^| %RESET%
echo %YELLOW%%padC%   ^|      ^| %RESET%
echo %YELLOW%%padC%   ^|      ^|%RESET%
echo %YELLOW%%padC%   +------+%RESET%
goto menu_text

:frame2
echo.
echo.
echo %YELLOW%%padC%     +------+%RESET%
echo %YELLOW%%padC%    /      /^|%RESET%
echo %YELLOW%%padC%   +------+ ^|%RESET%
echo %YELLOW%%padC%   ^|      ^| ^|%RESET%
echo %YELLOW%%padC%   ^|      ^| ^|%RESET%
echo %YELLOW%%padC%   ^|      ^| +%RESET%
echo %YELLOW%%padC%   ^|      ^|/%RESET%
echo %YELLOW%%padC%   +------+%RESET%
goto menu_text

:frame3
echo.
echo %YELLOW%%padC%   +------+%RESET%
echo %YELLOW%%padC%   ^|      ^|%RESET%
echo %YELLOW%%padC%   ^|      ^|%RESET%
echo %YELLOW%%padC%   +------+ %RESET%
echo %YELLOW%%padC%   ^|      ^| %RESET%
echo %YELLOW%%padC%   ^|      ^| %RESET%
echo %YELLOW%%padC%   ^|      ^| %RESET%
echo %YELLOW%%padC%   ^|      ^|%RESET%
echo %YELLOW%%padC%   +------+%RESET%
goto menu_text

:frame4
echo.
echo.
echo %YELLOW%%padC%+-------+%RESET%
echo %YELLOW%%padC%^| \      \%RESET%
echo %YELLOW%%padC%^|  +------+ %RESET%
echo %YELLOW%%padC%^|  ^|      ^| %RESET%
echo %YELLOW%%padC%^|  ^|      ^| %RESET%
echo %YELLOW%%padC%+  ^|      ^| %RESET%
echo %YELLOW%%padC% \ ^|      ^|%RESET%
echo %YELLOW%%padC%   +------+%RESET%
goto menu_text

:frame5
echo.
echo %YELLOW%%padC%   +------+ %RESET%
echo %YELLOW%%padC%   ^|      ^| %RESET%
echo %YELLOW%%padC%   ^|      ^| %RESET%
echo %YELLOW%%padC%   ^|      ^| %RESET%
echo %YELLOW%%padC%   ^|      ^|%RESET%
echo %YELLOW%%padC%   +------+%RESET%
echo %YELLOW%%padC%   ^|      ^|%RESET%
echo %YELLOW%%padC%   ^|      ^|%RESET%
echo %YELLOW%%padC%   +------+%RESET%
goto menu_text

:menu_text

echo %padM%[1] 🧬
echo.
echo %padM%[2] 🪰 vs 🐛 vs 🕷️ vs 🦟
echo.
echo %padM%[3] 🐛 🐜 vs 🐸 vs 🪱 🕷️
echo.
echo %padM%[4] AP-Markov Generator (4-grams) 💬
echo.
echo %padM%[5] Galton 🎲
echo.
echo %padM%[Q] Quit
echo.
echo.
set /a frame+=1
if %frame% gtr 5 set frame=1

choice /c 12345QN /n /t 1 /d N >nul

if errorlevel 7 goto menu_loop
if errorlevel 6 exit
if errorlevel 5 start "" "%~f0" action5 & goto menu_loop
if errorlevel 4 start "" "%~f0" action4 & goto menu_loop
if errorlevel 3 start "" "%~f0" action3 & goto menu_loop
if errorlevel 2 start "" "%~f0" action2 & goto menu_loop
if errorlevel 1 start "" "%~f0" action1 & goto menu_loop

goto menu_loop


:action1
setlocal enabledelayedexpansion

echo [?25l

set "RESET=[0m"
set "BG_WHITE=[47m"
set "BG_YELLOW=[43m"
set "BG_GREEN=[42m"
set "BG_BLUE=[44m"
set "BG_MAGENTA=[45m"

set "GROUND=!BG_WHITE!  !RESET!"
set "GROUP1=!BG_YELLOW!  !RESET!"
set "GROUP2=!BG_GREEN!  !RESET!"
set "GROUP3=!BG_BLUE!  !RESET!"
set "GROUP4=!BG_MAGENTA!  !RESET!"

set "SIZE=25"
set /a cycles=0

call :generateMap1
cls
goto game1

:generateMap1
for /l %%i in (1,1,%SIZE%) do (
    for /l %%j in (1,1,%SIZE%) do (
        set "board[%%i][%%j]=!GROUND!"
    )
)

set /a S_MINUS_2=%SIZE% - 2

for /l %%i in (1,1,3) do (
    for /l %%j in (1,1,3) do (
        set "board[%%i][%%j]=!GROUP1!"
    )
)

for /l %%i in (1,1,3) do (
    for /l %%j in (!S_MINUS_2!,1,%SIZE%) do (
        set "board[%%i][%%j]=!GROUP2!"
    )
)

for /l %%i in (!S_MINUS_2!,1,%SIZE%) do (
    for /l %%j in (1,1,3) do (
        set "board[%%i][%%j]=!GROUP3!"
    )
)

for /l %%i in (!S_MINUS_2!,1,%SIZE%) do (
    for /l %%j in (!S_MINUS_2!,1,%SIZE%) do (
        set "board[%%i][%%j]=!GROUP4!"
    )
)
goto :eof

:countPopulations1
set /a pop1=0
set /a pop2=0
set /a pop3=0
set /a pop4=0
for /l %%i in (1,1,%SIZE%) do (
    for /l %%j in (1,1,%SIZE%) do (
        if "!board[%%i][%%j]!"=="!GROUP1!" set /a pop1+=1
        if "!board[%%i][%%j]!"=="!GROUP2!" set /a pop2+=1
        if "!board[%%i][%%j]!"=="!GROUP3!" set /a pop3+=1
        if "!board[%%i][%%j]!"=="!GROUP4!" set /a pop4+=1
    )
)
goto :eof

:game1
call :countPopulations1
echo [H
call :displayGame1
call :simulationLogic1
set /a cycles+=1
goto game1

:displayGame1
cls
echo.
set /a "rand=(%RANDOM% %% 3)"

if %rand%==0 echo    ⏳ : %cycles% ( CTRL+C to quit ) 🌍  !BG_YELLOW! !RESET! : %pop1% !BG_GREEN! !RESET! : %pop2% !BG_BLUE! !RESET! : %pop3% !BG_MAGENTA! !RESET! : %pop4%
if %rand%==1 echo    ⏳ : %cycles% ( CTRL+C to quit ) 🌎  !BG_YELLOW! !RESET! : %pop1% !BG_GREEN! !RESET! : %pop2% !BG_BLUE! !RESET! : %pop3% !BG_MAGENTA! !RESET! : %pop4%
if %rand%==2 echo    ⏳ : %cycles% ( CTRL+C to quit ) 🌏  !BG_YELLOW! !RESET! : %pop1% !BG_GREEN! !RESET! : %pop2% !BG_BLUE! !RESET! : %pop3% !BG_MAGENTA! !RESET! : %pop4%
echo.
echo.

echo    !BG_YELLOW! !RESET!══════════════════════════════════════════════════!BG_GREEN! !RESET!
for /l %%i in (1,1,%SIZE%) do (
    set "line="
    for /l %%j in (1,1,%SIZE%) do (
        set "line=!line!!board[%%i][%%j]!"
    )
    echo    ║!line!║
)
echo    !BG_BLUE! !RESET!══════════════════════════════════════════════════!BG_MAGENTA! !RESET!
goto :eof

:simulationLogic1
for /l %%k in (1,1,250) do (
    set /a cy=!random! %% %SIZE% + 1
    set /a cx=!random! %% %SIZE% + 1
    call :processCell !cy! !cx!
)
goto :eof

:processCell
set /a dir=!random! %% 4
set /a ny=%1
set /a nx=%2

if !dir! equ 0 set /a ny-=1
if !dir! equ 1 set /a ny+=1
if !dir! equ 2 set /a nx-=1
if !dir! equ 3 set /a nx+=1

if !ny! geq 1 if !ny! leq %SIZE% if !nx! geq 1 if !nx! leq %SIZE% (
    for %%Y in (!ny!) do for %%X in (!nx!) do (
        set "cell=!board[%1][%2]!"
        set "neighbor=!board[%%Y][%%X]!"

        if "!cell!"=="!GROUP1!" if "!neighbor!"=="!GROUP2!" set "board[%%Y][%%X]=!GROUP1!"
        if "!cell!"=="!GROUP2!" if "!neighbor!"=="!GROUP3!" set "board[%%Y][%%X]=!GROUP2!"
        if "!cell!"=="!GROUP3!" if "!neighbor!"=="!GROUP4!" set "board[%%Y][%%X]=!GROUP3!"
        if "!cell!"=="!GROUP4!" if "!neighbor!"=="!GROUP1!" set "board[%%Y][%%X]=!GROUP4!"

        if "!neighbor!"=="!GROUND!" if not "!cell!"=="!GROUND!" (
            set /a rand_ext=!random! %% 2
            if !rand_ext! equ 0 set "board[%%Y][%%X]=!cell!"
        )
    )
)

set /a overpop_count=0
set "cell=!board[%1][%2]!"

set /a ty=%1 - 1
set /a by=%1 + 1
set /a lx=%2 - 1
set /a rx=%2 + 1

if %1 gtr 1 for %%T in (!ty!) do if "!board[%%T][%2]!"=="!cell!" set /a overpop_count+=1
if %1 lss %SIZE% for %%B in (!by!) do if "!board[%%B][%2]!"=="!cell!" set /a overpop_count+=1
if %2 gtr 1 for %%L in (!lx!) do if "!board[%1][%%L]!"=="!cell!" set /a overpop_count+=1
if %2 lss %SIZE% for %%R in (!rx!) do if "!board[%1][%%R]!"=="!cell!" set /a overpop_count+=1

if !overpop_count! geq 3 if not "!cell!"=="!GROUND!" (
    set "board[%1][%2]=!GROUND!"
)
goto :eof

:action2

echo [?25l
set "RESET=[0m"
set "BG_WHITE=[47m"
set "BG_YELLOW=[43m"
set "BG_GREEN=[42m"
set "BG_BLUE=[44m"
set "BG_MAGENTA=[45m"

set "GROUND=!BG_WHITE!  !RESET!"
set "GROUP1=!BG_WHITE!🪰!RESET!"
set "GROUP2=!BG_WHITE!🐛!RESET!"
set "GROUP3=!BG_WHITE!🕷️!RESET!"
set "GROUP4=!BG_WHITE!🦟!RESET!"

set "SIZE=25"
set /a cycles=0

call :generateMap2
cls
goto game2

:generateMap2
for /l %%i in (1,1,%SIZE%) do (
    for /l %%j in (1,1,%SIZE%) do (
        set "board[%%i][%%j]=!GROUND!"
    )
)

set /a S_MINUS_2=%SIZE% - 2

for /l %%i in (1,1,3) do (
    for /l %%j in (1,1,3) do (
        set "board[%%i][%%j]=!GROUP1!"
    )
)

for /l %%i in (1,1,3) do (
    for /l %%j in (!S_MINUS_2!,1,%SIZE%) do (
        set "board[%%i][%%j]=!GROUP2!"
    )
)

for /l %%i in (!S_MINUS_2!,1,%SIZE%) do (
    for /l %%j in (1,1,3) do (
        set "board[%%i][%%j]=!GROUP3!"
    )
)

for /l %%i in (!S_MINUS_2!,1,%SIZE%) do (
    for /l %%j in (!S_MINUS_2!,1,%SIZE%) do (
        set "board[%%i][%%j]=!GROUP4!"
    )
)
goto :eof

:countPopulations2
set /a pop1=0
set /a pop2=0
set /a pop3=0
set /a pop4=0
for /l %%i in (1,1,%SIZE%) do (
    for /l %%j in (1,1,%SIZE%) do (
        if "!board[%%i][%%j]!"=="!GROUP1!" set /a pop1+=1
        if "!board[%%i][%%j]!"=="!GROUP2!" set /a pop2+=1
        if "!board[%%i][%%j]!"=="!GROUP3!" set /a pop3+=1
        if "!board[%%i][%%j]!"=="!GROUP4!" set /a pop4+=1
    )
)
goto :eof

:game2
call :countPopulations2
echo [H
call :displayGame2
call :simulationLogic2
set /a cycles+=1
goto game2

:displayGame2
cls
echo.
set /a "rand=(%RANDOM% %% 3)"

if %rand%==0 echo    ⏳ : %cycles% ( CTRL+C to quit ) 🌍  🪰 : %pop1% 🐛 : %pop2% 🕷️ : %pop3% 🦟 : %pop4%
if %rand%==1 echo    ⏳ : %cycles% ( CTRL+C to quit ) 🌎  🪰 : %pop1% 🐛 : %pop2% 🕷️ : %pop3% 🦟 : %pop4%
if %rand%==2 echo    ⏳ : %cycles% ( CTRL+C to quit ) 🌏  🪰 : %pop1% 🐛 : %pop2% 🕷️ : %pop3% 🦟 : %pop4%

echo.
echo    ╔══════════════════════════════════════════════════╗
for /l %%i in (1,1,%SIZE%) do (
    set "line="
    for /l %%j in (1,1,%SIZE%) do (
        set "line=!line!!board[%%i][%%j]!"
    )
    echo    ║!line!║
)
echo    ╚══════════════════════════════════════════════════╝
goto :eof

:simulationLogic2
for /l %%k in (1,1,250) do (
    set /a cy=!random! %% %SIZE% + 1
    set /a cx=!random! %% %SIZE% + 1
    call :processCell2 !cy! !cx!
)
goto :eof

:processCell2
set /a dir=!random! %% 4
set /a ny=%1
set /a nx=%2

if !dir! equ 0 set /a ny-=1
if !dir! equ 1 set /a ny+=1
if !dir! equ 2 set /a nx-=1
if !dir! equ 3 set /a nx+=1

if !ny! geq 1 if !ny! leq %SIZE% if !nx! geq 1 if !nx! leq %SIZE% (
    for %%Y in (!ny!) do for %%X in (!nx!) do (
        set "cell=!board[%1][%2]!"
        set "neighbor=!board[%%Y][%%X]!"

        if "!cell!"=="!GROUP1!" if "!neighbor!"=="!GROUP2!" set "board[%%Y][%%X]=!GROUP1!"
        if "!cell!"=="!GROUP2!" if "!neighbor!"=="!GROUP3!" set "board[%%Y][%%X]=!GROUP2!"
        if "!cell!"=="!GROUP3!" if "!neighbor!"=="!GROUP4!" set "board[%%Y][%%X]=!GROUP3!"
        if "!cell!"=="!GROUP4!" if "!neighbor!"=="!GROUP1!" set "board[%%Y][%%X]=!GROUP4!"

        if "!neighbor!"=="!GROUND!" if not "!cell!"=="!GROUND!" (
            set /a rand_ext=!random! %% 2
            if !rand_ext! equ 0 set "board[%%Y][%%X]=!cell!"
        )
    )
)

set /a overpop_count=0
set "cell=!board[%1][%2]!"

set /a ty=%1 - 1
set /a by=%1 + 1
set /a lx=%2 - 1
set /a rx=%2 + 1

if %1 gtr 1 for %%T in (!ty!) do if "!board[%%T][%2]!"=="!cell!" set /a overpop_count+=1
if %1 lss %SIZE% for %%B in (!by!) do if "!board[%%B][%2]!"=="!cell!" set /a overpop_count+=1
if %2 gtr 1 for %%L in (!lx!) do if "!board[%1][%%L]!"=="!cell!" set /a overpop_count+=1
if %2 lss %SIZE% for %%R in (!rx!) do if "!board[%1][%%R]!"=="!cell!" set /a overpop_count+=1

if !overpop_count! geq 3 if not "!cell!"=="!GROUND!" (
    set "board[%1][%2]=!GROUND!"
)
goto :eof



:action3
echo [?25l
set "RESET=[0m"
set "BG_WHITE=[47m"
set "GROUND=!BG_WHITE!  !RESET!"
set "AST1=!BG_WHITE!🐛!RESET!"
set "ANT1=!BG_WHITE!🐜!RESET!"
set "AST2=!BG_WHITE!🪱!RESET!"
set "SPI2=!BG_WHITE!🕷️!RESET!"
set "FLOWER=!BG_WHITE!🌼!RESET!"
set "FROG=!BG_WHITE!🐸!RESET!"
set "SIZE=20"
set /a cycles=0

call :generateMap3
cls
goto game3

:generateMap3
for /l %%i in (1,1,%SIZE%) do (
    for /l %%j in (1,1,%SIZE%) do (
        set "board[%%i][%%j]=!GROUND!"
    )
)

set /a S_MINUS= %SIZE% - 2
for /l %%k in (1,1,5) do (
    set /a rY1=!random! %% 3 + 1
    set /a rX1=!random! %% 3 + !S_MINUS!
    set "board[!rY1!][!rX1!]=!AST1!"
    
    set /a rY2=!random! %% 3 + !S_MINUS!
    set /a rX2=!random! %% 3 + 1
    set "board[!rY2!][!rX2!]=!AST2!"
)

for /l %%k in (1,1,4) do call :spawnEntity3 "!FLOWER!"
for /l %%k in (1,1,2) do call :spawnEntity3 "!FROG!"
goto :eof

:spawnEntity3
set /a ry=!random! %% %SIZE% + 1
set /a rx=!random! %% %SIZE% + 1
set "board[!ry!][!rx!]=%~1"
goto :eof

:game3
echo [H
call :displayGame3
call :simulationLogic3
set /a cycles+=1
goto game3

:displayGame3
cls
echo.
set /a "rand=(%RANDOM% %% 3)"

if %rand%==0 echo    ⏳ : %cycles% ( CTRL+C to quit ) 🌍
if %rand%==1 echo    ⏳ : %cycles% ( CTRL+C to quit ) 🌎   
if %rand%==2 echo    ⏳ : %cycles% ( CTRL+C to quit ) 🌏  
echo.

echo    ╔════════════════════════════════════════╗
for /l %%i in (1,1,%SIZE%) do (
    set "line="
    for /l %%j in (1,1,%SIZE%) do (
        set "line=!line!!board[%%i][%%j]!"
    )
    echo    ║!line!║
)
echo    ╚════════════════════════════════════════╝
goto :eof

:simulationLogic3
for /l %%k in (1,1,150) do (
    set /a cy=!random! %% %SIZE% + 1
    set /a cx=!random! %% %SIZE% + 1
    call :processCell3 !cy! !cx!
)
goto :eof

:processCell3
set "cell=!board[%1][%2]!"
if "!cell!"=="!GROUND!" goto :eof
if "!cell!"=="!FLOWER!" goto :eof

set /a dir=!random! %% 4
set /a ny=%1
set /a nx=%2

if !dir! equ 0 set /a ny-=1
if !dir! equ 1 set /a ny+=1
if !dir! equ 2 set /a nx-=1
if !dir! equ 3 set /a nx+=1

if !ny! geq 1 if !ny! leq %SIZE% if !nx! geq 1 if !nx! leq %SIZE% (
    set "neighbor=!board[%ny%][%nx%]!"
    
    if "!neighbor!"=="!FLOWER!" (
        if "!cell!"=="!AST1!" set "board[%1][%2]=!ANT1!"
        if "!cell!"=="!AST2!" set "board[%1][%2]=!SPI2!"
        
        set "board[%ny%][%nx%]=!board[%1][%2]!"
        
        call :spawnEntity3 "!FLOWER!"
        call :spawnEntity3 "!FLOWER!"
    )
    
    if "!neighbor!"=="!FROG!" (
        set /a allies=0
        if "!board[%1][%2]!"=="!ANT1!" set /a allies+=1
        if "!board[%1][%2]!"=="!SPI2!" set /a allies+=1
        set /a chance=!random! %% 10
        if !chance! gtr 6 (
            set "board[%ny%][%nx%]=!GROUND!" 
            call :spawnEntity3 "!FROG!"
        ) else (
            set "board[%1][%2]=!GROUND!"
        )
    )
    
    if "!neighbor!"=="!GROUND!" (
        set "board[%ny%][%nx%]=!cell!"
        set "board[%1][%2]=!GROUND!"
    )
)
goto :eof

:action4
cls
echo.
echo       🧠 AP-4GMG 
echo.
echo.
echo.
echo %padM%[1] ▶️  GO              - Start
echo.
echo %padM%[2] 📚  LEARNING        - Machine learning
echo.
echo %padM%[3] 🔗  ANALYSIS        - Analyze links between data
echo.
echo.
echo.

choice /c 123 /n /m "👉 "
if errorlevel 3 goto ANALYSIS
if errorlevel 2 goto LEARNING
if errorlevel 1 goto GO


:ANALYSIS
cls
set "DIR_IN=ap\knowledge\learned"
set "DIR_OUT=ap\user"
set "REPORT=%DIR_OUT%\audit_report.txt"

if not exist "%DIR_OUT%" mkdir "%DIR_OUT%"

if not exist "%DIR_IN%" (
    echo [Error] The folder %DIR_IN% does not exist. Nothing to analyze.
    pause
goto action4
)


echo Analysis in progress, this may take a little time...
echo.

set "PS_SCRIPT=%temp%\audit_model.ps1"

echo $inDir = '%DIR_IN%' > "%PS_SCRIPT%"
echo $outFile = '%REPORT%' >> "%PS_SCRIPT%"
echo $files = Get-ChildItem -Path $inDir -Filter 'APWords.*.txt' >> "%PS_SCRIPT%"
echo $total = $files.Count >> "%PS_SCRIPT%"
echo if ($total -eq 0) { Write-Host 'No data found.'; exit } >> "%PS_SCRIPT%"
echo $faibles = 0 >> "%PS_SCRIPT%"
echo $lignesRapport = @() >> "%PS_SCRIPT%"
echo $lignesRapport += '======================================================' >> "%PS_SCRIPT%"
echo $lignesRapport += '               MODEL INTEGRITY REPORT                 ' >> "%PS_SCRIPT%"
echo $lignesRapport += '======================================================' >> "%PS_SCRIPT%"
echo $lignesRapport += '' >> "%PS_SCRIPT%"
echo $lignesRapport += 'List of dead-ends (words with 1 path or less) :' >> "%PS_SCRIPT%"
echo $lignesRapport += '------------------------------------------------------' >> "%PS_SCRIPT%"
echo $i = 0 >> "%PS_SCRIPT%"
echo foreach ($f in $files) { >> "%PS_SCRIPT%"
echo     $i++ >> "%PS_SCRIPT%"
echo     Write-Progress -Activity 'File Audit' -Status "Analysis : $i / $total" -PercentComplete (($i/$total)*100) >> "%PS_SCRIPT%"
echo     $mot = $f.Name -replace '\.txt$','' -replace '^^APWords\.','' >> "%PS_SCRIPT%"
echo     $lignes = (Get-Content $f.FullName -Encoding UTF8) ^| Where-Object { -not [string]::IsNullOrWhiteSpace($_) } >> "%PS_SCRIPT%"
echo     $nbChemins = $lignes.Count >> "%PS_SCRIPT%"
echo     if ($nbChemins -le 1) { >> "%PS_SCRIPT%"
echo         $faibles++ >> "%PS_SCRIPT%"
echo         $lignesRapport += "- $mot : $nbChemins path(s)" >> "%PS_SCRIPT%"
echo     } >> "%PS_SCRIPT%"
echo } >> "%PS_SCRIPT%"
echo $lignesRapport += '' >> "%PS_SCRIPT%"
echo $lignesRapport += '======================================================' >> "%PS_SCRIPT%"
echo $lignesRapport += '                    GLOBAL SUMMARY                    ' >> "%PS_SCRIPT%"
echo $lignesRapport += '======================================================' >> "%PS_SCRIPT%"
echo $lignesRapport += "Total words in memory        : $total" >> "%PS_SCRIPT%"
echo $lignesRapport += "Fragile words (dead-ends)    : $faibles" >> "%PS_SCRIPT%"
echo $sains = $total - $faibles >> "%PS_SCRIPT%"
echo $pourcentage = [math]::Round(($sains / $total) * 100, 2) >> "%PS_SCRIPT%"
echo $lignesRapport += "Network progression          : $pourcentage %%" >> "%PS_SCRIPT%"
echo $lignesRapport += '======================================================' >> "%PS_SCRIPT%"
echo $lignesRapport += '' >> "%PS_SCRIPT%"
echo if ($pourcentage -ge 98) { >> "%PS_SCRIPT%"
echo     $lignesRapport += 'DIAGNOSTIC: Very stable model, ready for generation.' >> "%PS_SCRIPT%"
echo } elseif ($pourcentage -ge 90) { >> "%PS_SCRIPT%"
echo     $lignesRapport += 'DIAGNOSTIC: Solid model, but some dead-ends persist.' >> "%PS_SCRIPT%"
echo } else { >> "%PS_SCRIPT%"
echo     $lignesRapport += 'DIAGNOSTIC: Too many loops. New training recommended.' >> "%PS_SCRIPT%"
echo } >> "%PS_SCRIPT%"
echo $lignesRapport ^| Set-Content $outFile -Encoding UTF8 >> "%PS_SCRIPT%"

powershell -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%"

del "%PS_SCRIPT%"

echo Audit complete! 
echo The report has been generated here: %REPORT%
pause
goto action4

:LEARNING
cls
if not exist "ap\action" mkdir "ap\action"
if not exist "ap\knowledge\learned" mkdir "ap\knowledge\learned"

set BOOK=ap\action\book.txt
if not exist "%BOOK%" (
    echo [Error] The file %BOOK% cannot be found.
    pause
goto action4
)

for /f %%A in ('type "%BOOK%" ^| find /c /v ""') do set total_lines=%%A
echo ========================================================
echo File detected! Number of lines to process: %total_lines%
echo ========================================================
echo Processing, please wait...

set PS_SCRIPT=%temp%\book_processing.ps1

echo $inputFile = 'ap\action\book.txt' > "%PS_SCRIPT%"
echo $outDir = 'ap\knowledge\learned' >> "%PS_SCRIPT%"
echo $lines = @(Get-Content $inputFile -Encoding UTF8) >> "%PS_SCRIPT%"
echo $lineCount = 0 >> "%PS_SCRIPT%"
echo $fileCounts = @{} >> "%PS_SCRIPT%"
echo foreach ($line in $lines) { >> "%PS_SCRIPT%"
echo     $lineCount++ >> "%PS_SCRIPT%"
echo     Write-Progress -Activity "Text processing" -Status "Line $lineCount / $($lines.Count)" -PercentComplete (($lineCount / $lines.Count) * 100) >> "%PS_SCRIPT%"
echo     # CORRECTION 1 : ^^ to correctly escape the caret in Batch >> "%PS_SCRIPT%"
echo     if ($line -match '^^\s*$') { continue } >> "%PS_SCRIPT%"
echo     # Sentence cleaning >> "%PS_SCRIPT%"
echo     $cleanLine = $line -replace '[/\*\+!:;\.\(\),«»\?\x22]', '' >> "%PS_SCRIPT%"
echo     $words = @($cleanLine -split '\s+' ^| Where-Object { $_ -ne '' }) >> "%PS_SCRIPT%"
echo     $wordCount = $words.Count >> "%PS_SCRIPT%"
echo     if ($wordCount -eq 0) { continue } >> "%PS_SCRIPT%"
echo     $isEven = ($wordCount %% 2) -eq 0 >> "%PS_SCRIPT%"
echo     $chunks = @() >> "%PS_SCRIPT%"
echo     $idx = 0 >> "%PS_SCRIPT%"
echo     if (-not $isEven -and $wordCount -ge 6) { >> "%PS_SCRIPT%"
echo         $chunks += ,($words[0..5]); $idx = 6 >> "%PS_SCRIPT%"
echo     } elseif (-not $isEven) { >> "%PS_SCRIPT%"
echo         $chunks += ,($words[0..($wordCount-1)]); $idx = $wordCount >> "%PS_SCRIPT%"
echo     } >> "%PS_SCRIPT%"
echo     while ($idx -lt $wordCount) { >> "%PS_SCRIPT%"
echo         $endIdx = $idx + 3 >> "%PS_SCRIPT%"
echo         if ($endIdx -ge $wordCount) { $endIdx = $wordCount - 1 } >> "%PS_SCRIPT%"
echo         $chunks += ,($words[$idx..$endIdx]); $idx += 4 >> "%PS_SCRIPT%"
echo     } >> "%PS_SCRIPT%"
echo     foreach ($chunk in $chunks) { >> "%PS_SCRIPT%"
echo         if ($chunk.Count -eq 0) { continue } >> "%PS_SCRIPT%"
echo         $firstWord = "$($chunk[0])".ToLower() >> "%PS_SCRIPT%"
echo         $safeWord = $firstWord -replace '[^^\p{L}\p{N}]', '' >> "%PS_SCRIPT%"
echo         # CORRECTION 2 : here too, use ^^ >> "%PS_SCRIPT%"
echo         if ($safeWord -match '^^\s*$') { $safeWord = 'unknown_symbol' } >> "%PS_SCRIPT%"
echo         $restWords = '' >> "%PS_SCRIPT%"
echo         if ($chunk.Count -gt 1) { $restWords = $chunk[1..($chunk.Count-1)] -join ' ' } >> "%PS_SCRIPT%"
echo         $filename = "$outDir\APWords.$safeWord.txt" >> "%PS_SCRIPT%"
echo         if ($null -eq $fileCounts[$filename]) { >> "%PS_SCRIPT%"
echo             if (Test-Path -LiteralPath $filename) { >> "%PS_SCRIPT%"
echo                 $fileCounts[$filename] = @(Get-Content -LiteralPath $filename).Count >> "%PS_SCRIPT%"
echo             } else { >> "%PS_SCRIPT%"
echo                 $fileCounts[$filename] = 0 >> "%PS_SCRIPT%"
echo             } >> "%PS_SCRIPT%"
echo         } >> "%PS_SCRIPT%"
echo         $fileCounts[$filename]++ >> "%PS_SCRIPT%"
echo         $id = $fileCounts[$filename] >> "%PS_SCRIPT%"
echo         $retryCount = 0 >> "%PS_SCRIPT%"
echo         $success = $false >> "%PS_SCRIPT%"
echo         while (-not $success -and $retryCount -lt 10) { >> "%PS_SCRIPT%"
echo             try { >> "%PS_SCRIPT%"
echo                 Add-Content -LiteralPath $filename -Value "$id; $restWords" -Encoding UTF8 -ErrorAction Stop >> "%PS_SCRIPT%"
echo                 $success = $true >> "%PS_SCRIPT%"
echo             } catch { >> "%PS_SCRIPT%"
echo                 $retryCount++ >> "%PS_SCRIPT%"
echo                 Start-Sleep -Milliseconds 50 >> "%PS_SCRIPT%"
echo             } >> "%PS_SCRIPT%"
echo         } >> "%PS_SCRIPT%"
echo     } >> "%PS_SCRIPT%"
echo } >> "%PS_SCRIPT%"


powershell -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%"

del "%PS_SCRIPT%"

echo Processing completed successfully!
pause
goto action4


:GO
cls
set "KNOWLEDGE_DIR=ap\knowledge\learned"


if not exist "%KNOWLEDGE_DIR%" (
    echo [Error] The folder %KNOWLEDGE_DIR% does not exist.
    echo You must first run the learning script.
    pause
goto action4
)

:menuap00
echo. %msg1% %msg2% %msg3% %msg4% %msg5%
echo.
set "turn=0"

set /p user_input="(or 'quit') 👉 : "
goto InputLoop1


:InputLoop
set "user_input=!generated_sentence!"
:InputLoop1

if /i "!user_input!"=="quit" goto action4
if "!user_input!"=="" goto :InputLoop

set "clean_input=!user_input!"
for %%C in (/ * - + ! : ; . , ?) do (
    set "clean_input=!clean_input:%%C= !"
)

set "current_word="
for %%W in (!clean_input!) do (
    set "current_word=%%W"
)

if "!current_word!"=="" (
    echo ❓
    goto :menuap00
)

set "generated_sentence=!current_word!"
set "word_count=0"

:GenerateLoop
set "file_path=%KNOWLEDGE_DIR%\APWords.!current_word!.txt"

if not exist "!file_path!" goto :EndGeneration

set "total_lines=0"
for /f "usebackq" %%A in ("!file_path!") do (
    set /a total_lines+=1
)

if !total_lines! equ 0 goto :menuap00

set /a "rand_line=%RANDOM% * !total_lines! / 32768 + 1"

set "next_word="
set "current_line=0"
for /f "usebackq tokens=1,* delims=;" %%A in ("!file_path!") do (
    set /a current_line+=1
    if !current_line! equ !rand_line! (
        set "next_word=%%B"
    )
)

if "!next_word!"=="" goto :menuap00

set "generated_sentence=!next_word!"
set "current_word=!next_word!"

set /a word_count+=1
if !word_count! geq 15 goto :EndGeneration

goto :GenerateLoop

:EndGeneration
set msg%turn%=!generated_sentence!
set /a turn+=1

if %turn% GEQ 10 goto menuap00
goto :InputLoop 

:action5
powershell.exe -ExecutionPolicy Bypass -NoProfile -File "%~dp0ap\action\galton.ps1"

pause
goto start_sbs