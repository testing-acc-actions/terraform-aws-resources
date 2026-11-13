def handler(event, context):
    """Return a small response for Terraform learning."""
    return {
        "statusCode": 200,
        "body": "Hello from the Terraform-managed Lambda function!"
    }
