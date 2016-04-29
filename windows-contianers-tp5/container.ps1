$feature = Get-WindowsFeature -Name containers

if ($feature.Installed -eq $false) {
    
    Install-WindowsFeature containers 
    
    $action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoExit c:\container.ps1"
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    Register-ScheduledTask -TaskName "contianers" -Action $action -Trigger $trigger -RunLevel Highest | Out-Null
    Restart-Computer -Force      
}

Unregister-ScheduledTask -TaskName contianers -Confirm:$false
New-Item -ItemType File c:\test.txt -Force