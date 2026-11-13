# terraform-aws-resources

Beginner-to-intermediate Terraform practice for learning individual AWS resource configurations without connecting to or deploying into an AWS account.

## Resources covered

| Folder | AWS resource | What it demonstrates |
|---|---|---|
| `s3/` | Amazon S3 | Bucket, versioning, encryption and public-access protection |
| `ec2/` | Amazon EC2 | Linux instance configuration and AMI data lookup |
| `vpc/` | Amazon VPC | VPC, public/private subnets, internet gateway and routing |
| `alb/` | Application Load Balancer | Load balancer, security group, target group and listener |
| `route53/` | Amazon Route 53 | DNS CNAME record in an existing hosted zone |
| `lambda/` | AWS Lambda | Python function, IAM execution role and deployment archive |
| `aurora/` | Amazon Aurora PostgreSQL | Cluster, Serverless v2 instance, subnet group and security group |

## GitHub Actions: Terraform Checks and Resource Showcase

Workflow: [`.github/workflows/terraform-checks.yml`](.github/workflows/terraform-checks.yml)

The workflow runs on pushes and pull requests targeting `main`, and can also be started manually from **Actions → Terraform Checks and Resource Showcase → Run workflow**.

It creates one independent job for each folder: `s3`, `ec2`, `vpc`, `alb`, `route53`, `lambda` and `aurora`.

### What each job demonstrates

| Step | Command / action | Purpose |
|---|---|---|
| Checkout | `actions/checkout` | Gets the repository files |
| Setup | `hashicorp/setup-terraform` | Installs Terraform CLI 1.10.5 |
| File tree | `find` | Displays repository and resource-folder files |
| Format | `terraform fmt -recursive` | Formats Terraform files in the runner |
| Format check | `terraform fmt -check -recursive` | Verifies formatting |
| Initialize | `terraform init -backend=false` | Initializes providers without a remote backend |
| Validate | `terraform validate` | Checks configuration syntax and consistency |
| Providers | `terraform providers` | Displays required providers |
| Inventory | `grep` | Lists resource blocks, data sources, variables and outputs |
| Dependency graph | `terraform graph -type=plan` | Prints the dependency graph in DOT format |
| State inspection | `terraform state list`, `terraform show`, `terraform output` | Runs only if a Terraform state file exists |

### What it intentionally does not do

- Does not configure AWS credentials or connect to an AWS account.
- Does not run `terraform plan`, `terraform apply` or destroy.
- Does not create, update or delete AWS resources.

**Important:** This is a configuration showcase, not a live infrastructure deployment. It can show resources and output declarations from the code, but real AWS resource IDs and evaluated output values require a Terraform state file. If no state file exists, the state-inspection step explains why those commands are skipped.

The formatting command changes files only inside the temporary GitHub Actions runner. It does not commit formatting changes back to this repository.

## Run checks locally (no AWS deployment)

Prerequisite: Terraform CLI 1.10.0 or later.

From PowerShell, choose one folder:

```powershell
cd s3
terraform fmt -recursive
terraform init -backend=false
terraform validate
terraform providers
terraform graph -type=plan
```

Repeat for `ec2`, `vpc`, `alb`, `route53`, `lambda` and `aurora`.

To list declared blocks in a folder:

```powershell
Get-ChildItem -Recurse -Filter *.tf | Select-String -Pattern '^resource\s+', '^data\s+', '^variable\s+', '^output\s+'
```

These checks do not create AWS resources. Validation does not prove that account permissions, quotas, remote IDs, service availability or runtime settings will work in a real deployment.

## Cost and deployment safety

Formatting, initialization with `-backend=false`, validation and graph commands do not provision AWS infrastructure. Do not run `terraform apply` unless you intend to create resources and have reviewed the charges.

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
├── .github/
│   └── workflows/
│       └── terraform-checks.yml
├── s3/
├── ec2/
├── vpc/
├── alb/
├── route53/
├── lambda/
│   └── src/
└── aurora/
```

Each resource folder contains Terraform configuration, variables and outputs. Lambda also includes its Python source code.
