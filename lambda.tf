resource "aws_iam_role" "lambda-iam" {
    name = "lambda-iam"
    assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

data "archive_file" "lambda-zip" {
    type = "zip"
    source_dir = "lambda"
    output_path = "lambda.zip"
}

resource "aws_lambda_function" "lambda" {
    filename = "lambda.zip"
    function_name = "lambda-function"
    role = aws_iam_role.lambda-iam.arn
    handler = "lambda.lambda_handler"
    source_code_hash = data.archive_file.lambda-zip.output_base64sha256
    runtime = "python3.12"
}

# DynamoDB
/*
resource "aws_lambda_function" "cloudwatch_lambda" {
  function_name    = "cloudwatch-processor"
  handler          = "lambda.lambda_handler"
  runtime          = "python3.12"  
  role             = aws_iam_role.lambda-iam.arn
  source_code_hash = data.archive_file.lambda-zip.output_base64sha256

  environment {
    variables = {
      DYNAMODB_TABLE_NAME = aws_dynamodb_table.cloudwatch_logs.name
    }
  }
}

*/