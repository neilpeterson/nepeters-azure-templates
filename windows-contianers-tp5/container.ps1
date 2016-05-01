#$feature = Get-WindowsFeature -Name containers

#if ($feature.Installed -eq $false) {
    
#    Install-WindowsFeature containers 
    
    $action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoExit C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\1.8\Downloads\0\container.ps1"
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    Register-ScheduledTask -TaskName "contianers" -Action $action -Trigger $trigger -RunLevel Highest | Out-Null
    Restart-Computer -Force      
#}

# Unregister-ScheduledTask -TaskName contianers -Confirm:$false

#if (!(Get-ContainerImage -Name windowsservercore)) {

    #Install-PackageProvider ContainerImage -Force
    #Install-ContainerImage -Name WindowsServerCore
#}


#Invoke-WebRequest https://aka.ms/tp5/Update-Container-Host -OutFile update-containerhost.ps1
#.\update-containerhost.ps1
sleep 300
New-Item c:\test.txt
