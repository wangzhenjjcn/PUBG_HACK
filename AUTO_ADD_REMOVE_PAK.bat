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
for /f "delims=" %%i in ('dir /b /a-d') do (
set /a a+=1
  mklink "C:\Program Files (x86)\Steam\steamapps\common\PUBG\TslGame\Content\Paks\TslGame-WindowsNoEditor_gamehack!a!.pak"  %~dp0PAKS\%%~ni.pak
)
echo  File deployment finished!!!!!
echo  文件部署完毕
echo   Open the game and switch back to the window after you get on the plane!
echo  上了飞机切回来
echo  Just enter a number, only a number can be entered to continue!
echo  在飞机上切回来随便输入一个数字就可以了
pause;
set N=1
:start
  del "C:\Program Files (x86)\Steam\steamapps\common\PUBG\TslGame\Content\Paks\TslGame-WindowsNoEditor_gamehack!N!.pak"
if "%n%"=="%a%" goto end
set /a n=%n%+1
goto start 
:end
echo ~~~~~~success~~~~enjoy~~~~~~~game!~~~~~~~~~~~~~~~
echo ~~~~~~成功部署，享受健康游戏，关爱现实生活~~~~~~~~~~
echo ~~Away from the game cheat start from ourselfs~~~
echo ~~~~~~~~~~~~谢谢关注~~~~~~thanks~~~~~~~~~~~~~~~~~~
pause;

