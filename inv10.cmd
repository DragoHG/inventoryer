@echo off
set here=%cd%
for /f "tokens=2 delims==" %%i in ('wmic bios get serialnumber /value') do set Serial=%%i
for /f "tokens=2 delims==" %%o in ('wmic computersystem get Manufacturer /value') do set Manufacturer=%%o
for /f "tokens=2 delims==" %%J in ('wmic computersystem get Model /value') do set Model=%%J
for /f "tokens=3 skip=1" %%a in ('wmic path Win32_NetworkAdapter where "PNPDeviceID like '%%%%PCI%%%%' AND NetConnectionStatus=2 AND AdapterTypeID='0'" get name^,MacAddress^,AdapterType') do (Set "MacAddress=%%a")
set metadata=%here%\infos\%ComputerName%-%UserName%\


set "csvFile=%here%\spo_inv.csv"
set "newData=%ComputerName%,%UserName%,%Manufacturer%,%Model%,%Serial%,%MacAddress%,10th" 
 
echo Appending data to CSV file... 
 
echo %newData% >> "%csvFile%" 
 
echo Data appended to the CSV file at %csvFile%. 

mkdir %metadata%

systeminfo >> %metadata%\systeminfo.txt

whoami >> %metadata%\%UserName%.txt
net user %UserName% >> %metadata%\%UserName%.txt

ipconfig /all >> %metadata%\ipconfig.txt

wmic NIC get Description,MACAddress,NetEnabled,Speed >> %metadata%\NICs.txt

wmic DISKDRIVE get InterfaceType,Name,Size,Status >> %metadata%\disks.txt

wmic USERACCOUNT get Caption,Name,PasswordRequired,Status >> %metadata%\accounts.txt
