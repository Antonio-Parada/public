## Phase 4: The Hotspot (hostapd + dnsmasq)

**Objective:** Turn the internal Wi-Fi card into an Access Point that bridges clients to the `vmbr1` internal network.

### 4.1 Install Packages
We need the Access Point software and the DHCP/DNS server.

1.  **Install tools:**
    ```bash
    apt install hostapd dnsmasq -y
    ```

### 4.2 Configure the Access Point (hostapd)
This defines the Wi-Fi network name and password.

1.  **Edit the config file:**
    ```bash
    nano /etc/hostapd/hostapd.conf
    ```

2.  **Paste the following configuration:**
    *(Change `wlp1s0` to your actual Wi-Fi interface name found in `ip link`)*

    ```ini
    # --- HARDWARE CONFIG ---
    interface=wlp1s0
    driver=nl80211

    # --- NETWORK LINK ---
    # Crucial: This connects the Wi-Fi signal to the internal bridge
    bridge=vmbr1

    # --- WI-FI SETTINGS ---
    ssid=Proxmox_Station
    hw_mode=g
    channel=7
    wmm_enabled=0
    macaddr_acl=0
    auth_algs=1
    ignore_broadcast_ssid=0

    # --- SECURITY (WPA2) ---
    wpa=2
    wpa_passphrase=SetYourStrongPasswordHere
    wpa_key_mgmt=WPA-PSK
    wpa_pairwise=TKIP
    rsn_pairwise=CCMP
    ```

3.  **Point the daemon to the config:**
    Edit `/etc/default/hostapd`:
    ```bash
    nano /etc/default/hostapd
    ```
    Uncomment/Edit the `DAEMON_CONF` line:
    ```bash
    DAEMON_CONF="/etc/hostapd/hostapd.conf"
    ```

### 4.3 Configure DHCP & DNS (dnsmasq)
This assigns IP addresses to your TV and provides the "Offline Domain" feature.

1.  **Backup original config:**
    ```bash
    mv /etc/dnsmasq.conf /etc/dnsmasq.conf.bak
    ```

2.  **Create new config:**
    ```bash
    nano /etc/dnsmasq.conf
    ```

3.  **Paste the Configuration:**

    ```ini
    # Listen only on the internal bridge (Don't mess with other interfaces)
    interface=vmbr1
    bind-interfaces

    # DHCP Range for Clients (TV, Phone, Laptop, etc.)
    # Assigns IPs from .50 to .150, valid for 12 hours
    dhcp-range=10.10.20.50,10.10.20.150,12h

    # DNS Settings (Use Google DNS for upstream)
    server=8.8.8.8
    server=8.8.4.4

    # --- THE OFFLINE MAGIC ---
    # Maps 'proxmox.local' to the Gateway IP
    # Allows you to type [https://proxmox.local:8006](https://proxmox.local:8006) on the TV even without internet
    address=/proxmox.local/10.10.20.1
    ```

### 4.4 Activate Services
Debian often masks hostapd by default. We must unmask and enable it.

1.  **Unmask and Enable:**
    ```bash
    systemctl unmask hostapd
    systemctl enable hostapd
    systemctl enable dnsmasq
    ```

2.  **Start Services:**
    ```bash
    systemctl restart dnsmasq
    systemctl restart hostapd
    ```

### 4.5 Verification
Take out your phone (disconnect from USB tether first) or use another device.

1.  **Scan for Wi-Fi:**
    Look for **"Proxmox_Station"**.

2.  **Connect:**
    Connect and check your IP address. It should be in the `10.10.20.x` range.
