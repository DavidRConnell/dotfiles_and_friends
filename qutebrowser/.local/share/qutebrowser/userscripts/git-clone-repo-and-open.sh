#!/usr/bin/env bash

cd $HOME/clones
git clone ${QUTE_URL}

package=${QUTE_URL##*/}
emacsclient -ca '' "${HOME}/clones/${package}"
