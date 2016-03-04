$swarmpath = 'c:\swarm'
$ip = (Get-NetIPAddress | where {$_.IPAddress -Like '10.0.0.*'})[0]
$ad = $ip.IPAddress + ":2375"
$netsh = "netsh interface portproxy add v4tov4 listenport=2375 listenaddress=$ip.IPAddress connectport=2375 connectaddress=127.0.0.1"
$swarm = "$swarmpath\swarm.exe join --advertise=$ad consul://172.16.0.5:8500/nodes"

if (!(Test-Path -Path $swarmpath)) {
    New-Item -ItemType Directory -Path $swarmpath
}

Invoke-WebRequest -Method Get -Uri https://raw.githubusercontent.com/neilpeterson/azure-runbooks-and-scripts/master/windows-swarm-setup/swarm.exe -OutFile "$swarmpath\swarm.exe"
Invoke-Expression -Command:$netsh
Invoke-Expression -Command:$swarm