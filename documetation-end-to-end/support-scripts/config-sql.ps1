Param (
    [string]$user,
    [string]$password
)

# firewall
netsh advfirewall firewall add rule name="sql " dir=in action=allow protocol=TCP localport=1433

Import-Module SQLPS -DisableNameChecking
$server = new-Object Microsoft.SqlServer.Management.Smo.Server("(local)")
$login = new-object Microsoft.SqlServer.Management.Smo.Login("(local)", $user)
$login.LoginType = 'SqlLogin'
$login.PasswordPolicyEnforced = $false
$login.PasswordExpirationEnabled = $false
$login.Create($password)

$server.Settings.LoginMode = [Microsoft.SqlServer.Management.Smo.ServerLoginMode]::Mixed
$server.Alter()
$server.Refresh()
Restart-Service MSSQLSERVER
