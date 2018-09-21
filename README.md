# Dotfiles
Contains all my config files (including those that are not true dotfiles
and excluding all my vim configuration files which are in vimconfig) along
with an install script for linking the files.

In the future the install script will also install some git repos and
perform some other basic tasks for setting up a new computer.

## Install

All files in the $HOME/dotfiles (or where ever the repo is moved to) that
are not hidden will be moved into the $HOME directory following the same
folder paths as in the $HOME/dotfiles. Since hidden files are ignored, the
leading dot in dotfiles names should be replaced with a '\_' to identify
them as dotfiles.

Hidden files and directories will be untouched and as such can be used to
store non config files like the install script itself and the meta\_data
folder containing additional info that may be useful for setting up a new
computer.

To install the repo enter the following into a terminal

``` bash
cd ~
git clone https://github.com/DavidRConnell/dotfiles.git
cd dotfiles
./.install
```
