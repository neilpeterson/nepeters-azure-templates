Param (
    [string]$user,
    [string]$password
)

# firewall
netsh advfirewall firewall add rule name="sql " dir=in action=allow protocol=TCP localport=1433

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


# enable tcp/ip protocol
$server.Settings.LoginMode = [Microsoft.SqlServer.Management.Smo.ServerLoginMode]::Mixed
$server.Alter()
$server.Refresh()

# restart sql
Restart-Service MSSQLSERVER
