#//Descargar Agentes//
$filebeat = "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.13.4-windows-x86_64.zip"
$metricbeat = "https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.13.4-windows-x86_64.zip"
$winlogbeat = "https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-7.13.4-windows-x86_64.zip"
$heartbeat = "https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-7.13.4-windows-x86_64.zip"
$fileyml = "conf_files/filebeat.yml"
$metricyml = "conf_files/metricbeat.yml"
$winyml = "conf_files/winlogbeat.yml"
$heartyml = "conf_files/heartbeat.yml"
$file1 = "conf_files/Filebeat - Vista Loyalty - IIS Module.yml"
$file2 = "conf_files/Filebeat - Vista Loyalty - MSSQL Module.yml"
$metric1 = "conf_files/Metricbeat - Vista Loyalty - IIS Module.yml"
$metric2 = "conf_files/Metricbeat - Vista Loyalty - MSSQL Module.yml"
$metric3 = "conf_files/Metricbeat - Vista Loyalty - System Module.yml"
$metric4 = "conf_files/Metricbeat - Vista Loyalty - Windows Module.yml"
$heart1 = "conf_files/Heartbeat - Vista Loyalty - HTTP Module.yml"
$heart2 = "conf_files/Heartbeat - Vista Loyalty - ICMP Module.yml"
$ProgressPreference = 'SilentlyContinue'
wget $filebeat -OutFile "filebeat-7.13.4-windows-x86_64.zip"
wget $metricbeat -OutFile "metricbeat-7.13.4-windows-x86_64.zip"
wget $winlogbeat -OutFile "winlogbeat-7.13.4-windows-x86_64.zip"
wget $heartbeat -OutFile "heartbeat-7.13.4-windows-x86_64.zip"
echo "Agentes descargados"

#Descomprimir Agentes
tar.exe -xvzf "filebeat-7.13.4-windows-x86_64.zip" 
tar.exe -xvzf "metricbeat-7.13.4-windows-x86_64.zip"
tar.exe -xvzf "winlogbeat-7.13.4-windows-x86_64.zip"
tar.exe -xvzf "heartbeat-7.13.4-windows-x86_64.zip"
rm "filebeat-7.13.4-windows-x86_64.zip"
rm "metricbeat-7.13.4-windows-x86_64.zip"
rm "winlogbeat-7.13.4-windows-x86_64.zip"
rm "heartbeat-7.13.4-windows-x86_64.zip"
Rename-Item -Path ".\filebeat-7.13.4-windows-x86_64\" -NewName "Filebeat"
Rename-Item -Path ".\metricbeat-7.13.4-windows-x86_64\" -NewName "Metricbeat"
Rename-Item -Path ".\winlogbeat-7.13.4-windows-x86_64\" -NewName "Winlogbeat"
Rename-Item -Path ".\heartbeat-7.13.4-windows-x86_64\" -NewName "Heartbeat"
echo "Archivos descromprimidos"

#Sustituir archivo de configuracion de Agentes
cp $fileyml -Destination "Filebeat/filebeat.yml" -Recurse -force
cp $metricyml -Destination "Metricbeat/metricbeat.yml" -Recurse -force
cp $winyml -Destination "Winlogbeat/winlogbeat.yml" -Recurse -force
cp $heartyml -Destination "Heartbeat/winlogbeat.yml" -Recurse -force
mv $file1 -Destination "Filebeat/"
mv $file2 -Destination "Filebeat"
mv $metric1 -Destination "Metricbeat/"
mv $metric2 -Destination "Metricbeat/"
mv $metric3 -Destination "Metricbeat/"
mv $metric4 -Destination "Metricbeat/"
mv $heart1 -Destination "Heartbeat/"
mv $heart2 -Destination "Heartbeat/"

Move-Item -Path "Filebeat" -Destination 'C:\Program Files\'
Move-Item -Path "Metricbeat" -Destination 'C:\Program Files\'
Move-Item -Path "Heartbeat" -Destination 'C:\Program Files\'
Move-Item -Path "Winlogbeat" -Destination 'C:\Program Files\'


#Iniciar Agentes
powershell.exe -File "C:\Program Files\Filebeat\install-service-filebeat.ps1"
Start-Service filebeat
powershell.exe -File "C:\Program Files\Metricbeat\install-service-metricbeat.ps1"
Start-Service metricbeat
powershell.exe -File "C:\Program Files\Winlogbeat\install-service-winlogbeat.ps1"
Start-Service winlogbeat
powershell.exe -File "C:\Program Files\Heartbeat\install-service-heartbeat.ps1"
Start-Service heartbeat