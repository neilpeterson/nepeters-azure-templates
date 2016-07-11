<#
.SYNOPSIS

.DESCRIPTION

.PARAMETER Alias

.EXAMPLE

#>

Param (

)

# firewall
netsh advfirewall firewall add rule name="http" dir=in action=allow protocol=TCP localport=80


# install dot.net core sdk
New-Item -ItemType Directory c:\temp
Invoke-WebRequest https://go.microsoft.com/fwlink/?LinkID=809122 -outfile c:\temp\DotNetCore.1.0.0-SDK.Preview2-x64.exe
Start-Process c:\temp\DotNetCore.1.0.0-SDK.Preview2-x64.exe -ArgumentList '/quiet' -Wait


# download music app
Invoke-WebRequest  https://github.com/neilpeterson/nepeters-azure-templates/raw/master/documetation-end-to-end/music-app/music-store-azure-demo.zip -OutFile c:\temp\musicstore.zip
Expand-Archive C:\temp\musicstore.zip c:\
