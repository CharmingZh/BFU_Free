:: ����˵����������ҵ��ѧУ԰������
:: ��ϵ��ʽ��Wechat@Raul7Zhangjiaming

:: ������ʾ���ʹ�ý����������
@echo off

:: ���ô��ڱ���
title ��������С����-BJFU

:: ���������д�����ʽ
color 5b
mode con cols=90 lines=40

goto main

:README
cls
echo ==================================================================================
echo                      �������Ǵ�ѧ����С���� 
echo                                           Author ��Github@CharmingZh/BFU_Free
echo                                           Version��V 0.0.1 (Released)
echo  Intro:    �����д�����������������ӱ������Ǵ�ѧУ԰���۸���ˣ��ֲ��뻨Ǯʹ��
echo            ��ʱ������·��ĳ������������˴˽ű�����������������ڸ��󲩿͵ı���
echo            IPv6 �����������̳̣�����ԭ���߱�ʾû���ҵ����������ýű�һ���޸ģ�����
echo            �����Ļ���������һ��СС�Ĺ��������Ƴ�һ���л��ű��������λУ��ʹ�ã�
echo            ע�⣬���ű��ĳ����Ƿ����λ�����������������Υ���Ҽ͵����飬�Ҳ���
echo            �뱻����Ȳ�=_=��
echo  Author:   ������κ����⣬������ Github ������� Issue�������� QQ Ⱥ����� Bug ��
echo            ����֮��İ汾�н��иĽ���Ҳ��ӭ��λ�Ȱ��������С������������΢�ţ���
echo            ��һ��������ͬ�ɳ����������ñ����߷ǳ�ʵ�ã�Ҳ��ӭ�����ߵ� GitHub ��Ŀ
echo            �ϵ�һ�����ǣ���
echo            Wechat@CharminZh����ע������)
echo            QQ_Feedback_Group : 379255617
echo ==================================================================================
goto loop

:Start
cls
echo ��������������������...
PowerShell -Command "&{Disable-NetAdapterBinding -Name "��̫��" -ComponentID ms_tcpip}"
PowerShell -Command "&{Enable-NetAdapterBinding -Name "��̫��" -ComponentID ms_tcpip6}"
netsh interface ipv6 set dns "��̫��" static 2001:67c:2b0::4
echo ...�������
goto loop

:End
cls
echo ���ڹر�������������...
PowerShell -Command "&{Enable-NetAdapterBinding -Name "��̫��" -ComponentID ms_tcpip}"
echo ...���
goto loop

:Custom
cls
echo ����IPv4,�ر�IPv6...
PowerShell -Command "&{Enable-NetAdapterBinding -Name "��̫��" -ComponentID ms_tcpip}"
PowerShell -Command "&{Disable-NetAdapterBinding -Name "��̫��" -ComponentID ms_tcpip6}"
echo ...���
goto loop

:main
:: ������
:: ���ڷ�֧���룺
::             - 0 : ���� README �ļ�
::             - 1 : IPv4 -> IPv6
::             - 2 : IPv6 -> IPv4
::             - 3 : �˳�����

:Help
cls
echo ==================================================================================
echo  �ر�ǿ�������ڱ�����ԭ��Ϊʹ�� IPv6 �ŵ��ƹ�У԰���շѼ��ϵͳ��������ڲ�����
echo                   վԭ����֧�� IPv6 ���ʣ��� CSDN �ȣ����ڲ�����վ�򲻿�ʱ����ر�����
echo                   �����ܣ�����ʹ�ø���վʱ�������ٴο�����Ӧ�á�
echo                   ���㲿����վ�޷����ʣ����Ǵ�������á����Һܺ���������վ�Ѿ�֧�ַ��ʣ�
echo                   �磺Bilibili������԰��Github �ȵȡ�
echo  ����˵����
echo              - 0 : ��������
echo              - 1 : ����������
echo              - 2 : �ر�������
echo              - 3 : ����IPv4,�ر�IPv6
echo              - 4 : �˳�����
echo              - 5 : ����˵��
echo ==================================================================================
:loop
set /p select=            [ �Ⱥ����� ]��������Ҫִ�еĲ�����Ӧ��� ��
if %select%==0 (GOTO README) else (
	if %select%==1 (GOTO Start) else (
		if %select%==2 (GOTO End) else (
			if %select%==4 (
				echo Bye~
				goto bye
			) else (
				if %select%==3 (GOTO Custom) else (
					if %select%==5 (GOTO Help)
					echo             [����] ���������������������
					goto main
				)
			)	
		)
	)
)


:: ����ģ��

:: echo ������������ (ANSI Encoding could help this shit)

:: set /p temp=������; echo %temp% 

:: ��ֹ����ִ������˳����������
:bye
pause