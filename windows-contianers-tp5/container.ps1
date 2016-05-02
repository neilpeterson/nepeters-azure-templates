param (
[string]$adminUser
)

function install-script {
"   
# TP5 Contianer Installation`r
# Install Windows Server Core Image`r`n
Install-PackageProvider ContainerImage -Force`r
Install-ContainerImage -Name WindowsServerCore`r`n    
# Install Docker daemon and client`r`n
Invoke-WebRequest https://aka.ms/tp5/Update-Container-Host -OutFile update-containerhost.ps1`r
.\update-containerhost.ps1`r
docker tag windowsservercore:10.0.14300.1000 windowsservercore:latest`r`n
# Remove Scheduled Task`r`n
schtasks /DELETE /TN scriptcontianers /F"
}

Install-Script > c:\images.ps1
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoExit c:\images.ps1"
$trigger = New-ScheduledTaskTrigger -AtStartup
Register-ScheduledTask -TaskName "scriptcontianers" -Action $action -Trigger $trigger -RunLevel Highest -User $adminUser | Out-Null

Install-WindowsFeature containers
Restart-Computer -Force      
