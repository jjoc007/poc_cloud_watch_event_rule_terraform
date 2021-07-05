resource "aws_iam_role" "poc_lambda_role" {
  name               = "poc-cloud-watch-rule-lambda-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "poc_lambda_to_default" {
  role       = aws_iam_role.poc_lambda_role.name
  policy_arn = aws_iam_policy.poc_default_policy.arn
}

resource "aws_iam_policy" "poc_default_policy" {
  name   = "poc_cloud_watch_rule_default_policy_all"
  policy = data.aws_iam_policy_document.default_lambda_policy.json
}