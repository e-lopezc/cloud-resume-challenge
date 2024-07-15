resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "website_public_access_block" {
  bucket = aws_s3_bucket.website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "website_bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.website_bucket.arn}/*"
      },
    ]
  })
}

# reading the content of the files in the repo

data "github_repository_file" "html_file" {
  repository = var.github_repo
  branch     = var.github_branch
  file       = "index.html"
}

data "github_repository_file" "css_file" {
  repository = var.github_repo
  branch     = var.github_branch
  file       = "css/styles.css"
}

resource "aws_s3_object" "html_file" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "index.html"
  content      = data.github_repository_file.html_file.content
  content_type = "text/html"
  etag         = md5(data.github_repository_file.html_file.content)
}

resource "aws_s3_object" "css_file" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "css/styles.css"
  content      = data.github_repository_file.css_file.content
  content_type = "text/css"
  etag         = md5(data.github_repository_file.css_file.content)
}