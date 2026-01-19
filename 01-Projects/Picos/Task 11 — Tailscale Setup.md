## Phase 11: The Private Backdoor (Tailscale)

**Objective:** Install Tailscale on the host to provide secure, zero-config VPN access to the Proxmox server and the entire `10.10.20.x` internal network from anywhere in the world.

### 11.1 Install Tailscale on Host
Since the Proxmox host (Debian) is the router, we install Tailscale directly on "picos" (not in an LXC).

1.  **Run the Install Script:**
    ```bash
    curl -fsSL [https://tailscale.com/install.sh](https://tailscale.com/install.sh) | sh
    ```

2.  **Verify Forwarding is Active:**
    Tailscale needs IP forwarding to route traffic. We already did this in **Task 3**, but verify it:
    ```bash
    sysctl net.ipv4.ip_forward
    # Output must be: net.ipv4.ip_forward = 1
    ```

### 11.2 Configure as a Subnet Router
This is the magic step. We tell Tailscale: "Hey, anyone connected to me is allowed to talk to the `10.10.20.0/24` network."

1.  **Bring Up Tailscale:**
    Run this command to start the service and advertise your internal network:

    ```bash
    tailscale up --advertise-routes=10.10.20.0/24 --advertise-exit-node --ssh
    ```
    * `--advertise-routes`: Exposes your TV/LXC network to your phone/PC.
    * `--advertise-exit-node`: Allows you to route *all* your phone's traffic through this laptop (optional, but great for privacy).
    * `--ssh`: Enables "Tailscale SSH" so you can SSH in from the browser admin panel if needed.

2.  **Authenticate:**
    Copy the URL provided in the terminal and log in with your Tailscale account.

### 11.3 Enable Routes in Dashboard (CRITICAL)
The command above *requests* the routes, but you must *approve* them in the web console.

1.  **Go to:** [login.tailscale.com/admin/machines](https://login.tailscale.com/admin/machines)
2.  **Find:** `picos` in the list.
3.  **Click:** The "..." menu > **Edit route settings**.
4.  **Toggle ON:**
    * `10.10.20.0/24`
    * `Use as exit node` (if desired).



### 11.4 Verification
1.  **Disconnect** your phone from the Laptop's Wi-Fi (switch to 5G/LTE).
2.  **Open** the Tailscale App on your phone and connect.
3.  **Try to ping:** The internal Gateway.
    * Terminal/Ping Tool: `ping 10.10.20.1`
4.  **Try to access:** The Proxmox GUI.
    * Browser: `https://100.x.y.z:8006` (Use the Tailscale IP of picos).

### 11.5 Why this is powerful
You can now leave your "PICOS" laptop plugged into ethernet at a hotel, walk away with your phone, and still:
* SSH into the laptop (`ssh root@picos`).
* Access the internal LXC containers.
* Manage the Android TV (if it has debugging on) remotely.

