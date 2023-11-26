#!/bin/bash

read -p "Enter your package manager (apt/dnf/pacman/zypper): " package_manager

case $package_manager in
    apt)
        sudo apt update && sudo apt upgrade -y
        ;;
    dnf)
        sudo dnf update -y
        ;;
    pacman)
        sudo pacman -Syu --noconfirm
        ;;
    zypper)
        sudo zypper update -y
        ;;
    *)
        echo "Invalid package manager. Exiting."
        exit 1
        ;;
esac

case $package_manager in
    apt | dnf | pacman)
        sudo $package_manager install -y python3 python3-pip python3-venv
        ;;
    zypper)
        sudo $package_manager install -y python3 python3-pip python3-virtualenv
        ;;
esac

python3 -m venv metalslugfontreborn
source metalslugfontreborn/bin/activate

pip install -r requirements.txt

echo "----------------------------------------"
echo "Process completed successfully!"
echo "Package manager: $package_manager"
echo "Python3, pip, and virtualenv installed."
echo "Virtual environment created and activated."
echo "Packages installed from requirements.txt."
echo "Virtual environment deactivated."
echo "----------------------------------------"

echo "Choose a version to run:"
echo "1. Windowed Version"
echo "2. Console Version"

read -p "Enter your choice (1 or 2): " choice

case $choice in
    1)
        python3 Src/windowed-version.py
        ;;
    2)
        python3 Src/console-version.py
        ;;
    *)
        echo "Invalid choice. Exiting."
        ;;
esac
