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

# reading the content of the files in my cv githup epo

data "http" "html_file" {
  url = "https://raw.githubusercontent.com/${var.github_repo}/${var.github_branch}/index.html"

  request_headers = {
    Accept = "application/vnd.github.v3.raw"
  }
}

data "http" "css_file" {
  url = "https://raw.githubusercontent.com/${var.github_repo}/${var.github_branch}/css/style.css"

  request_headers = {
    Accept = "application/vnd.github.v3.raw"
  }
}

resource "aws_s3_object" "html_file" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "index.html"
  content      = data.http.html_file.response_body
  content_type = "text/html"
  etag         = md5(data.http.html_file.response_body)
}

resource "aws_s3_object" "css_file" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "css/styles.css"
  content      = data.http.css_file.response_body
  content_type = "text/css"
  etag         = md5(data.http.css_file.response_body)

  depends_on = [aws_s3_object.html_file]
  
  }
