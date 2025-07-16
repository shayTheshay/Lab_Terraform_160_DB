###########################################
# README.md – Terraform RDS Lab (CLI Style)
###########################################

# 👋 Welcome to the Terraform RDS Lab project.
# This guide will walk you through provisioning a MySQL RDS instance in AWS
# using a modular Terraform setup with full CLI instructions and commentary.

###########################################
# 🔧 PREREQUISITES – Ensure the following are installed:
###########################################

# ✅ Terraform (https://developer.hashicorp.com/terraform/downloads)
terraform -v     # Check Terraform version

# ✅ AWS CLI (https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
aws --version    # Check AWS CLI version

# ✅ An AWS account with access keys generated from IAM

###########################################
# 🔐 LOGIN TO AWS (using AWS CLI)
###########################################

# This sets up your credentials locally in ~/.aws/credentials
aws configure

# Expected prompts:
# AWS Access Key ID [None]: <your-access-key>
# AWS Secret Access Key [None]: <your-secret-key>
# Default region name [None]: us-west-2
# Default output format [None]: json

###########################################
# 📁 PROJECT STRUCTURE OVERVIEW
###########################################

# Your Terraform project directory should look like this:

.
├── main.tf                  # Root - wires all modules together
├── variables.tf             # Defines global/root variables
├── outputs.tf               # Prints key output values (e.g. RDS endpoint)
├── provider.tf              # AWS provider config (region, version, etc)
├── terraform.tfvars         # Supplies actual input values for variables
├── .env                     # (optional) store local AWS creds securely
├── .gitignore               # Ignore secrets and Terraform state files
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── db_subnet_group/
    │   ├── main.tf          # Creates subnet group + 2 subnets in different AZs
    │   ├── variables.tf
    │   └── outputs.tf
    └── rds/
        ├── main.tf          # Creates the actual RDS instance (MySQL)
        ├── variables.tf
        └── outputs.tf

###########################################
# ⚙️ SETUP – Terraform CLI Commands
###########################################

# 1️⃣ Initialize your Terraform working directory
terraform init

# 2️⃣ Validate the syntax
terraform validate

# 3️⃣ Preview the execution plan
terraform plan

# 4️⃣ Apply the infrastructure (will prompt for "yes")
terraform apply

# NOTE: RDS creation can take 5–10 minutes. Be patient ⏳

###########################################
# 🧾 SAMPLE terraform.tfvars FILE (Optional)
###########################################

# You can supply values for variables like this:
# Create a file named `terraform.tfvars` and paste:

db_name              = "mydb"
username             = "admin"
password             = "MySecurePassword123"
subnet_group_name    = "main_db_subnet_group"
allocated_storage    = 20
region               = "us-west-2"

###########################################
# 🖥️ ACCESS OUTPUTS (such as DB Endpoint)
###########################################

# After apply, you can view outputs like this:
terraform output

# Example:
# rds_endpoint = "mydb-instance.abcdef123456.us-west-2.rds.amazonaws.com"

###########################################
# 🧹 DESTROY THE INFRASTRUCTURE
###########################################

# This will delete all AWS resources created by Terraform
terraform destroy

# Again, type `yes` when prompted.

###########################################
# 📦 TIPS & BEST PRACTICES
###########################################

# ✅ Use .gitignore to avoid committing sensitive files:
echo ".terraform/
*.tfstate
*.tfstate.backup
terraform.tfvars
.env" >> .gitignore

# ✅ NEVER store credentials in your Terraform files!
# Use AWS CLI (`aws configure`) or environment variables instead.

# ✅ Use modules to keep code clean and reusable.

# ✅ Use `terraform output` to easily retrieve connection details.

# ✅ Use version control (like Git) to track your infrastructure changes.

###########################################
# ✅ DONE! You now have a MySQL RDS instance using Terraform
###########################################

# Questions? Debugging? Rerun with `TF_LOG=DEBUG`:
TF_LOG=DEBUG terraform apply

# Happy Automating! 💻☁️
