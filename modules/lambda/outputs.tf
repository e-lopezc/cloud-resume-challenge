output "lambda_visitors_counter_updater_arn" {
  description = "The arn of the lambda function visitors_counter_updater"
  value       = aws_lambda_function.visitors_counter_updater.arn
}

output "lambda_visitors_counter_updater_url" {
  description = "The url of the lambda function - visitors counter updater"
  value       = aws_lambda_function_url.visitors_counter_updater_url
}
