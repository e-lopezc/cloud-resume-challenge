data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/src/"
  output_path = "${path.module}/visitors_counter_updater.zip"
}


resource "aws_lambda_function" "visitors_counter_updater" {
  filename         = data.archive_file.lambda_zip.output_path
  function_name    = var.lambda_name
  role             = aws_iam_role.visitors_counter_updater_role.arn
  handler          = "visitors_counter_updater.lambda_handler"
  runtime          = "python3.12"
  source_code_hash = filebase64sha256("${path.module}/src/visitor_counter_updater.py")
  environment {
    variables = {
      DYNAMO_TABLE_NAME = "${var.dynamodb_table_name}"
    }
  }
  tags = {
    Name        = var.lambda_name
    Environment = var.environment
  }

}


resource "aws_iam_role" "visitors_counter_updater_role" {
  name = "${var.lambda_name}_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name        = "${var.lambda_name}_role"
    Environment = var.environment
  }
}

resource "aws_iam_policy" "visitors_counter_updater_policy" {
  name        = "${var.lambda_name}_policy"
  path        = "/"
  description = "${var.lambda_name}_policy"
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ],
          "Effect" : "Allow",
          "Resource" : "arn:aws:logs:*:*:*"
        },
        {
          "Action" : [
            "dynamodb:*"
          ],
          "Effect" : "Allow",
          "Resource" : "arn:aws:dynamodb:*:*:table/${var.dynamodb_table_name}"
        }
      ]
    }
  )
  tags = {
    Name        = "${var.lambda_name}_policy"
    Environment = var.environment
  }

}

resource "aws_iam_role_policy_attachment" "policy_to_lambda_role" {
  role       = aws_iam_role.visitors_counter_updater_role.name
  policy_arn = aws_iam_policy.visitors_counter_updater_policy.arn
}

resource "aws_lambda_function_url" "visitors_counter_updater_url" {
  function_name      = aws_lambda_function.visitors_counter_updater.function_name
  authorization_type = "NONE"

  cors {
    allow_credentials = true
    allow_origins     = ["*"]
    allow_methods     = ["*"]
    allow_headers     = ["date", "keep-alive"]
    expose_headers    = ["keep-alive", "date"]
    max_age           = 86400
  }

}
