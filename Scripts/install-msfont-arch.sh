#!/bin/bash

# Update and upgrade the system
sudo pacman -Syu --noconfirm

# Install Python, pip, venv and tkinter
sudo pacman -S --noconfirm python python-pip python-virtualenv tk

# Create a virtual environment
python -m venv msfont

# Activate the virtual environment
source msfont/bin/activate

# Install packages
# Use --use-pep517 flag to ensure PEP 517 compatibility
pip install wheel Pillow
pip install --use-pep517 ttkthemes

# Deactivate the virtual environment
deactivate

echo "Python and pip installed, virtual environment created, and libraries installed."
