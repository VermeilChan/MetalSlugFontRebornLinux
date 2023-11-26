#!/bin/bash

echo "Choose a version to run:"
echo "1. Windowed Version"
echo "2. Console Version"

read -p "Enter your choice (1 or 2): " choice

sudo apt install libxcb-xinerama0

export QT_QPA_PLATFORM=xcb

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
