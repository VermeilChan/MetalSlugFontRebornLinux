#!/bin/bash

source metalslugfontreborn/bin/activate

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

deactivate
