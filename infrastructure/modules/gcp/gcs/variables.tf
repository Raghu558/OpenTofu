variable "bucket_name" {
  description = "Name of the GCS bucket"
  type        = string
}

variable "bucket_location" {
  description = "Location of the GCS bucket"
  type        = string
}

variable "storage_class" {
  description = "Storage class of the GCS bucket"
  type        = string
}

variable "versioning_status" {
  description = "Enable versioning for the GCS bucket"
  type        = bool
}

variable "project" {
  description = "Project name where the resources to be created"
  type = string
}
