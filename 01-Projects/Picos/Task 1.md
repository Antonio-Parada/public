# PICOS: Proxmox Integrated Casting & Offline Server
## Phase 1: The Foundation (Minimal Debian Install)

**Objective:** Install a raw, headless Debian 12 system optimized for the ASUS Vivobook (Ryzen 3 / 8GB RAM).

### 1.1 Preparation
* **Download:** [Debian 12 "Bookworm" Netinst ISO (amd64)](https://www.debian.org/download)
* **Flash:** Use BalenaEtcher or Rufus to write ISO to USB.
* **BIOS Settings (F2 to enter):**
    * **Secure Boot:** Disabled
    * **Fast Boot:** Disabled

### 1.2 Installation Steps
1.  **Boot:** Boot from USB -> Select **"Install"** (Text Mode).
2.  **Hostname:** `picos`
3.  **Domain Name:** (Leave blank or use `local`).
4.  **Root Password:** (Set a strong password).
5.  **User Account:** Create user `engineer` (or your preference).
6.  **Partitioning:**
    * Method: **"Guided - use entire disk"**
    * Scheme: **"All files in one partition"** (Recommended for 8GB RAM setup).
    * *Note: Do not choose ZFS or LVM-Thin yet; standard ext4 saves RAM.*
7.  **Package Manager:**
    * Archive Mirror: Select your country -> `deb.debian.org`.
    * HTTP Proxy: (Leave blank).

### 1.3 Software Selection (CRITICAL)
When the "Software selection" menu appears, use `Spacebar` to toggle options.
**Your screen must match this exactly:**

[ ] Debian desktop environment
[ ] ... GNOME
[ ] ... Xfce
[ ] ... KDE Plasma
[ ] ... Cinnamon
[ ] ... MATE
[ ] ... LXDE
[ ] ... LXQt
[ ] ... SSH server            <-- CHECK THIS [X]
[ ] ... Web server
[ ] ... Standard system utilities <-- CHECK THIS [X]

### 1.4 Post-Install Verification
Log in as `root` and run the following to verify RAM usage is minimal (~100MB):

free -h
