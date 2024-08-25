#!/bin/bash

# Find the root directory of the Git repository
root_dir=$(git rev-parse --show-toplevel)

# Change directory to the root directory
cd "$root_dir"

# Print the current working directory to confirm the change
pwd
