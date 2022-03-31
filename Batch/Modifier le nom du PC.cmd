@echo off
echo Votre nom d'ordinateur est actuellement : %computername%
set /p variable= quel nom d'ordinateur souhaitez vous ?
REG ADD "HKLM\SYSTEM\ControlSet001\Control\ComputerName\ComputerName" /v ComputerName /t REG_SZ /d %variable% /f 
REG ADD "HKLM\SYSTEM\ControlSet001\Services\Tcpip\Parameters" /v "NV Hostname" /t REG_SZ /d %variable% /f 
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName" /v ComputerName /t REG_SZ /d %variable% /f 
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "NV Hostname" /t REG_SZ /d %variable% /f

shutdown -r -f -t 5 -c "Redemarrage pour changer le nom de votre machine virtuelle"