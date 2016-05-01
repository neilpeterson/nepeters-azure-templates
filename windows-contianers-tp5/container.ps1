$feature = Get-WindowsFeature -Name containers

if ($feature.Installed -eq $false) {
    
    Install-WindowsFeature containers 
    
    "Install-PackageProvider ContainerImage -Force;Install-ContainerImage -Name WindowsServerCore;Unregister-ScheduledTask -TaskName scriptcontianers -Confirm:$false" > c:\images.ps1
    
    $action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoExit c:\images.ps1"
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    Register-ScheduledTask -TaskName "scriptcontianers" -Action $action -Trigger $trigger -RunLevel Highest -User "system" | Out-Null
    Restart-Computer -Force      
}
