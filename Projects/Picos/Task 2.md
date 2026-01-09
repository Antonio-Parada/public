## Phase 2: The Transformation (Installing Proxmox VE)

**Objective:** Convert the standard Debian OS into a Type-1 Hypervisor by swapping the kernel and installing the Proxmox engine.

### 2.1 Configure Hostname Resolution (CRITICAL)
Proxmox will refuse to start if the hostname does not resolve to a local IP.

1.  **Check your current hostname:**
    ```bash
    hostname
    # Output should be: picos
    ```

2.  **Edit the Hosts file:**
    ```bash
    nano /etc/hosts
    ```

3.  **Modify the file to look EXACTLY like this:**
    *(Replace `127.0.1.1` line or add it if missing)*
    ```text
    127.0.0.1       localhost
    127.0.1.1       picos

    # The following lines are desirable for IPv6 capable hosts
    ::1             localhost ip6-localhost ip6-loopback
    ff02::1         ip6-allnodes
    ff02::2         ip6-allrouters
    ```
    *(Press `Ctrl+O`, `Enter` to save, `Ctrl+X` to exit)*

4.  **Verify:**
    ```bash
    hostname --ip-address
    # Output must be: 127.0.1.1
    ```

### 2.2 Add Proxmox Repositories
We need to tell Debian where to find the Proxmox software.

1.  **Add the repository:**
    ```bash
    echo "deb [arch=amd64] [http://download.proxmox.com/debian/pve](http://download.proxmox.com/debian/pve) bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
    ```

2.  **Add the Repository GPG Key:**
    ```bash
    wget [https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg](https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg) -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg
    ```

3.  **Update package lists:**
    ```bash
    apt update && apt full-upgrade -y
    ```

### 2.3 Install the Proxmox Kernel
We replace the standard Linux kernel with the virtualization-optimized one.

1.  **Install Kernel:**
    ```bash
    apt install pve-kernel-6.8
    ```
    *(Note: If it asks to confirm removal of conflicting packages, type 'y')*

2.  **Reboot System:**
    You must reboot now to load the new kernel.
    ```bash
    systemctl reboot
    ```

### 2.4 Install Proxmox VE Core
Once rebooted, log back in as `root` and install the main engine.

1.  **Install Packages:**
    ```bash
    apt install proxmox-ve postfix open-iscsi
    ```

2.  **Configuration Prompts:**
    * **Postfix Configuration:** Select **"Local only"**.
    * **System Mail Name:** Leave as `picos`.

3.  **Remove Old Kernel (Optional Cleanup):**
    ```bash
    apt remove linux-image-amd64 'linux-image-6.1*'
    update-grub
    ```

### 2.5 Verify Success
Check if the Proxmox API is running (it might fail until network bridge is set, but the binary should be there).

```bash
pveversion -v 
```

Success Indicator: You see a list of pve-manager, qemu-server, etc.
