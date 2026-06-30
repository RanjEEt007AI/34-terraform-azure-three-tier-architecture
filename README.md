# 🚀 Terraform Azure Three-Tier Architecture

Deploy a simple Three-Tier Architecture on Microsoft Azure using Terraform and Infrastructure as Code (IaC).

---

## 📌 Project Overview

This project creates a basic Azure Three-Tier Architecture consisting of:

✅ Azure Resource Group
✅ Virtual Network (VNet)
✅ Web Tier Subnet
✅ Application Tier Subnet
✅ Database Tier Subnet
✅ Web Virtual Machine
✅ Application Virtual Machine
✅ Database Virtual Machine

This project demonstrates how a traditional application architecture can be deployed automatically using Terraform.

---

## 🏗 Architecture Diagram

```text
                        +--------------------+
                        |   Internet Users   |
                        +----------+---------+
                                   |
                                   |
                         +---------v---------+
                         |     Web Tier      |
                         |      Web VM       |
                         +---------+---------+
                                   |
                                   |
                         +---------v---------+
                         | Application Tier  |
                         |      App VM       |
                         +---------+---------+
                                   |
                                   |
                         +---------v---------+
                         |   Database Tier   |
                         |      DB VM        |
                         +-------------------+


                         Inside Azure VNet
```

---

## 🛠 Tech Stack ( set of technologies and tools )

* Terraform
* Microsoft Azure
* Azure Virtual Network
* Azure Virtual Machines
* Azure Networking

---

## 📁 Project Structure

```bash
terraform-azure-three-tier-architecture/
│
├── main.tf
├── provider.tf
├── .gitignore
└── README.md
```

---

## ⚙️ Prerequisites

Before running this project, ensure:

* Azure Account
* Terraform installed
* Azure CLI installed

---

## 🔑 Azure Authentication

Login to Azure:

```bash
az login
```

Verify active subscription:

```bash
az account show
```

---

## 🚀 Deployment Steps

### Step 1: Initialize Terraform

```bash
terraform init
```

---

### Step 2: Validate Configuration

```bash
terraform validate
```

---

### Step 3: Preview Changes

```bash
terraform plan
```

---

### Step 4: Deploy Infrastructure

```bash
terraform apply
```

Type:

```bash
yes
```

---

## 🔍 Verify Resources

After deployment, verify the following resources in Azure Portal:

* Resource Group
* Virtual Network
* Web Subnet
* App Subnet
* DB Subnet
* Web VM
* Application VM
* Database VM

---

## 🧹 Destroy Infrastructure

Remove all resources:

```bash
terraform destroy
```

---

## 🌟 Features

✔ Infrastructure as Code (IaC)
✔ Multi-tier architecture deployment
✔ Separate application layers
✔ Beginner friendly project
✔ Easy resource management
✔ Scalable design approach

---

## 🎯 Benefits of Three-Tier Architecture

* Better scalability
* Improved security
* Easier maintenance
* Layer separation
* Better application management

---

## 👨‍💻 Author

Ranjeet Kumar

DevOps | Azure | Terraform | Kubernetes

---

### ⭐ If you found this project useful, give it a star.
