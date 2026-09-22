# 04-New-InfrastructureReport.ps1
# Generates infrastructure health reports in CSV and HTML formats.

$ReportPath = ".\reports"

if (-not (Test-Path $ReportPath)) {
    New-Item -ItemType Directory -Path $ReportPath | Out-Null
}

$Targets = @(
    @{
        Test   = "Default Gateway"
        Target = "192.168.1.1"
        Type   = "Ping"
    },
    @{
        Test   = "DC01 Connectivity"
        Target = "192.168.1.10"
        Type   = "Ping"
    },
    @{
        Test   = "Ubuntu01 Connectivity"
        Target = "192.168.1.13"
        Type   = "Ping"
    },
    @{
        Test   = "Internal DNS"
        Target = "dc01.conettin.lab"
        Type   = "DNS"
    }
)

$Results = foreach ($Item in $Targets) {

    if ($Item.Type -eq "Ping") {

        $Success = Test-Connection `
            -ComputerName $Item.Target `
            -Count 2 `
            -Quiet

    }
    elseif ($Item.Type -eq "DNS") {

        try {
            Resolve-DnsName `
                $Item.Target `
                -Server 192.168.1.10 `
                -ErrorAction Stop | Out-Null

            $Success = $true
        }
        catch {
            $Success = $false
        }
    }

    [PSCustomObject]@{
        Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Test      = $Item.Test
        Target    = $Item.Target
        Status    = if ($Success) { "PASS" } else { "FAIL" }
    }
}

$Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"

$CSVFile = "$ReportPath\Infrastructure-Health-$Timestamp.csv"
$HTMLFile = "$ReportPath\Infrastructure-Health-$Timestamp.html"

$Results |
    Export-Csv `
        -Path $CSVFile `
        -NoTypeInformation `
        -Encoding UTF8

$Results |
    ConvertTo-Html `
        -Title "Infrastructure Health Report" `
        -PreContent "<h1>Infrastructure Health Report</h1><p>Generated: $(Get-Date)</p>" |
    Out-File `
        -FilePath $HTMLFile `
        -Encoding UTF8

Write-Host ""
Write-Host "========================================"
Write-Host " Infrastructure Report Completed"
Write-Host "========================================"
Write-Host ""

$Results | Format-Table -AutoSize

Write-Host ""
Write-Host "CSV Report : $CSVFile"
Write-Host "HTML Report: $HTMLFile"