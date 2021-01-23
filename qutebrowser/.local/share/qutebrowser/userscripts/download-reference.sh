#! /bin/bash

tmp_name=/tmp/qutebrowser_$(date "+%Y%m%d%H%M%s").pdf
pdf_url=$(echo "$QUTE_URL" | sed -n "s_.*\(https://.*\.pdf\).*_\1_p")

if [ -z "$pdf_url" ]; then
    >&2 echo "No PDF at URL: $QUTE_URL."
    exit 1
fi

wget -A pdf --user-agent="$QUTE_USER_AGENT" "$pdf_url" -O $tmp_name
emacsclient -ca '' $tmp_name
