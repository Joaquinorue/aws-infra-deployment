resource "aws_cloudwatch_log_group" "lambda_log" {
    name = "/lambda/${aws_lambda_function.lambda.function_name}"
}