# Active Directory Domain Services

## Objective

Deploy Active Directory Domain Services on DC01, create the
`Conettin.lab` forest and domain, promote DC01 to a Domain
Controller, and validate the core Active Directory services.

## Environment

- Server: DC01
- Operating System: Windows Server 2025 Standard Evaluation
- Active Directory Domain: `Conettin.lab`
- NetBIOS Name: `CONETTIN`
- Domain Controller: `DC01`
- DNS Server: DC01

## Server Preparation

Windows Server 2025 was deployed on Hyper-V and prepared to become
the first Domain Controller in the lab.

The server was renamed to:

DC01

A clear server name was selected because the system would provide
the Domain Controller and DNS roles for the environment.

## Active Directory Domain Services Installation

The Active Directory Domain Services role was installed on DC01.

After the AD DS binaries and management components were installed,
DC01 was prepared for Domain Controller promotion.

At this stage, installing the AD DS role alone did not make the
server a Domain Controller.

The next step was to promote the server and create the Active
Directory forest.

## Domain Controller Promotion

DC01 was promoted to the first Domain Controller in a new Active
Directory forest.

The new forest root domain was configured as:

Conettin.lab

Because this was the first Domain Controller, the deployment created
both:

Forest: Conettin.lab
Domain: Conettin.lab

DC01 became the first Domain Controller for the new environment.

## Domain Controller Options

During Domain Controller promotion, the required Domain Controller
options were reviewed.

DC01 was configured to provide the services required by the new
Active Directory environment, including DNS integration.

The Directory Services Restore Mode (DSRM) configuration was also
completed during the promotion process.

## NetBIOS Name

The Active Directory NetBIOS domain name was configured as:

CONETTIN

This provides the legacy-compatible short domain name associated
with the Active Directory domain.

The environment therefore uses:

DNS Domain Name : Conettin.lab
NetBIOS Name    : CONETTIN

## Prerequisite Check

Before the Domain Controller promotion was executed, the Active
Directory configuration wizard performed prerequisite validation.

This stage checked whether the server was ready for:

- Active Directory Domain Services
- Forest creation
- Domain creation
- DNS integration
- Domain Controller promotion

The prerequisite stage was reviewed before continuing with the
installation.

## Active Directory Installation

After the prerequisite stage, the Domain Controller promotion was
completed.

DC01 was promoted from a standalone Windows Server into a Domain
Controller.

The server then provided the core Active Directory infrastructure
for the lab.

The logical hierarchy became:

Conettin.lab
      │
      └── DC01
           │
           ├── Active Directory Domain Services
           ├── Domain Controller
           └── DNS Server

## Domain Validation

After installation, the Active Directory domain was inspected using:

powershell
Get-ADDomain

The command confirmed important domain information including:

DistinguishedName : DC=Conettin,DC=lab
DNSRoot           : Conettin.lab
Name              : Conettin
NetBIOSName       : CONETTIN
PDCEmulator       : DC01.Conettin.lab
RIDMaster         : DC01.Conettin.lab

This confirmed that the `Conettin.lab` Active Directory domain was
successfully created.

## Forest Validation

The Active Directory forest was inspected using:

powershell
Get-ADForest

This validated the forest configuration associated with the
`Conettin.lab` environment.

The lab currently contains a single Active Directory forest and
domain.

Forest
└── Conettin.lab
      │
      └── DC01

## Domain Controller Validation

The Domain Controller configuration was inspected using:

powershell
Get-ADDomainController

The output confirmed:

HostName        : DC01.Conettin.lab
Domain          : Conettin.lab
Forest          : Conettin.lab
Name            : DC01
Site            : Default-First-Site-Name
OperatingSystem : Windows Server 2025 Standard Evaluation

DC01 was also identified as a Global Catalog server.

This confirmed that DC01 was operating as the Domain Controller for
the lab.

## Active Directory Services Validation

The DNS Server service was inspected using:

powershell
Get-Service DNS

The service reported:

Status : Running
Name   : DNS

Active Directory Domain Services was inspected using:

powershell
Get-Service NTDS

The service reported:

Status : Running
Name   : NTDS

Both core services were therefore operational.

## DNS Integration

Active Directory relies heavily on DNS for locating Domain
Controllers and directory services.

The Active Directory-integrated DNS records were inspected using:

powershell
Get-DnsServerResourceRecord -ZoneName "Conettin.lab"

The zone contained records including:

- NS
- SOA
- LDAP SRV
- Kerberos SRV
- Global Catalog SRV

Examples of Active Directory service discovery records included:

_ldap._tcp
_kerberos._tcp
_gc._tcp
_kpasswd._tcp

These SRV records allow systems to locate Active Directory services
instead of requiring clients to know the server addresses manually.

For example:

Client
  │
  │ "Where is an LDAP service for Conettin.lab?"
  ▼
DNS SRV Query
  │
  ▼
_ldap._tcp.dc._msdcs.conettin.lab
  │
  ▼
DC01.Conettin.lab : 389

## DNS Zone Validation

DNS zones associated with the Active Directory environment were
inspected using:

powershell
Get-DnsServerZone

This confirmed that the DNS zones required by Active Directory were
present on DC01.

## Initial Validation Issue

During the initial Active Directory validation, DC01 reported an
unexpected APIPA IPv4 address:

169.254.75.165

This was visible during Domain Controller inspection.

DNS queries also initially failed to resolve
`dc01.conettin.lab` correctly.

For example:

powershell
nslookup dc01.conettin.lab

did not initially return the expected working IPv4 configuration.

However, Active Directory service records were present in DNS.

This indicated that the AD DS installation itself had succeeded, but
the underlying network and DNS client configuration required further
investigation.

## Network and DNS Correction

The problem was investigated separately at the network and DNS
layers.

DC01 was eventually configured with:

IPv4 Address    : 192.168.1.10/24
Default Gateway : 192.168.1.1
DNS Server      : 192.168.1.10

Detailed troubleshooting is documented in:

docs/04-networking.md
docs/06-dns.md

After the network correction, the Domain Controller DNS records
registered with the correct IPv4 address.

## Final Active Directory DNS Validation

The DC01 A record was validated using:

powershell
Get-DnsServerResourceRecord -ZoneName "Conettin.lab" -RRType A

The record correctly pointed to:

dc01.conettin.lab → 192.168.1.10

DNS resolution was validated using:

powershell
Resolve-DnsName dc01.conettin.lab -Server 192.168.1.10

Active Directory LDAP service discovery was validated using:

powershell
Resolve-DnsName _ldap._tcp.dc._msdcs.conettin.lab `
  -Type SRV `
  -Server 192.168.1.10

The SRV query successfully returned:

NameTarget : dc01.conettin.lab
Priority   : 0
Weight     : 100
Port       : 389
IPv4       : 192.168.1.10

This confirmed that Active Directory service discovery was
operational.

## Final State

The Active Directory infrastructure currently consists of:

Conettin.lab
      │
      └── DC01
          192.168.1.10
              │
              ├── AD DS
              ├── DNS
              ├── LDAP : 389
              ├── Kerberos
              └── Global Catalog

Core validation status:

| Component               | Status      |
|-------------------------|-------------|
| Active Directory Forest | Operational |
| `Conettin.lab` Domain   | Operational |
| DC01 Domain Controller  | Operational |
| NTDS Service            | Running     |
| DNS Service             | Running     |
| DNS A Record            | Operational |
| LDAP SRV Discovery      | Operational |
| Internal DNS Resolution | Operational |

## Result

DC01 was successfully promoted to the first Domain Controller of the
`Conettin.lab` Active Directory forest.

Active Directory Domain Services and DNS are operational, and the
Domain Controller can be discovered through Active Directory DNS
service records.

## Lessons Learned

Installing the Active Directory Domain Services role and promoting a
server to a Domain Controller are separate stages.

The deployment flow used in this lab was:

Windows Server
      ↓
Server Naming
      ↓
AD DS Role Installation
      ↓
New Forest
      ↓
Domain Configuration
      ↓
DC Options
      ↓
NetBIOS Configuration
      ↓
Prerequisite Check
      ↓
DC Promotion
      ↓
AD Validation
      ↓
DNS Validation

Active Directory is strongly dependent on DNS.

A successful AD DS installation does not guarantee that client
connectivity and name resolution are correctly configured.

Infrastructure validation should therefore separate:

AD DS Service Health
        ↓
DNS Service Health
        ↓
Network Connectivity
        ↓
DNS Resolution
        ↓
AD Service Discovery

This separation was important in this lab because Active Directory
and its DNS records existed while DC01 still had an incorrect IPv4
network configuration.

## Next Step

Automate infrastructure validation and prepare the Linux server for
future container and cloud engineering workloads.