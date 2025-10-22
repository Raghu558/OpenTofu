resource "google_storage_bucket" "this" {
  name          = var.bucket_name
  location      = var.bucket_location
  storage_class = var.storage_class
  project = var.project
  versioning {
    enabled = var.versioning_status
  }
  lifecycle {
    prevent_destroy = false
  }

}
