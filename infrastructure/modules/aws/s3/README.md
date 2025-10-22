# AWS S3 Module

This module creates an AWS S3 bucket with optional versioning and tagging.

## Inputs

| Name | Type | Default | Description |
|------|------|----------|-------------|
| bucket_name | string | n/a | The name of the S3 bucket |
| acl | string | "private" | The canned ACL to apply |
| versioning_enabled | bool | false | Whether versioning should be enabled |
| tags | map(string) | {} | Tags to assign to the bucket |

## Outputs

| Name | Description |
|------|--------------|
| bucket_id | The name of the S3 bucket |
| bucket_arn | The ARN of the S3 bucket |
