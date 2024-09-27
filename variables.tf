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

variable "discord_bot_token" {
  description = "The Discord bot token"
  type        = string
}

variable "discord_bot_application_id" {
  description = "The Discord bot application ID"
  type        = string
}

variable "discord_server_id" {
  description = "The server ID the discord bot will be deployed in"
  type        = string
}

variable "discord_user_id" {
  description = "The Discord user ID"
  type        = string
}

variable "discord_invite_link" {
  description = "A discord invite link to the server"
  type        = string
}

variable "yt_credential" {
  description = "The YouTube API credential string (including the access token, refresh token, etc.)"
  type        = string
}

variable "allowed_ip" {
  description = "The IP address allowed to ssh into the instance"
  type        = string
}

variable "public_key_path" {
  description = "The path to the public key file"
  type        = string
}