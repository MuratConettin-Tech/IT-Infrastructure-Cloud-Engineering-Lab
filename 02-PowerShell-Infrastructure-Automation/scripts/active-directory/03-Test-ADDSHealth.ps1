# 03-Test-ADDSHealth.ps1
# Active Directory and DNS health validation.

$DomainName = "conettin.lab"
$DCName     = "dc01.conettin.lab"

Write-Host "========================================"
Write-Host " Active Directory & DNS Health Check"
Write-Host "========================================"

$Results = @()

try {
    $Domain = Get-ADDomain -ErrorAction Stop
    $Results += [PSCustomObject]@{
        Test   = "Active Directory Domain"
        Target = $Domain.DNSRoot
        Status = "PASS"
    }
}
catch {
    $Results += [PSCustomObject]@{
        Test   = "Active Directory Domain"
        Target = $DomainName
        Status = "FAIL"
    }
}

$NTDS = Get-Service NTDS
$Results += [PSCustomObject]@{
    Test   = "AD DS Service"
    Target = "NTDS"
    Status = if ($NTDS.Status -eq "Running") { "PASS" } else { "FAIL" }
}

$DNS = Get-Service DNS
$Results += [PSCustomObject]@{
    Test   = "DNS Service"
    Target = "DNS"
    Status = if ($DNS.Status -eq "Running") { "PASS" } else { "FAIL" }
}

try {
    Resolve-DnsName $DCName -Server 192.168.1.10 -ErrorAction Stop | Out-Null

    $Results += [PSCustomObject]@{
        Test   = "DC DNS Resolution"
        Target = $DCName
        Status = "PASS"
    }
}
catch {
    $Results += [PSCustomObject]@{
        Test   = "DC DNS Resolution"
        Target = $DCName
        Status = "FAIL"
    }
}

try {
    Resolve-DnsName "_ldap._tcp.dc._msdcs.$DomainName" `
        -Type SRV `
        -Server 192.168.1.10 `
        -ErrorAction Stop | Out-Null

    $Results += [PSCustomObject]@{
        Test   = "LDAP SRV Record"
        Target = "_ldap._tcp.dc._msdcs.$DomainName"
        Status = "PASS"
    }
}
catch {
    $Results += [PSCustomObject]@{
        Test   = "LDAP SRV Record"
        Target = "_ldap._tcp.dc._msdcs.$DomainName"
        Status = "FAIL"
    }
}

$Results | Format-Table -AutoSize