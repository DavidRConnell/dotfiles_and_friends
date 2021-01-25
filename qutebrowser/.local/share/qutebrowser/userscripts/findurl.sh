#!/bin/bash

# Find the URL inside a string.
# Opitional argument --ext looks for a url with that file extension.
# Example:
#   findurl --ext=pdf $string

if [ "$#" -gt 1 ]; then
    ext=${1#*=}
    shift
else
    ext='[a-zA-Z]\+'
fi

echo "$1" | sed -n "s_.*\(https\?://.*\.$ext\).*_\1_p"
