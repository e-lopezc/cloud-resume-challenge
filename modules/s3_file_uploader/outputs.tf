output "uploaded_files" {
  description = "List of files uploaded to S3"
  value       = keys(aws_s3_object.files)
}
