## Phase 10: Final Polish (Aliases & Maintenance)

**Objective:** Create "Shortcut Commands" (Aliases) to make managing the system easier and customize the SSH login banner for a professional "Mission Control" feel.

### 10.1 Create "PICOS" Aliases
Instead of remembering long systemctl commands, we create simple shortcuts for the `root` user.

1.  **Edit Bash Config:**
    ```bash
    nano /root/.bashrc
    ```

2.  **Add these lines to the bottom:**

    ```bash
    # --- PICOS CONTROL CENTER ---

    # 1. STATUS CHECK
    # Usage: Type 'picos-status' to see IPs and Service Health
    alias picos-status='echo "--- NETWORK ---"; ip -br a; echo ""; echo "--- SERVICES ---"; systemctl status hostapd dnsmasq cloudflared --no-pager'

    # 2. QUICK RESTART (Hotspot)
    # Usage: Type 'picos-reset-wifi' if the TV connection acts up
    alias picos-reset-wifi='systemctl restart hostapd dnsmasq && echo "Hotspot Rebooted."'

    # 3. TUNNEL CHECK
    # Usage: Type 'picos-tunnel' to see the live Cloudflare logs
    alias picos-tunnel='journalctl -u cloudflared -f'

    # 4. SYSTEM UPDATE
    # Usage: Type 'picos-update' to safely update Debian & Proxmox
    alias picos-update='apt update && apt full-upgrade -y && apt autoremove -y && echo "System Updated."'
    ```

3.  **Apply Changes:**
    ```bash
    source /root/.bashrc
    ```

### 10.2 Custom Login Banner (MOTD)
Set a custom "Message of the Day" that appears whenever you SSH in.

1.  **Edit MOTD:**
    ```bash
    nano /etc/motd
    ```

2.  **Paste your Banner:**

    ```text
    ===================================================
      SYSTEM:  PICOS (Proxmox Casting Station)
      STATUS:  OPERATIONAL
      IP ADDR: 10.10.20.1 (Gateway)
    ===================================================
      > Type 'picos-status' for telemetry.
      > Type 'startx' to launch Dashboard manually.
    ===================================================
    ```

### 10.3 Final System Seal (Cleanup)
Clear out the installation debris to free up space on your 8GB RAM setup.

1.  **Clean Cache:**
    ```bash
    apt clean
    rm -rf /var/lib/apt/lists/*
    ```

2.  **Disable Unused Services:**
    Disable Bluetooth to save resources (unless you need it).
    ```bash
    systemctl disable bluetooth
    systemctl stop bluetooth
    ```

### 10.4 The Final Reboot
Perform one last full system reboot to prove everything starts automatically.

1.  **Reboot:**
    ```bash
    reboot
    ```

2.  **The "Success" Checklist:**
    * [ ] Boot is silent (Plymouth Splash).
    * [ ] Screen loads Chromium Proxmox Login.
    * [ ] "Proxmox_Station" Wi-Fi is visible on your phone.
    * [ ] SSH login shows your custom Banner.
    * [ ] `picos-status` command works.
