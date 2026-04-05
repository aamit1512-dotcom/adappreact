# 🚀 3-Tier Web Application (React + Node.js + Azure)

## 📌 Overview
This project demonstrates a **3-tier architecture** deployed on Azure:

- Frontend → React (VM1 with Nginx)
- Backend → Node.js API (VM2)
- Infrastructure → Azure Application Gateway + VNet + NSG (Terraform)

---

## 🏗️ Architecture

Browser  
↓  
Application Gateway (Public IP)  
↓  
Frontend VM (Nginx + React)  
↓  
Backend VM (Node.js API - Private IP)

---

## ⚙️ Tech Stack

- **Frontend:** React.js  
- **Backend:** Node.js (Express)  
- **Infra:** Azure (VMs, VNet, NSG, App Gateway)  
- **IaC:** Terraform  
- **Web Server:** Nginx  

---

## 📂 Project Structure
