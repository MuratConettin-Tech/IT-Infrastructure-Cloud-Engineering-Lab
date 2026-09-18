# Hybrid Infrastructure Lab
# Active Directory and DNS validation script
# Server: DC01
# Domain: Conettin.lab

Write-Host "========================================="
Write-Host " Active Directory Infrastructure Check"
Write-Host "========================================="

# 1. Network Configuration
Write-Host "`n[1] Network Configuration"

Get-NetIPAddress `
    -InterfaceAlias "Ethernet" `
    -AddressFamily IPv4 |
    Select-Object IPAddress, PrefixLength, AddressState

# 2. Default Gateway
Write-Host "`n[2] Default Gateway"

Get-NetRoute `
    -DestinationPrefix "0.0.0.0/0" |
    Select-Object DestinationPrefix, NextHop

# 3. DNS Client
Write-Host "`n[3] DNS Client Configuration"

Get-DnsClientServerAddress `
    -InterfaceAlias "Ethernet" `
    -AddressFamily IPv4 |
    Select-Object ServerAddresses

# 4. Active Directory Domain
Write-Host "`n[4] Active Directory Domain"

Get-ADDomain |
    Select-Object DNSRoot, NetBIOSName, PDCEmulator

# 5. Domain Controller
Write-Host "`n[5] Domain Controller"

Get-ADDomainController |
    Select-Object HostName, IPv4Address, Site

# 6. Core Services
Write-Host "`n[6] Core Services"

Get-Service DNS, NTDS |
    Select-Object Status, Name, DisplayName

# 7. DC01 DNS Resolution
Write-Host "`n[7] DC01 DNS Resolution"

Resolve-DnsName dc01.conettin.lab `
    -Server 192.168.1.10 `
    -Type A |
    Select-Object Name, Type, IPAddress

# 8. LDAP SRV Record
Write-Host "`n[8] Active Directory LDAP SRV Record"

Resolve-DnsName `
    _ldap._tcp.dc._msdcs.conettin.lab `
    -Server 192.168.1.10 `
    -Type SRV |
    Select-Object Name, NameTarget, Port

# 9. Ubuntu01 Connectivity
Write-Host "`n[9] Ubuntu01 Connectivity"

$UbuntuTest = Test-Connection `
    -ComputerName 192.168.1.13 `
    -Count 2 `
    -Quiet

Write-Host "Ubuntu01 reachable: $UbuntuTest"

Write-Host "`n========================================="
Write-Host " Validation Completed"
Write-Host "========================================="