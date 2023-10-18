#!/bin/bash

# Update and upgrade the system
su -c 'apt update && apt upgrade -y'

# Install Python and pip
su -c 'apt install -y python3 python3-pip'

# Create a virtual environment
su -c 'python3 -m venv msfont'

# Activate the virtual environment
su -c 'source msfont/bin/activate'

# Install libraries from requirements.txt
su -c 'pip install -r requirements.txt'

# Deactivate the virtual environment
su -c 'deactivate'

# Clean up after installation
su -c 'apt autoremove -y'

echo "Python and pip installed, virtual environment created, and libraries installed."
