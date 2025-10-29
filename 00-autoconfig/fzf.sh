#!/usr/bin/env bash

# Install fzf if not already present
if [ ! -d "${HOME}/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf
    ${HOME}/.fzf/install
else
    echo "fzf already installed at ${HOME}/.fzf"
fi

# Install fzf-tab plugin if not already present
FZF_TAB_DIR="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab"
if [ ! -d "$FZF_TAB_DIR" ]; then
    git clone https://github.com/Aloxaf/fzf-tab "$FZF_TAB_DIR"
else
    echo "fzf-tab already installed at $FZF_TAB_DIR"
fi

# Check for ncurses development headers before attempting to build
if ! pkg-config --exists ncurses 2>/dev/null && ! [ -f /usr/include/ncurses.h ]; then
    echo "Warning: ncurses development headers not found."
    echo "To build the fzf-tab binary module for better performance, install:"
    echo "  Ubuntu/Debian: sudo apt-get install libncurses5-dev libncursesw5-dev"
    echo "  Fedora/RHEL: sudo dnf install ncurses-devel"
    echo "  Arch: sudo pacman -S ncurses"
    echo ""
    echo "Skipping fzf-tab module build. The plugin will still work, but may be slower."
else
    # Build the fzf-tab module using zsh
    echo "Building fzf-tab binary module..."
    cd "$FZF_TAB_DIR"
    if zsh -c "source ./fzf-tab.plugin.zsh && build-fzf-tab-module" 2>/dev/null; then
        echo "fzf-tab module built successfully"
    else
        echo "Warning: Failed to build fzf-tab module. The plugin will still work, but may be slower."
    fi
    cd - > /dev/null
fi

sed -i 's/cursor_y \* 2 > window_height/cursor_y \* 1\.8 > window_height/g' ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab/lib/ftb-tmux-popup
