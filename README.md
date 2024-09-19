# Terraform AWS JMusicBot

This project sets up a JMusicBot on an AWS EC2 instance using Terraform.

## Prerequisites

- Terraform installed
- AWS credentials configured
- SSH key pair for EC2 instance access
- Discord app/bot token (follow the bot creation directions on the [JMusicBot website](https://jmusicbot.com/) to create a token)
- Discord user ID (directions to obtain your user ID can be found [here](https://jmusicbot.com/finding-your-user-id/))

## Usage

1. Clone the repository.
2. Update `terraform.tfvars` with your values.
3. Initialize Terraform:

   ```sh
   terraform init
    ```
4. Apply the Terraform configuration:

   ```sh
   terraform apply
    ```
5. Check the deployment by SSHing into the EC2 instance using the output public IP:

   ```sh
   ssh -i <path-to-ssh-key> ubuntu@<public-ip>
   ```
   NOTE: it may take a few minutes for java to install and the bot to start up after the instance is created. See cloud init logs in `/var/log/cloud-init-output.log` for progress on the user data script.
6. Invite the bot to your Discord server following the instructions on the [JMusicBot](https://jmusicbot.com/) website.