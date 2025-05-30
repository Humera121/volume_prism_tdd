#!/bin/bash

calculate_volume() {
    local height=$1
    local width=$2
    local length=$3

    if [[ -z "$height" || -z "$width" || -z "$length" ]]; then
        echo "Error: Missing argument(s)"
        return 1
    fi

    if ! [[ "$height" =~ ^[0-9]+$ && "$width" =~ ^[0-9]+$ && "$length" =~ ^[0-9]+$ ]]; then
        echo "Error: All arguments must be positive whole numbers"
        return 1
    fi

    volume=$((height * width * length))
    echo "$volume"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    calculate_volume "$@"
fi
