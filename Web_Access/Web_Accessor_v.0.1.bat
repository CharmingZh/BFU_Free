:: 功能说明：保加利亚大学校园网免流
:: 联系方式：Wechat@Raul7Zhangjiaming

:: 隐藏显示命令，使得界面更加美观
@echo off

:: 设置窗口标题
title 表姐夫免流小助手-BJFU

:: 设置命令行窗口样式
color 5b
mode con cols=90 lines=40

goto main

:README
cls
echo ==================================================================================
echo                      保加利亚大学免流小助手 
echo                                           Author ：Github@CharmingZh/BFU_Free
echo                                           Version：V 0.0.1 (Released)
echo  Intro:    由于有大量数据下载需求，外加保加利亚大学校园网价格感人，又不想花钱使用
echo            随时可能跑路的某六软件，开发了此脚本。灵感来自于流传于各大博客的表姐夫
echo            IPv6 免流量上网教程，由于原作者表示没有找到在哪里配置脚本一键修改，本人
echo            在他的基础上做了一点小小的工作，现推出一键切换脚本。方便各位校友使用，
echo            注意，本脚本的初衷是方便各位科研生活，请勿用于做违法乱纪的事情，我并不
echo            想被人请喝茶=_=。
echo  Author:   如果有任何问题，可以在 Github 上面提出 Issue，或者在 QQ 群中提出 Bug 我
echo            会在之后的版本中进行改进，也欢迎各位热爱计算机的小伙伴们添加作者微信，日
echo            后一起交流，共同成长。若您觉得本工具非常实用，也欢迎在作者的 GitHub 项目
echo            上点一颗星星：）
echo            Wechat@CharminZh（请注明来意)
echo            QQ_Feedback_Group : 379255617
goto loop


:Start
cls
echo 正在启动免流量部署中...
netsh interface ipv6 set dns "以太网" static 2001:67c:2b0::4
PowerShell -Command "&{Disable-NetAdapterBinding -Name "以太网" -ComponentID ms_tcpip}"
echo ...部署完成
goto loop

:End
cls
echo 正在关闭免流量部署中...
PowerShell -Command "&{Enable-NetAdapterBinding -Name "以太网" -ComponentID ms_tcpip}"
echo ...完成
goto loop

:main
:: 主程序
:: 关于分支代码：
::             - 0 : 进入 README 文件
::             - 1 : IPv4 -> IPv6
::             - 2 : IPv6 -> IPv4
::             - 3 : 退出程序

:loop
echo ==================================================================================
echo  特别强调：由于本程序原理为使用 IPv6 信道绕过校园网收费监管系统，因此由于部分网
echo                   站原生不支持 IPv6 访问（如 CSDN 等），在部分网站打不开时，请关闭免流
echo                   量功能，待不使用该网站时，可以再次开启此应用。
echo                   即便部分网站无法访问，但是大多数常用、并且很耗流量的网站已经支持访问，
echo                   如：Bilibili，博客园，Github 等等。
echo  操作说明：
echo              - 0 : 关于作者
echo              - 1 : 启动免流量
echo              - 2 : 关闭免流量
echo              - 3 : 退出程序
echo ==================================================================================
set /p select=            [菜单]请输入您要执行的操作对应编号 ：
if %select%==0 (GOTO README) else (
	if %select%==1 (GOTO Start) else (
		if %select%==2 (GOTO End) else (
			if %select%==3 (
				echo Bye~
				goto bye
			)
			echo             [错误] 输入参数有误，请重新输入
			goto main
		)
	)
)


:: 测试模块

:: echo 测试中文乱码 (ANSI Encoding could help this shit)

:: set /p temp=请输入; echo %temp% 

:: 设置阻塞，方便调试
:bye
pause