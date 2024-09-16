variable "vpc_name" {
  description = "The name of the vpc network"
  type        = string
}

variable "vpc_region" {
  description = "Region"
  type        = string
  default     = "dev"
}

variable "droplet_name" {
  description = "The AWS region where the S3 bucket will be created"
  type        = string
}

variable "droplet_image" {
  description = "Image of droplet"
  type        = string
}

variable "droplet_size" {
  description = "Type of droplet"
  type        = string
}

variable "token" {
  description = "Token"
  type        = string
}