$cred = Get-Credential
$script = "https://raw.githubusercontent.com/neilpeterson/nepeters-azure-templates/master/windows-custom-script-simple/Create-File.ps1"
$run = "Create-File.ps1"
$name = "scripttest"
$location = "West US"

Login-AzureRmAccount -Credential $cred
Set-AzureRmVMCustomScriptExtension -ResourceGroupName $name -VMName $name -Name $name -FileUri $script -Run $run -Location $location