#!/bin/bash

# Function to check if a file exists
file_exists() {
  [ -f "$1" ]
}

# Ask the user to choose a version
PS3="Please choose a version (enter the number): "
options=("Windowed Version" "Console Version")

select version in "${options[@]}"; do
  case $REPLY in
    1)
      if file_exists "Src/windowed-version.py"; then
        echo "Running windowed version..."
        python3 Src/windowed-version.py
        if [ $? -eq 0 ]; then
          echo "Windowed version executed successfully."
          exit 0
        fi
      else
        echo "Error: Windowed version not found."
        exit 1
      fi
      ;;
    2)
      if file_exists "Src/console-version.py"; then
        echo "Running console version..."
        python3 Src/console-version.py
        if [ $? -eq 0 ]; then
          echo "Console version executed successfully."
          exit 0
        fi
      else
        echo "Error: Console version not found."
        exit 1
      fi
      ;;
    *)
      echo "Invalid option. Please select 1 for Windowed Version or 2 for Console Version."
      ;;
  esac
done
