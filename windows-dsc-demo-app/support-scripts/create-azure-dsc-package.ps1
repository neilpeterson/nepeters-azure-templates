$cred = Get-Credential
Login-AzureRmAccount -credential $cred
Publish-AzureRmVMDscConfiguration -ConfigurationPath .\windows-dsc-iis-app.ps1 -ConfigurationArchivePath .\windows-dsc-iis-app.ps1.zip -AdditionalPath .\demo-app
