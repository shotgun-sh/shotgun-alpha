#!/bin/bash

set -e

echo "Setting up @proofs-io/shotgun installation..."

# This script will automatically install Node.js via nvm if it's not present
# Node.js 22 is installed to ensure compatibility with the shotgun packages

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if Node.js and npm are installed
if ! command_exists node; then
    echo "Node.js not found. Installing Node.js via nvm..."
    
    # Check if nvm is already installed
    if ! command_exists nvm && [ ! -s "$HOME/.nvm/nvm.sh" ]; then
        echo "Installing nvm..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
        
        # Source nvm for current session (in lieu of restarting the shell)
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    else
        echo "nvm already installed, sourcing..."
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    fi
    
    # Install Node.js 22
    echo "Installing Node.js 22..."
    nvm install 22
    nvm use 22
    
    echo "Node.js $(node --version) and npm $(npm --version) installed successfully!"
elif ! command_exists npm; then
    echo "Node.js found but npm is missing. This is unusual - please install npm manually."
    exit 1
else
    echo "Node.js $(node --version) and npm $(npm --version) already installed."
fi

echo "Installing @proofs-io/shotgun globally..."

# Install the packages globally
npm install -g @proofs-io/shotgun@dev
npm install -g @proofs-io/shotgun-server@dev

echo "Installation complete!"
echo "You can now use 'shotgun' command globally."