#!/bin/bash
# Dependencies: adb, zenity

# 1. The Prompt
# This creates a nice floating dialog asking the user to connect.
if ! zenity --question \
    --title="Android Repair" \
    --text="<b>Connection Lost?</b>\n\n1. Connect your device via USB.\n2. Click 'Proceed' below." \
    --ok-label="Proceed" \
    --cancel-label="Cancel" \
    --width=300; then
    exit 0
fi

# 2. The Check (with a progress bar)
(
    echo "10"; echo "# Waiting for device..."
    adb wait-for-device
    
    echo "50"; echo "# Injecting TCP Mode (Port 5555)..."
    adb -d tcpip 5555
    sleep 2
    
    echo "90"; echo "# Verifying..."
    if adb -d shell netstat -an | grep -q "5555"; then
        echo "100"; echo "# Success!"
    else
        echo "100"; echo "# Failed!"
        exit 1
    fi
) | zenity --progress --title="Android Repair" --auto-close --pulsate

# 3. The Result
if [ $? -eq 0 ]; then
    zenity --info --text="<b>Success!</b>\n\nWireless bridge restored.\nYou may unplug the cable." --width=250
else
    zenity --error --text="<b>Injection Failed.</b>\n\nCheck if 'USB Debugging' is enabled." --width=250
fi
