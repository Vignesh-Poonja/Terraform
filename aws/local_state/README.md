### **Defining Infrastructure Using Terraform**  

Terraform allows you to define infrastructure as code (IaC) in a **declarative** way. Below are the **steps** to define and provision infrastructure using Terraform.

---

## **1️⃣ Install Terraform**
Before defining infrastructure, install Terraform from the official website:  
🔗 [Terraform Download](https://developer.hashicorp.com/terraform/downloads)  

Verify the installation using:  
```sh
terraform version
```

---

## **2️⃣ Initialize a Terraform Project**
Create a new project directory and navigate to it:  
```sh
mkdir my-terraform-project && cd my-terraform-project
```
Create a new **main.tf** file where the infrastructure definition will be written.

---

## **3️⃣ Define Infrastructure in `main.tf`**  
Terraform uses **providers** (like AWS, Azure, GCP) to manage cloud resources. Below is an example of provisioning an **AWS EC2 instance**.

Terraform files are primarily written in HashiCorp Configuration Language (HCL), which is a declarative configuration language designed for Terraform. The files have a .tf extension and follow a structured, human-readable syntax.

### **Example: `main.tf` for AWS EC2**
```hcl
# Define the AWS Provider
provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

# Define an EC2 Instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}
```

---

## **4️⃣ Initialize Terraform**
Run the following command to download the required provider plugins:  
```sh
terraform init
```

---

## **5️⃣ Plan and Apply Infrastructure**
Check the execution plan before applying changes:  
```sh
terraform plan
```
Apply the configuration to create the infrastructure:  
```sh
terraform apply
```
👉 **Type `yes` when prompted** to confirm the changes.

---

## **6️⃣ Verify the Infrastructure**
Once the apply command completes, you can verify the created resources.  
For AWS, run:  
```sh
aws ec2 describe-instances --region us-east-1
```
Or check it in the AWS Console.

---

## **7️⃣ Manage State Files**
Terraform keeps track of infrastructure using **state files (`terraform.tfstate`)**.  
- Always **store state files securely** (e.g., in AWS S3 with state locking).  
- Avoid **manually editing** the state file.

---

## **8️⃣ Destroy Infrastructure (Optional)**
To remove all resources created by Terraform:  
```sh
terraform destroy
```
👉 **Type `yes` when prompted** to confirm the deletion.
