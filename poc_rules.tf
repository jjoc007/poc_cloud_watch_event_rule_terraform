resource "aws_cloudwatch_event_rule" "poc_execution_rule" {
  name = "poc-schedule-configurations"
  description = "Fires every 5 minutes"
  schedule_expression = local.poc_execution_rule_schedule_expression
}

resource "aws_cloudwatch_event_target" "poc_check_rule_schedule" {
  rule = aws_cloudwatch_event_rule.poc_execution_rule.name
  target_id = "poc_schedule_configurations"
  arn = aws_lambda_function.poc_schedule_configurations.arn
  input = <<JSON
{
  "foo": {
    "bar": [
      1,
      2
    ]
  }
}
JSON
}