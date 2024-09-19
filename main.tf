provider "aws" {
  region = var.region
}

resource "aws_instance" "jmusicbot" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer_key.key_name

  security_groups = [aws_security_group.jmusicbot_sg.name]

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y openjdk-11-jdk wget || sudo apt-get update --fix-missing && sudo apt-get install -y openjdk-11-jdk wget

    # Wait until Java is installed
    while ! java -version 2>&1 >/dev/null | grep "openjdk version" ; do
      echo "Waiting for Java installation to complete..."
      sleep 10
    done

    # Download and set up JMusicBot
    cd /home/ubuntu
    wget https://github.com/jagrosh/MusicBot/releases/download/0.4.3/JMusicBot-0.4.3.jar

    # Create config file
    echo "token = ${var.bot_token}" > config.txt
    echo "owner = ${var.discord_user_id}" >> config.txt

    # Start the bot
    nohup java -Dnogui=true -jar JMusicBot-0.4.3.jar > bot.log 2>&1 &
  EOF

  tags = {
    Name = "JMusicBot"
  }
}

resource "aws_security_group" "jmusicbot_sg" {
  name        = "jmusicbot_sg"
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