terraform {
  required_version = ">=1.6.0"
}

module "google_provider" {
  source         = "../../infrastructure/providers/gcp"
  gcp_region     = var.gcp_region
  gcp_project_id = var.gcp_project_id
}

module "gcp_gcs_bucket" {
  source            = "../../infrastructure/modules/gcp/gcs"
  bucket_name       = var.bucket_name
  bucket_location   = var.bucket_location
  versioning_status = var.versioning_status
  storage_class     = var.storage_class
  project           = var.gcp_project_id
}