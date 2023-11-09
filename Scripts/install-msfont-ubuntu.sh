#!/bin/bash

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install Python, pip, venv and tkinter
sudo apt install -y python3 python3-pip python3-venv python3-tk

# Create a virtual environment
python3 -m venv msfont

# Activate the virtual environment
source msfont/bin/activate

# Install packages
# Use --use-pep517 flag to ensure PEP 517 compatibility
pip install wheel Pillow
pip install --use-pep517 ttkthemes

# Deactivate the virtual environment
deactivate

echo "Python and pip installed, virtual environment created, and libraries installed."
