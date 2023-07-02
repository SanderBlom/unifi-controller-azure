locals {
  environment_names = {
    1 = "prod"
    2 = "dev"
  }
  environment_name = lookup(local.environment_names, var.environment, "unknown")

  tags = {
    managedby   = "Terraform"
    environment = local.environment_name
  }
}
