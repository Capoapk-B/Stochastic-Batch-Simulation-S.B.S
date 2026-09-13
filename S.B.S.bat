@echo off
title Stochastic Batch Simulation
mode con cols=70 lines=22
setlocal enabledelayedexpansion
chcp 65001 >nul

:debutsbs
set dossier=AP

REM Creer le dossier de base "AP" s'il n'existe pas
if not exist "%dossier%" (
    mkdir "%dossier%"
    echo.
) else (
    echo.
)

REM Creer les sous-dossiers a l'interieur du dossier "AP" s'ils n'existent pas
if not exist "%dossier%\utilisateur" (
    mkdir "%dossier%\utilisateur"
    echo.
) else (
    echo.
)

if not exist "%dossier%\connaissance" (
    mkdir "%dossier%\connaissance"
    echo.
) else (
    echo.
)

if not exist "%dossier%\action" (
    mkdir "%dossier%\action"
    echo.
) else (
    echo.
)

REM Creer les sous-dossiers a l'interieur du dossier "AP" s'ils n'existent pas
if not exist "%dossier%\utilisateur" (
    mkdir "%dossier%\utilisateur"
    echo.
) else (
    echo.
)

REM Creer les sous-dossiers a l'interieur du dossier "connaissance" s'ils n'existent pas
if not exist "%dossier%\connaissance\apris" (
    mkdir "%dossier%\connaissance\apris"
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
    set "ligne_temp=    "
    for /l %%B in (1,1,39) do (
        set /a randCol=!random! %% 6
        set /a randChar=!random! %% 2
        for %%C in (!randCol!) do set "ligne_temp=!ligne_temp!!c[%%C]!!randChar!"
    )
    echo %ESC%[3;1H!ligne_temp!%RESET%
    
    for /l %%D in (1,1,2000) do rem
)

echo %ESC%[?25h

if not "%~1"=="" goto %~1

for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
set "YELLOW=%ESC%[33m"
set "RESET=%ESC%[0m"

set "padM=                   "
set "padC=                                                                        "

set frame=1

:menu_loop
cls
echo.
echo       %GREEN%T%RESET%OCHASTIC %GREEN%B%RESET%ATCH %GREEN%S%RESET%IMULATION%RESET%                                                         by Capoapk
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
echo %padM%[4] AP-Générateur markovien à 4-grammes 💬
echo.
echo %padM%[5] Galton 🎲
echo.
echo %padM%[Q] Quitter
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

set "SOL=!BG_WHITE!  !RESET!"
set "GROUPE1=!BG_YELLOW!  !RESET!"
set "GROUPE2=!BG_GREEN!  !RESET!"
set "GROUPE3=!BG_BLUE!  !RESET!"
set "GROUPE4=!BG_MAGENTA!  !RESET!"

set "TAILLE=25"
set /a cycles=0

call :genererCarte1
cls
goto jeu1

:genererCarte1
for /l %%i in (1,1,%TAILLE%) do (
    for /l %%j in (1,1,%TAILLE%) do (
        set "tableau[%%i][%%j]=!SOL!"
    )
)

set /a T_MOINS_2=%TAILLE% - 2

for /l %%i in (1,1,3) do (
    for /l %%j in (1,1,3) do (
        set "tableau[%%i][%%j]=!GROUPE1!"
    )
)

for /l %%i in (1,1,3) do (
    for /l %%j in (!T_MOINS_2!,1,%TAILLE%) do (
        set "tableau[%%i][%%j]=!GROUPE2!"
    )
)

for /l %%i in (!T_MOINS_2!,1,%TAILLE%) do (
    for /l %%j in (1,1,3) do (
        set "tableau[%%i][%%j]=!GROUPE3!"
    )
)

for /l %%i in (!T_MOINS_2!,1,%TAILLE%) do (
    for /l %%j in (!T_MOINS_2!,1,%TAILLE%) do (
        set "tableau[%%i][%%j]=!GROUPE4!"
    )
)
goto :eof

:compterPopulations1
set /a pop1=0
set /a pop2=0
set /a pop3=0
set /a pop4=0
for /l %%i in (1,1,%TAILLE%) do (
    for /l %%j in (1,1,%TAILLE%) do (
        if "!tableau[%%i][%%j]!"=="!GROUPE1!" set /a pop1+=1
        if "!tableau[%%i][%%j]!"=="!GROUPE2!" set /a pop2+=1
        if "!tableau[%%i][%%j]!"=="!GROUPE3!" set /a pop3+=1
        if "!tableau[%%i][%%j]!"=="!GROUPE4!" set /a pop4+=1
    )
)
goto :eof

:jeu1
call :compterPopulations1
echo [H
call :afficherJeu1
call :logiqueSimulation1
set /a cycles+=1
goto jeu1

:afficherJeu1
cls
echo.
set /a "rand=(%RANDOM% %% 3)"

if %rand%==0 echo    ⏳ : %cycles% ( CTRL+C pour quitter ) 🌍  !BG_YELLOW! !RESET! : %pop1% !BG_GREEN! !RESET! : %pop2% !BG_BLUE! !RESET! : %pop3% !BG_MAGENTA! !RESET! : %pop4%
if %rand%==1 echo    ⏳ : %cycles% ( CTRL+C pour quitter ) 🌎  !BG_YELLOW! !RESET! : %pop1% !BG_GREEN! !RESET! : %pop2% !BG_BLUE! !RESET! : %pop3% !BG_MAGENTA! !RESET! : %pop4%
if %rand%==2 echo    ⏳ : %cycles% ( CTRL+C pour quitter ) 🌏  !BG_YELLOW! !RESET! : %pop1% !BG_GREEN! !RESET! : %pop2% !BG_BLUE! !RESET! : %pop3% !BG_MAGENTA! !RESET! : %pop4%
echo.
echo.

echo    !BG_YELLOW! !RESET!══════════════════════════════════════════════════!BG_GREEN! !RESET!
for /l %%i in (1,1,%TAILLE%) do (
    set "ligne="
    for /l %%j in (1,1,%TAILLE%) do (
        set "ligne=!ligne!!tableau[%%i][%%j]!"
    )
    echo    ║!ligne!║
)
echo    !BG_BLUE! !RESET!══════════════════════════════════════════════════!BG_MAGENTA! !RESET!
goto :eof

:logiqueSimulation1
for /l %%k in (1,1,250) do (
    set /a cy=!random! %% %TAILLE% + 1
    set /a cx=!random! %% %TAILLE% + 1
    call :traiterCellule !cy! !cx!
)
goto :eof

:traiterCellule
set /a dir=!random! %% 4
set /a ny=%1
set /a nx=%2

if !dir! equ 0 set /a ny-=1
if !dir! equ 1 set /a ny+=1
if !dir! equ 2 set /a nx-=1
if !dir! equ 3 set /a nx+=1

if !ny! geq 1 if !ny! leq %TAILLE% if !nx! geq 1 if !nx! leq %TAILLE% (
    for %%Y in (!ny!) do for %%X in (!nx!) do (
        set "cell=!tableau[%1][%2]!"
        set "voisin=!tableau[%%Y][%%X]!"

        if "!cell!"=="!GROUPE1!" if "!voisin!"=="!GROUPE2!" set "tableau[%%Y][%%X]=!GROUPE1!"
        if "!cell!"=="!GROUPE2!" if "!voisin!"=="!GROUPE3!" set "tableau[%%Y][%%X]=!GROUPE2!"
        if "!cell!"=="!GROUPE3!" if "!voisin!"=="!GROUPE4!" set "tableau[%%Y][%%X]=!GROUPE3!"
        if "!cell!"=="!GROUPE4!" if "!voisin!"=="!GROUPE1!" set "tableau[%%Y][%%X]=!GROUPE4!"

        if "!voisin!"=="!SOL!" if not "!cell!"=="!SOL!" (
            set /a rand_ext=!random! %% 2
            if !rand_ext! equ 0 set "tableau[%%Y][%%X]=!cell!"
        )
    )
)

set /a surpop_count=0
set "cell=!tableau[%1][%2]!"

set /a ty=%1 - 1
set /a by=%1 + 1
set /a lx=%2 - 1
set /a rx=%2 + 1

if %1 gtr 1 for %%T in (!ty!) do if "!tableau[%%T][%2]!"=="!cell!" set /a surpop_count+=1
if %1 lss %TAILLE% for %%B in (!by!) do if "!tableau[%%B][%2]!"=="!cell!" set /a surpop_count+=1
if %2 gtr 1 for %%L in (!lx!) do if "!tableau[%1][%%L]!"=="!cell!" set /a surpop_count+=1
if %2 lss %TAILLE% for %%R in (!rx!) do if "!tableau[%1][%%R]!"=="!cell!" set /a surpop_count+=1

if !surpop_count! geq 3 if not "!cell!"=="!SOL!" (
    set "tableau[%1][%2]=!SOL!"
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

set "SOL=!BG_WHITE!  !RESET!"
set "GROUPE1=!BG_WHITE!🪰!RESET!"
set "GROUPE2=!BG_WHITE!🐛!RESET!"
set "GROUPE3=!BG_WHITE!🕷️!RESET!"
set "GROUPE4=!BG_WHITE!🦟!RESET!"

set "TAILLE=25"
set /a cycles=0

call :genererCarte2
cls
goto jeu2

:genererCarte2
for /l %%i in (1,1,%TAILLE%) do (
    for /l %%j in (1,1,%TAILLE%) do (
        set "tableau[%%i][%%j]=!SOL!"
    )
)

set /a T_MOINS_2=%TAILLE% - 2

for /l %%i in (1,1,3) do (
    for /l %%j in (1,1,3) do (
        set "tableau[%%i][%%j]=!GROUPE1!"
    )
)

for /l %%i in (1,1,3) do (
    for /l %%j in (!T_MOINS_2!,1,%TAILLE%) do (
        set "tableau[%%i][%%j]=!GROUPE2!"
    )
)

for /l %%i in (!T_MOINS_2!,1,%TAILLE%) do (
    for /l %%j in (1,1,3) do (
        set "tableau[%%i][%%j]=!GROUPE3!"
    )
)

for /l %%i in (!T_MOINS_2!,1,%TAILLE%) do (
    for /l %%j in (!T_MOINS_2!,1,%TAILLE%) do (
        set "tableau[%%i][%%j]=!GROUPE4!"
    )
)
goto :eof

:compterPopulations2
set /a pop1=0
set /a pop2=0
set /a pop3=0
set /a pop4=0
for /l %%i in (1,1,%TAILLE%) do (
    for /l %%j in (1,1,%TAILLE%) do (
        if "!tableau[%%i][%%j]!"=="!GROUPE1!" set /a pop1+=1
        if "!tableau[%%i][%%j]!"=="!GROUPE2!" set /a pop2+=1
        if "!tableau[%%i][%%j]!"=="!GROUPE3!" set /a pop3+=1
        if "!tableau[%%i][%%j]!"=="!GROUPE4!" set /a pop4+=1
    )
)
goto :eof

:jeu2
call :compterPopulations2
echo [H
call :afficherJeu2
call :logiqueSimulation2
set /a cycles+=1
goto jeu2

:afficherJeu2
cls
echo.
set /a "rand=(%RANDOM% %% 3)"

if %rand%==0 echo    ⏳ : %cycles% ( CTRL+C pour quitter ) 🌍  🪰 : %pop1% 🐛 : %pop2% 🕷️ : %pop3% 🦟 : %pop4%
if %rand%==1 echo    ⏳ : %cycles% ( CTRL+C pour quitter ) 🌎  🪰 : %pop1% 🐛 : %pop2% 🕷️ : %pop3% 🦟 : %pop4%
if %rand%==2 echo    ⏳ : %cycles% ( CTRL+C pour quitter ) 🌏  🪰 : %pop1% 🐛 : %pop2% 🕷️ : %pop3% 🦟 : %pop4%

echo.
echo    ╔══════════════════════════════════════════════════╗
for /l %%i in (1,1,%TAILLE%) do (
    set "ligne="
    for /l %%j in (1,1,%TAILLE%) do (
        set "ligne=!ligne!!tableau[%%i][%%j]!"
    )
    echo    ║!ligne!║
)
echo    ╚══════════════════════════════════════════════════╝
goto :eof

:logiqueSimulation2
for /l %%k in (1,1,250) do (
    set /a cy=!random! %% %TAILLE% + 1
    set /a cx=!random! %% %TAILLE% + 1
    call :traiterCellule2 !cy! !cx!
)
goto :eof

:traiterCellule2
set /a dir=!random! %% 4
set /a ny=%1
set /a nx=%2

if !dir! equ 0 set /a ny-=1
if !dir! equ 1 set /a ny+=1
if !dir! equ 2 set /a nx-=1
if !dir! equ 3 set /a nx+=1

if !ny! geq 1 if !ny! leq %TAILLE% if !nx! geq 1 if !nx! leq %TAILLE% (
    for %%Y in (!ny!) do for %%X in (!nx!) do (
        set "cell=!tableau[%1][%2]!"
        set "voisin=!tableau[%%Y][%%X]!"

        if "!cell!"=="!GROUPE1!" if "!voisin!"=="!GROUPE2!" set "tableau[%%Y][%%X]=!GROUPE1!"
        if "!cell!"=="!GROUPE2!" if "!voisin!"=="!GROUPE3!" set "tableau[%%Y][%%X]=!GROUPE2!"
        if "!cell!"=="!GROUPE3!" if "!voisin!"=="!GROUPE4!" set "tableau[%%Y][%%X]=!GROUPE3!"
        if "!cell!"=="!GROUPE4!" if "!voisin!"=="!GROUPE1!" set "tableau[%%Y][%%X]=!GROUPE4!"

        if "!voisin!"=="!SOL!" if not "!cell!"=="!SOL!" (
            set /a rand_ext=!random! %% 2
            if !rand_ext! equ 0 set "tableau[%%Y][%%X]=!cell!"
        )
    )
)

set /a surpop_count=0
set "cell=!tableau[%1][%2]!"

set /a ty=%1 - 1
set /a by=%1 + 1
set /a lx=%2 - 1
set /a rx=%2 + 1

if %1 gtr 1 for %%T in (!ty!) do if "!tableau[%%T][%2]!"=="!cell!" set /a surpop_count+=1
if %1 lss %TAILLE% for %%B in (!by!) do if "!tableau[%%B][%2]!"=="!cell!" set /a surpop_count+=1
if %2 gtr 1 for %%L in (!lx!) do if "!tableau[%1][%%L]!"=="!cell!" set /a surpop_count+=1
if %2 lss %TAILLE% for %%R in (!rx!) do if "!tableau[%1][%%R]!"=="!cell!" set /a surpop_count+=1

if !surpop_count! geq 3 if not "!cell!"=="!SOL!" (
    set "tableau[%1][%2]=!SOL!"
)
goto :eof



:action3
echo [?25l
set "RESET=[0m"
set "BG_WHITE=[47m"
set "SOL=!BG_WHITE!  !RESET!"
set "AST1=!BG_WHITE!🐛!RESET!"
set "ANT1=!BG_WHITE!🐜!RESET!"
set "AST2=!BG_WHITE!🪱!RESET!"
set "SPI2=!BG_WHITE!🕷️!RESET!"
set "FLEUR=!BG_WHITE!🌼!RESET!"
set "FROG=!BG_WHITE!🐸!RESET!"
set "TAILLE=20"
set /a cycles=0

call :genererCarte3
cls
goto jeu3

:genererCarte3
for /l %%i in (1,1,%TAILLE%) do (
    for /l %%j in (1,1,%TAILLE%) do (
        set "tableau[%%i][%%j]=!SOL!"
    )
)

set /a T_MOINS= %TAILLE% - 2
for /l %%k in (1,1,5) do (
    set /a rY1=!random! %% 3 + 1
    set /a rX1=!random! %% 3 + !T_MOINS!
    set "tableau[!rY1!][!rX1!]=!AST1!"
    
    set /a rY2=!random! %% 3 + !T_MOINS!
    set /a rX2=!random! %% 3 + 1
    set "tableau[!rY2!][!rX2!]=!AST2!"
)

for /l %%k in (1,1,4) do call :spawnEntite3 "!FLEUR!"
for /l %%k in (1,1,2) do call :spawnEntite3 "!FROG!"
goto :eof

:spawnEntite3
set /a ry=!random! %% %TAILLE% + 1
set /a rx=!random! %% %TAILLE% + 1
set "tableau[!ry!][!rx!]=%~1"
goto :eof

:jeu3
echo [H
call :afficherJeu3
call :logiqueSimulation3
set /a cycles+=1
goto jeu3

:afficherJeu3
cls
echo.
set /a "rand=(%RANDOM% %% 3)"

if %rand%==0 echo    ⏳ : %cycles% ( CTRL+C pour quitter ) 🌍
if %rand%==1 echo    ⏳ : %cycles% ( CTRL+C pour quitter ) 🌎   
if %rand%==2 echo    ⏳ : %cycles% ( CTRL+C pour quitter ) 🌏  
echo.

echo    ╔════════════════════════════════════════╗
for /l %%i in (1,1,%TAILLE%) do (
    set "ligne="
    for /l %%j in (1,1,%TAILLE%) do (
        set "ligne=!ligne!!tableau[%%i][%%j]!"
    )
    echo    ║!ligne!║
)
echo    ╚════════════════════════════════════════╝
goto :eof

:logiqueSimulation3
for /l %%k in (1,1,150) do (
    set /a cy=!random! %% %TAILLE% + 1
    set /a cx=!random! %% %TAILLE% + 1
    call :traiterCellule3 !cy! !cx!
)
goto :eof

:traiterCellule3
set "cell=!tableau[%1][%2]!"
if "!cell!"=="!SOL!" goto :eof
if "!cell!"=="!FLEUR!" goto :eof

set /a dir=!random! %% 4
set /a ny=%1
set /a nx=%2

if !dir! equ 0 set /a ny-=1
if !dir! equ 1 set /a ny+=1
if !dir! equ 2 set /a nx-=1
if !dir! equ 3 set /a nx+=1

if !ny! geq 1 if !ny! leq %TAILLE% if !nx! geq 1 if !nx! leq %TAILLE% (
    set "voisin=!tableau[%ny%][%nx%]!"
    
    if "!voisin!"=="!FLEUR!" (
        if "!cell!"=="!AST1!" set "tableau[%1][%2]=!ANT1!"
        if "!cell!"=="!AST2!" set "tableau[%1][%2]=!SPI2!"
        
        set "tableau[%ny%][%nx%]=!tableau[%1][%2]!"
        
        call :spawnEntite3 "!FLEUR!"
        call :spawnEntite3 "!FLEUR!"
    )
    
    if "!voisin!"=="!FROG!" (
        set /a allies=0
        if "!tableau[%1][%2]!"=="!ANT1!" set /a allies+=1
        if "!tableau[%1][%2]!"=="!SPI2!" set /a allies+=1
        set /a chance=!random! %% 10
        if !chance! gtr 6 (
            set "tableau[%ny%][%nx%]=!SOL!" 
            call :spawnEntite3 "!FROG!"
        ) else (
            set "tableau[%1][%2]=!SOL!"
        )
    )
    
    if "!voisin!"=="!SOL!" (
        set "tableau[%ny%][%nx%]=!cell!"
        set "tableau[%1][%2]=!SOL!"
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
echo %padM%[1] ▶️  GO              - Demarrer
echo.
echo %padM%[2] 📚  APPRENTISSAGE   - Apprentissage automatique
echo.
echo %padM%[3] 🔗  ANALYSE         - Analyser les liens entre les donnees
echo.
echo.
echo.

choice /c 123 /n /m "👉 "
if errorlevel 3 goto ANALYSE
if errorlevel 2 goto APPRENTISSAGE
if errorlevel 1 goto GO


:ANALYSE
cls
set "DIR_IN=ap\connaissance\apris"
set "DIR_OUT=ap\utilisateur"
set "RAPPORT=%DIR_OUT%\rapport_audit.txt"

if not exist "%DIR_OUT%" mkdir "%DIR_OUT%"

if not exist "%DIR_IN%" (
    echo [Erreur] Le dossier %DIR_IN% n'existe pas. Il n'y a rien a analyser.
    pause
goto action4
)


echo Analyse en cours, cela peut prendre un peu de temps...
echo.

set "PS_SCRIPT=%temp%\audit_modele.ps1"

echo $inDir = '%DIR_IN%' > "%PS_SCRIPT%"
echo $outFile = '%RAPPORT%' >> "%PS_SCRIPT%"
echo $files = Get-ChildItem -Path $inDir -Filter 'MotsAP.*.txt' >> "%PS_SCRIPT%"
echo $total = $files.Count >> "%PS_SCRIPT%"
echo if ($total -eq 0) { Write-Host 'Aucune donnee trouvee.'; exit } >> "%PS_SCRIPT%"
echo $faibles = 0 >> "%PS_SCRIPT%"
echo $lignesRapport = @() >> "%PS_SCRIPT%"
echo $lignesRapport += '======================================================' >> "%PS_SCRIPT%"
echo $lignesRapport += '           RAPPORT D INTEGRITE DU MODELE              ' >> "%PS_SCRIPT%"
echo $lignesRapport += '======================================================' >> "%PS_SCRIPT%"
echo $lignesRapport += '' >> "%PS_SCRIPT%"
echo $lignesRapport += 'Liste des culs-de-sac (mots avec 1 chemin ou moins) :' >> "%PS_SCRIPT%"
echo $lignesRapport += '------------------------------------------------------' >> "%PS_SCRIPT%"
echo $i = 0 >> "%PS_SCRIPT%"
echo foreach ($f in $files) { >> "%PS_SCRIPT%"
echo     $i++ >> "%PS_SCRIPT%"
echo     Write-Progress -Activity 'Audit des fichiers' -Status "Analyse : $i / $total" -PercentComplete (($i/$total)*100) >> "%PS_SCRIPT%"
echo     $mot = $f.Name -replace '\.txt$','' -replace '^^MotsAP\.','' >> "%PS_SCRIPT%"
echo     $lignes = (Get-Content $f.FullName -Encoding UTF8) ^| Where-Object { -not [string]::IsNullOrWhiteSpace($_) } >> "%PS_SCRIPT%"
echo     $nbChemins = $lignes.Count >> "%PS_SCRIPT%"
echo     if ($nbChemins -le 1) { >> "%PS_SCRIPT%"
echo         $faibles++ >> "%PS_SCRIPT%"
echo         $lignesRapport += "- $mot : $nbChemins chemin(s)" >> "%PS_SCRIPT%"
echo     } >> "%PS_SCRIPT%"
echo } >> "%PS_SCRIPT%"
echo $lignesRapport += '' >> "%PS_SCRIPT%"
echo $lignesRapport += '======================================================' >> "%PS_SCRIPT%"
echo $lignesRapport += '                    BILAN GLOBAL                      ' >> "%PS_SCRIPT%"
echo $lignesRapport += '======================================================' >> "%PS_SCRIPT%"
echo $lignesRapport += "Total des mots en memoire    : $total" >> "%PS_SCRIPT%"
echo $lignesRapport += "Mots fragiles (culs-de-sac)  : $faibles" >> "%PS_SCRIPT%"
echo $sains = $total - $faibles >> "%PS_SCRIPT%"
echo $pourcentage = [math]::Round(($sains / $total) * 100, 2) >> "%PS_SCRIPT%"
echo $lignesRapport += "Progression du reseau        : $pourcentage %%" >> "%PS_SCRIPT%"
echo $lignesRapport += '======================================================' >> "%PS_SCRIPT%"
echo $lignesRapport += '' >> "%PS_SCRIPT%"
echo if ($pourcentage -ge 98) { >> "%PS_SCRIPT%"
echo     $lignesRapport += 'DIAGNOSTIC : Modele tres stable, pret pour la generation.' >> "%PS_SCRIPT%"
echo } elseif ($pourcentage -ge 90) { >> "%PS_SCRIPT%"
echo     $lignesRapport += 'DIAGNOSTIC : Modele solide, mais quelques impasses persistent.' >> "%PS_SCRIPT%"
echo } else { >> "%PS_SCRIPT%"
echo     $lignesRapport += 'DIAGNOSTIC : Trop de boucles. Nouvel entrainement recommande.' >> "%PS_SCRIPT%"
echo } >> "%PS_SCRIPT%"
echo $lignesRapport ^| Set-Content $outFile -Encoding UTF8 >> "%PS_SCRIPT%"

powershell -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%"

del "%PS_SCRIPT%"

echo Audit termine ! 
echo Le rapport a ete genere ici : %RAPPORT%
pause
goto action4

:APPRENTISSAGE
cls
if not exist "ap\action" mkdir "ap\action"
if not exist "ap\connaissance\apris" mkdir "ap\connaissance\apris"

set LIVRE=ap\action\livre.txt
if not exist "%LIVRE%" (
    echo [Erreur] Le fichier %LIVRE% est introuvable.
    pause
goto action4
)

for /f %%A in ('type "%LIVRE%" ^| find /c /v ""') do set total_lines=%%A
echo ========================================================
echo Fichier detecte ! Nombre de lignes a traiter : %total_lines%
echo ========================================================
echo Traitement en cours, veuillez patienter...

set PS_SCRIPT=%temp%\traitement_livre.ps1

echo $inputFile = 'ap\action\livre.txt' > "%PS_SCRIPT%"
echo $outDir = 'ap\connaissance\apris' >> "%PS_SCRIPT%"
echo $lines = @(Get-Content $inputFile -Encoding UTF8) >> "%PS_SCRIPT%"
echo $lineCount = 0 >> "%PS_SCRIPT%"
echo $fileCounts = @{} >> "%PS_SCRIPT%"
echo foreach ($line in $lines) { >> "%PS_SCRIPT%"
echo     $lineCount++ >> "%PS_SCRIPT%"
echo     Write-Progress -Activity "Traitement du texte" -Status "Ligne $lineCount / $($lines.Count)" -PercentComplete (($lineCount / $lines.Count) * 100) >> "%PS_SCRIPT%"
echo     # CORRECTION 1 : ^^ pour echapper correctement le circonflexe en Batch >> "%PS_SCRIPT%"
echo     if ($line -match '^^\s*$') { continue } >> "%PS_SCRIPT%"
echo     # Nettoyage de la phrase >> "%PS_SCRIPT%"
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
echo         # CORRECTION 2 : ici aussi, on met ^^ >> "%PS_SCRIPT%"
echo         if ($safeWord -match '^^\s*$') { $safeWord = 'symbole_inconnu' } >> "%PS_SCRIPT%"
echo         $restWords = '' >> "%PS_SCRIPT%"
echo         if ($chunk.Count -gt 1) { $restWords = $chunk[1..($chunk.Count-1)] -join ' ' } >> "%PS_SCRIPT%"
echo         $filename = "$outDir\MotsAP.$safeWord.txt" >> "%PS_SCRIPT%"
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

echo Traitement termine avec succes !
pause
goto action4


:GO
cls
set "KNOWLEDGE_DIR=ap\connaissance\apris"


if not exist "%KNOWLEDGE_DIR%" (
    echo [Erreur] Le dossier %KNOWLEDGE_DIR% n'existe pas.
    echo Vous devez d'abord lancer le script d'apprentissage.
    pause
goto action4
)

:menuap00
echo. %msg1% %msg2% %msg3% %msg4% %msg5%
echo.
set "tour=0"

set /p user_input="(ou 'quitter') 👉 : "
goto InputLoop1


:InputLoop
set "user_input=!generated_sentence!"
:InputLoop1

if /i "!user_input!"=="quitter" goto action4
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
set "file_path=%KNOWLEDGE_DIR%\MotsAP.!current_word!.txt"

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
set msg%tour%=!generated_sentence!
set /a tour+=1

if %tour% GEQ 10 goto menuap00
goto :InputLoop 

:action5
powershell.exe -ExecutionPolicy Bypass -NoProfile -File "%~dp0ap\action\galton.ps1"

pause
goto debutsbs