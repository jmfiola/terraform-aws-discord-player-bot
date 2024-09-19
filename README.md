# Terraform AWS JMusicBot

This project sets up a JMusicBot on an AWS EC2 instance using Terraform.

## Prerequisites

- Terraform installed
- AWS credentials configured
- SSH key pair for accessing the EC2 instance
- Discord app/bot token (follow the bot creation directions on [JMusicBot](https://jmusicbot.com/) to create a token)
- Dicord user ID (right-click on your user in Discord and click "Copy ID" to get your user ID)

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
6. Invite the bot to your Discord server following the instructions on the [JMusicBot](https://jmusicbot.com/) website.