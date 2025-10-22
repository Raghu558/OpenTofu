variable "bucket_name" {
  description = "Unique name to create s3 bucket"
  type = string
}

variable "versioning_status" {
  type = bool
  description = "Enable or disable versioning for the S3 bucket"
}