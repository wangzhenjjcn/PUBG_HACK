@echo off
set pubg_path=C:\Progra~2\Steam\steamapps\common\PUBG\TslGame\
set pak_path=%pubg_path%Content\Paks\
set modpak_path=%pubg_path%Content\Paks\TslGame-WindowsNoEditor_ui.pak\
set modpaks_path=%pubg_path%Content\Paks\TslGame-WindowsNoEditor_ui.pak\TslGame-WindowsNoEditor_ui1.pak\

del "%modpaks_path%" /S /F /Q /A 
rd "%modpak_path%" /S  /Q  
  echo Y|move        "%filepath%TslGame-WindowsNoEditor_ui.pak"   "%pak_path%"
echo ============================================================================
echo                                  uninstalled!
echo ============================================================================
pause;