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
  source                                 = "./modules/cloudfront"
  domain_name                            = var.domain_name
  acm_certificate_arn                    = var.ssl_certificate_arn
  s3_bucket_website_regional_domain_name = module.s3_website_bucket.website_bucket_regional_domain_name
  bucket_name                            = module.s3_website_bucket.website_bucket_domain_name
  depends_on                             = [module.s3_website_bucket]
}

module "route53" {
  source                    = "./modules/route53"
  create_zone               = var.create_zone
  domain_name               = var.domain_name
  environment               = var.environment
  cloudfront_domain_name    = module.cloud_distribution.cloudfront_distribution_domain_name
  cloudfront_hosted_zone_id = "Z2FDTNDATAQYW2" # This is the fixed CloudFront hosted zone ID
  depends_on                = [module.cloud_distribution]
}

module "dynamodb_table" {
  source      = "./modules/dynamodb"
  table_name  = var.dynamodb_table_name
  environment = var.environment
  #left default values for rest of variables
}

