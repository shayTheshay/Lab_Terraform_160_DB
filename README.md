# Terraform RDS Lab 🚀

A modular Terraform project that provisions a MySQL RDS instance on AWS with proper networking components and security groups.

## 📋 Overview

This project demonstrates how to use Terraform modules to create a complete RDS infrastructure including:
- VPC with public and private subnets
- Database subnet group across multiple availability zones
- Security groups for database access
- MySQL RDS instance with Multi-AZ deployment

## 🏗️ Architecture

The infrastructure includes:
- **VPC Module**: Creates a Virtual Private Cloud with subnets
- **DB Subnet Group Module**: Sets up database subnets across multiple AZs
- **RDS Module**: Provisions the MySQL database instance

## 📁 Project Structure

```
terraform-rds-lab/
├── main.tf                    # Root module that orchestrates all components
├── variables.tf               # Global variable definitions
├── outputs.tf                 # Output values (DB endpoint, etc.)
├── provider.tf               # AWS provider configuration
├── terraform.tfvars         # Variable values (not tracked in git)
├── README.md                # This file
├── .gitignore               # Git ignore file
└── modules/
    ├── vpc/
    │   ├── main.tf          # VPC resources
    │   ├── variables.tf     # VPC module variables
    │   └── outputs.tf       # VPC module outputs
    ├── db_subnet_group/
    │   ├── main.tf          # Subnet group and subnets
    │   ├── variables.tf     # Subnet module variables
    │   └── outputs.tf       # Subnet module outputs
    └── rds/
        ├── main.tf          # RDS instance configuration
        ├── variables.tf     # RDS module variables
        └── outputs.tf       # RDS module outputs
```

## 🔧 Prerequisites

Before you begin, ensure you have:

- **Terraform** (v1.3+) - [Installation Guide](https://developer.hashicorp.com/terraform/downloads)
- **AWS CLI** - [Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- **AWS Account** with appropriate permissions for RDS, VPC, and EC2 resources

### Verify Prerequisites

```bash
# Check Terraform version
terraform -v

# Check AWS CLI version
aws --version
```

## 🚀 Getting Started

### 1. Configure AWS Credentials

```bash
aws configure
```

Provide your AWS credentials when prompted:
- AWS Access Key ID
- AWS Secret Access Key
- Default region (e.g., `us-west-2`)
- Default output format (`json`)

### 2. Clone and Initialize

```bash
# Navigate to your project directory
cd terraform-rds-lab

# Initialize Terraform
terraform init
```

### 3. Configure Variables

Create a `terraform.tfvars` file with your desired values:

```hcl
# terraform.tfvars
db_name              = "mydb"
username             = "admin"
password             = "MySecurePassword123!"
subnet_group_name    = "main_db_subnet_group"
allocated_storage    = 20
region               = "us-west-2"
```

### 4. Deploy Infrastructure

```bash
# Validate configuration
terraform validate

# Review planned changes
terraform plan

# Apply infrastructure
terraform apply
```

> **Note**: RDS creation typically takes 5-10 minutes. The process will show progress updates.

## 📊 Accessing Your Database

After deployment, retrieve connection information:

```bash
# View all outputs
terraform output

# Get specific output
terraform output rds_endpoint
```

Example output:
```
rds_endpoint = "mydb-instance.abcdef123456.us-west-2.rds.amazonaws.com"
```

## 🧹 Cleanup

To destroy all created resources:

```bash
terraform destroy
```

Confirm by typing `yes` when prompted.

## 🔒 Security Best Practices

### Git Ignore Configuration

Ensure your `.gitignore` includes:

```gitignore
# Terraform
.terraform/
*.tfstate
*.tfstate.backup
terraform.tfvars
.env

# IDE
.vscode/
*.swp
*.swo
```

### Credential Management

- **Never** commit AWS credentials to version control
- Use AWS CLI configuration or environment variables
- Consider using AWS IAM roles for production deployments

## 📖 Module Documentation

### VPC Module
- Creates VPC with configurable CIDR blocks
- Sets up public and private subnets
- Configures internet gateway and route tables

### DB Subnet Group Module
- Creates database subnet group
- Provisions subnets across multiple availability zones
- Ensures high availability for RDS deployment

### RDS Module
- Provisions MySQL RDS instance
- Configures Multi-AZ deployment for high availability
- Sets up security groups for database access

## 🐛 Troubleshooting

### Common Issues

**Authentication Errors**
```bash
# Verify AWS credentials
aws sts get-caller-identity
```

**State Lock Issues**
```bash
# Force unlock (use with caution)
terraform force-unlock <lock-id>
```

**Debug Mode**
```bash
# Enable detailed logging
TF_LOG=DEBUG terraform apply
```

### Useful Commands

```bash
# Format Terraform files
terraform fmt

# Show current state
terraform show

# List resources in state
terraform state list

# Import existing resources
terraform import aws_instance.example i-1234567890abcdef0
```

## 🔗 References

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS RDS Documentation](https://docs.aws.amazon.com/rds/)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

**Happy Infrastructure Automation!** 🎉

For questions or issues, please refer to the [Terraform documentation](https://www.terraform.io/docs/) or open an issue in this repository.