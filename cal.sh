#!/bin/bash

# Function to calculate GCD
gcd() {
    echo "scale=0; num1 = $1; num2 = $2; while(num2) { temp = num2; num2 = num1 % num2; num1 = temp } num1" | bc -l -w
}

while true; do
    echo "---------------------------------------------"
    echo "                   M0h4mm3d                   "
    echo "---------------------------------------------"

    # Read the scale with command history support
    read -e -p "scale: " scale

    # Check if the user wants to quit
    if [ "$scale" == "q" ]; then
        echo "Exiting..."
        break
    fi

    # Set default scale if user input is empty
    scale="${scale:-30}"

    # Read the expression with command history support
    read -e -p "Enter the expression: " expression

    # Function to calculate LCM
    lcm() {
        local num1=$1
        local num2=$2
        local gcd_value=$(gcd $num1 $num2)
        echo "scale=${scale}; num1 = $num1; num2 = $num2; lcm = num1 * num2 / $gcd_value; lcm" | bc -l -w
    }

    # Function to calculate HCF
    hcf() {
        echo "scale=${scale}; num1 = $1; num2 = $2; gcd(num1, num2)" | bc -l -w
    }

    # Check if the expression is LCM or HCF
    if [[ $expression == *"lcm("* ]]; then
        result=$(lcm ${expression//[^0-9]/ })
    elif [[ $expression == *"hcf("* ]]; then
        result=$(hcf ${expression//[^0-9]/ })
    else
        # Perform the calculation for basic arithmetic operations
        result=$(echo "scale=${scale};${expression}" | bc -l -w | tr -d '\n\\')
    fi

    # Display the result in green color
    echo -e "\033[32mResult: ${result}\033[0m"

    # Clear the result variable for the next iteration
    unset result
done
