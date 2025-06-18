# 🛒 Shopping App – AWS EKS Deployment with Terraform & GitHub Actions

This project demonstrates how to deploy a containerized Python-based shopping app on AWS EKS using Infrastructure as Code (Terraform) and GitHub Actions CI/CD pipelines.

## 📌 Project Features

- 🐳 Dockerized Python application
- ☁️ AWS EKS cluster provisioning using Terraform
- 🔄 GitHub Actions for CI/CD
  - CI: Build & push Docker image to ECR
  - CD: Apply Terraform and deploy app to EKS
- ⚙️ Kubernetes manifests for Deployment & LoadBalancer Service

---

## 📁 Project Structure

shopping-tf-cicd-eks/
├── app/ # App source code
├── Dockerfile # Docker build file
├── terraform/ # All Terraform IaC configs
├── k8s/ # Kubernetes YAMLs (Deployment + Service)
└── .github/workflows/ # GitHub Actions CI/CD pipelines


---

## 🚀 CI/CD Pipeline Overview

### CI (`ci.yml`)
- Triggered on `push` to `master`
- Builds Docker image
- Pushes image to Amazon ECR

### CD (`cd.yml`)
- Triggered after CI completes
- Runs `terraform apply` to provision EKS
- Applies Kubernetes manifests to deploy app

---

## 🔐 Required GitHub Secrets

Set these in your repository under **Settings > Secrets and variables > Actions**:

| Name                   | Description                          |
|------------------------|--------------------------------------|
| `AWS_ACCESS_KEY_ID`    | Your AWS access key                  |
| `AWS_SECRET_ACCESS_KEY`| Your AWS secret key                  |
| `AWS_REGION`           | e.g. `ap-south-1`                    |
| `ECR_REPOSITORY`       | ECR repository name (e.g. `caps-shopping-app`) |
| `EKS_CLUSTER_NAME`     | Your EKS cluster name (e.g. `shopping-cluster`) |

---

## ✅ How to Deploy

1. Push your code to the `master` branch
2. GitHub Actions will:
   - Build & push Docker image to ECR
   - Provision EKS using Terraform
   - Deploy app to Kubernetes

---

## 🧹 Cleanup

To destroy infrastructure:
```bash
cd terraform/
terraform destroy -auto-approve
" ⚠️ If state is missing, manually delete via AWS Console " 

👤 Author
Abhishek Yadav

🏷️ Tags
DevOps AWS EKS Terraform GitHub Actions CI/CD Docker Kubernetes Python