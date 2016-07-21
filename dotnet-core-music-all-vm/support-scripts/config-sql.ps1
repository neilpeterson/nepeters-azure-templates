<#
.SYNOPSIS

.DESCRIPTION

.PARAMETER Alias

.EXAMPLE

#>

Param (
    [string]$user = "sqladmin",
    [string]$password = "Password12"
)

# firewall
netsh advfirewall firewall add rule name="sql" dir=in action=allow protocol=TCP localport=1433

Import-Module SQLPS -DisableNameChecking

# create user and grant sysadmin (demo purposes only)
$server = new-Object Microsoft.SqlServer.Management.Smo.Server("(local)")
$login = new-object Microsoft.SqlServer.Management.Smo.Login("(local)", $user)
$login.LoginType = 'SqlLogin'
$login.PasswordPolicyEnforced = $false
$login.PasswordExpirationEnabled = $false
$login.Create($password)
$login.AddToRole("sysadmin")
$login.Alter()


# changed login to mixed
$server.Settings.LoginMode = [Microsoft.SqlServer.Management.Smo.ServerLoginMode]::Mixed
$server.Alter()
$server.Refresh()

# enable tcpip

$smo = 'Microsoft.SqlServer.Management.Smo.'
$wmi = new-object ($smo + 'Wmi.ManagedComputer').
$uri = "ManagedComputer[@Name='" + (get-item env:\computername).Value + "']/ServerInstance[@Name='MSSQLSERVER']/ServerProtocol[@Name='Tcp']"
$Tcp = $wmi.GetSmoObject($uri)
$Tcp.IsEnabled = $true
$Tcp.Alter()

# restart sql
Restart-Service MSSQLSERVER
