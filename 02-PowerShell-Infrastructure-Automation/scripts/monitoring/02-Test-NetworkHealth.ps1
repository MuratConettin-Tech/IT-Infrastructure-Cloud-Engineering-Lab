# 02-Test-NetworkHealth.ps1
# Basic infrastructure network health validation.

$Gateway = "192.168.1.1"
$DC01    = "192.168.1.10"
$Ubuntu01 = "192.168.1.13"
$Domain  = "dc01.conettin.lab"

Write-Host "========================================"
Write-Host " Infrastructure Network Health Check"
Write-Host "========================================"

$GatewayTest = Test-Connection $Gateway -Count 2 -Quiet
$DC01Test = Test-Connection $DC01 -Count 2 -Quiet
$UbuntuTest = Test-Connection $Ubuntu01 -Count 2 -Quiet

try {
    $DNSResult = Resolve-DnsName $Domain -Server $DC01 -ErrorAction Stop
    $DNSTest = $true
}
catch {
    $DNSTest = $false
}

$Results = @(
    [PSCustomObject]@{
        Test   = "Default Gateway"
        Target = $Gateway
        Status = if ($GatewayTest) { "PASS" } else { "FAIL" }
    }

    [PSCustomObject]@{
        Test   = "DC01 Connectivity"
        Target = $DC01
        Status = if ($DC01Test) { "PASS" } else { "FAIL" }
    }

    [PSCustomObject]@{
        Test   = "Ubuntu01 Connectivity"
        Target = $Ubuntu01
        Status = if ($UbuntuTest) { "PASS" } else { "FAIL" }
    }

    [PSCustomObject]@{
        Test   = "Internal DNS Resolution"
        Target = $Domain
        Status = if ($DNSTest) { "PASS" } else { "FAIL" }
    }
)

$Results | Format-Table -AutoSize