#!/bin/bash

while true; do
    echo "---------------------------------------------"
    echo "                   M0h4mm3d                   "
    echo "---------------------------------------------"
    read -p "Enter scale (def=30): " scale

    # Check if the user wants to quit
    if [ "$scale" == "q" ]; then
        echo "Exiting..."
        break
    fi

    # Set default scale if user input is empty
    scale="${scale:-30}"

    read -p "Enter the expression: " expression

    # Perform the calculation and remove line breakers and slashes
    result=$(echo "scale=${scale};${expression}" | bc -l -w | tr -d '\n\\')

    # Display the result
    echo "Result: ${result}"

    # Clear the result variable for the next iteration
    unset result
done
