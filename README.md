# IT Infrastructure Cloud Engineering Lab

A hands-on infrastructure engineering portfolio focused on modern enterprise infrastructure, cloud platforms, automation, Infrastructure as Code, containers, Kubernetes, DevOps and SRE practices.

This repository contains practical projects designed to simulate real-world infrastructure engineering scenarios rather than isolated technology exercises.

_______________________________________________________________

## Prerequisites

Before starting this lab:

- Basic knowledge of networking (IP, DNS)
- Basic Windows / Linux usage
- Hyper-V enabled on host machine
- Minimum 16GB RAM recommended

_______________________________________________________________

## What You Will Build

By completing this engineering roadmap, the environment will include:

- Active Directory domain
- Active Directory-integrated DNS
- Windows Server infrastructure
- Linux infrastructure
- Internal virtual networking
- PowerShell and Bash automation
- Microsoft Azure infrastructure
- Infrastructure as Code
- Docker container workloads
- Kubernetes platform
- Database and SQL labs
- CI/CD pipelines
- Monitoring and observability
- SRE and reliability practices
- Enterprise-style hybrid infrastructure

_______________________________________________________________

## Objectives

- Modernize and extend enterprise infrastructure skills
- Build practical Cloud and Hybrid Cloud experience
- Automate infrastructure and operational tasks
- Manage infrastructure using Infrastructure as Code
- Design and operate containerized workloads
- Build Kubernetes-based platforms
- Develop practical database and SQL administration skills
- Implement CI/CD automation
- Apply monitoring, observability and SRE practices
- Document architecture, implementation and operational decisions

_______________________________________________________________

## Technology Areas

### Infrastructure & Virtualization

- Hyper-V
- Windows Server
- Linux
- Active Directory / DNS
- Virtual Networking

### Cloud

- Microsoft Azure
- Azure Virtual Network
- Azure Compute
- Azure Storage
- Microsoft Entra ID
- Azure Monitor
- Azure Arc
- Hybrid Cloud

### Automation

- PowerShell
- Bash
- REST APIs
- Infrastructure Automation

### Infrastructure as Code

- Terraform
- Azure Bicep
- Azure Resource Manager (ARM) concepts

### Containers

- Docker
- Docker Compose
- Container Registry

### Kubernetes

- Kubernetes Architecture
- Deployments
- Services
- ConfigMaps
- Secrets
- Ingress
- Persistent Volumes
- Helm
- Kubernetes Networking
- High Availability

### Databases

- SQL fundamentals
- Relational database concepts
- Microsoft SQL Server
- PostgreSQL
- Database connectivity
- Backup and restore concepts
- Database security
- Performance and monitoring fundamentals

### DevOps

- Git
- GitHub
- GitHub Actions
- CI/CD
- Automated Testing
- Container Build & Deployment

### SRE & Operations

- Monitoring
- Logging
- Observability
- Metrics
- Alerting
- SLI / SLO / SLA
- Availability
- Reliability
- Incident Management
- RTO / RPO
- Disaster Recovery
- Capacity Planning

_______________________________________________________________

## Architecture Vision

This repository evolves towards a fully integrated enterprise-style platform:

On-Premises
     ↓
Hybrid Infrastructure
     ↓
Cloud
     ↓
Automation / IaC
     ↓
Containers
     ↓
Kubernetes
     ↓
Data Services
     ↓
CI/CD
     ↓
Observability
     ↓
SRE


The final architecture will combine:

- Hybrid networking
- Identity and DNS
- Infrastructure automation
- Infrastructure as Code
- Container orchestration
- Database services
- CI/CD automation
- Monitoring and observability
- Reliability engineering
_______________________________________________________________

## Project Roadmap

| #  | Project                             | Focus Area                | Status       |
|----|-------------------------------------|---------------------------|--------------|
| 01 | Hybrid Infrastructure Lab           | On-Prem Infrastructure    | In Progress  |
| 02 | PowerShell Infrastructure Automation| Automation                | Planned      |
| 03 | Azure Infrastructure Platform       | Cloud                     | Planned      |
| 04 | Terraform Infrastructure as Code    | Infrastructure as Code    | Planned      |
| 05 | Docker Containerization             | Containers                | Planned      |
| 06 | Kubernetes Platform                 | Orchestration             | Planned      |
| 07 | Database & SQL Engineering          | Data / Database           | Planned      |
| 08 | CI/CD GitHub Actions                | DevOps                    | Planned      |
| 09 | Monitoring & Observability          | SRE                       | Planned      |
| 10 | SRE & Reliability Engineering       | SRE                       | Planned      |
| 11 | Enterprise Capstone                 | End-to-End Platform       | Planned      |


_______________________________________________________________

## Repository Structure

IT-Infrastructure-Cloud-Engineering-Lab/
│
├── 01-Hybrid-Infrastructure-Lab/
├── 02-PowerShell-Infrastructure-Automation/
├── 03-Azure-Infrastructure-Platform/
├── 04-Terraform-Infrastructure-as-Code/
├── 05-Docker-Containerization/
├── 06-Kubernetes-Platform/
├── 07-Database-SQL-Engineering/
├── 08-CI-CD-GitHub-Actions/
├── 09-Monitoring-Observability/
├── 10-SRE-Reliability/
└── 11-Enterprise-Capstone/
_______________________________________________________________

Each project contains its own documentation, architecture, configuration examples, scripts and implementation evidence where appropriate.

______________________________________________________________

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

Projects focus on understanding why a technology is used, how it integrates with other infrastructure components, and how it can be operated reliably in production.

_______________________________________________________________

## Documentation Standard

Each project may contain:

- Architecture diagrams
- Infrastructure configuration
- Automation scripts
- Infrastructure as Code
- Deployment manifests
- Screenshots where useful
- Testing results
- Monitoring information
- Operational considerations
- Troubleshooting cases
- Lessons learned

Screenshots are included only when they provide useful evidence of implementation.

Documentation should explain the implementation and engineering decisions rather than relying only on screenshots.


_______________________________________________________________

## Key Capabilities

The completed portfolio is intended to demonstrate practical capability in:

- Designing hybrid infrastructure environments
- Managing Windows Server and Linux systems
- Implementing Active Directory and DNS
- Troubleshooting infrastructure and networking
- Automating infrastructure using PowerShell and Bash
- Deploying and managing Azure infrastructure
- Managing infrastructure using Terraform and Bicep
- Building Docker-based workloads
- Building and operating Kubernetes platforms
- Working with relational databases and SQL
- Implementing CI/CD pipelines with GitHub Actions
- Implementing monitoring and observability
- Applying SRE practices for reliability and scalability

_______________________________________________________________

## Engineering Goals

By completing this roadmap, the objective is to demonstrate practical capability across:

Infrastructure
      ↓
Cloud
      ↓
Automation
      ↓
Infrastructure as Code
      ↓
Containers
      ↓
Kubernetes
      ↓
Databases
      ↓
CI/CD
      ↓
Observability
      ↓
SRE

The final goal is to combine these technologies into an integrated enterprise-style platform rather than treating each technology as an isolated subject.
_______________________________________________________________

## Current Progress

### Project 01 — Hybrid Infrastructure Lab

Current environment:

DC01
├── Windows Server 2025
├── 192.168.1.10/24
├── Active Directory Domain Services
├── DNS Server
└── Conettin.lab

Ubuntu01
├── Ubuntu Server
├── 192.168.1.13/24
├── DNS → 192.168.1.10
└── SSH

Completed:

- Hyper-V infrastructure
- Windows Server deployment
- Ubuntu Server deployment
- Static IPv4 networking
- Active Directory Domain Services
- Active Directory-integrated DNS
- Internal DNS resolution
- Windows ↔ Linux connectivity
- SSH remote administration
- Network and DNS troubleshooting
- PowerShell validation scripts
- Bash validation script
- Technical documentation
- Architecture documentation
- Configuration documentation

Final repository validation and GitHub publication are in progress.

_______________________________________________________________

## Status

This repository is continuously evolving as new infrastructure projects are designed, implemented, tested and documented.

Current focus:

Project 01
Hybrid Infrastructure Lab
        ↓
Final Validation
        ↓
Git / GitHub
        ↓
Project 02+