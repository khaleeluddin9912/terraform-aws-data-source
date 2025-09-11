# terraform-aws-data-source

This repository demonstrates how to use **Terraform AWS Data Sources** to fetch information about existing AWS resources like VPCs, AMIs, Security Groups, and more.  
It serves as a learning resource for beginners who want to understand how **data sources** work in Terraform.

---

## 📂 Repository Structure

terraform-aws-data-source/
├── providers.tf # AWS provider configuration
├── vpc.tf # VPC resource definitions
├── ec2.tf # EC2 instance configuration
├── data.tf # AWS data sources (fetching existing resource details)
├── output.tf # Output values
└── README.md # Documentation

yaml
Copy code

---

## ⚙️ Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) v1.5+
- AWS account with sufficient permissions
- AWS CLI configured with credentials (`aws configure`)

---

## 📌 Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/khaleeluddin9912/terraform-aws-data-source.git
   cd terraform-aws-data-source
Initialize Terraform:

bash
Copy code
terraform init
Preview the plan:

bash
Copy code
terraform plan
Apply the configuration:

bash
Copy code
terraform apply
🗂️ Data Sources Used
The data.tf file demonstrates the following AWS data sources:

aws_ami → Fetches the latest Amazon AMI ID

aws_availability_zones → Retrieves available AZs in the region

aws_caller_identity → Displays AWS account details

aws_region → Fetches the current AWS region

aws_security_group → Retrieves Security Group details by tags

aws_vpc → Gets VPC information by tags

⚠️ Important Note
Running these configurations may incur AWS charges (especially when combined with vpc.tf and ec2.tf).

The data sources themselves are safe to query, but associated resources (like EC2 or VPC) may lead to billing.

Use this repo for learning purposes only and at your own risk.

✅ Best Practices
Always run terraform plan before terraform apply to verify what resources will be fetched/created.

Use tags to filter existing resources more accurately.

Destroy test resources after use:

bash
terraform destroy

👨‍💻 Author: Mohammed Khaleel Uddin
