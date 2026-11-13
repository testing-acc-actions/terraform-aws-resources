# terraform-aws-resources

Beginner-to-intermediate Terraform practice for learning individual AWS resources through small, independent configurations.

## Resources covered

| Folder | AWS resource | What it demonstrates |
|---|---|---|
| `s3/` | Amazon S3 | Bucket, versioning, encryption and public-access protection |
| `ec2/` | Amazon EC2 | Linux instance and AMI data lookup |
| `vpc/` | Amazon VPC | VPC, public/private subnets, internet gateway and routing |
| `alb/` | Application Load Balancer | Load balancer, security group, target group and listener |
| `route53/` | Amazon Route 53 | DNS CNAME record in an existing hosted zone |
| `lambda/` | AWS Lambda | Python function, IAM execution role and deployment archive |
| `aurora/` | Amazon Aurora PostgreSQL | Cluster, Serverless v2 instance, subnet group and security group |

## Learning approach

- Each folder is an independent Terraform root configuration.
- Start with `main.tf`, then understand its variables and outputs.
- Keep the first implementation readable; avoid unnecessary modules and abstractions.
- GitHub Actions runs formatting and validation checks only.
- No AWS infrastructure is created by GitHub Actions.

## Prerequisites

- Terraform CLI 1.10.0 or later.
- AWS credentials are needed only if you later choose AWS-backed operations.
- AWS provider defaults to `ap-south-1`; override with `aws_region`.

## Validate one folder locally

For example, from PowerShell:

```powershell
cd s3
terraform fmt -recursive
terraform init -backend=false
terraform validate
```

Repeat for `ec2`, `vpc`, `alb`, `route53`, `lambda` and `aurora`.

These commands do not create AWS resources. Validation does not prove that account permissions, quotas, IDs or runtime settings will work in a real deployment.

## GitHub Actions

The workflow in `.github/workflows/terraform-checks.yml` checks formatting and validates each independent folder. It does not configure AWS credentials and does not run `terraform plan` or `terraform apply`.

## Cost and deployment safety

Writing Terraform and running formatting/validation does not provision infrastructure. Do not run `terraform apply` unless you intend to create resources and have reviewed the charges.

- EC2 can incur compute, storage and public IPv4 charges.
- ALB incurs hourly and usage charges.
- Route 53 hosted zones and DNS queries can incur charges; this example expects an existing hosted zone.
- Lambda may have a free usage allowance, but usage and related services can still incur charges.
- **Aurora is not a free resource.** Serverless v2 can incur database capacity, storage and I/O charges.
- NAT gateways, public IPv4 addresses and data transfer can also cost money.

The Aurora example enables deletion protection and requires a database password. Never commit credentials or `terraform.tfvars` to Git.

## Suggested learning order

1. S3
2. EC2
3. VPC and subnets
4. ALB
5. Route 53
6. Lambda
7. Aurora PostgreSQL

## Repository structure

```text
.
├── .github/workflows/terraform-checks.yml
├── s3/
├── ec2/
├── vpc/
├── alb/
├── route53/
├── lambda/
└── aurora/
```

Each resource folder contains `main.tf`, `variables.tf` and `outputs.tf`. Lambda also includes its Python source.
