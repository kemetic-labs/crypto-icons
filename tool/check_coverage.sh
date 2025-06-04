#!/bin/bash

# Generate coverage report
echo "Generating coverage report..."
fvm flutter test --coverage

# Check if lcov is installed
if ! command -v lcov &> /dev/null; then
    echo "lcov is not installed. Installing..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        brew install lcov
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        sudo apt-get update
        sudo apt-get install -y lcov
    else
        echo "Unsupported OS. Please install lcov manually."
        exit 1
    fi
fi

# Generate HTML report
echo "Generating HTML report..."
genhtml coverage/lcov.info -o coverage/html

# Print coverage statistics
echo "Coverage statistics:"
lcov --summary coverage/lcov.info

echo "Done!"
