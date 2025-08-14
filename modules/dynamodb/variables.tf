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