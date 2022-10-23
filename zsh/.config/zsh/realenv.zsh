# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ZSH files
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export HISTSIZE=50000
export SAVEHIST=50000

# Editors
export EDITOR="emacsclient -ca ''"
export VISUAL="emacsclient -ca ''"

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export STOW_DIR="$HOME/.dotfiles"
