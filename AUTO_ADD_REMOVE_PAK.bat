@echo off
echo 
echo  author Wang Zhen  A.Hleb.King wangzhenjjcn@gmail.com 
echo  since 018-1-7 6:53:44 pm
echo  
echo
echo Refuse pirated games
echo pay attention to self-protection
echo beware fooled
echo moderate games benefit the brain 
echo do not addicted to the game 
echo reasonable to arrange a time to enjoy a healthy life
echo 拒绝盗版游戏，注意自我保护，谨防受骗上当，适度游戏益脑，沉迷游戏伤身，合理安排时间，享受健康生活~!
cd /d %~dp0/PAKS
setlocal enabledelayedexpansion
set /a a=0
set PUBG_PATH=C:\Program Files (x86)\Steam\steamapps\common\PUBG
for /f "delims=" %%i in ('dir /aa/s/b/on *.pak') do (
set /a a+=1
  mklink "!PUBG_PATH!\TslGame\Content\Paks\TslGame-WindowsNoEditor_sound1!a!88888.pak"     %%~fi
)
echo  File deployment finished!!!!!
echo  文件部署完毕
echo   Open the game if you are in the Ingame Lobby (when you hear the sound), the most people hear the sound first and still have blackscreen, switch back
echo  黑屏进游戏听到声音切回来，就是在出生地等待的时候
echo  Just enter a number, only a number can be entered to continue!
echo  切回来随便输入一个数字就可以了
pause;
set N=1
:start
  del "!PUBG_PATH!\TslGame\Content\Paks\TslGame-WindowsNoEditor_gamehack1!N!88888.pak"
if "%n%"=="%a%" goto end
set /a n=%n%+1
goto start 
:end
echo ~~~~~~success~~~~enjoy~~~~~~~game!~~~~~~~~~~~~~~~
echo ~~~~~~成功部署，享受健康游戏，关爱现实生活~~~~~~~~~~
echo ~~Away from the game cheat start from ourselfs~~~
echo ~~~~~~~~~~~~谢谢关注~~~~~~thanks~~~~~~~~~~~~~~~~~~
pause;

