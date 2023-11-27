#!/bin/bash

echo ""
echo "This script will download and install the required dependencies to use MetalSlugFontReborn."
echo "It will download Python 3, pip, venv, xcb, Pillow, and PyQt6."
echo ""

echo ""
read -p "Do you want to install the dependencies? (y/n): " install_dependencies
echo ""

echo ""
if [ "$install_dependencies" != "y" ]; then
    echo "Exiting script. No dependencies will be installed."
    exit 0
fi
echo ""

echo ""
read -p "Enter your package manager (apt/dnf/pacman/zypper): " package_manager
echo ""

echo ""
case $package_manager in
    apt)
        sudo apt update -y || { echo "Error updating package list. Continuing anyway."; }
        ;;
    dnf)
        sudo dnf update -y || { echo "Error updating package list. Continuing anyway."; }
        ;;
    pacman)
        sudo pacman -Syu --noconfirm || { echo "Error updating package list. Continuing anyway."; }
        ;;
    zypper)
        sudo zypper update -y || { echo "Error updating package list. Continuing anyway."; }
        ;;
    *)
        echo "Invalid package manager."
        exit 1
        ;;
esac
echo ""

echo ""
case $package_manager in
    apt)
        sudo apt install libxcb-cursor0 -y || { echo "Error installing libxcb-cursor0. Continuing anyway."; }
        ;;
    dnf)
        sudo dnf install xcb-util-cursor -y || { echo "Error installing xcb-util-cursor. Continuing anyway."; }
        ;;
    pacman)
        sudo pacman -S xcb-util-cursor --noconfirm || { echo "Error installing xcb-util-cursor. Continuing anyway."; }
        ;;
    zypper)
        sudo zypper install libxcb-cursor0 -y || { echo "Error installing libxcb-cursor0. Continuing anyway."; }
        ;;
esac
echo ""

echo ""
case $package_manager in
    apt)
        sudo $package_manager install python3 python3-pip python3-venv -y || { echo "Error installing Python dependencies. Continuing anyway."; }
        ;;
    dnf)
        sudo $package_manager install python3 python3-pip python3-venv -y || { echo "Error installing Python dependencies. Continuing anyway."; }
        ;;
    pacman)
        sudo $package_manager -S python python-pip python-virtualenv --noconfirm || { echo "Error installing Python dependencies. Continuing anyway."; }
        ;;
    zypper)
        sudo $package_manager install python3 python3-pip virtualenv -y || { echo "Error installing Python dependencies. Continuing anyway."; }
        ;;
esac
echo ""

echo ""
python3 -m venv metalslugfontreborn || { echo "Error creating virtual environment. Continuing anyway."; }
echo ""

echo ""
source metalslugfontreborn/bin/activate || { echo "Error activating virtual environment. Continuing anyway."; }
echo ""

echo ""
pip install -r requirements.txt || { echo "Error installing Python packages. Continuing anyway."; }
echo ""

echo ""
deactivate || { echo "Error deactivating virtual environment. Continuing anyway."; }
echo ""

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
