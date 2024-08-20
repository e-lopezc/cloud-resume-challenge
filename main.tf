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

module "cloud_distribution" {
  source                     = "./modules/cloudfront"
  s3_bucket_website_endpoint = module.s3_website_bucket.website_endpoint
  bucket_name                = module.s3_website_bucket.website_bucket_name
  depends_on                 = [module.s3_website_bucket] 
}
