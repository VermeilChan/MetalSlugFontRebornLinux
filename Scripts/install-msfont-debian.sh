#!/bin/bash

# Update and upgrade the system
su -c 'apt update && apt upgrade -y'

# Install Python and pip
su -c 'apt install -y python3 python3-pip python3-venv python3-tk'

# Install wheel package
pip install wheel

# Create a virtual environment
python3 -m venv msfont

# Activate the virtual environment
source msfont/bin/activate

# Install libraries from requirements.txt
# Use --use-pep517 flag to ensure PEP 517 compatibility
pip install --use-pep517 -r requirements.txt

# Install Pillow and ttkthemes
pip install Pillow ttkthemes

# Deactivate the virtual environment
deactivate

# Clean up after installation
su -c 'apt autoremove -y'

echo "Python and pip installed, virtual environment created, and libraries installed."
