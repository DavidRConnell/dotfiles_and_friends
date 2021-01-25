#!/bin/bash

# Download pdf at url and open.

tmp_name=/tmp/qutebrowser_$(date "+%Y%m%d%H%M%s").pdf
pdf_url=$($(dirname $0)/findurl.sh --ext=pdf "$QUTE_URL")

if [ -z "$pdf_url" ]; then
    >&2 echo "No PDF at URL: $QUTE_URL."
    exit 1
fi

wget -A pdf --user-agent="$QUTE_USER_AGENT" "$pdf_url" -O $tmp_name
xdg-open $tmp_name
