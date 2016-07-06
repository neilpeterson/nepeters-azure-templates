Param (
    [string]$user,
    [string]$password
)

Import-Module SQLPS -DisableNameChecking
$server = new-Object Microsoft.SqlServer.Management.Smo.Server("(local)")
$login = new-object Microsoft.SqlServer.Management.Smo.Login("(local)", $user)
$login.LoginType = 'SqlLogin'
$login.PasswordPolicyEnforced = $false
$login.PasswordExpirationEnabled = $false
$login.Create($password)
