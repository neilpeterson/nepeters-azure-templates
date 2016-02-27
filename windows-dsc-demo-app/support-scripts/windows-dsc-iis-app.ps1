configuration APP {

    param 
    (
        [string[]]$NodeName = 'localhost'
    )

    node $NodeName {
  
        WindowsFeature IIS { 
            Ensure = "Present" 
            Name = "Web-Server"                        
        } 

        WindowsFeature IISConsole {
            Ensure = "Present"
            Name = "Web-Mgmt-Console"
            DependsOn = "[WindowsFeature]IIS"
        }

        WindowsFeature Web-Asp-Net45 {
            Ensure = "Present"
            Name = "Web-Asp-Net45"
            DependsOn = "[WindowsFeature]IIS"
        }

        File APPDEMO {
            SourcePath = "C:\Packages\Plugins\Microsoft.Powershell.DSC\2.14.0.0\DSCWork\windows-dsc-iis-app.ps1.0\demo-app"
            DestinationPath = "C:\inetpub\wwwroot\"
            Recurse = $true
            Type = "Directory"
            Ensure = "Present"
            DependsOn = "[WindowsFeature]IIS"
        }

    } 
}

APP

Start-DscConfiguration -Wait -Verbose -Path .\APP -Force