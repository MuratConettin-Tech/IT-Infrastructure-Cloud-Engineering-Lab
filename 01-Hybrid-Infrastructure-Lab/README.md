<─── Back to Main Repository:
[IT Infrastructure Cloud Engineering Lab](../README.md)

# 01-Hybrid-Infrastructure-Lab

## Prerequisites

Before starting this lab:

- Basic knowledge of networking (IP, DNS)
- Basic Windows / Linux usage
- Hyper-V enabled on host machine
- Minimum 16GB RAM recommended

_______________________________________________________________

## What You Will Build

This lab builds the foundation for a small enterprise-style hybrid infrastructure environment consisting of:

- Microsoft Hyper-V virtualization
- Windows Server 2025
- Active Directory Domain Services
- Active Directory-integrated DNS
- Ubuntu Server
- Static IPv4 networking
- SSH remote administration
- Windows and Linux connectivity
- PowerShell infrastructure validation
- Bash infrastructure validation
- Infrastructure troubleshooting
- Technical documentation
- Architecture documentation
- Reusable configuration examples

This environment provides the local infrastructure foundation for later projects in the main engineering roadmap, including:

- PowerShell infrastructure automation
- Microsoft Azure
- Terraform
- Docker
- Kubernetes
- Database and SQL engineering
- CI/CD
- Monitoring and observability
- SRE and reliability engineering

_______________________________________________________________

## Overview

This project is the foundation of my infrastructure engineering lab.

The objective is to build a small enterprise-style hybrid infrastructure environment using virtualization, Windows Server, Linux, networking and basic automation technologies.

The environment starts as a local Hyper-V infrastructure and will gradually evolve through the separate projects defined in the main repository.

This first project focuses on establishing a stable local infrastructure foundation before introducing advanced automation, cloud platforms, Infrastructure as Code, containers, orchestration, databases, CI/CD and SRE practices.

_______________________________________________________________

## Objectives

- Build a structured infrastructure lab environment
- Deploy Windows Server and Linux virtual machines
- Configure Hyper-V virtual networking
- Implement static IPv4 addressing
- Implement Active Directory Domain Services
- Configure Active Directory-integrated DNS
- Establish Windows ↔ Linux connectivity
- Configure Linux remote administration using SSH
- Troubleshoot network and DNS problems
- Validate Active Directory service discovery
- Automate infrastructure validation using PowerShell
- Automate Linux infrastructure validation using Bash
- Document architecture and infrastructure configuration
- Document troubleshooting and lessons learned
- Prepare a stable infrastructure foundation for later projects

_______________________________________________________________

## Current Architecture

                    Local Network
                         │
                  192.168.1.1
                     Gateway
                         │
                         │
               Windows 10 Pro Host
                         │
                       Hyper-V
                         │
               Hyper-V Virtual Switch
                         │
              ┌──────────┴──────────┐
              │                     │
            DC01                 Ubuntu01
       Windows Server 2025      Ubuntu Server
        192.168.1.10/24        192.168.1.13/24
              │                     │
         AD DS + DNS                SSH
              │                     │
              └──── Internal DNS ───┘
                   192.168.1.10

### DC01

Hostname        : DC01
Operating System: Windows Server 2025
IPv4 Address    : 192.168.1.10/24
Default Gateway : 192.168.1.1
DNS Server      : 192.168.1.10
Domain          : Conettin.lab
NetBIOS         : CONETTIN
Roles           : AD DS / DNS

### Ubuntu01

Hostname        : Ubuntu01
Operating System: Ubuntu Server
Interface       : eth0
IPv4 Address    : 192.168.1.13/24
Default Gateway : 192.168.1.1
DNS Server      : 192.168.1.10
Remote Access   : SSH

_______________________________________________________________

## Target architecture:

                         Microsoft Azure
                               │
                          Azure VNet
                               │
                      Hybrid Connectivity
                               │
                ┌──────────────┴──────────────┐
                │                             │
           On-Premises                    Azure VM
                │
              Hyper-V
                │
         ┌──────┴───────┐
         │              │
       DC01          Ubuntu01
         │              │
     AD / DNS       Containers
                        │
                   Docker
                        │
                   Kubernetes

The target architecture will be implemented progressively through the separate projects defined in the main repository.


_______________________________________________________________

## Infrastructure Components

|       Component       |           Technology            |             Purpose                 |
|-----------------------|---------------------------------|-------------------------------------|
| Host                  | Windows 10 Pro                  | Hyper-V virtualization host         |
| Virtualization        | Hyper-V                         | Virtual machine platform            |
| DC01                  | Windows Server 2025             | Active Directory / DNS              |
| Ubuntu01              | Ubuntu Server                   | Linux infrastructure server         |
| Networking            | IPv4 / Hyper-V                  | Internal infrastructure connectivity|
| DNS                   | Windows DNS Server              | AD and internal name resolution     |
| Remote Administration | SSH                             | Linux remote administration         |
| Automation            | PowerShell / Bash               | Infrastructure validation           |
| Cloud                 | Microsoft Azure                 | Future hybrid cloud infrastructure  |
| IaC                   | Terraform / Bicep               | Future infrastructure automation    |
| Containers            | Docker                          | Future application containerization |
| Platform              | Kubernetes                      | Future container orchestration      |
| Database              | SQL Server / PostgreSQL         | Future database and SQL engineering |
| CI/CD                 | GitHub Actions                  | Future deployment automation        |
| Monitoring            | Azure Monitor/Prometheus/Grafana| Future observability                |


_______________________________________________________________

## Implementation Roadmap

### Phase 1 — Local Infrastructure

Completed:

- Enable Hyper-V
- Configure Hyper-V
- Create virtual networking
- Deploy DC01
- Deploy Ubuntu01
- Configure Windows Server
- Configure Ubuntu Server
- Configure static IPv4 networking
- Configure Active Directory Domain Services
- Create the `Conettin.lab` forest
- Promote DC01 to Domain Controller
- Configure Active Directory-integrated DNS
- Configure Ubuntu01 internal DNS
- Configure SSH
- Validate Windows ↔ Linux connectivity
- Troubleshoot IPv4 and DNS
- Validate Active Directory service discovery
- Create PowerShell infrastructure validation scripts
- Create Bash infrastructure validation script
- Document infrastructure configuration
- Document network and DNS troubleshooting
- Document final architecture
- Validate final infrastructure state

### Future Projects

The technologies below are intentionally developed as separate projects in the main repository rather than additional phases of Project 01:

02 — PowerShell Infrastructure Automation
03 — Azure Infrastructure Platform
04 — Terraform Infrastructure as Code
05 — Docker Containerization
06 — Kubernetes Platform
07 — Database & SQL Engineering
08 — CI/CD GitHub Actions
09 — Monitoring & Observability
10 — SRE & Reliability Engineering
11 — Enterprise Capstone

Project 01 provides the local infrastructure foundation required by these later projects.

_______________________________________________________________

## Implementation Summary

### Hyper-V

Microsoft Hyper-V was enabled on the Windows 10 Pro host and used as the virtualization platform for the lab.

Two primary virtual machines were deployed:

DC01
Ubuntu01

The virtual machines communicate through the Hyper-V networking environment.

### Windows Server / DC01

Windows Server 2025 was deployed and configured as the primary Windows infrastructure server.

The server was renamed:

DC01

Final network configuration:

IPv4 Address    : 192.168.1.10/24
Default Gateway : 192.168.1.1
DNS Server      : 192.168.1.10


DC01 provides:

- Active Directory Domain Services
- Domain Controller services
- DNS Server
- LDAP service discovery
- Kerberos service discovery
- Global Catalog
- Internal DNS resolution

### Active Directory

The Active Directory environment consists of:

Forest            : Conettin.lab
Domain            : Conettin.lab
NetBIOS           : CONETTIN
Domain Controller : DC01

Active Directory was validated using PowerShell commands including:

powershell
Get-ADDomain
Get-ADForest
Get-ADDomainController
Get-Service NTDS
Get-Service DNS

### DNS

DC01 provides the internal DNS infrastructure for the lab.

DNS zones and Active Directory DNS records were inspected using commands including:

powershell
Get-DnsServerZone
Get-DnsServerResourceRecord -ZoneName "Conettin.lab"

Validated DNS records included:

- A
- NS
- SOA
- LDAP SRV
- Kerberos SRV
- Global Catalog SRV

Active Directory LDAP service discovery was validated using:

_ldap._tcp.dc._msdcs.conettin.lab

The LDAP service record correctly identifies:

dc01.conettin.lab
Port 389

### Ubuntu Server

Ubuntu01 was deployed as the Linux infrastructure server.

Final configuration:

IPv4 Address    : 192.168.1.13/24
Default Gateway : 192.168.1.1
DNS Server      : 192.168.1.10
SSH             : Enabled

Network configuration is managed using Netplan.

The reusable Netplan configuration is stored under:

configs/ubuntu01/

_______________________________________________________________

## Troubleshooting Case Study

One of the main technical exercises in this lab involved diagnosing an apparent Active Directory and DNS connectivity problem.

### Initial Findings

Active Directory Domain Services and DNS Server were successfully installed.

Active Directory-integrated DNS contained the expected service records, including:

- NS
- SOA
- LDAP SRV
- Kerberos SRV
- Global Catalog SRV

However, network and DNS client configuration problems prevented the infrastructure from operating correctly.

### Symptoms

DC01 reported an APIPA IPv4 address instead of the required static infrastructure address.

Ubuntu01 was also configured to use public DNS resolvers rather than the internal Active Directory DNS server.

As a result, Ubuntu01 could not correctly resolve the private `Conettin.lab` namespace.

### Investigation

The issue was investigated from the network layer upward:

Network Adapter
      ↓
Interface State
      ↓
IPv4 Address
      ↓
Subnet
      ↓
Default Gateway
      ↓
Routing
      ↓
Peer Connectivity
      ↓
DNS Client
      ↓
DNS Server
      ↓
DNS Records
      ↓
Active Directory Service Discovery

Windows networking was investigated using commands including:

powershell
Get-NetAdapter
Get-NetIPConfiguration
Get-NetIPInterface
Get-NetIPAddress
Get-NetRoute
Get-DnsClientServerAddress

Linux networking was investigated using:

bash
ip addr
ip route
ip neigh show
resolvectl status

### Root Cause

The issue involved two configuration problems:

1. DC01 did not have the required static IPv4 configuration and had received an APIPA address.
2. Ubuntu01 was configured to use public DNS resolvers, which cannot resolve the private `Conettin.lab` Active Directory namespace.

### Resolution

DC01 was configured with:

IPv4 Address    : 192.168.1.10/24
Default Gateway : 192.168.1.1
DNS Server      : 192.168.1.10

Ubuntu01 retained:

IPv4 Address    : 192.168.1.13/24
Default Gateway : 192.168.1.1

Ubuntu01 DNS was changed to:

192.168.1.10

The Ubuntu Netplan configuration was backed up before modification.

The updated configuration was validated and applied using:

bash
sudo netplan generate
sudo netplan apply

### Final Validation

DC01 networking was validated using:

powershell
Get-NetIPAddress
Get-NetRoute
Get-DnsClientServerAddress


Connectivity was validated using:

powershell
ping 192.168.1.1
ping 192.168.1.13

DC01 DNS resolution was validated using:

powershell
Resolve-DnsName dc01.conettin.lab -Server 192.168.1.10

Active Directory LDAP service discovery was validated using:

powershell
Resolve-DnsName _ldap._tcp.dc._msdcs.conettin.lab `
  -Type SRV `
  -Server 192.168.1.10

Ubuntu01 DNS configuration was validated using:

bash
resolvectl status

Internal DNS resolution was tested using:

bash
nslookup dc01.conettin.lab

Hostname-based connectivity was tested using:

bash
ping -c 4 dc01.conettin.lab

Final network and DNS validation completed successfully.

_______________________________________________________________

## Infrastructure Validation and Automation

The project includes small PowerShell and Bash scripts for repeatable infrastructure validation.

These scripts are part of Project 01 because they validate the infrastructure built in this lab.

More advanced PowerShell automation is developed separately in Project 02.

### PowerShell

scripts/powershell/
├── 01-Test-ADInfrastructure.ps1
└── 02-Test-ADDS-DNS.ps1

#### 01-Test-ADInfrastructure.ps1

Validates:

- DC01 IPv4 configuration
- Default gateway
- DNS client configuration
- Active Directory domain
- Domain Controller
- NTDS and DNS services
- DC01 DNS resolution
- LDAP SRV record
- Ubuntu01 connectivity

#### 02-Test-ADDS-DNS.ps1

Provides additional Active Directory and DNS validation:

- Active Directory domain
- Active Directory forest
- Domain Controller
- NTDS and DNS services
- DNS zones
- DNS resource records
- DC01 DNS resolution

### Bash

scripts/bash/
└── 01-Test-Network.sh

The Ubuntu01 validation script checks:

- IPv4 configuration
- Default route
- DNS configuration
- Gateway connectivity
- DC01 IP connectivity
- DC01 DNS resolution
- Internal DNS query
- SSH service status

Final Bash validation produced:

Gateway reachable: PASS
DC01 reachable: PASS
dc01.conettin.lab -> 192.168.1.10 : PASS
Internal DNS query: PASS
SSH service: RUNNING

_______________________________________________________________

## Engineering Approach

Each project follows an engineering workflow:

Problem
   ↓
Requirements
   ↓
Architecture
   ↓
Implementation
   ↓
Automation
   ↓
Testing
   ↓
Monitoring
   ↓
Documentation
   ↓
Lessons Learned

For Project 01, the practical troubleshooting workflow also demonstrated:

Identify Problem
      ↓
Inspect Network
      ↓
Identify Root Cause
      ↓
Correct Configuration
      ↓
Validate Connectivity
      ↓
Validate DNS
      ↓
Validate Services
      ↓
Automate Validation
      ↓
Document Results

_______________________________________________________________

## Project Context

This lab is part of the broader IT Infrastructure Cloud Engineering roadmap.

Related Objectives:
- Infrastructure virtualization
- Hybrid cloud foundations
- Windows Server administration
- Linux administration
- Active Directory and DNS
- Networking and troubleshooting
- Automation readiness

This project contributes to:
- PowerShell infrastructure automation
- Azure platform deployment
- Terraform Infrastructure as Code
- Docker containerization
- Kubernetes platform engineering
- Database and SQL engineering
- CI/CD
- Monitoring and observability
- SRE and reliability engineering

_______________________________________________________________

## Design Decisions

|       Decision       |                  Reason                   |         Alternative         |
|----------------------|-------------------------------------------|-----------------------------|
| Hyper-V              | Native Windows integration                | VMware                      |
| Windows Server 2025  | Microsoft server platform used for the lab| Older Windows Server        |
| Ubuntu Server        | Linux infrastructure platform             | Other Linux distributions   |
| Static IPv4          | Predictable server addressing             | DHCP                        |
| DC01 as internal DNS | Required for AD-integrated name resolution| Public DNS                  |
| Netplan              | Native Ubuntu Server network configuration| Runtime-only configuration  |
| SSH                  | Standard Linux remote administration      | Hyper-V console only        |
| PowerShell           | Windows infrastructure validation         | Manual validation           |
| Bash                 | Linux infrastructure validation           | Manual validation           |
| Markdown             | Version-controlled technical documentation| External documentation only |
| Mermaid              | Version-controlled architecture diagrams  | Image-only diagrams         |


_______________________________________________________________

## Failure Scenarios

The lab also provides a foundation for understanding infrastructure failure scenarios.

Examples include:

- Invalid or missing IPv4 configuration → loss of network connectivity
- Missing default route → inability to reach external networks
- Incorrect DNS client configuration → internal name resolution failure
- DNS Server failure → Active Directory service discovery impact
- DC01 failure → AD DS and internal DNS availability impact
- Ubuntu01 network failure → loss of Linux services and remote administration
- SSH service failure → remote Linux administration unavailable

More advanced high-availability and disaster recovery scenarios will be addressed in later projects.

_______________________________________________________________

## Documentation

Implementation details, architecture decisions, configuration notes, troubleshooting steps and relevant screenshots are documented throughout the project.

Screenshots are included selectively to demonstrate important configuration, troubleshooting and validation stages.

Markdown documentation is used as the primary technical explanation, while screenshots provide supporting implementation evidence.

### Project Structure

01-Hybrid-Infrastructure-Lab/
│
├── README.md
│
├── architecture/
│   └── 01-current-lab-topology.md
│
├── configs/
│   └── ubuntu01/
│       └── 01-netplan.yaml
│
├── docs/
│   ├── 01-hyperv-foundation.md
│   ├── 02-windows-server-dc01.md
│   ├── 03-ubuntu-server.md
│   ├── 04-networking.md
│   ├── 05-active-directory.md
│   └── 06-dns.md
│
├── scripts/
│   ├── powershell/
│   │   ├── 01-Test-ADInfrastructure.ps1
│   │   └── 02-Test-ADDS-DNS.ps1
│   │
│   └── bash/
│       └── 01-Test-Network.sh
│
└── screenshots/
    └── Implementation and validation evidence

### Documentation Files

docs/
├── 01-hyperv-foundation.md
├── 02-windows-server-dc01.md
├── 03-ubuntu-server.md
├── 04-networking.md
├── 05-active-directory.md
└── 06-dns.md

Configuration examples are stored under:

configs/

Reusable validation scripts are stored under:

scripts/

Architecture documentation is stored under:

architecture/


_______________________________________________________________

## Current Status

### Phase 1 — Local Infrastructure

**Technical implementation: COMPLETED**

Completed:

- [x] Enable Hyper-V
- [x] Configure Hyper-V virtual networking
- [x] Deploy Windows Server 2025 VM
- [x] Deploy Ubuntu Server VM
- [x] Configure DC01 static IPv4 networking
- [x] Configure Ubuntu01 static IPv4 networking
- [x] Configure default gateway and routing
- [x] Enable and validate SSH
- [x] Perform DC01 ↔ Ubuntu01 connectivity testing
- [x] Install Active Directory Domain Services
- [x] Create the `Conettin.lab` Active Directory forest
- [x] Promote DC01 to Domain Controller
- [x] Install and validate DNS Server
- [x] Validate AD DS and NTDS services
- [x] Inspect Active Directory DNS resource records
- [x] Validate LDAP and Kerberos SRV records
- [x] Inspect DNS zones
- [x] Correct DC01 IPv4 configuration
- [x] Validate DC01 DNS client configuration
- [x] Configure Ubuntu01 to use internal DNS
- [x] Validate DNS resolution between DC01 and Ubuntu01
- [x] Complete network and DNS troubleshooting
- [x] Document final Phase 1 network architecture
- [x] Create PowerShell infrastructure validation script
- [x] Create PowerShell AD DS / DNS validation script
- [x] Create Bash infrastructure validation script
- [x] Validate PowerShell infrastructure script
- [x] Validate Bash infrastructure script
- [x] Document final infrastructure configuration
- [x] Complete Phase 1 technical validation

Repository publication:

- [ ] Final repository structure review
- [ ] Add `.gitignore`
- [ ] Initialize Git repository
- [ ] Create initial commit
- [ ] Publish repository to GitHub


_______________________________________________________________

## Validation Results

|              Test                    |         Result         |
|--------------------------------------|------------------------|
| DC01 IPv4                            | 192.168.1.10/24 — PASS |
| Ubuntu01 IPv4                        | 192.168.1.13/24 — PASS |
| Default Gateway                      | 192.168.1.1 — PASS     |
| Internal DNS                         | 192.168.1.10 — PASS    |
| Active Directory Domain Services     | Operational            |
| NTDS Service                         | Running                |
| DNS Server                           | Running                |
| DNS Zones                            | Validated              |
| DC01 DNS Resolution                  | PASS                   |
| LDAP SRV Discovery                   | PASS                   |
| Kerberos SRV Records                 | Validated              |
| DC01 → Ubuntu01                      | PASS                   |
| Ubuntu01 → DC01                      | PASS                   |
| Ubuntu Internal DNS                  | PASS                   |
| SSH Service                          | Running                |
| PowerShell Infrastructure Validation | PASS                   |
| PowerShell AD DS / DNS Validation    | PASS                   |
| Bash Infrastructure Validation       | PASS                   |

_______________________________________________________________

## Lessons Learned

This project demonstrated that infrastructure troubleshooting should begin with the lowest relevant layer instead of immediately focusing on the application or service reporting the failure.

An apparent DNS or Active Directory problem may actually originate from:

Network Interface
      ↓
IP Addressing
      ↓
Subnet
      ↓
Gateway
      ↓
Routing
      ↓
DNS Client
      ↓
DNS Server
      ↓
Directory Services

The DC01 APIPA issue demonstrated the importance of validating IPv4 addressing and routing before investigating higher-level services.

The Ubuntu01 DNS issue demonstrated why systems interacting with an Active Directory namespace should use the internal DNS infrastructure rather than public DNS resolvers.

The troubleshooting process also demonstrated the importance of validating configuration changes from both sides of the infrastructure rather than assuming that a successful service installation means the complete environment is operational.

PowerShell and Bash validation scripts demonstrated how repeated manual infrastructure checks can begin to be converted into reusable automation.

Separating architecture, configuration, scripts, technical documentation and screenshots makes the project easier to understand, maintain and present as an engineering portfolio.

_______________________________________________________________

## Next Steps

Project 01 provides the local infrastructure foundation for the remaining projects in the main engineering roadmap.

The next projects are maintained separately:

02 — PowerShell Infrastructure Automation
03 — Azure Infrastructure Platform
04 — Terraform Infrastructure as Code
05 — Docker Containerization
06 — Kubernetes Platform
07 — Database & SQL Engineering
08 — CI/CD GitHub Actions
09 — Monitoring & Observability
10 — SRE & Reliability Engineering
11 — Enterprise Capstone

Project numbers define the repository structure; they do not require every lab to be completed strictly in numerical order.

After Project 01 is published to GitHub, the next practical lab can move into Docker and containerization while the broader engineering roadmap remains unchanged.