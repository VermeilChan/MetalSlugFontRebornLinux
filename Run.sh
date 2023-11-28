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
        deactivate
        exit 1
        ;;
esac

if [ $? -ne 0 ]; then
    echo "If the GUI version doesn't work for you even if you install xcb"
    echo "please check this GitHub discussions: https://github.com/NVlabs/instant-ngp/discussions/300"
fi

deactivate
