#!/usr/bin/env bash

# Taken from https://dev.to/writingcode/how-i-manage-my-dotfiles-using-gnu-stow-4l59

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

# what directories should be installable by all users including the root user
base=(
    bash
    nvim
    tmux
)

# folders that should, or only need to be installed for a local user
useronly=(
    zsh
    bin
    git
    isync
    latex
    pass-git-helper
    topgrade
    qutebrowser
    xdg-mime
    zathura
)

# run the stow command for the passed in directory ($2) in location $1
stowit() {
    usr=$1
    app=$2
    stow --dotfiles --verbose --restow --target=${usr} ${app}
}

echo ""
echo "Stowing apps for user: $(whoami)"

# install apps available to local users and root
for app in "${base[@]}"; do
    stowit "${HOME}" "$app"
done

# install only user space folders
for app in "${useronly[@]}"; do
    if [[ ! "$(whoami)" = *"root"* ]]; then
        stowit "${HOME}" "$app"
    fi
done

echo ""
echo "Done stowing"
