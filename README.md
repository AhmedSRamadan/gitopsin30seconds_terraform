# GitOpsIn30Seconds_Terraform
This repo is the single source of truth for infrastructure resources managed by terraform.

## Directory Structure
The resources are grouped into the following modules:
.    
├── main.tf : resources to bootstrap the infrastructure (root module)    
├── cluster : resources to bootstrap the GKE cluster  
└── argocd  : resources to bootstrap ArgoCD inside the GKE cluster     


