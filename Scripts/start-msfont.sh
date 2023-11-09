#!/bin/bash

# Ask the user to choose a version
PS3="Please choose a version (enter the number): "
options=("Windowed Version" "Console Version")

select version in "${options[@]}"; do
  case $REPLY in
    1)
      echo "Running windowed version..."
      python3 Src/windowed-version.py
      ;;
    2)
      echo "Running console version..."
      python3 Src/console-version.py
      ;;
    *)
      echo "Invalid option. Please select 1 for Windowed Version or 2 for Console Version."
      ;;
  esac
done
