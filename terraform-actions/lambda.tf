# Trust policy for Lambda execution role
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "s3_list" {
  name               = "lambda_execution_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# Minimal S3 list permissions (list bucket names)
data "aws_iam_policy_document" "s3_list_policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListAllMyBuckets"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "s3_list" {
  name        = "s3_list_policy"
  description = "Policy to allow listing S3 buckets"
  policy      = data.aws_iam_policy_document.s3_list_policy.json
}

resource "aws_iam_role_policy_attachment" "attach_s3_list" {
    role       = aws_iam_role.s3_list.name
    policy_arn = aws_iam_policy.s3_list.arn
}

# Attach basic CloudWatch Logs permissions for Lambda
resource "aws_iam_role_policy_attachment" "basic_logs" {
  role       = aws_iam_role.s3_list.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Package the Lambda function code
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda_src/list_s3.py"
  output_path = "${path.module}/list_s3.zip"
}

action "aws_lambda_invoke" "test_invoke" {
	config {
    function_name = aws_lambda_function.list_s3_buckets.function_name
    payload = jsonencode({
      key1 = "value1"
      key2 = "value2"
    })
  }
}

# Lambda function
resource "aws_lambda_function" "list_s3_buckets" {
  function_name    = "list_s3"
  role             = aws_iam_role.s3_list.arn
  handler          = "list_s3.lambda_handler"
  runtime          = "python3.11"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  timeout     = 10
  memory_size = 128

  environment {
    variables = {
      ENVIRONMENT = "production"
      LOG_LEVEL   = "info"
    }
  }

  tags = {
    Environment = "production"
    Application = "s3-list"
  }
}

