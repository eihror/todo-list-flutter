#!/bin/bash

# Exit the script on any command with non-zero exit status
set -e

echo "Do you use fvm? (Y/n)"
read -r fvmUser

# If no answer is provided, default to 'y'
fvmUser=${fvmUser:-y}

coverage_cmd=""

if [ "$fvmUser" = "y" ] || [ "$fvmUser" = "Y" ]; then
  echo "Using FVM"
  coverage_cmd+="fvm flutter test --coverage"
else
  echo "Not using FVM"
  coverage_cmd+="flutter test --coverage"
fi

# Add here folders and/or files you want to exclude: Example exclude_paths=("lib/mock/*" "lib/utils/l10n/*" "lib/utils/colors.dart")
exclude_paths=("*/navigation")

# Print the current working directory
echo "Running Flutter coverage in $(pwd)"

# Clean coverage folder
echo "Cleaning previous coverage"
rm -rf coverage

# Run Flutter tests with coverage
echo "Running Flutter tests..."
eval $coverage_cmd

# Check if lcov is installed
if ! command -v lcov &>/dev/null; then
  echo "lcov could not be found. Please install it to generate coverage reports."
  exit 1
fi

# Generate the coverage report
echo "Generating coverage report..."

lcov_cmd="lcov --remove coverage/lcov.info"

for path in "${exclude_paths[@]}"; do
  lcov_cmd+=" '$path'"
done

lcov_cmd+=" -o coverage/new_lcov.info"
eval $lcov_cmd

genhtml coverage/new_lcov.info --output-directory coverage/html

# Open the generated report (optional)
echo "Opening coverage report..."
open coverage/html/index.html || start coverage/html/index.html

echo "Coverage report generated successfully."
