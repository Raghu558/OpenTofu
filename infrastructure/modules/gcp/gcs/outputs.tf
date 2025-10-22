output "bucket_name" {
  description = "Name of the gcs created"
  value = google_storage_bucket.this.name
}
output "bucket_self_link" {
  description = "The self link of the created GCS bucket"
  value       = google_storage_bucket.this.self_link
}