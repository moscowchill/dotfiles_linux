dotfiles-linux
==========

Linux dotfiles collection for terminal customization and dev tooling.

## Structure

**Shell & Terminal**
- `zsh/` - Oh My Zsh config with custom themes + `zsh_un`/`zsh_hn` for prompt display
- `tmux/` - Terminal multiplexer setup
- `terminator/`, `tilix/`, `st/` - Terminal emulator configs

**Dev Tools**
- `vim/` - Vim configuration
- `git/` - Git aliases and settings
- `sublime/` - Sublime Text preferences
- `obsidian/` - Note-taking setup

**Utilities**
- `ranger/` - File manager
- `mc/` - Midnight Commander
- `fzf/` - Fuzzy finder
- `ssh/` - SSH configurations
- `asciinema/` - Terminal recording

**System**
- `00-autoconfig/` - Auto-configuration scripts
- `05-scripts/` - Utility scripts
- `system/` - System-level configs (gitignored)
- `layouts/` - Window layouts

## Quick Start

Each directory has its own `INSTALL.sh` for symlinking configs to `~/.dotfiles/`.

**Personalization**: Edit `zsh/zsh_un` (username) and `zsh/zsh_hn` (hostname) for custom prompt display.
