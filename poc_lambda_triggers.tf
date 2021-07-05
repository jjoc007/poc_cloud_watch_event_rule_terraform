resource "aws_lambda_permission" "allow_cloudwatch_to_call_schedule_configurations" {
  statement_id = "AllowExecutionFromCloudWatch"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.poc_schedule_configurations.function_name
  principal = "events.amazonaws.com"
  source_arn = aws_cloudwatch_event_rule.poc_execution_rule.arn
}