param (
[string]$adminUser
)


#$feature = Get-WindowsFeature -Name containers

#if ($feature.Installed -eq $false) {
    
    Install-WindowsFeature containers    

    Install-Script > c:\images.ps1
    
    $action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoExit c:\images.ps1"
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    Register-ScheduledTask -TaskName "scriptcontianers" -Action $action -Trigger $trigger -RunLevel Highest -User $adminUser | Out-Null
    Restart-Computer -Force      
#}

function install-script {
"# TP5 Contianer Installation`r`n
    # Install Windows Server Core Image`r`n
    Install-PackageProvider ContainerImage -Force`r
    Install-ContainerImage -Name WindowsServerCore`r`n    
    # Install Docker daemon and client`r`n
    Invoke-WebRequest https://aka.ms/tp5/Update-Container-Host -OutFile update-containerhost.ps1`r
    .\update-containerhost.ps1`r`n
    Unregister-ScheduledTask -TaskName scriptcontianers -Confirm:$false"
}
