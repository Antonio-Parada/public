#!/bin/bash
SERIAL="100.97.245.116:5555"

# 1. Connect silently
adb connect $SERIAL > /dev/null 2>&1

# 2. Check Device State (0=Folded, 2=Open)
# We strip any whitespace to be safe
RAW_STATE=$(adb -s $SERIAL shell cmd device_state print-state | tr -d '[:space:]')

# 3. Decision Logic
if [[ "$RAW_STATE" == "0" ]]; then
    # STATE 0: FOLDED -> Target Display 1 (Cover Screen)
    # This enables mouse input on the front screen
    exec scrcpy -s $SERIAL --display-id=1 \
           --window-title "Z Flip 5 (Front)" \
           --always-on-top --stay-awake > /dev/null 2>&1

elif [[ "$RAW_STATE" == "2" ]]; then
    # STATE 2: OPEN -> Target Display 0 (Main Screen)
    # This applies your Pokemon crop
    exec scrcpy -s $SERIAL --display-id=0 \
           --crop 1080:1080:0:780 \
           --window-width 800 --window-height 800 \
           --window-title "Z Flip 5 (Main)" \
           --always-on-top --turn-screen-off --stay-awake > /dev/null 2>&1

else
    # Fallback (Just in case): Default to Front Screen
    exec scrcpy -s $SERIAL --display-id=1 --always-on-top > /dev/null 2>&1
fi
