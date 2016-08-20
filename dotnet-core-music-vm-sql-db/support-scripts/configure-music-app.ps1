<#
.SYNOPSIS

.DESCRIPTION

.PARAMETER Alias

.EXAMPLE

#>

Param (

    [string]$user,
    [string]$password,
    [string]$sqlserver
)

# firewall
netsh advfirewall firewall add rule name="http" dir=in action=allow protocol=TCP localport=80

# folders
New-Item -ItemType Directory c:\temp
New-Item -ItemType Directory c:\music

# install iis
Install-WindowsFeature web-server -IncludeManagementTools

# install dot.net core sdk
Invoke-WebRequest https://go.microsoft.com/fwlink/?LinkID=809122 -outfile c:\temp\DotNetCore.1.0.0-SDK.Preview2-x64.exe
Start-Process c:\temp\DotNetCore.1.0.0-SDK.Preview2-x64.exe -ArgumentList '/quiet' -Wait
Invoke-WebRequest https://go.microsoft.com/fwlink/?LinkId=817246 -outfile c:\temp\DotNetCore.WindowsHosting.exe
Start-Process c:\temp\DotNetCore.WindowsHosting.exe -ArgumentList '/quiet' -Wait

# download music app
#Invoke-WebRequest  https://github.com/neilpeterson/nepeters-azure-templates/raw/master/dotnet-core-music-vm-sql-db/music-app/music-store-azure-demo-pub.zip -OutFile c:\temp\musicstore.zip
#Expand-Archive C:\temp\musicstore.zip c:\music

# download music app
Invoke-WebRequest  https://github.com/neilpeterson/nepeters-azure-templates/raw/master/dotnet-core-music-all-vm/music-app/music-store-azure-demo.zip -OutFile c:\temp\musicstore.zip
Expand-Archive C:\temp\musicstore.zip c:\

# update SQL connection string
#Remove-Item c:\music\config.json
#$configfile = New-Item 'c:\music\config.json'
#$configfile = New-Item 'c:\music-store-azure-demo\src\MusicStore\config.json'
#$string = '{"AppSettings": { "SiteTitle": "ASP.NET MVC Music Store", "CacheDbResults": true }, "Data": { "DefaultConnection": { "ConnectionString": "Server=' + $sqlserver + ';Database=MusicStore;Integrated Security=False;User Id=' + $user + ';Password=' + $password + ';MultipleActiveResultSets=True;Connect Timeout=30" } } }'
#Add-Content $configfile $string

Remove-Item c:music-store-azure-demo\src\MusicStore\config.json
$configfile = New-Item 'c:\music-store-azure-demo\src\MusicStore\config.json'
#$configfile = New-Item 'c:\music-store-azure-demo\src\MusicStore\config.json'
$string = '{"AppSettings": { "SiteTitle": "ASP.NET MVC Music Store", "CacheDbResults": true }, "Data": { "DefaultConnection": { "ConnectionString": "Server=' + $sqlserver + ';Database=MusicStore;Integrated Security=False;User Id=' + $user + ';Password=' + $password + ';MultipleActiveResultSets=True;Connect Timeout=30" } } }'
Add-Content $configfile $string

# start music store app
#Set-Location C:\music-store-azure-demo\src\MusicStore\
#& "C:\Program Files\dotnet\dotnet.exe" restore
#& "C:\Program Files\dotnet\dotnet.exe" publish -o c:\music

# Remove
# update web.config
#$current = "dotnet"
#$replace = 'c:\Program Files\dotnet\dotnet.exe'
#$file = "c:\music\web.config"
#(get-content $file) | foreach-object {$_ -replace $current, $replace} | set-content $file
#& iisreset

# config iis
#Remove-WebSite -Name "Default Web Site"
#Set-ItemProperty IIS:\AppPools\DefaultAppPool\ managedRuntimeVersion ""
#New-Website -Name "MusicStore" -Port 80 -PhysicalPath C:\music\ -ApplicationPool DefaultAppPool
#Start-Sleep 600
#& iisreset

# start music store app
Set-Location C:\music-store-azure-demo\src\MusicStore\
& "C:\Program Files\dotnet\dotnet.exe" restore
& "C:\Program Files\dotnet\dotnet.exe" publish -o c:\music
Remove-WebSite -Name "Default Web Site"
Set-ItemProperty IIS:\AppPools\DefaultAppPool\ managedRuntimeVersion ""
New-Website -Name "MusicStore" -Port 80 -PhysicalPath C:\music\ -ApplicationPool DefaultAppPool
& iisreset
