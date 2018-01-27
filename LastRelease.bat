@echo off
echo ==================================================================================================
echo  if err with encode problem,pls make a file and copy code from github page and save as bat file
echo ==================================================================================================
echo  author wang zhen  a.hleb.king wangzhenjjcn@gmail.com 
echo  since 018-1-27 23:23:23 AM (UTC+8)
echo ==================================================================================================
echo ---------------------------------------refuse pirated games---------------------------------------
echo --------------------------------pay attention to self-protection----------------------------------
echo ---------------------------------------- beware fooled--------------------------------------------
echo --------------------------------moderate games benefit the brain ---------------------------------
echo -----------------------------------do not addicted to the game -----------------------------------
echo ------------------------reasonable to arrange a time to enjoy a healthy life----------------------
echo ==================================================================================================
echo ==================================================================================================
echo ====!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!WARNING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!===============
echo ====!!!!!!!!!!!!!!!!!!MAKE SURE YOUR DRIVER C HAVE 22GB FREE SPACES!!!!!!!!!!!!!!!!===============
echo ====!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!RISK  ON YOUR OWN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!===============
echo ====!!!!!!!!!!!!!!!!!!You Can Edit This File Make Sure PUBG_PATH  right!!!!!!!!!!!!===============
echo ==================================================================================================
set paks_path=c:\moddedfiles\
set pubg_path=c:\program files (x86)\steam\steamapps\common\pubg\
echo ==================================================================================================
set filepath=%~dp0
set PAK_PATH=%pubg_path%TslGame\Content\Paks\
set PAK_PATH_RENAME=%pubg_path%TslGame\Content\Paks1\
:start
echo --start
if exist %paks_path% goto copypaks
if not exist %paks_path% goto creatpaksfolder
:creatpaksfolder
echo --creatpaksfolder
if not exist %paks_path% mkdir %paks_path%
goto start
:copypaks
echo --copypaks
cd %PAK_PATH%
echo =====OOOPS=======PLS====WAIT=====WAIT======WAIT====12GB===DATA===COPY=======ING=================
for /f "delims=" %%i in ('dir /aa/s/b/on *.pak') do (
if  not exist  %paks_path%%%~nxi  xcopy "%%~fi" "%paks_path%" 
if    exist  %paks_path%%%~nxi  echo COPY===%%~nxi===DONE
if  not exist  %paks_path%%%~nxi  goto copypaks
)
echo ---paks copy done
goto copymoddedfiles
:copymoddedfiles
echo --copymoddedfiles
cd %filepath%
for /f "delims=" %%i in ('dir /aa/s/b/on *.pak') do (
if  not exist  %paks_path%%%~nxi  xcopy "%%~fi" "%paks_path%" 
if  exist  %paks_path%%%~nxi  echo COPY===%%~nxi===DONE
if  not exist  %paks_path%%%~nxi goto copymoddedfiles
)
cd C:\
echo ---paks modded copy done
goto RenamePAKSFOLDER
:RenamePAKSFOLDER
echo --RenamePAKSFOLDER
if  not exist  "%PAK_PATH_RENAME%"  RENAME  "%PAK_PATH%"   Paks1
if  not exist  "%PAK_PATH_RENAME%"  goto RenamePAKSFOLDER
echo ---paks folder renamed done
goto mklink
:mklink
echo --mklink
if not exist  "%PAK_PATH%"  mklink /j "%pubg_path%TslGame\Content\Paks" "%paks_path%"
if not exist  "%PAK_PATH%"  goto mklink
echo ---mklink done
echo ============================================================================
echo                          run game please  
echo ============================================================================
echo    (IMPORTANT: DO THIS ON THE 1 MINUTE COUNTDOWN BEFORE PARACHUTE)
echo    (IMPORTANT: DO THIS ON THE 1 MINUTE COUNTDOWN BEFORE PARACHUTE)
echo    (IMPORTANT: DO THIS ON THE 1 MINUTE COUNTDOWN BEFORE PARACHUTE)
echo    (IMPORTANT: DO THIS ON THE 1 MINUTE COUNTDOWN BEFORE PARACHUTE)
echo    (IMPORTANT: DO THIS ON THE 1 MINUTE COUNTDOWN BEFORE PARACHUTE)
echo    (IMPORTANT: DO THIS ON THE 1 MINUTE COUNTDOWN BEFORE PARACHUTE)
echo    (IMPORTANT: DO THIS ON THE 1 MINUTE COUNTDOWN BEFORE PARACHUTE)
echo    (IMPORTANT: DO THIS ON THE 1 MINUTE COUNTDOWN BEFORE PARACHUTE)
echo    (IMPORTANT: DO THIS ON THE 1 MINUTE COUNTDOWN BEFORE PARACHUTE)
echo    (IMPORTANT: DO THIS ON THE 1 MINUTE COUNTDOWN BEFORE PARACHUTE)
echo    (IMPORTANT: DO THIS ON THE 1 MINUTE COUNTDOWN BEFORE PARACHUTE)
echo    (IMPORTANT: DO THIS ON THE 1 MINUTE COUNTDOWN BEFORE PARACHUTE)
echo    (IMPORTANT: DO THIS ON THE 1 MINUTE COUNTDOWN BEFORE PARACHUTE)
echo ============================================================================
echo           DO this:  swich back and key down any thing!!!!!!!!!!!!
echo ============================================================================
pause;
goto deletemklink
:deletemklink
echo --deletemklink
if exist  "%PAK_PATH%" rd /s /q  "%PAK_PATH%"
if exist  "%PAK_PATH%" goto deletemklink
echo ---delete done
goto RenamePAKSFOLDERback
:RenamePAKSFOLDERback
echo --RenamePAKSFOLDERback
if  not exist  "%PAK_PATH%" RENAME  "%PAK_PATH_RENAME%"   Paks
if  not exist  "%PAK_PATH%" goto RenamePAKSFOLDERback
echo %PAK_PATH%   DONE
echo ---rename back done
echo ============================================================================
echo                 ENJOY!!ENJOY!!ENJOY!!ENJOY!!ENJOY!!ENJOY!!ENJOY!!
echo                    NO NEED TO DO IT EVERY SINGLE GAME.
echo                    NO NEED TO DO IT EVERY SINGLE GAME.
echo                    NO NEED TO DO IT EVERY SINGLE GAME.
echo                    NO NEED TO DO IT EVERY SINGLE GAME.
echo                    TO DO IT EVERYTIME YOU LAUNCH PUBG.
echo                    TO DO IT EVERYTIME YOU LAUNCH PUBG.
echo                    TO DO IT EVERYTIME YOU LAUNCH PUBG.
echo                    TO DO IT EVERYTIME YOU LAUNCH PUBG.
echo ============================================================================
pause;
pause;
pause;
