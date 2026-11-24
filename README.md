# terraform-aws-resources

Beginner-to-intermediate Terraform practice for learning individual AWS resource configurations. The repository is organized as independent examples; validation does not require AWS credentials or deploy infrastructure.

## AWS examples

| Example | Resource | What it demonstrates |
|---|---|---|
| [S3](examples/aws/s3/) | Amazon S3 | Bucket, versioning, encryption and public-access protection |
| [EC2](examples/aws/ec2/) | Amazon EC2 | Linux instance configuration and AMI data lookup |
| [VPC](examples/aws/vpc/) | Amazon VPC | VPC, public/private subnets, internet gateway and routing |
| [ALB](examples/aws/alb/) | Application Load Balancer | Load balancer, security group, target group and listener |
| [Route 53](examples/aws/route53/) | Amazon Route 53 | DNS CNAME record in an existing hosted zone |
| [Lambda](examples/aws/lambda/) | AWS Lambda | Python function, IAM execution role and deployment archive |
| [Aurora](examples/aws/aurora/) | Amazon Aurora PostgreSQL | Cluster, Serverless v2 instance, subnet group and security group |

Each folder is an independent Terraform root module. Run Terraform commands from inside the relevant example directory.

## Repository structure

```text
.
├── .github/
│   └── workflows/
│       ├── terraform-checks.yml
│       └── Aws-pending.yml
├── examples/
│   └── aws/
│       ├── s3/
│       ├── ec2/
│       ├── vpc/
│       ├── alb/
│       ├── route53/
│       ├── lambda/
│       │   └── src/
│       └── aurora/
├── .gitignore
└── README.md
```

## GitHub Actions: Terraform checks

Workflow: [Terraform checks](.github/workflows/terraform-checks.yml)

The workflow runs on pushes and pull requests targeting `main`, and can also be started manually. It runs one independent job for each AWS example.

Each job checks out the repository, installs Terraform CLI 1.10.5, checks formatting, runs `terraform init -backend=false` and `terraform validate`, then displays provider requirements, declared blocks and a dependency graph. It inspects Terraform state only if a state file is present.

### What the workflow does not do

- It does not configure AWS credentials or connect to an AWS account.
- It does not run `terraform plan`, `terraform apply` or destroy.
- It does not create, update or delete AWS resources.

Validation checks configuration syntax and consistency, not AWS permissions, quotas, service-side constraints or runtime behavior. The workflow's formatting check does not commit changes to the repository.

## Run checks locally (no AWS deployment)

Prerequisite: Terraform CLI 1.10.0 or later.

From PowerShell, for example:

```powershell
cd examples/aws/s3
terraform fmt -recursive
terraform init -backend=false
terraform validate
terraform providers
terraform graph -type=plan
```

Repeat from `examples/aws/ec2`, `vpc`, `alb`, `route53`, `lambda` and `aurora`.

These commands do not provision AWS infrastructure.

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
