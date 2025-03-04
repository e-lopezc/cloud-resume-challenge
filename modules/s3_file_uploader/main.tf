resource "aws_s3_object" "cvfiles" {
  for_each = fileset(var.source_directory, var.file_pattern)

  bucket = var.bucket_name
  key    = each.value
  source = "${var.source_directory}${each.value}"

  etag = filemd5("${var.source_directory}${each.value}")

  content_type = lookup({
    ".html" = "text/html",
    ".css"  = "text/css",
    ".js"   = "application/javascript"
  }, regex("\\.(html|css|js)$", each.value), "application/octet-stream")
}
