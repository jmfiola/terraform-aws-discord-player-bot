output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.discord_player_bot.id
}

output "public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.discord_player_bot.public_ip
}

output "bot_invite_link" {
  description = "The invite link for the Discord bot"
  value       = "https://discord.com/oauth2/authorize?client_id=${var.discord_bot_application_id}&permissions=8&integration_type=0&scope=bot"
}