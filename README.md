# 🚀 Azure 3-Tier Web Application Infrastructure (Terraform)

## 📌 Project Overview

This project demonstrates a production-style 3-tier web application infrastructure deployed on Microsoft Azure using Terraform.

The infrastructure is designed using reusable Terraform modules and follows a structured Infrastructure as Code (IaC) approach for scalability, maintainability, and environment separation.

The setup includes:

- Frontend application hosted on an Nginx VM
- Backend API hosted on a separate Node.js VM
- Azure Application Gateway for traffic routing
- Azure Virtual Network (VNet) and NSGs for network security
- Modular Terraform configuration for reusable infrastructure deployment

---

# 🏗️ Architecture

```text
User Browser
      │
      ▼
Azure Application Gateway (Public IP)
      │
      ▼
Frontend VM (Nginx + React)
      │
      ▼
Backend VM (Node.js API - Private Access)
```

---

# ⚙️ Tech Stack

| Component | Technology |
|---|---|
| Cloud Provider | Microsoft Azure |
| Infrastructure as Code | Terraform |
| Frontend | React.js |
| Backend | Node.js / Express |
| Web Server | Nginx |
| Networking | Azure VNet, NSG |
| Traffic Routing | Azure Application Gateway |

---

# 📁 Project Structure

```text
webapp-iac/
│
├── environments/
│   └── dev/
│
├── modules/
│   ├── appgateway/
│   ├── computing/
│   ├── networking/
│   ├── pip/
│   ├── resource_group/
│   ├── secrets/
│   ├── sql_database/
│   ├── sql_server/
│   └── storage/
│
├── .gitignore
└── README.md
```

---

# 📦 Terraform Modules

## 🔹 networking
Creates:
- Virtual Network (VNet)
- Subnets
- Network Security Groups (NSGs)

## 🔹 appgateway
Deploys:
- Azure Application Gateway
- Public IP configuration
- HTTP routing

## 🔹 computing
Creates:
- Frontend VM
- Backend VM
- VM networking configuration

## 🔹 sql_server & sql_database
Provision:
- Azure SQL Server
- Azure SQL Database

## 🔹 secrets
Handles:
- Secret and sensitive configuration management structure

## 🔹 storage
Creates:
- Azure Storage resources

---

# 🔐 Security Features

- Network segmentation using subnets
- NSG rules for traffic control
- Backend service isolated from direct public access
- Application Gateway used as entry point
- Infrastructure managed using Infrastructure as Code principles

---

# 🌍 Environment-Based Deployment

The project is structured to support multiple environments.

Current environment:
- Development (`environments/dev`)

This structure helps maintain:
- reusable modules
- clean environment separation
- scalable infrastructure management

---

# 🚀 Deployment Steps

## Prerequisites

Install:
- Terraform
- Azure CLI

Authenticate with Azure:

```bash
az login
```

---

## Initialize Terraform

```bash
terraform init
```

## Validate Configuration

```bash
terraform validate
```

## Review Execution Plan

```bash
terraform plan
```

## Deploy Infrastructure

```bash
terraform apply
```

---

# 📚 Key Learnings

This project helped in understanding:

- Terraform module structuring
- Azure networking concepts
- Application Gateway configuration
- Infrastructure provisioning using Terraform
- Environment-based infrastructure organization
- Infrastructure scalability and reusability practices

---

# 🔄 Planned Enhancements

Future improvements planned for this project:

- GitHub Actions CI/CD pipeline
- Terraform remote backend
- AKS deployment integration
- Security scanning using Checkov and Trivy
- Monitoring integration with Prometheus and Grafana

---

# 👨‍💻 Author

**Amit Kumar**

DevOps Engineer | Azure | Terraform | Docker | Kubernetes | CI/CD

GitHub: https://github.com/aamit1512-dotcom

LinkedIn: https://www.linkedin.com/in/amit-kumar-858a85358/
