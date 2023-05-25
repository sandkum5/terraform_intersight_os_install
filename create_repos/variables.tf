variable "api_key" {
  type        = string
  description = "(Required) Intersight API Key File"
}

variable "api_secretkeyfile" {
  type        = string
  description = "(Required) Intersight SecretKey File"
}

variable "api_endpoint" {
  type        = string
  description = "(Required) Intersight URL"
}

variable "org_name" {
  type        = string
  description = "(Required) Organization Name"
}