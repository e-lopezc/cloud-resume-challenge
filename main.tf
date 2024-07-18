provider "aws" {
  region = var.aws_region
}

module "s3_website_bucket" {
  source        = "./modules/s3_website_bucket"
  bucket_name   = var.bucket_name
  environment   = var.environment
  github_repo   = var.github_repo
  github_branch = var.github_branch
}
