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

By the end of this lab, you will have:

- Active Directory domain
- Linux server running Docker
- Internal virtual network
- Hybrid-ready infrastructure base

_______________________________________________________________

## Overview

This project is the foundation of my infrastructure engineering lab.

The objective is to build a small enterprise-style hybrid infrastructure environment using virtualization, Windows Server, Linux, networking, automation and cloud technologies.

The environment will gradually evolve from a local Hyper-V infrastructure into a hybrid cloud architecture integrated with Microsoft Azure.

_______________________________________________________________

## Objectives

* Build a structured infrastructure lab environment
* Deploy Windows Server and Linux virtual machines
* Configure virtual networking
* Implement Active Directory and DNS
* Automate infrastructure administration using PowerShell
* Extend the environment into Microsoft Azure
* Prepare the platform for Docker and Kubernetes
* Introduce Infrastructure as Code with Terraform and Bicep
* Apply monitoring and SRE principles

_______________________________________________________________

## Architecture

### Initial architecture:

Windows 10 Pro Host
        │
      Hyper-V
        │
   ┌────┴─────┐
   │          │
  DC01      Ubuntu01
   │          │
 AD / DNS   Docker

### Target architecture:

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
        ┌───────┴────────┐
        │                │
       DC01           Ubuntu01
        │                │
    AD / DNS       Docker / Kubernetes


_______________________________________________________________

## Infrastructure Components

Component	Technology				Purpose
Host		Windows 10 Pro				Hyper-V virtualization host
Virtualization	Hyper-V					Virtual machine platform
DC01		Windows Server 2025			Active Directory / DNS
Ubuntu01	Ubuntu Server				Linux / Docker / Kubernetes
Cloud		Microsoft Azure				Hybrid cloud infrastructure
IaC		Terraform / Bicep			Infrastructure automation
Containers	Docker					Application containerization
Platform	Kubernetes				Container orchestration
CI/CD		GitHub Actions				Automated deployment
Monitoring	Azure Monitor / Prometheus / Grafana	Observability


_______________________________________________________________

## Implementation Phases

### Phase 1 — Local Infrastructure

* Enabled Hyper-V on host machine
* Configure Hyper-V
* Create virtual network
* Deploy DC01
* Configure Windows Server
* Configure Active Directory
* Configure DNS
* Deploy Ubuntu01

### Phase 2 — Automation

* PowerShell infrastructure scripts
* Server health checks
* Inventory collection
* Remote administration
* Reporting

### Phase 3 — Azure Integration

* Azure Resource Group
* Virtual Network
* Subnets
* Network Security Groups
* Virtual Machines
* Storage
* Monitoring
* Hybrid connectivity

### Phase 4 — Infrastructure as Code

* Terraform
* Bicep
* Reproducible infrastructure
* Automated deployment and destruction

### Phase 5 — Containers

* Docker
* Docker Compose
* Container Registry
* Redis
* Application containerization

### Phase 6 — Kubernetes

* Kubernetes cluster
* Deployments
* Services
* Ingress
* Persistent Volumes
* Secrets
* ConfigMaps
* Scaling
* Health checks

### Phase 7 — CI/CD

* GitHub Actions
* Automated build
* Automated testing
* Container image creation
* Deployment automation

### Phase 8 — Observability & SRE

* Metrics
* Logs
* Monitoring
* Alerting
* Availability
* SLI / SLO / SLA
* Incident response
* Disaster recovery

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

_______________________________________________________________

## Project Context

This lab is part of the broader IT Infrastructure Cloud Engineering roadmap.

Related Objectives:
- Infrastructure Virtualization
- Hybrid Cloud Foundations
- Automation Readiness

This project contributes to:
→ Future Azure Platform Deployment
→ Terraform Infrastructure as Code
→ Kubernetes Platform

_______________________________________________________________

## Design Decisions

| Decision | Reason | Alternative |
|---------|--------|------------|
| Hyper-V | Native Windows integration | VMware ESXi |


_______________________________________________________________

## Failure Scenarios

- VM crash → Recovery steps
- Network failure → Isolation behavior
- Disk failure → Data loss impact

_______________________________________________________________

## Key Metrics

- VM Provision Time: X minutes
- Resource Utilization: %
- Network Latency: ms
- Cost Estimate: $

_______________________________________________________________

## Documentation

Implementation details, architecture decisions, configuration notes and relevant screenshots will be documented throughout the project.

Screenshots are included selectively to demonstrate important configuration and implementation stages.

### Project Structure

- /docs → Detailed technical notes and explanations
- /scripts → Automation and configuration scripts
- /screenshots → Proof of implementation


_______________________________________________________________

## Current Status

### Phase 1 — Local Infrastructure

Current focus:

* Hyper-V
* Windows Server 2025
* DC01
* Virtual networking

_______________________________________________________________

## Lessons Learned

This section will be updated throughout the project with technical findings, design decisions, problems encountered and solutions implemented.