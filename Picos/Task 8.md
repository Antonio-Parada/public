## Phase 8: Reliability Hardening (The USB Watchdog)

**Objective:** Lock the USB Tether interface name to `usb0` permanently (preventing random renaming) and configure a watchdog to auto-restart the connection if it drops.

### 8.1 The "Name Lock" (udev rule)
Android phones often change their internal ID (e.g., `enx...` to `eth1`), breaking network configs. We force Linux to always call it `usb0`.

1.  **Identify your Phone:**
    * Plug your phone in and enable USB Tethering.
    * Run: `lsusb`
    * Look for your phone (e.g., `Google Inc.`, `Samsung`).
    * Note the ID (Format is `VENDOR_ID:PRODUCT_ID`, e.g., `18d1:4ee7`).

2.  **Create the Rule:**
    ```bash
    nano /etc/udev/rules.d/90-phone-tether.rules
    ```

3.  **Add the Configuration:**
    *(Replace `xxxx` and `yyyy` with your specific ID found in step 1)*
    ```bash
    # Force the specific phone to always be named 'usb0'
    SUBSYSTEM=="net", ACTION=="add", ATTRS{idVendor}=="xxxx", ATTRS{idProduct}=="yyyy", NAME="usb0"
    ```

4.  **Reload Rules:**
    ```bash
    udevadm control --reload-rules
    ```

### 8.2 The "Conflict Resolver" (NetworkManager)
We need to stop the Desktop Network Manager from trying to "steal" the USB connection from Proxmox.

1.  **Edit NetworkManager Config:**
    ```bash
    nano /etc/NetworkManager/NetworkManager.conf
    ```

2.  **Add the Ignore Rule:**
    Add these lines at the bottom (or modify the `[keyfile]` section if it exists):
    ```ini
    [keyfile]
    unmanaged-devices=interface-name:usb0
    ```

3.  **Restart NetworkManager:**
    ```bash
    systemctl restart NetworkManager
    ```

### 8.3 The Watchdog Script (Auto-Heal)
If the connection drops (cable bump, phone sleep), this script detects the ping loss and forces a reset.

1.  **Create the Script:**
    ```bash
    nano /usr/local/bin/net-watchdog.sh
    ```

2.  **Paste the Logic:**
    ```bash
    #!/bin/bash
    # Ping Cloudflare DNS to check internet
    ping -c 1 1.1.1.1 > /dev/null 2>&1

    if [ $? -ne 0 ]; then
        echo "$(date): Internet lost. Attempting revive..." >> /var/log/net-watchdog.log
        # Force reload the USB interface
        ifdown usb0 --force
        sleep 2
        ifup usb0
    fi
    ```

3.  **Make Executable:**
    ```bash
    chmod +x /usr/local/bin/net-watchdog.sh
    ```

4.  **Schedule it (Cron):**
    Run `crontab -e` and add this line to run every minute:
    ```bash
    * * * * * /usr/local/bin/net-watchdog.sh
    ```

### 8.4 Verification
1.  **Unplug** your phone.
2.  **Replug** it (ensure "USB Tethering" is active).
3.  Run `ip link`.
4.  **Success Indicator:** The interface is named `usb0` (not `enx...`) and it automatically has an IP address.
