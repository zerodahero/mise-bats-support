#!/bin/bash
# test/test.sh
set -e

echo "Testing bats-support plugin..."

# Install the plugin
mise plugin install bats-support .

# Test basic functionality
if [[ "$(mise ls-remote bats-support)" == "" ]]; then
    echo "ERROR: No versions available"
    exit 1
fi

# Test basic functionality
mise install bats-support@latest
mise use bats-support@latest

# Verify installation
mise exec bats-support:tool -- [[ -n "$BATS_LIB_PATH" ]] || { echo "BATS_LIB_PATH is not set"; exit 1; }

# Clean up
mise plugin remove bats-support

echo "All tests passed!"
