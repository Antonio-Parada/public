#!/bin/bash
CONFIG="$HOME/Work/adb/devices.list"
export PATH="$HOME/.local/bin:$PATH"

# 1. Build Menu
OPTS=$(cat "$CONFIG" && echo "  Repair Connection|repair-link")

# 2. Select
# We use awk to hide the command part from the user
SELECTED=$(echo -e "$OPTS" | awk -F '|' '{print $1}' | wofi --dmenu --cache-file /dev/null --prompt "Android")

# 3. Execute
# No complex terminal logic needed anymore!
CMD=$(echo -e "$OPTS" | grep "^$SELECTED|" | cut -d '|' -f 2)

if [[ -n "$CMD" ]]; then
    exec "$CMD"
fi
