#!/usr/bin/env bash

# Prefetch source code and copy the sha256 to the clipboard.

if [ -z "$QUTE_URL" ]; then
    >&2 echo "No source found at: $QUTE_URL."
    exit 1
fi

nix-prefetch-url "$QUTE_URL" | tail -n 1 | tr -d '\n' | xclip -selection clipboard
