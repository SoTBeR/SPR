#!/bin/sh

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$CURRENT_DIR/../.." && pwd)"

if [ -f "/opt/homebrew/bin/dosbox-x" ]; then
    DOSBOX_BIN="/opt/homebrew/bin/dosbox-x"
else
    DOSBOX_BIN="/usr/local/bin/dosbox-x"
fi

if [ -f "$CURRENT_DIR/dosbox.conf" ]; then
    CONF_ARG="-conf $CURRENT_DIR/dosbox.conf"
else
    CONF_ARG=""
fi

"$DOSBOX_BIN" $CONF_ARG \
    -c "mount c \"$ROOT_DIR\"" \
    -c "c:" \
    -c "\EXE\SAPR_B31\FILES\SAPR_B31.EXE" \
    -c "exit"

osascript -e 'tell application "Terminal" to close front window' & exit
