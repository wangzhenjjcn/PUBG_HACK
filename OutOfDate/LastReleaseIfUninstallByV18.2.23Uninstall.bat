@echo off
echo ==================================================================================================
echo  if err with encode problem,pls make a file and copy code from github page and save as bat file
echo  the first @  maybe err encode 
echo ==================================================================================================
echo  author wang zhen  a.hleb.king wangzhenjjcn@gmail.com 
echo  since       018-1-27 23:23:23 AM (UTC+8)
echo  lastupdated 018-2-23 16:23:23 AM (UTC+8)
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
set pubg_path=C:\Progra~2\Steam\steamapps\common\PUBG\TslGame\
set pak_path=%pubg_path%Content\Paks\
set modpak_path=%pubg_path%Content\Paks\TslGame-WindowsNoEditor_ui.pak\
set modpaks_path=%pubg_path%Content\Paks\TslGame-WindowsNoEditor_ui.pak\TslGame-WindowsNoEditor_ui1.pak\
echo ==================================================================================================
set filepath=%~dp0
:start
if not exist %pubg_path% echo Alert!!!!PUBG NOT FOUNDED!!!!!!!!!!!!!!
if not exist %pubg_path% echo goto start
echo start					CopyPaks
rd "%filepath%TslGame-WindowsNoEditor_ui.pak" /S  /Q  
if not exist %modpaks_path%  echo Y|move "%pak_path%TslGame-WindowsNoEditor_ui.pak"   "%filepath%"
if not exist %modpak_path% goto creatpaksfolder
if not exist %modpaks_path% goto creatpaksfolder
if exist %modpaks_path% goto copypaks
echo start					--Done 
:creatpaksfolder
echo creatpaksfolder		MakingFiles
cd "%pak_path%"
if not exist %modpak_path%   mkdir %modpak_path%
cd "%modpak_path%"
if not exist %modpaks_path%   mkdir %modpaks_path%
echo creatpaksfolder		--Done 
goto start
:copypaks
echo --copypaks				Working
cd "%modpak_path%"
echo =====OOOPS=======PLS====WAIT=====WAIT======WAIT=======DATA===COPY=======ING=================
if  not exist  "%modpak_path%TslGame-WindowsNoEditor_ui.pak"   xcopy "%filepath%TslGame-WindowsNoEditor_ui.pak" "%modpak_path%"  
echo ---paks copy done
goto copymoddedfiles
:copymoddedfiles
echo --copymoddedfiles
cd %filepath%PAKS\
for /f "delims=" %%i in ('dir /aa/s/b/on *.pak') do (
if  not exist  %modpaks_path%%%~nxi  xcopy "%%~fi" "%modpaks_path%" 
if  exist  %modpaks_path%%%~nxi  echo COPY===%%~nxi===DONE
if  not exist  %modpaks_path%%%~nxi goto copymoddedfiles
)
cd C:\
echo ---paks modded copy done
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
