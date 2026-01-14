#!/bin/bash
# Test script to validate the sync logic without actually pushing

echo "Testing .editorconfig sync logic..."

# Check if .editorconfig exists
if [ ! -f .editorconfig ]; then
    echo "Error: .editorconfig file not found"
    exit 1
fi

echo "✓ .editorconfig found"

# Test getting repositories list
echo "Testing repository list retrieval..."
gh search repos --owner linksplatform --limit 5 --json name | jq -r '.[].name' > test-repos.txt

if [ -f test-repos.txt ] && [ -s test-repos.txt ]; then
    echo "✓ Successfully retrieved repository list:"
    cat test-repos.txt
else
    echo "✗ Failed to retrieve repository list"
    exit 1
fi

echo "✓ Test completed successfully"
rm -f test-repos.txt