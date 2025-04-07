# cloud-resume-challenge

This personal project is inspired by the famous cloud resume challege https://cloudresumechallenge.dev/docs/the-challenge/aws/

I believe is a great idea to put in practice what you learn about aws services like s3, lambda, cloudfront, route 53 but using IaC to provision the underline resources.

* S3 to host the static website - Bucket policy
* CloudFront for CDN distribution - Only GET, HEADER
* Route53 public zone to host the dns record.
* ACM for SSL certificate pointing to the dns record.
* DynamoDB to handle data related to visitor counter.
* Lambda to update the counter once we have a visitor.
* Javascript to comunicate with Lambda via Lambda URL
