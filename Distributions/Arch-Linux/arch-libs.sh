#!/bin/bash

# Function for error handling
handle_error() {
    echo "Error: $1"
    exit 1
}

# Update the package list and upgrade installed packages
sudo pacman -Syu --noconfirm || handle_error "Failed to update package list."

# Install Python and Pip
sudo pacman -S python python-pip tk --noconfirm || handle_error "Failed to install Python and Pip."

# Create a virtual environment
python -m venv msfont || handle_error "Failed to create a virtual environment."

# Activate the virtual environment
source msfont/bin/activate || handle_error "Failed to activate the virtual environment."

# Install libraries from requirements.txt
pip install -r requirements.txt || handle_error "Failed to install libraries from requirements.txt."

# Deactivate the virtual environment when you're done
deactivate || handle_error "Failed to deactivate the virtual environment."

echo "Script completed successfully."
