#!/usr/bin/env bash

cd $HOME/clones
git clone ${QUTE_URL}

echo "message-info \"Done cloning ${QUTE_URL}\"" >${QUTE_FIFO}
