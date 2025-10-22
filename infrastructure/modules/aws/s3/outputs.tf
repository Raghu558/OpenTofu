output "bucket_name" {
    description = "The name of the s3 bucket created"
    value       = aws_s3_bucket.this.bucket
}

output "bucket_arn" {
  description = "The ARN of the created s3 bucket"
  value = aws_s3_bucket.this.arn
}