#!/bin/bash
# Install script for fzf configuration

echo "Setting up fzf configuration..."

# Create symlink to the portable fzf configuration
# This will be sourced by .zshrc
if [ -f "${HOME}/.fzf.zsh" ] && [ ! -L "${HOME}/.fzf.zsh" ]; then
    echo "Backing up existing .fzf.zsh to .fzf.zsh.backup"
    mv "${HOME}/.fzf.zsh" "${HOME}/.fzf.zsh.backup"
fi

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create symlink to the portable version
ln -sf "${SCRIPT_DIR}/fzf.zsh" "${HOME}/.fzf.zsh"
echo "Created symlink: ~/.fzf.zsh -> ${SCRIPT_DIR}/fzf.zsh"

echo "fzf configuration installed successfully!"