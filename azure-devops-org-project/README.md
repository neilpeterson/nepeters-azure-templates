# Deploy Azure DevOps Organization and Project

This template will create both an Azure DevOps Organization and an empty project. Related resource manager objects are created in a named resource group.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fneilpeterson%2Fnepeters-azure-templates%2Fmaster%2Fazure-devops-org-project%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>


Once deployed, find both the organization and projects resources in the resource group.

![](./images/arm-objects.jpg)

Select the organization object, and then the "My Azure DevOps Organizations" link.

![](./images/org.jpg)

Select the project.

![](./images/project.jpg)

Begin working with the new (empty) project.

![](./images/project.jpg)

Note: removing the Azure resource group, and azure objects, does not remove the Azure DevOps project / organization.