# Terraform AWS Resources

A collection of independent Terraform configurations for learning and showcasing AWS resources. All project files are grouped under `Terraform/terraform-aws-resources/`.

The GitHub Actions validation workflow remains in the repository-root `.github/workflows/` directory so GitHub can discover and run it automatically. The workflow does not require AWS credentials and does not provision infrastructure.

## AWS resources

| Folder | AWS service | What it demonstrates |
|---|---|---|
| [s3](aws-resources/s3/) | Amazon S3 | Bucket, versioning, encryption and public-access protection |
| [ec2](aws-resources/ec2/) | Amazon EC2 | Linux instance configuration and AMI data lookup |
| [vpc](aws-resources/vpc/) | Amazon VPC | VPC, public/private subnets, internet gateway and routing |
| [alb](aws-resources/alb/) | Application Load Balancer | Load balancer, security group, target group and listener |
| [route53](aws-resources/route53/) | Amazon Route 53 | DNS CNAME record in an existing hosted zone |
| [lambda](aws-resources/lambda/) | AWS Lambda | Python function, IAM execution role and deployment archive |
| [aurora](aws-resources/aurora/) | Amazon Aurora PostgreSQL | Cluster, Serverless v2 instance, subnet group and security group |

Each resource folder is an independent Terraform root module. Run Terraform commands from inside the relevant resource folder.

## Repository structure

```text
terraform-aws-resources/
├── .github/
│   └── workflows/
│       ├── terraform-checks.yml
│       └── Aws-pending.yml
└── Terraform/
    └── terraform-aws-resources/
        ├── aws-resources/
        │   ├── s3/
        │   ├── ec2/
        │   ├── vpc/
        │   ├── alb/
        │   ├── route53/
        │   ├── lambda/
        │   │   └── src/
        │   └── aurora/
        ├── .gitignore
        └── README.md
```

## GitHub Actions: Terraform checks

Workflow: [Terraform checks](../../.github/workflows/terraform-checks.yml)

GitHub Actions discovers workflows only from the repository-root `.github/workflows/` directory. The workflow runs on pushes and pull requests targeting `main`, and can also be started manually. It runs one independent job for each AWS resource folder.

Each job checks out the repository, installs Terraform CLI 1.10.5, checks formatting with `terraform fmt -check -recursive`, initializes without a backend using `terraform init -backend=false`, and runs `terraform validate`. It also displays provider requirements, declared Terraform blocks and a dependency graph. State inspection is skipped when no state file is present.

### What the workflow does not do

- It does not configure AWS credentials or connect to an AWS account.
- It does not run `terraform plan`, `terraform apply` or `terraform destroy`.
- It does not create, update or delete AWS resources.

Validation checks configuration syntax and consistency; it does not prove that AWS permissions, quotas, service-side constraints or runtime behavior will work in a real deployment.

## Run checks locally (no AWS deployment)

Prerequisite: Terraform CLI 1.10.0 or later.

From PowerShell, starting at the repository root:

```powershell
Set-Location .\Terraform\terraform-aws-resources\aws-resources\s3
terraform fmt -recursive
terraform init -backend=false
terraform validate
terraform providers
terraform graph -type=plan
```

Repeat from the `ec2`, `vpc`, `alb`, `route53`, `lambda` and `aurora` folders.

These commands validate the configuration and do not provision AWS infrastructure.

## Cost and deployment safety

Do not run `terraform apply` unless you intend to create resources and have reviewed the charges.

- EC2 can incur compute, storage and public IPv4 charges.
- ALB incurs hourly and usage charges.
- Route 53 hosted zones and DNS queries can incur charges; the example expects an existing hosted zone.
- Lambda may have a free usage allowance, but usage and related services can still incur charges.
- **Aurora is not a free resource.** Serverless v2 can incur database capacity, storage and I/O charges.
- NAT gateways, public IPv4 addresses and data transfer can also cost money.

The Aurora example enables deletion protection and requires a database password. Never commit credentials, `terraform.tfvars` or Terraform state files to Git.

## Suggested learning order

1. S3
2. EC2
3. VPC and subnets
4. ALB
5. Route 53
6. Lambda
7. Aurora PostgreSQL
