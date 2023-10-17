#!/bin/bash

# Function to run a Python script and check the exit status
run_python_script() {
    python3 "$1"
    local exit_status=$?
    if [ $exit_status -ne 0 ]; then
        echo "Error: Script $1 failed with exit code $exit_status"
        exit $exit_status
    fi
}

# Run the windowed version
run_python_script "Src/windowed-version.py"

# If the windowed version fails, run the console version
if [ $? -ne 0 ]; then
    echo "Windowed version failed. Running console version..."
    run_python_script "Src/console-version.py"

    # Check the exit status of the console version
    if [ $? -ne 0 ]; then
        echo "Console version also failed."
    fi
fi