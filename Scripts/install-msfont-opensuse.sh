#!/bin/bash

# Update and upgrade the system
su -c 'zypper refresh && zypper up -y'

# Install Python, pip, venv, and tkinter
su -c 'zypper install -y python3 python3-pip python3-tk -y'

# Install virtualenv
pip3 install virtualenv

# Create a virtual environment
python3 -m venv msfont

# Activate the virtual environment
source msfont/bin/activate

# Install packages
# Use --use-pep517 flag to ensure PEP 517 compatibility
pip3 install wheel Pillow
pip3 install --use-pep517 ttkthemes

# Deactivate the virtual environment
deactivate

echo "Python and pip installed, virtual environment created, and libraries installed."
