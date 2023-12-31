resource "aws_apigatewayv2_api" "lambda-api" {
    name = "http-api"
    protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "lambda-stage" {
    api_id = aws_apigatewayv2_api.lambda-api.id
    name = "$default"
    auto_deploy = true
}

resource "aws_apigatewayv2_integration" "lambda-integration" {
    api_id = aws_apigatewayv2_api.lambda-api.id
    integration_type = "AWS_PROXY"
    integration_method = "POST"
    integration_uri = aws_lambda_function.lambda.invoke_arn
    passthrough_behavior = "WHEN_NO_MATCH"
}

resource "aws_apigatewayv2_route" "lambda_route" {
    api_id = aws_apigatewayv2_api.lambda-api.id
    route_key = "GET /{proxy+}"
    target = "integrations/${aws_apigatewayv2_integration.lambda-integration.id}"
}

resource "aws_lambda_permission" "api-gateway" {
    statement_id = "AllowExecutionFromAPIGateway"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.lambda.arn
    principal = "apigateway.amazonaws.com"
    source_arn = "${aws_apigatewayv2_api.lambda-api.execution_arn}/*/*/*"
}
