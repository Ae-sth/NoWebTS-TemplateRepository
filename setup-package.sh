#!/bin/bash

# Create the package.json
npm init -y

# Read the package.json file into a variable
package_json=$(cat package.json)

# Modify the package.json file to include the scripts field
commands=$(cat commands.json)
package_json=$(echo $package_json | jq `. + $package`)

# Write the modified package.json file back to disk
echo $package_json > package.json

# Get the list of packages from the file
packages=$(cat package.list)

# Install each package using npm
for package in $packages
do
  npm install $package
done
