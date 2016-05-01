Invoke-WebRequest https://raw.githubusercontent.com/Microsoft/Virtualization-Documentation/master/windows-server-container-tools/Install-ContainerHost/Install-ContainerHost.ps1 -OutFile c:\install-containerhost.ps1
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoExit c:\install-containerhost.ps1"
$trigger = New-ScheduledTaskTrigger -AtLogOn
Register-ScheduledTask -TaskName "scriptcontianers" -Action $action -Trigger $trigger -RunLevel Highest -User "system" | Out-Null
Restart-Computer -Force
