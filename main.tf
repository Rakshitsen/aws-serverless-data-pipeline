module "bucket" {
  source        = "./modules/s3"
  bucket_name   = var.bucket_name
  function_arn  = module.function.function_arn
  function_name = module.function.function_name
}
module "function" {
  source               = "./modules/lambda"
  role_name            = var.role_name
  function_name        = var.function_name
  function_folder_name = var.function_folder_name
  index_filename       = var.index_filename
  runtime              = var.runtime

}

module "dynamodb" {
  source       = "./modules/dynamodb"
  table_name   = var.table_name
  hash_key     = var.hash_key
  billing_mode = var.billing_mode
}

