## Phase 3: The Networking Layer (Bridge + NAT)

**Objective:** Create the private `10.10.20.x` subnet for the "Casting Station" and configure traffic forwarding so the laptop acts as a router.

### 3.1 Enable IP Forwarding
We must tell the Linux kernel to allow traffic to pass *through* the laptop, not just *to* it.

1.  **Edit sysctl.conf:**
    ```bash
    nano /etc/sysctl.conf
    ```

2.  **Uncomment/Add this line:**
    Find `net.ipv4.ip_forward=1` and remove the `#` at the start.
    ```text
    net.ipv4.ip_forward=1
    ```

3.  **Apply changes:**
    ```bash
    sysctl -p
    ```

### 3.2 Configure the Network Interfaces
We will define `vmbr1` as the Gateway for your private cloud. We also set up the "Life Support" link for USB Tethering.

1.  **Find your interface names (Optional check):**
    ```bash
    ip link
    # Identify your internal wifi card (e.g., wlp1s0)
    # Identify your USB tether (plug phone in now, usually usb0 or enx...)
    ```

2.  **Edit Interfaces File:**
    ```bash
    nano /etc/network/interfaces
    ```

3.  **Replace content with the "PICOS Core Config":**
    *(Make sure to adjust `wlp1s0` if your card has a different name)*

    ```text
    auto lo
    iface lo inet loopback

    # --- INPUT: USB TETHERING (Phone) ---
    # This is the "Life Raft". When phone is plugged in, internet flows.
    allow-hotplug usb0
    iface usb0 inet dhcp

    # --- OUTPUT: INTERNAL PRIVATE CLOUD (vmbr1) ---
    # The Gateway for your TV and LXC containers.
    # Not bridged to a physical port yet (Hostapd will attach to this).
    auto vmbr1
    iface vmbr1 inet static
        address 10.10.20.1/24
        bridge-ports none
        bridge-stp off
        bridge-fd 0
        
        # --- NAT ROUTING RULES ---
        # Forward traffic from 10.10.20.x out through usb0 (Phone)
        post-up   iptables -t nat -A POSTROUTING -s '10.10.20.0/24' -o usb0 -j MASQUERADE
        post-down iptables -t nat -D POSTROUTING -s '10.10.20.0/24' -o usb0 -j MASQUERADE
        
        # (OPTIONAL: Add secondary NAT for your USB WiFi Adapter if you use it)
        # post-up   iptables -t nat -A POSTROUTING -s '10.10.20.0/24' -o wlxYOUR_ADAPTER_ID -j MASQUERADE
    ```

4.  **Save and Exit:** `Ctrl+O`, `Enter`, `Ctrl+X`.

### 3.3 Apply Networking
Reload the configuration to bring up the bridge.

1.  **Reload:**
    ```bash
    ifreload -a
    ```
    *(If `ifreload` is missing, install `ifupdown2`: `apt install ifupdown2`)*

2.  **Verify:**
    ```bash
    ip a
    ```
    **Success Indicator:** You should see `vmbr1` listed with IP `10.10.20.1`.

