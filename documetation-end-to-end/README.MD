# Deploy Two Tier Application on Azure Virtual Machines

This in progress template will deploy two virtual machines, running the .NET Core Music Store Application.

![](./media/architecture.png)

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fneilpeterson%2Fnepeters-azure-templates%2Fmaster%2Fdocumetation-end-to-end%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/load=httpshttps%3A%2F%2Fraw.githubusercontent.com%2Fneilpeterson%2Fnepeters-azure-templates%2Fmaster%2Fdocumetation-end-to-end%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

# Details

Command for launching kestrel on port 80:

```none
dotnet.exe run --server.urls=http://0.0.0.0:5000
```
