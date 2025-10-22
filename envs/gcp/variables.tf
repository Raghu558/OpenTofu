variable "gcp_region" {
}
variable "gcp_project_id" {
}
variable "bucket_name" {
  type    = string
  default = "my-bucket-tofu-12345"
}

variable "bucket_location" {
  type    = string
  default = "asia-south1"
}
variable "versioning_status" {
  default = false
}
variable "storage_class" {
  type    = string
  default = "STANDARD"
}
