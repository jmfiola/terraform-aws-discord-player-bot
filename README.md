# Terraform AWS JMusicBot

This project sets up a JMusicBot on an AWS EC2 instance using Terraform.

## Prerequisites

- Terraform installed
- AWS credentials configured
- SSH key pair for accessing the EC2 instance

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
5. SSH into the EC2 instance using the output public IP:

   ```sh
   ssh -i <path-to-ssh-key> ubuntu@<public-ip>
```