variable "region" {
  description = "The AWS region to deploy in"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance"
  type        = string
}

variable "bot_token" {
  description = "The Discord bot token"
  type        = string
}

variable "discord_user_id" {
  description = "The Discord user ID"
  type        = string
}

variable "public_key_path" {
  description = "The path to the public key file"
  type        = string
}