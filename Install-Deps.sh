#!/bin/bash

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
            sudo apt update -y || { echo "Error: Failed to update package list using apt. Do you want to continue? (y/n)"; read -r continue_install; }
            ;;
        dnf)
            sudo dnf update -y || { echo "Error: Failed to update package list using dnf. Do you want to continue? (y/n)"; read -r continue_install; }
            ;;
        pacman)
            sudo pacman -Syu --noconfirm || { echo "Error: Failed to update package list using pacman. Do you want to continue? (y/n)"; read -r continue_install; }
            ;;
        zypper)
            sudo zypper update -y || { echo "Error: Failed to update package list using zypper. Do you want to continue? (y/n)"; read -r continue_install; }
            ;;
    esac

    if [ "$continue_install" != "y" ]; then
        echo "Exiting script. Installation aborted."
        exit 1
    fi

    echo "Installing necessary libraries for xcb support..."
    case $package_manager in
        apt)
            sudo apt install libxcb-cursor0 -y || { echo "Error: Failed to install libxcb-cursor0 using apt. Do you want to continue? (y/n)"; read -r continue_install; }
            ;;
        dnf)
            sudo dnf install xcb-util-cursor -y || { echo "Error: Failed to install xcb-util-cursor using dnf. Do you want to continue? (y/n)"; read -r continue_install; }
            ;;
        pacman)
            sudo pacman -S xcb-util-cursor --noconfirm || { echo "Error: Failed to install xcb-util-cursor using pacman. Do you want to continue? (y/n)"; read -r continue_install; }
            ;;
        zypper)
            sudo zypper install libxcb-cursor0 -y || { echo "Error: Failed to install libxcb-cursor0 using zypper. Do you want to continue? (y/n)"; read -r continue_install; }
            ;;
    esac

    if [ "$continue_install" != "y" ]; then
        echo "Exiting script. Installation aborted."
        exit 1
    fi

    echo
fi

echo "Installing Python and virtual environment..."
case $package_manager in
    apt | dnf)
        sudo $package_manager install python3 python3-pip python3-venv -y || { echo "Error: Failed to install Python dependencies using $package_manager. Do you want to continue? (y/n)"; read -r continue_install; }
        ;;
    pacman)
        sudo $package_manager -S python python-pip python-virtualenv --noconfirm || { echo "Error: Failed to install Python dependencies using pacman. Do you want to continue? (y/n)"; read -r continue_install; }
        ;;
    zypper)
        sudo $package_manager install python3 python3-pip virtualenv -y || { echo "Error: Failed to install Python dependencies using zypper. Do you want to continue? (y/n)"; read -r continue_install; }
        ;;
esac

if [ "$continue_install" != "y" ]; then
    echo "Exiting script. Installation aborted."
    exit 1
fi

echo

echo "Creating and activating virtual environment..."
python3 -m venv metalslugfontreborn || { echo "Error: Failed to create virtual environment. Do you want to continue? (y/n)"; read -r continue_install; }

if [ "$continue_install" != "y" ]; then
    echo "Exiting script. Installation aborted."
    exit 1
fi

source metalslugfontreborn/bin/activate || { echo "Error: Failed to activate virtual environment. Do you want to continue? (y/n)"; read -r continue_install; }

if [ $? -eq 0 ]; then
    echo "Virtual environment activated successfully."
else
    echo "Error: Virtual environment activation failed. Exiting script."
    exit 1
fi
echo

echo "Installing Python packages from requirements.txt..."
pip install -r requirements.txt || { echo "Error: Failed to install Python packages. Do you want to continue? (y/n)"; read -r continue_install; }
echo "The program will not work if you don't install Pillow"

if [ "$continue_install" != "y" ]; then
    echo "Exiting script. Installation aborted."
    exit 1
fi

echo

echo "Deactivating virtual environment..."
deactivate || { echo "Error: Failed to deactivate virtual environment. Do you want to continue? (y/n)"; read -r continue_install; }

if [ "$continue_install" != "y" ]; then
    echo "Exiting script. Installation aborted."
    exit 1
fi

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
