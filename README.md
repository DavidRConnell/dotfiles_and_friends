# Dot Files and Friends.

**Work in progress**

Contains all my config files (including those that are not true dotfiles
) along with an install script for linking the files and downloading
installing other git repos and some other basic tasks for setting up a new
computer.

## Install

All files in the $HOME/dotfiles_and_friends (or where ever the repo is
moved to) that are not hidden will be moved into the $HOME directory
following the same folder paths as in the $HOME/dotfiles_and_friends. Since
hidden files are ignored, the leading dot in dotfiles_and_friends names
should be replaced with a '\_' to identify them as dotfiles_and_friends.

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
