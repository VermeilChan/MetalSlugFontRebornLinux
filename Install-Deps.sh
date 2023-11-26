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
    apt)
        sudo apt-get install -y '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev
        ;;
    dnf)
        sudo dnf install -y libxcb-devel libX11-xcb-devel mesa-libGLU-devel libXrender-devel libXi-devel libxkbcommon-devel libxkbcommon-x11-devel
        ;;
    pacman)
        sudo pacman -S --noconfirm libxcb libx11 libglu mesa libxrender libxi libxkbcommon libxkbcommon-x11
        ;;
    zypper)
        sudo zypper install -y libxcb-devel libX11-xcb-devel Mesa-libGLU-devel libXrender-devel libXi-devel libxkbcommon-devel libxkbcommon-x11-devel
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

deactivate

echo "----------------------------------------"
echo "Process completed successfully!"
echo "Package manager: $package_manager"
echo "Additional libraries for xcb support installed."
echo "Python3, pip, and virtualenv installed."
echo "Virtual environment created and activated."
echo "Packages installed from requirements.txt."
echo "Virtual environment deactivated."
echo "----------------------------------------"
