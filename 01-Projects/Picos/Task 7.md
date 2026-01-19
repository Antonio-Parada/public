## Phase 7: The Cloud Tunnel (LXC + Cloudflared)

**Objective:** Create a dedicated container to run the Cloudflare Tunnel daemon, exposing the local Proxmox dashboard to the internet via a secure, clean URL.

### 7.1 Download LXC Template
We need a base OS image for our container. Debian 12 is small and stable.

1.  **Update Template List:**
    ```bash
    pveam update
    ```

2.  **Download Template:**
    ```bash
    pveam download local debian-12-standard_12.7-1_amd64.tar.zst
    ```
    *(Note: Version numbers change; use `pveam available` to check exact names if this fails).*

### 7.2 Create the Tunnel Container
We will create a container with ID `100` attached to our internal `vmbr1` network.

1.  **Run Creation Command:**
    ```bash
    pct create 100 local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst \
      --hostname tunnel-node \
      --net0 name=eth0,bridge=vmbr1,ip=10.10.20.5/24,gw=10.10.20.1 \
      --storage local \
      --memory 512 \
      --cores 1 \
      --password YourContainerRootPassword \
      --unprivileged 1 \
      --start 1
    ```

2.  **Enter the Container:**
    ```bash
    pct enter 100
    ```

### 7.3 Install Cloudflare Tunnel (Inside LXC)
Now that you are inside the container (`root@tunnel-node`), install the agent.

1.  **Download & Install:**
    ```bash
    curl -L --output cloudflared.deb [https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb](https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb)
    dpkg -i cloudflared.deb
    ```

### 7.4 Authenticate & Configure
*Prerequisite: You need a domain name added to a Cloudflare account.*

1.  **Login:**
    ```bash
    cloudflared tunnel login
    ```
    * This will print a URL.
    * Copy it, open it on your phone/laptop browser, and authorize the domain.

2.  **Create the Tunnel:**
    ```bash
    cloudflared tunnel create picos-tunnel
    # Copy the Tunnel-ID (UUID) output for the next step.
    ```

3.  **Route DNS:**
    Map your domain (e.g., `proxmox.yourdomain.com`) to this tunnel.
    ```bash
    cloudflared tunnel route dns picos-tunnel proxmox.yourdomain.com
    ```

### 7.5 Define the Ingress Rules
Tell the tunnel where to send the traffic (to the Proxmox Host IP).

1.  **Create Config:**
    ```bash
    mkdir -p /etc/cloudflared
    nano /etc/cloudflared/config.yml
    ```

2.  **Paste Configuration:**
    *(Replace `YOUR-TUNNEL-UUID` with the actual UUID from step 7.4)*

    ```yaml
    tunnel: YOUR-TUNNEL-UUID
    credentials-file: /root/.cloudflared/YOUR-TUNNEL-UUID.json

    ingress:
      # Map the domain to the internal Proxmox IP
      - hostname: proxmox.yourdomain.com
        service: [https://10.10.20.1:8006](https://10.10.20.1:8006)
        originRequest:
          # Critical: Ignore the self-signed cert on Proxmox
          noTLSVerify: true

      # Catch-all rule (required)
      - service: http_status:404
    ```

3.  **Install as a Service:**
    ```bash
    cloudflared service install
    systemctl start cloudflared
    ```

### 7.6 Verification
1.  **Exit Container:** Type `exit` to return to the host.
2.  **Test:** Open `https://proxmox.yourdomain.com` on your phone (disconnected from local Wi-Fi).
3.  **Result:** You should see the Proxmox login page loading securely over the internet.
