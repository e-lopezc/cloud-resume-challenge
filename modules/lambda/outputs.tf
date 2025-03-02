output "lambda_visitors_counter_updater_url" {
  description = "The url of the lambda function - visitors counter updater"
  value       = aws_lambda_function_url.visitors_counter_updater_url
}
