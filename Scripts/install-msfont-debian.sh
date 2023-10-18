#!/bin/bash

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if Python is installed
if ! command_exists python; then
  echo "Python is not installed. Installing Python..."
  su -c "apt-get update && apt-get install -y python3"
fi

# Check if Pip is installed
if ! command_exists pip; then
  echo "Pip is not installed. Installing Pip..."
  su -c "apt-get update && apt-get install -y python3-pip"
fi

# Create a virtual environment
echo "Creating a virtual environment..."
su -c "python -m venv msfont-env"

# Activate the virtual environment
echo "Activating the virtual environment..."
source msfont-env/bin/activate

# Install libraries from requirements.txt
if [ -f "requirements.txt" ]; then
  echo "Installing libraries from requirements.txt..."
  pip install -r requirements.txt
else
  echo "requirements.txt not found. No libraries installed."
fi

# Deactivate the virtual environment
deactivate

echo "Script completed."
