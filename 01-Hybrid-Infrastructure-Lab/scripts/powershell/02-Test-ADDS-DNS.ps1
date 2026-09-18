```powershell
# Test-ADDS-DNS.ps1
# Basic validation of Active Directory and DNS services.

Write-Host "=== Active Directory Domain ==="
Get-ADDomain

Write-Host "`n=== Active Directory Forest ==="
Get-ADForest

Write-Host "`n=== Domain Controller ==="
Get-ADDomainController

Write-Host "`n=== AD DS and DNS Services ==="
Get-Service NTDS, DNS

Write-Host "`n=== DNS Zones ==="
Get-DnsServerZone

Write-Host "`n=== Domain DNS Records ==="
Get-DnsServerResourceRecord -ZoneName "Conettin.lab"

Write-Host "`n=== DC DNS Resolution ==="
Resolve-DnsName dc01.conettin.lab -ErrorAction Continue