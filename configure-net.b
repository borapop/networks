@echo off
set local=%~1
if "%~1"=="" (
	echo Usage: configure-net [local network name] or configure-net [local network name] [ip] [mask] [gateway] [dns]
) else if "%~2"=="" (
	echo auto
	netsh interface ip set address name="%local%" source=dhcp
	ipconfig
) else (
	set ip=%~2
	set mask=%~3
	set gateway=%~4
	set dns=%~5

	netsh interface ip set address name="%local%" static %ip% %mask% %gateway% 1
	netsh interface ip set dns "%local%" static none
	netsh interface ip add dns "%local%" %dns% 1
	ipconfig
)
