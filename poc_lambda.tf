resource "aws_lambda_function" "poc_schedule_configurations" {
  filename         = "resources/lambdas/src.zip"
  function_name    = "poc-schedule-configurations"
  role             = aws_iam_role.poc_lambda_role.arn
  handler          = "schedule_actions.handler"
  source_code_hash = filebase64sha256("resources/lambdas/src.zip")
  runtime          = "python3.8"
}