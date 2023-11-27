#!/bin/bash

echo "This script will download and install the required dependencies to use MetalSlugFontReborn."
echo "It will download Python 3, pip, venv, xcb, Pillow, and PyQt6."

read -p "Do you want to install the dependencies? (y/n): " install_dependencies

if [ "$install_dependencies" != "y" ]; then
    echo "Exiting script. No dependencies will be installed."
    exit 0
fi

read -p "Enter your package manager (apt/dnf/pacman/zypper): " package_manager

case $package_manager in
    apt)
        sudo apt update -y || { echo "Failed to update packages. Exiting."; exit 1; }
        ;;
    dnf)
        sudo dnf update -y || { echo "Failed to update packages. Exiting."; exit 1; }
        ;;
    pacman)
        sudo pacman -Syu --noconfirm || { echo "Failed to update packages. Exiting."; exit 1; }
        ;;
    zypper)
        sudo zypper update -y || { echo "Failed to update packages. Exiting."; exit 1; }
        ;;
    *)
        echo "Invalid package manager. Exiting."
        exit 1
        ;;
esac

case $package_manager in
    apt)
        sudo apt-get install -y '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev || { echo "Failed to install xcb dependencies. Exiting."; exit 1; }
        ;;
    dnf)
        sudo dnf install -y libxcb-devel libX11-devel mesa-libGLU-devel libXrender-devel libXi-devel libxkbcommon-devel libxkbcommon-x11-devel || { echo "Failed to install xcb dependencies. Exiting."; exit 1; }
        ;;
    pacman)
        sudo pacman -S --noconfirm libxcb libx11 libglu mesa libxrender libxi libxkbcommon libxkbcommon-x11 || { echo "Failed to install xcb dependencies. Exiting."; exit 1; }
        ;;
    zypper)
        sudo zypper install -y libxcb-devel libX11-devel Mesa-libGLU-devel libXrender-devel libXi-devel libxkbcommon-devel libxkbcommon-x11-devel || { echo "Failed to install xcb dependencies. Exiting."; exit 1; }
        ;;
esac

case $package_manager in
    apt)
        sudo $package_manager install -y python3 python3-pip python3-venv || { echo "Failed to install Python and venv. Exiting."; exit 1; }
        ;;
    dnf)
        sudo $package_manager install -y python3 python3-pip || { echo "Failed to install Python and pip. Exiting."; exit 1; }
        ;;
    pacman)
        sudo $package_manager install --noconfirm python3 python3-pip python3-venv || { echo "Failed to install Python and pip. Exiting."; exit 1; }
        ;;
    zypper)
        sudo $package_manager install -y python3 python3-pip python3-virtualenv || { echo "Failed to install Python, pip, and venv. Exiting."; exit 1; }
        ;;
esac

python3 -m venv metalslugfontreborn || { echo "Failed to create virtual environment. Exiting."; exit 1; }
source metalslugfontreborn/bin/activate || { echo "Failed to activate virtual environment. Exiting."; exit 1; }

pip install -r requirements.txt || { echo "Failed to install Python packages. Exiting."; deactivate; exit 1; }

deactivate

echo "|---------------------------------------------------------------------------|"
echo "|                All dependencies have been successfully installed.         |"
echo "|---------------------------------------------------------------------------|"
echo "|           Selected package manager: $package_manager                      |"
echo "|---------------------------------------------------------------------------|"
echo "|    Additional libraries for xcb support have been installed.              |"
echo "|---------------------------------------------------------------------------|"
echo "|        Python3, pip, and venv have been installed.                        |"
echo "|---------------------------------------------------------------------------|"
echo "|    Virtual environment has been created and activated.                    |"
echo "|---------------------------------------------------------------------------|"
echo "| Packages have been installed from the requirements.txt file.              |"
echo "|---------------------------------------------------------------------------|"
echo "|    Virtual environment has been deactivated.                              |"
echo "|---------------------------------------------------------------------------|"
echo "|            Now, please run the following command:                         |"
echo "|                        bash Run.sh                                        |"
echo "|---------------------------------------------------------------------------|"
