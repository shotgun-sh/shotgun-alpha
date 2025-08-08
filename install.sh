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
        
        # Install nvm
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
        
        # Source nvm for current session
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        
        # Manually add nvm to shell profiles since the installer may not work reliably
        echo "Adding nvm to shell profiles..."
        NVM_PROFILE_CONTENT='
# NVM configuration added by shotgun installer
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion'
        
        # Always add to .profile as universal fallback
        if ! grep -q "NVM_DIR.*nvm.sh" "$HOME/.profile" 2>/dev/null; then
            echo "$NVM_PROFILE_CONTENT" >> "$HOME/.profile"
            echo "Added nvm to .profile"
        else
            echo "nvm already configured in .profile"
        fi
        
        # Add to shell-specific profiles
        if [[ "$SHELL" == *"zsh"* ]] || [ -f "$HOME/.zshrc" ]; then
            if ! grep -q "NVM_DIR.*nvm.sh" "$HOME/.zshrc" 2>/dev/null; then
                touch "$HOME/.zshrc"
                echo "$NVM_PROFILE_CONTENT" >> "$HOME/.zshrc"
                echo "Added nvm to .zshrc"
            else
                echo "nvm already configured in .zshrc"
            fi
        fi
        
        if [[ "$SHELL" == *"bash"* ]] || [ -f "$HOME/.bashrc" ]; then
            if ! grep -q "NVM_DIR.*nvm.sh" "$HOME/.bashrc" 2>/dev/null; then
                touch "$HOME/.bashrc"
                echo "$NVM_PROFILE_CONTENT" >> "$HOME/.bashrc"
                echo "Added nvm to .bashrc"
            else
                echo "nvm already configured in .bashrc"
            fi
        fi
        
    else
        echo "nvm already installed, sourcing..."
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    fi
    
    # Verify nvm is working before proceeding
    if ! command_exists nvm; then
        echo "ERROR: nvm is still not available after installation attempts."
        echo "Please try running the following manually:"
        echo "  export NVM_DIR=\"\$HOME/.nvm\""  
        echo "  [ -s \"\$NVM_DIR/nvm.sh\" ] && \\. \"\$NVM_DIR/nvm.sh\""
        echo "  nvm install 22"
        exit 1
    fi
    
    # Install Node.js 22
    echo "Installing Node.js 22..."
    nvm install 22
    nvm use 22
    
    # Set Node.js 22 as the default version for new shell sessions
    echo "Setting Node.js 22 as default version..."
    nvm alias default 22
    
    echo "Node.js $(node --version) and npm $(npm --version) installed successfully!"
elif ! command_exists npm; then
    echo "Node.js found but npm is missing. This is unusual - please install npm manually."
    exit 1
else
    echo "Node.js $(node --version) and npm $(npm --version) already installed."
fi

echo "Installing @proofs-io/shotgun globally..."

# Pre-install uv to avoid postinstall script failures
echo "Pre-installing uv to ensure setup.sh succeeds..."
if ! command -v uv >/dev/null 2>&1; then
    # Try multiple methods to install UV
    UV_INSTALLED=false
    
    # Method 1: Official installer (try but don't fail if it has issues)
    if curl -LsSf https://astral.sh/uv/install.sh | sh >/dev/null 2>&1; then
        export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
        if command -v uv >/dev/null 2>&1; then
            UV_INSTALLED=true
            echo "UV installed via official installer"
        fi
    fi
    
    # Method 2: Try pip install if Python is available and method 1 failed
    if [ "$UV_INSTALLED" = false ] && (command -v python3 >/dev/null 2>&1 || command -v python >/dev/null 2>&1); then
        PYTHON_CMD=python3
        if ! command -v python3 >/dev/null 2>&1; then
            PYTHON_CMD=python
        fi
        
        if $PYTHON_CMD -m pip install uv --user >/dev/null 2>&1; then
            export PATH="$HOME/.local/bin:$PATH"
            if command -v uv >/dev/null 2>&1; then
                UV_INSTALLED=true
                echo "UV installed via pip"
            fi
        fi
    fi
    
    # Method 3: Try system package manager if available
    if [ "$UV_INSTALLED" = false ]; then
        if command -v apt-get >/dev/null 2>&1; then
            echo "Attempting to install Python and pip via apt..."
            apt-get update >/dev/null 2>&1 && apt-get install -y python3-pip >/dev/null 2>&1
            if python3 -m pip install uv --user >/dev/null 2>&1; then
                export PATH="$HOME/.local/bin:$PATH"
                if command -v uv >/dev/null 2>&1; then
                    UV_INSTALLED=true
                    echo "UV installed via apt + pip"
                fi
            fi
        fi
    fi
    
    if [ "$UV_INSTALLED" = false ]; then
        echo "Warning: Could not pre-install UV. The setup.sh postinstall script may fail."
        echo "You may need to install UV manually: curl -LsSf https://astral.sh/uv/install.sh | sh"
    fi
else
    echo "UV is already available"
fi

npm uninstall -g @proofs-io/shotgun
npm uninstall -g @proofs-io/shotgun-server
npm cache clean --force
npm install -g @proofs-io/shotgun --force
npm install -g @proofs-io/shotgun-server --force

echo "Installation complete!"

# Final verification and user instructions
echo ""
echo "=== Installation Summary ==="
if command_exists node; then
    echo "✓ Node.js: $(node --version)"
fi
if command_exists npm; then
    echo "✓ npm: $(npm --version)"  
fi
if command_exists shotgun; then
    echo "✓ shotgun CLI is available"
else
    echo "⚠ shotgun CLI installation may need a shell restart"
fi
if command_exists shotgund; then
    echo "✓ shotgund server is available"
else 
    echo "⚠ shotgund server installation may need a shell restart"
fi

echo ""
echo "You can now use 'shotgun' command globally."
echo "If it's not immediately available, please restart your shell or run:"
echo "  source ~/.bashrc   (for bash users)"
echo "  source ~/.zshrc    (for zsh users)"
echo ""
