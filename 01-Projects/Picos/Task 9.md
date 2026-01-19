## Phase 9: The "Dual-Wield" Bonus (Secondary USB Wi-Fi)

**Objective:** Configure a secondary USB Wi-Fi adapter to act as a dedicated "Client Radio" (WAN), connecting to external networks (Home/Starbucks) while the internal card remains a dedicated Hotspot.

### 9.1 Identify the Second Radio
Plug in your USB Wi-Fi adapter now.

1.  **Check Interfaces:**
    ```bash
    ip link
    ```

2.  **Identify the names:**
    * `wlp...` (Likely your Internal card -> Assigned to Hostapd).
    * `wlx...` (Likely your USB Adapter -> Starts with 'wlx' + MAC address).
    * *Write down the specific name of the USB adapter (e.g., `wlx00c0ca96d35c`).*

### 9.2 Configure Client Connection (nmtui)
We use NetworkManager to handle this adapter because it makes connecting to random public Wi-Fi easy.

1.  **Open the UI:**
    ```bash
    nmtui
    ```

2.  **Select "Activate a connection".**
    * You should see a list of Wi-Fi networks detected by the USB adapter.
    * Connect to your Home Wi-Fi or Phone Hotspot.

3.  **Verify Connectivity:**
    Exit `nmtui` and ping the outside world:
    ```bash
    ping -c 3 8.8.8.8
    ```

### 9.3 Update NAT Routing (The "Failover" Pipe)
We need to tell the Proxmox internal network (`10.10.20.x`) that it is allowed to route traffic through *both* the USB Cable (`usb0`) AND the USB Wi-Fi (`wlx...`).

1.  **Edit Interfaces:**
    ```bash
    nano /etc/network/interfaces
    ```

2.  **Update the `vmbr1` block:**
    Add the second pair of `post-up/post-down` rules for the new interface.

    ```text
    auto vmbr1
    iface vmbr1 inet static
        address 10.10.20.1/24
        # ... (keep existing bridge settings) ...
        
        # --- PRIMARY ROUTE (Phone USB) ---
        post-up   iptables -t nat -A POSTROUTING -s '10.10.20.0/24' -o usb0 -j MASQUERADE
        post-down iptables -t nat -D POSTROUTING -s '10.10.20.0/24' -o usb0 -j MASQUERADE
        
        # --- SECONDARY ROUTE (USB Wi-Fi Stick) ---
        # Replace 'wlxYOUR_ID' with your actual USB adapter name
        post-up   iptables -t nat -A POSTROUTING -s '10.10.20.0/24' -o wlxYOUR_ID -j MASQUERADE
        post-down iptables -t nat -D POSTROUTING -s '10.10.20.0/24' -o wlxYOUR_ID -j MASQUERADE
    ```

3.  **Apply Changes:**
    ```bash
    ifreload -a
    ```

### 9.4 Verification (The Unplug Test)
1.  **Connect** the USB Wi-Fi to a local network.
2.  **Unplug** the USB Phone Tether.
3.  **Check TV:** Your Android TV (connected to the internal hotspot) should still have internet access, now seamlessly flowing through the USB stick.
