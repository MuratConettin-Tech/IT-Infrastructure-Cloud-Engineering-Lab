# 01-Get-SystemInventory.ps1
# Collects basic Windows system inventory information.

$OS = Get-CimInstance Win32_OperatingSystem
$Computer = Get-CimInstance Win32_ComputerSystem
$CPU = Get-CimInstance Win32_Processor

$IPv4 = Get-NetIPAddress -AddressFamily IPv4 |
    Where-Object {
        $_.IPAddress -notlike "127.*" -and
        $_.IPAddress -notlike "169.254.*"
    } |
    Select-Object -First 1

$Gateway = Get-NetRoute -DestinationPrefix "0.0.0.0/0" |
    Sort-Object RouteMetric |
    Select-Object -First 1

$DNS = Get-DnsClientServerAddress -AddressFamily IPv4 |
    Where-Object { $_.ServerAddresses.Count -gt 0 } |
    Select-Object -First 1

$Disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"

$Inventory = [PSCustomObject]@{
    ComputerName      = $Computer.Name
    Manufacturer      = $Computer.Manufacturer
    Model             = $Computer.Model
    OperatingSystem   = $OS.Caption
    OSVersion         = $OS.Version
    BuildNumber       = $OS.BuildNumber
    Architecture      = $OS.OSArchitecture
    CPU               = $CPU.Name
    PhysicalCores     = $CPU.NumberOfCores
    LogicalProcessors = $CPU.NumberOfLogicalProcessors
    MemoryGB          = [math]::Round($Computer.TotalPhysicalMemory / 1GB, 2)
    DiskSizeGB        = [math]::Round($Disk.Size / 1GB, 2)
    DiskFreeGB        = [math]::Round($Disk.FreeSpace / 1GB, 2)
    IPv4Address       = $IPv4.IPAddress
    DefaultGateway    = $Gateway.NextHop
    DNSServers        = ($DNS.ServerAddresses -join ", ")
    PowerShellVersion = $PSVersionTable.PSVersion.ToString()
}

$Inventory | Format-List