#!/bin/bash

while true; do
    echo "---------------------------------------------"
    echo "                   M0h4mm3d                   "
    echo "---------------------------------------------"

    # Read the scale with command history support
    read -e -p "scale:" scale

    # Check if the user wants to quit
    if [ "$scale" == "q" ]; then
        echo "Exiting..."
        break
    fi

    # Set default scale if user input is empty
    scale="${scale:-30}"

    # Read the expression with command history support
    read -e -p "Enter the expression: " expression

    # Perform the calculation and remove line breakers and slashes
    result=$(echo "scale=${scale};${expression}" | bc -l -w | tr -d '\n\\')

    # Display the result in green color
    echo -e "\033[32mResult: ${result}\033[0m"

    # Clear the result variable for the next iteration
    unset result
done
