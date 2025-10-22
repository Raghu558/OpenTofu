# OpenTofu Infrastructure Repository

This repository contains modular infrastructure-as-code (IaC) for **AWS, GCP, and Azure** using **OpenTofu**.  
It is structured for **multi-cloud**, modularity, and secure handling of sensitive credentials.

---

## Table of Contents

1. [Project Structure](#project-structure)  
2. [Setup](#setup)  
3. [Managing Secrets](#managing-secrets)  
4. [Usage](#usage)  
5. [Modules](#modules)  
6. [Best Practices](#best-practices)

---

## Project Structure

OpenTofu/
├── infrastructure/
│ ├── modules/
│ │ ├── aws/
│ │ │ ├── s3/
│ │ │ │ ├── main.tf
│ │ │ │ ├── variables.tf
│ │ │ │ ├── outputs.tf
│ │ │ └── eks/
│ │ ├── gcp/
│ │ │ └── gcs/
│ │ └── azure/
│ │ └── storage/
│ └── providers/
│ ├── aws/
│ │ └── providers.tf
│ ├── gcp/
│ │ └── providers.tf
│ └── azure/
│ └── providers.tf
├── envs/
│ ├── aws/
│ │ └── terraform.tfvars.example
│ ├── gcp/
│ │ └── terraform.tfvars.example
│ └── azure/
│ └── terraform.tfvars.example
├── .gitignore
└── README.md



---

## Setup

1. Clone the repo:

```bash
git clone https://github.com/Raghu558/OpenTofu.git
cd OpenTofu


# Example if using Terraform-compatible CLI
tofu --version
