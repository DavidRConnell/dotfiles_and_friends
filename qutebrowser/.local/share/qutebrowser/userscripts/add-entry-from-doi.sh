#!/usr/bin/env bash

# Add a doi to the master bib and try to download the associated pdf.

doi=$(echo $QUTE_URL | sed -n "s_https://doi.org/\(.*\)_\1_p")
bibfile="$HOME/notes/zettle/references/master.bib"

emacsclient --eval "(doi-utils-add-bibtex-entry-from-doi \"$doi\" \"$bibfile\")"
