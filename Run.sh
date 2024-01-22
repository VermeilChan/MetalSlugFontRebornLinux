#!/bin/bash

METALSLUG_ENV="metalslugfontreborn"

show_menu() {
    echo "Choose a version to run:"
    echo "1. Windowed Version"
    echo "2. Console Version"
    echo "3. Exit"
}

run_version() {
    case $1 in
        1)
            python3 Src/windowed-version.py
            ;;
        2)
            python3 Src/console-version.py
            ;;
        3)
            echo "Exiting."
            deactivate
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
}

source $METALSLUG_ENV/bin/activate

while true; do
    show_menu

    read -p "Enter your choice (1, 2, or 3 to exit): " choice

    run_version $choice

    if [ $? -ne 0 ]; then
        echo ""
        echo "If the GUI version isn't working for you, even after installing xcb."
        echo "Please refer to the discussions on GitHub at https://github.com/NVlabs/instant-ngp/discussions/300."
        echo ""
        echo "Or, check if a new Qt6 update has been released."
        echo "If so, you may need to wait until PyQt6 updates or use the CLI version."
        echo ""
    fi
done
