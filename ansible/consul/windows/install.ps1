$myDownloadUrl = "https://releases.hashicorp.com/consul/1.19.1/consul_1.19.1_windows_386.zip"
$baseDir = "C:\Tools\Consul"
$serviceName = "Consul"

Write-Host "################ create directories ############################"
mkdir "$baseDir\bin"
mkdir "$baseDir\config"
mkdir "$baseDir\data"

Write-Host "################ copy default configuration ####################"
Copy-Item ".\consul.json" -Destination "$baseDir\config"

Write-Host "################ download and unzip comsul binaries ############"
Invoke-WebRequest $myDownloadUrl -OutFile "$baseDir\bin\bin.zip"
Expand-Archive -Path "$baseDir\bin\bin.zip" -DestinationPath "$baseDir\bin" -Force

Write-Host "################ install service ###############################"
sc.exe Create $serviceName binPath="$baseDir\bin\consul.exe agent -config-dir=$baseDir\config" DisplayName=$serviceName start=auto

Write-Host "################ start service #################################"
Start-Service -Name $serviceName

New-NetFirewallRule -DisplayName 'Consul' -Profile 'Public' -Direction Inbound -Action Allow -Protocol TCP -LocalPort 8500