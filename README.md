# 🛒 Shopping App Deployment on AWS EKS using Terraform

This project demonstrates how to containerize and deploy a simple shopping app on **Amazon EKS** (Elastic Kubernetes Service) with a **custom VPC**, subnets, route tables, and public access — all automated using **Terraform**.

---

## 🧰 Tech Stack

- AWS (EKS, ECR, VPC, IAM)
- Terraform
- Docker
- Kubernetes (`kubectl`)
- Python HTTP Server (serving static files)

---

## 📁 Project Structure

eks_shopping_app/
├── app/
│ ├── app.py
│ └── static/
├── k8s/
│ ├── deployment.yml
│ └── service.yml
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ └── terraform.tfvars
├── .gitignore
└── README.md



---

## 🚀 Step-by-Step Deployment

### 1️⃣ Clone the Project

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO


## Build & Push Docker Image to Amazon ECR

# Authenticate Docker to your ECR
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin <ACCOUNT_ID>.dkr.ecr.ap-south-1.amazonaws.com

# Build your image
docker build -t caps-shopping-app ./app

# Tag it for ECR
docker tag caps-shopping-app:latest <ACCOUNT_ID>.dkr.ecr.ap-south-1.amazonaws.com/caps-shopping-app:latest

# Push to ECR
docker push <ACCOUNT_ID>.dkr.ecr.ap-south-1.amazonaws.com/caps-shopping-app:latest


## Create EKS Infrastructure using Terraform

cd terraform

# Initialize Terraform
terraform init

# Preview the resources
terraform plan

# Apply and create all resources
terraform apply -auto-approve


This will:

Create a custom VPC, subnets, and route tables

Provision an EKS cluster with node groups

Output kubeconfig command to connect to your cluster


### 4️⃣ Connect to EKS

aws eks update-kubeconfig --region ap-south-1 --name shopping-eks-cluster

## Deploy App to EKS

cd ../k8s

# Apply Kubernetes manifests
kubectl apply -f deployment.yml
kubectl apply -f service.yml

# Verify pods and service
kubectl get pods
kubectl get svc

## Find the EXTERNAL-IP of your shopping-service, and open in browser:

http://<external-lb-dns>

### 🧹 Cleanup (Destroy All)
# To destroy everything provisioned by Terraform:

cd terraform
terraform destroy -auto-approve

📌 Notes
Ensure your image's container listens on port 8000.

The service maps port 80 → 8000 internally.

All traffic is routed through a LoadBalancer provisioned by Kubernetes.

💬 Author
Abhishek Yadav
GitHub: @YadavAbhishek03
Project: caps-shopping-app

