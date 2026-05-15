# 🚀 Azure 3-Tier Web Application Infrastructure using Terraform

## 📌 Project Overview

This project demonstrates a production-style 3-tier web application infrastructure deployed on Microsoft Azure using Terraform and modular Infrastructure as Code (IaC) practices.

The infrastructure provisions networking, compute resources, traffic routing, and supporting cloud services required to host a distributed frontend-backend application architecture.

The project is structured using reusable Terraform modules and environment-based deployment design for better scalability, maintainability, and infrastructure organization.

---

# 🏗️ Architecture

```text
User Browser
      │
      ▼
Azure Application Gateway (Public IP)
      │
      ▼
Frontend VM (Nginx + React Application)
      │
      ▼
Backend VM (Node.js API - Private IP)
      │
      ▼
Azure SQL Database
```

---

# ⚙️ Tech Stack

| Component | Technology |
|---|---|
| Cloud Provider | Microsoft Azure |
| Infrastructure as Code | Terraform |
| Frontend | React.js |
| Backend | Node.js / Express |
| Reverse Proxy | Nginx |
| Traffic Routing | Azure Application Gateway |
| Database | Azure SQL |
| Networking | Azure VNet, NSG |
| Operating System | Linux |
| Source Control | GitHub |

---

# 📂 Repository Structure

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

## 🔹 resource_group
Creates Azure Resource Groups for organizing infrastructure resources.

## 🔹 networking
Creates:
- Virtual Network (VNet)
- Subnets
- Network Security Groups (NSGs)

## 🔹 pip
Creates Azure Public IP resources for internet-facing services.

## 🔹 appgateway
Deploys:
- Azure Application Gateway
- Frontend traffic routing
- Public ingress configuration

## 🔹 computing
Creates:
- Frontend Virtual Machine
- Backend Virtual Machine
- VM networking configuration

## 🔹 sql_server
Deploys Azure SQL Server resources.

## 🔹 sql_database
Creates Azure SQL Database instance.

## 🔹 secrets
Manages infrastructure-related secret configuration structure.

## 🔹 storage
Creates Azure Storage resources.

---

# 🌐 Application Architecture

The deployed application follows a 3-tier architecture model.

## Frontend Layer
- React.js application
- Hosted on Linux VM
- Served through Nginx

## Application Layer
- Node.js backend API
- Hosted on separate Linux VM
- Accessible internally using private IP communication

## Database Layer
- Azure SQL Database
- Used for persistent data storage

---

# 🔐 Security Features

- Network segmentation using subnets
- NSG rules for controlled traffic flow
- Backend API isolated from direct public access
- Application Gateway used as centralized ingress point
- Private IP communication between application tiers
- Infrastructure managed through Infrastructure as Code practices

---

# 🌍 Environment-Based Deployment

The project structure supports multiple deployment environments.

Current implementation:
- Development Environment (`environments/dev`)

Benefits:
- Reusable infrastructure modules
- Easier environment management
- Scalable infrastructure organization

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

---

## Validate Configuration

```bash
terraform validate
```

---

## Review Infrastructure Plan

```bash
terraform plan
```

---

## Deploy Infrastructure

```bash
terraform apply
```

---

# ☁️ Azure Resources Used

- Azure Virtual Machines
- Azure Application Gateway
- Azure Virtual Network (VNet)
- Azure Network Security Groups (NSGs)
- Azure SQL Server
- Azure SQL Database
- Azure Public IP
- Azure Storage

---

# 🔗 Related Application Repository

## AdApp – Full Stack Web Application

Frontend and backend application repository used with this infrastructure project:

https://github.com/aamit1512-dotcom/adapp

### Application Stack
- React.js frontend
- Node.js backend API
- Nginx reverse proxy
- Azure VM deployment
- Private IP communication between tiers

---

# 🔥 Key Features

- Modular Terraform architecture
- Azure infrastructure provisioning
- 3-tier application deployment model
- Application Gateway traffic routing
- Frontend and backend VM separation
- Secure private backend communication
- Environment-based deployment structure
- Infrastructure scalability and reusability

---

# 🧠 Learning Highlights

This project helped in understanding:

- Terraform module structuring
- Azure networking concepts
- Infrastructure provisioning using Terraform
- Application Gateway configuration
- Linux VM deployment
- Frontend-backend communication
- Private networking between services
- Infrastructure organization and scalability
- Troubleshooting cloud networking and deployment issues

---

# 🔄 Planned Enhancements

Future improvements planned for this project:

- GitHub Actions CI/CD pipeline integration
- Terraform remote backend setup
- AKS-based container deployment
- Docker containerization
- Security scanning using Checkov and Trivy
- Monitoring integration using Prometheus and Grafana

---

# 👨‍💻 Author

**Amit Kumar**

DevOps Engineer | Azure | Terraform | Docker | Kubernetes

🔗 GitHub:  
https://github.com/aamit1512-dotcom

🔗 LinkedIn:  
https://www.linkedin.com/in/amit-kumar-858a85358/
