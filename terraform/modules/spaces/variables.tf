variable "space_dutschhub" {
  description = "Space for deutschhub"
  type        = string
}

variable "space_dutschlern" {
  description = "Space for deutschhub"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "Region"
  type        = string
}

variable "token" {
  description = "Token"
  type        = string
}

variable "access_key" {
  description = "Key for space access"
  type        = string
}

variable "secret_key" {
  description = "Secret key for space access"
  type        = string
}