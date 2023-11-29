#!/bin/bash

continue_install="y"

echo "This script will download and install the required dependencies to use MetalSlugFontReborn."
echo "It will download Python 3, pip, venv, xcb, Pillow, and PyQt6."
echo "Please ensure you have the necessary permissions to install packages."
echo

read -p "Do you want to install the dependencies? (y/n): " install_dependencies
echo

if [ "$install_dependencies" != "y" ]; then
    echo "Exiting script. No dependencies will be installed."
    exit 0
fi
echo

read -p "Do you want to install additional libraries for xcb support? required for GUI version (y/n): " install_xcb_libraries
echo

if [ "$install_xcb_libraries" != "y" ]; then
    echo "Skipping installation of additional libraries for xcb support."
else
    read -p "Enter your package manager (apt/dnf/pacman/zypper): " package_manager
    echo

    case $package_manager in
        apt)
            echo "Debian/Ubuntu Based Distros : apt"
            ;;
        dnf)
            echo "Fedora Based Distros : dnf"
            ;;
        pacman)
            echo "Arch Based Distros : pacman"
            ;;
        zypper)
            echo "OpenSUSE Distros : zypper"
            ;;
    esac
fi

    case $package_manager in
        apt | dnf | pacman | zypper)
            ;;
        *)
            echo "Error: Invalid package manager. Please enter one of the following: apt, dnf, pacman, zypper."
            exit 1
            ;;
    esac
    echo

    echo "Please wait, installing dependencies..."

    case $package_manager in
        apt)
            sudo apt update -y || { echo "Error: Failed to update package list using apt. Exiting script."; exit 1; }
            ;;
        dnf)
            sudo dnf update -y || { echo "Error: Failed to update package list using dnf. Exiting script."; exit 1; }
            ;;
        pacman)
            sudo pacman -Syu --noconfirm || { echo "Error: Failed to update package list using pacman. Exiting script."; exit 1; }
            ;;
        zypper)
            sudo zypper update -y || { echo "Error: Failed to update package list using zypper. Exiting script."; exit 1; }
            ;;
    esac

    echo "Installing necessary libraries for xcb support..."
    case $package_manager in
        apt)
            sudo apt install libxcb-cursor0 -y || { echo "Error: Failed to install libxcb-cursor0 using apt. Exiting script."; exit 1; }
            ;;
        dnf)
            sudo dnf install xcb-util-cursor -y || { echo "Error: Failed to install xcb-util-cursor using dnf. Exiting script."; exit 1; }
            ;;
        pacman)
            sudo pacman -S xcb-util-cursor --noconfirm || { echo "Error: Failed to install xcb-util-cursor using pacman. Exiting script."; exit 1; }
            ;;
        zypper)
            sudo zypper install libxcb-cursor0 -y || { echo "Error: Failed to install libxcb-cursor0 using zypper. Exiting script."; exit 1; }
            ;;
    esac
fi

echo
echo "Installing Python and virtual environment..."
case $package_manager in
    apt | dnf)
        sudo $package_manager install python3 python3-pip python3-venv -y || { echo "Error: Failed to install Python dependencies using $package_manager. Exiting script."; exit 1; }
        ;;
    pacman)
        sudo $package_manager -S python python-pip python-virtualenv --noconfirm || { echo "Error: Failed to install Python dependencies using pacman. Exiting script."; exit 1; }
        ;;
    zypper)
        sudo $package_manager install python3 python3-pip virtualenv -y || { echo "Error: Failed to install Python dependencies using zypper. Exiting script."; exit 1; }
        ;;
esac

echo

echo "Creating and activating virtual environment..."
python3 -m venv metalslugfontreborn || { echo "Error: Failed to create virtual environment. Exiting script."; exit 1; }

source metalslugfontreborn/bin/activate || { echo "Error: Failed to activate virtual environment. Exiting script."; exit 1; }

if [ $? -eq 0 ]; then
    echo "Virtual environment activated successfully."
else
    echo "Error: Virtual environment activation failed. Exiting script."
    exit 1
fi
echo

echo "Installing Python packages from requirements.txt..."
pip install -r requirements.txt || { echo "Error: Failed to install Python packages. Exiting script."; exit 1; }
echo "The program will not work if you don't install Pillow"

echo

echo "Deactivating virtual environment..."
deactivate || { echo "Error: Failed to deactivate virtual environment. Exiting script."; exit 1; }

echo "|---------------------------------------------------------------------------|"
echo "| Selected package manager: $package_manager                                 "
echo "|---------------------------------------------------------------------------|"
echo "| Additional libraries for xcb support have been installed.                 |"
echo "|---------------------------------------------------------------------------|"
echo "| Python3, pip, and venv have been installed.                               |"
echo "|---------------------------------------------------------------------------|"
echo "| Virtual environment has been created and activated.                       |"
echo "|---------------------------------------------------------------------------|"
echo "| Packages have been installed from the requirements.txt file.              |"
echo "|---------------------------------------------------------------------------|"
echo "| Virtual environment has been deactivated.                                 |"
echo "|---------------------------------------------------------------------------|"
echo "| Now, please run the following command:                                    |"
echo "| bash Run.sh                                                               |"
echo "|---------------------------------------------------------------------------|"
echo
echo "MetalSlugFontReborn setup script completed."
