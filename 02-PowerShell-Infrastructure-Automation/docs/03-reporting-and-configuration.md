# Reporting and Configuration

## Objective

Extend the infrastructure automation workflow with centralized
configuration and automated report generation.

---

## Centralized Configuration

Infrastructure information is stored in:

```text
configs/infrastructure.json
```

The configuration contains:

- Domain name
- Domain Controller name
- Domain Controller FQDN
- Domain Controller IPv4 address
- Ubuntu server name
- Ubuntu server IPv4 address
- Default gateway

Example:

```json
{
    "domain": "conettin.lab",
    "domainController": {
        "name": "dc01",
        "fqdn": "dc01.conettin.lab",
        "ip": "192.168.1.10"
    },
    "ubuntuServer": {
        "name": "ubuntu01",
        "ip": "192.168.1.13"
    },
    "network": {
        "gateway": "192.168.1.1"
    }
}
```

PowerShell can load the configuration using:

```powershell
$Config = Get-Content .\configs\infrastructure.json |
    ConvertFrom-Json
```

Configuration values can then be accessed as object properties.

Example:

```powershell
$Config.domainController.ip
```

Result:

```text
192.168.1.10
```

Separating configuration from automation logic improves maintainability and
makes scripts easier to reuse in different environments.

---

## Infrastructure Reporting

Script:

```text
scripts/reporting/04-New-InfrastructureReport.ps1
```

The reporting script performs infrastructure health checks and converts the
results into structured PowerShell objects.

The following tests are included:

- Default gateway connectivity
- DC01 connectivity
- Ubuntu01 connectivity
- Internal DNS resolution

The results contain:

- Timestamp
- Test
- Target
- Status

---

## CSV Reporting

PowerShell exports the results using:

```powershell
Export-Csv
```

Reports are stored under:

```text
reports/
```

Example:

```text
Infrastructure-Health-20260922-160330.csv
```

CSV output can be used for additional analysis, historical comparison or
integration with other tools.

---

## HTML Reporting

The same PowerShell objects are converted into an HTML report using:

```powershell
ConvertTo-Html
```

Example output:

```text
Infrastructure-Health-20260922-160330.html
```

### Report Execution

![Infrastructure Report Execution](../screenshots/04-Infrastructure-Report-Execution.PNG)

### HTML Report

![Infrastructure Health HTML Report](../screenshots/05-Infrastructure-Health-HTML-Report.PNG)

The generated HTML report provides a human-readable infrastructure health
summary.

---

## Automation Flow

```text
Infrastructure
      |
      v
PowerShell Validation
      |
      v
PSCustomObject
      |
      +----------------+
      |                |
      v                v
     CSV              HTML
      |                |
      +-------+--------+
              |
              v
           Reports
```

---

## Result

The project demonstrates an end-to-end infrastructure automation workflow:

```text
Discovery
   |
   v
Validation
   |
   v
Health Checks
   |
   v
Structured Results
   |
   v
CSV / HTML Reporting
```

Infrastructure configuration is also separated from automation logic using
a JSON configuration file, providing a foundation for more reusable
automation.