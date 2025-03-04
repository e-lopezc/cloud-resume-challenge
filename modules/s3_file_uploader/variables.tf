variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "source_directory" {
  description = "Source directory containing files to upload"
  type        = string
  default     = "src/"
}

variable "file_pattern" {
  description = "File pattern to match for uploads"
  type        = string
  default     = "**/*.*"
}

variable "s3_object_ownership" {
  description = "Object ownership setting for the S3 bucket"
  type        = string
  default     = "BucketOwnerPreferred"
}
