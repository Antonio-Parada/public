## Phase 5: The Dashboard (Xorg + i3 + Chromium)

**Objective:** Install a minimal graphical environment to display the Proxmox web interface on the laptop screen without a heavy Desktop Environment.

### 5.1 Install Graphics Stack
We need the X Window System, the window manager, the browser, and sound drivers.

1.  **Run Install Command:**
    ```bash
    apt install xorg i3-wm chromium pulseaudio pavucontrol firmware-amd-graphics -y
    ```
    *(Note: `firmware-amd-graphics` is essential for Ryzen GPU acceleration).*

### 5.2 Configure Auto-Start (The Kiosk Mode)
We configure `i3` to launch Chromium instantly upon starting, ignoring the Proxmox SSL error.

1.  **Create Config Directory:**
    ```bash
    mkdir -p /root/.config/i3
    ```

2.  **Edit i3 Config:**
    ```bash
    nano /root/.config/i3/config
    ```

3.  **Paste the Kiosk Configuration:**

    ```text
    # --- VISUALS ---
    # Remove window borders for a clean "Appliance" look
    default_border pixel 0
    new_window pixel 0

    # --- AUTO-START ---
    # Launch Chromium in Kiosk mode (Full screen, no address bar)
    # --ignore-certificate-errors: Bypasses the "Not Secure" warning for localhost
    # --no-sandbox: Required when running as root
    exec --no-startup-id chromium --kiosk --ignore-certificate-errors --no-sandbox https://localhost:8006
    ```

4.  **Configure Xorg to Auto-Start:**
    To avoid typing `startx` every time, add this to your profile.

    ```bash
    nano /root/.bash_profile
    ```
    Add this line to the bottom:
    ```bash
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
    ```

### 5.3 Verify The GUI
Now we test if the screen lights up with the dashboard.

1.  **Launch:**
    ```bash
    startx
    ```

2.  **Expected Result:**
    * Screen flickers.
    * i3 loads (black background).
    * Chromium opens full screen to the Proxmox Login page.
    * **No SSL Error warning** (It should go straight to login).

3.  **Exit:**
    If you need to get back to the terminal, press `Mod+Enter` (usually Alt+Enter or Win+Enter) to open a terminal window over the browser, or `Mod+Shift+E` to exit i3.
