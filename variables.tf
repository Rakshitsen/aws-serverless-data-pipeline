variable "region" {
  type = string
}
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "role_name" {
  type = string
}
variable "function_folder_name" {
  type = string
}
variable "index_filename" {
  type = string
}
variable "function_name" {
  type = string
}
variable "runtime" {
  type = string
}
# variable "function_arn" {
#   type = string
# }

variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string

}
variable "hash_key" {
  description = "The hash key for the DynamoDB table"
  type        = string

}
variable "billing_mode" {
  description = "The billing mode for the DynamoDB table (e.g., PROVISIONED, PAY_PER_REQUEST)"
  type        = string
}