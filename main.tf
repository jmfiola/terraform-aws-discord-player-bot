provider "aws" {
  region = var.region
}

resource "aws_instance" "discord_player_bot" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer_key.key_name

  security_groups = [aws_security_group.discord_player_bot_sg.name]

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y docker.io

    # Create .env file
    cat <<EOL > .env
    DISCORD_TOKEN=${var.discord_bot_token}
    CLIENT_ID=${var.discord_bot_application_id}
    DEV_GUILD=${var.discord_server_id}
    DEV_IDS=${var.discord_user_id}
    SUPPORT_SERVER=${var.discord_invite_link}
    YT_CREDENTIAL=${var.yt_credential}
    EOL

    # Pull Docker image and run the container
    sudo docker pull lakhindarpal/discord-player-bot:latest
    sudo docker run --env-file .env --name discord_player_bot -d lakhindarpal/discord-player-bot:latest

    # Register slash commands
    sudo docker exec discord_player_bot npm run register
  EOF

  tags = {
    Name = "DiscordPlayerBot"
  }
}

resource "aws_security_group" "discord_player_bot_sg" {
  name        = "discord_player_bot_sg"
  description = "Allow SSH and ICMP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.allowed_ip}/32"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${var.allowed_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "deployer_key"
  public_key = file(var.public_key_path)
}