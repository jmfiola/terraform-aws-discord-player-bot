# Terraform AWS Discord player bot

This project sets up a discord player bot on an AWS EC2 Ubuntu instance using Terraform.

## Prerequisites

- Terraform installed
- AWS credentials configured
- SSH key pair for EC2 instance access
- Discord invite link
- Discord app id/bot token (can be found [here](https://discord.com/developers/applications))
- Discord user ID (directions to obtain your user ID can be found [here](https://jmusicbot.com/finding-your-user-id/))
- Youtube credential string (see instructions [here](https://github.com/retrouser955/discord-player-youtubei))


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
5. Invite the bot to your Discord server by clicking on the invite link in the Terraform output.
6. Check the deployment by SSHing into the EC2 instance using the output public IP:

   ```sh
   ssh -i <path-to-ssh-key> ubuntu@<public-ip>
   ```
   NOTE: it may take a few minutes for java to install and the bot to start up after the instance is created. See cloud init logs in `tail -f /var/log/cloud-init-output.log` for progress on the user data script.
