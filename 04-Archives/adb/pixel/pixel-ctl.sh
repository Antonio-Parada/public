#!/bin/bash
# Pixel 8 Pro - Tailscale Connection
SERIAL="100.77.195.31:5555"  # <--- REPLACE with your Pixel's Tailscale IP

# 1. Silent Connect
adb connect $SERIAL > /dev/null 2>&1

# 2. Launch (Pixel 8 Pro has a high-res screen, so we limit size for performance)
exec scrcpy -s $SERIAL \
       --window-title "Pixel 8 Pro" \
       --max-size 1024 \
       --max-fps 60 \
       --video-bit-rate 16M \
       --always-on-top --turn-screen-off --stay-awake > /dev/null 2>&1
