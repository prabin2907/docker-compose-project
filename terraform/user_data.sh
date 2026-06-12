#!/bin/bash
set -e

echo "Updating packages..."
apt-get update -y

echo "Installing Docker..."
apt-get install -y docker.io

echo "Starting Docker service..."
systemctl start docker
systemctl enable docker

echo "Installing Docker Compose..."
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Creating Docker CLI plugins directory..."
mkdir -p /usr/libexec/docker/cli-plugins
ln -sf /usr/local/bin/docker-compose /usr/libexec/docker/cli-plugins/docker-compose

echo "Adding ubuntu user to docker group..."
usermod -aG docker ubuntu

echo "User data script completed successfully!"