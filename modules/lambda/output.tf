# modules/lambda/outputs.tf
output "function_name" {
  value = aws_lambda_function.example.function_name
}

output "function_arn" {
  value = aws_lambda_function.example.arn
}
