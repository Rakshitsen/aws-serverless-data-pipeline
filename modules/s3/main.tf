resource "random_string" "my_random_string" {
  length  = 5
  special = false
  upper   = false
  lower   = true
  numeric = true
}

resource "aws_s3_bucket" "example" {
  bucket = "${var.bucket_name}-${random_string.my_random_string.result}"

  tags = {
    Name        = "${var.bucket_name}-${random_string.my_random_string.result}"
    Environment = "Dev"
  }
}


resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = var.function_name
  # Use the function ARN from the lambda module output
  principal  = "s3.amazonaws.com"
  source_arn = aws_s3_bucket.example.arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.example.id

  lambda_function {
    lambda_function_arn = var.function_arn
    # Use the function ARN from the lambda module output
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".json"
  }
  depends_on = [
    aws_lambda_permission.allow_s3
  ]
}