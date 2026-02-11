#!/bin/bash
# Update package list and install necessary dependencies
sudo apt-get update -y
sudo apt-get install -y wget apt-transport-https gnupg lsb-release
# Download and add the public key for the Trivy repository
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --
dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
# Add the Trivy repository to your APT sources
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg]
https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo
tee -a /etc/apt/sources.list.d/trivy.list
# Update the package list again to include the new repository
sudo apt-get update -y
# Install Trivy
sudo apt-get install -y trivy
