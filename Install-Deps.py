import os
import sys
import subprocess

def get_user_input():
    return input("Enter your package manager (apt/dnf/pacman/zypper): ").lower()

def check_sudo():
    try:
        subprocess.run(["sudo", "-v"], check=True)
    except subprocess.CalledProcessError:
        print("Error: This script requires sudo privileges.")
        sys.exit(1)

def run_command(command):
    try:
        subprocess.run(command, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error: {e}")
        sys.exit(1)

def update_packages(package_manager):
    print(f"Updating packages using {package_manager}...")
    run_command(["sudo", package_manager, "update", "-y"])

def install_python_pip_venv(package_manager):
    print(f"Installing Python, pip, and venv using {package_manager}...")
    run_command(["sudo", package_manager, "install", "-y", "python3", "python3-pip", "python3-venv"])

def create_virtual_environment():
    print("Creating virtual environment...")
    run_command(["sudo", "python3", "-m", "venv", "venv"])

def activate_virtual_environment():
    print("Activating virtual environment...")
    activate_script = os.path.join("venv", "bin", "activate")
    run_command([activate_script])

def install_packages_from_requirements_txt():
    print("Installing packages from requirements.txt...")
    run_command(["pip", "install", "--no-cache-dir", "-r", "requirements.txt"])

def deactivate_virtual_environment():
    print("Deactivating virtual environment...")
    run_command(["deactivate"])

def main():
    package_manager = get_user_input()
    check_sudo()

    print("Selected package manager:", package_manager)

    update_packages(package_manager)
    install_python_pip_venv(package_manager)

    create_virtual_environment()
    activate_virtual_environment()
    install_packages_from_requirements_txt()
    deactivate_virtual_environment()

if __name__ == "__main__":
    main()
