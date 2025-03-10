### **Terraform**  

```md
## Introduction  
Terraform is an open-source Infrastructure as Code (IaC) tool developed by HashiCorp. It allows you to define, provision, and manage cloud infrastructure using a declarative configuration language.

## Prerequisites  
- Install **Terraform**: [Download Terraform](https://developer.hashicorp.com/terraform/downloads)  
- Install **AWS CLI** (if using AWS): [Download AWS CLI](https://aws.amazon.com/cli/)  
- Configure AWS credentials:
```bash
aws configure
```

---

## Terraform Lifecycle  
Terraform follows a structured lifecycle to manage infrastructure:  

1. **Write**: Define resources in `.tf` files  
2. **Init**: Initialize the working directory  
3. **Plan**: Preview infrastructure changes  
4. **Apply**: Deploy changes to the infrastructure  
5. **Destroy**: Remove resources  

---

## Terraform State Files  
Terraform keeps track of infrastructure using **state files (`terraform.tfstate`)**.  
- Stores the **current state** of infrastructure  
- Helps in tracking **changes and dependencies**  
- Stored **locally** by default, but can be **remotely** stored (S3, Azure Blob, etc.)  

### **Remote State Example (AWS S3)**  
```hcl
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
  }
}
```
---

## Terraform Commands  

### **Basic Commands**
| Command | Description |
|---------|-------------|
| `terraform init` | Initialize Terraform working directory |
| `terraform plan` | Preview changes before applying |
| `terraform apply` | Apply the changes to the infrastructure |
| `terraform destroy` | Destroy all managed resources |
| `terraform fmt` | Format Terraform code properly |
| `terraform validate` | Check configuration for syntax errors |
| `terraform show` | Show the current state file |
| `terraform output` | Display output values |
| `terraform state list` | List all managed resources |
| `terraform state rm <resource>` | Remove a specific resource from the state |

---

## Terraform Example  

### **Main Configuration (`main.tf`)**
```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}
```

### **Terraform Workflow**
```bash
terraform init          # Initialize Terraform
terraform plan          # Preview the execution plan
terraform apply -auto-approve   # Apply changes
terraform destroy       # Destroy resources
```

---

## Best Practices  
✔️ Use **remote state storage** (S3, Azure Blob, etc.)  
✔️ Implement **state locking** with DynamoDB to avoid conflicts  
✔️ Use **Terraform modules** for better organization  
✔️ Enable **version control** with Git  
✔️ Use **environment-specific workspaces** (`terraform workspace`)  

---

## Additional Resources  
- **Terraform Documentation**: [https://developer.hashicorp.com/terraform](https://developer.hashicorp.com/terraform)  
- **AWS Provider Docs**: [https://registry.terraform.io/providers/hashicorp/aws/latest/docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)  
- **Terraform Best Practices**: [https://www.terraform-best-practices.com/](https://www.terraform-best-practices.com/)  

---
