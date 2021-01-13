# Dot Files and Friends.

Contains my dotfiles.
Uses stow to link files.

## Install

Requires stow.

``` bash
cd ~
git clone https://github.com/DavidRConnell/dotfiles.git .dotfiles
cd .dotfiles
./setup.sh
```

Alternatively use `stow --dotfiles [PACKAGES...]` to manually select packages to install.
The setup.sh script can also be edited to choose packages in a persistent manner.
