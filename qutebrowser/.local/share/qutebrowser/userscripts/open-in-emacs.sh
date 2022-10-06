#!/usr/bin/env bash

tmp_dir="/tmp/qutebrowser/cache"
file_name="${QUTE_URL##*/}"

[ -d "$tmp_dir" ] || mkdir -p "$tmp_dir"
cd "$tmp_dir"

wget --user-agent="$QUTE_USER_AGENT" "$QUTE_URL"
emacsclient -ca '' "$file_name"
