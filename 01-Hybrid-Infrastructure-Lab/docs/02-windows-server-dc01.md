# Windows Server DC01 Deployment

## Objective

Deploy Windows Server 2025 as the primary Windows infrastructure
server and prepare it for Active Directory Domain Services and DNS.

## Environment

- Virtual Machine: DC01
- Operating System: Windows Server 2025 Standard Evaluation
- Hypervisor: Microsoft Hyper-V
- Planned Role: Domain Controller
- Planned Services:
  - Active Directory Domain Services
  - DNS Server

## Virtual Machine Deployment

DC01 was created as a virtual machine on the Hyper-V host.

The virtual machine was connected to the Hyper-V virtual network and
prepared for Windows Server installation.

## Windows Server Installation

Windows Server 2025 installation was performed inside the DC01
virtual machine.

The deployment process included:

1. Booting the VM from the Windows Server installation media.
2. Starting Windows Setup.
3. Selecting the Windows Server edition.
4. Configuring the installation disk.
5. Installing the operating system.
6. Completing the initial server setup.
7. Performing the first login.

After installation, Windows Server was ready for infrastructure
configuration.

## Server Role

DC01 was designed as the core Windows infrastructure server for the
lab.

Its responsibilities include:

DC01
 │
 ├── Active Directory Domain Services
 ├── Domain Controller
 ├── DNS Server
 ├── LDAP
 ├── Kerberos
 └── Internal DNS

The Active Directory roles were installed later in the lab after
the initial operating system and network configuration stages.

## Server Naming

Before promoting the server to a Domain Controller, the Windows
Server hostname was changed to:

DC01

Using a clear server naming convention makes infrastructure roles
easier to identify and manage.

In this lab:

DC01
│ │
│ └── 01 = First server of this role
│
└──── DC = Domain Controller

## Network Dependency

DC01 requires stable network configuration because Active Directory
and DNS depend on consistent server addressing.

During later validation, the network configuration required
additional troubleshooting before the Active Directory DNS
environment became fully operational.

The final working network configuration became:

IPv4 Address    : 192.168.1.10/24
Default Gateway : 192.168.1.1
DNS Server      : 192.168.1.10

Detailed network troubleshooting is documented separately in:

docs/04-networking.md

DNS troubleshooting is documented in:

docs/06-dns.md

## Validation

After the operating system deployment, DC01 successfully booted and
was available for further infrastructure configuration.

Later validation confirmed that the server could operate with:

- Static IPv4 networking
- Default gateway connectivity
- Ubuntu01 connectivity
- Active Directory Domain Services
- Internal DNS

## Result

Windows Server 2025 was successfully deployed as DC01.

The server became the foundation for the Active Directory and DNS
infrastructure implemented in later stages of the lab.

## Lessons Learned

Infrastructure server deployment should separate the following
layers:

Virtual Machine
      ↓
Operating System
      ↓
Network Configuration
      ↓
Server Identity
      ↓
Infrastructure Roles
      ↓
Service Validation

A Domain Controller should use predictable network configuration
because identity and DNS services depend on stable addressing.

## Next Step

Deploy Ubuntu01 and establish network connectivity between the
Windows and Linux infrastructure.