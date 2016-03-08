$cred = Get-Credential
Login-AzureRmAccount -Credential $cred
New-AzureRmResourceGroupDeployment -TemplateFile ..\azuredeploy.json -ResourceGroupName resource-group -existingVMSSName vmms-name -newCapacity 5
