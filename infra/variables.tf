variable "project_name" {
  type        = string
  description = "Base project name used in naming resources"
  default     = "login-app"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Azure region where the resources are provisioned"
  default     = "southafricanorth"
}

variable "app_service_sku" {
  type        = string
  description = "Pricing SKU for the App Service Plan (F1 for Free, B1 for Basic)"
  default     = "F1"
}