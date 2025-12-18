## Phase 6: The Stealth Boot (Silent GRUB + Branding)

**Objective:** Hide the scrolling kernel text ("matrix code") during boot and replace it with a graphical splash screen for a professional "Appliance" feel.

### 6.1 Install Boot Splash (Plymouth)
Plymouth handles the graphical transition from BIOS to Login.

1.  **Install Plymouth and Themes:**
    ```bash
    apt install plymouth plymouth-themes -y
    ```

2.  **Set the Default Theme:**
    We will use the "spinner" theme as a base (clean, minimal).
    ```bash
    plymouth-set-default-theme -R spinner
    ```

3.  **Custom Branding (Optional):**
    If you have a logo ready, you can replace the default Debian logo.
    * **Upload your logo** to the laptop (use SCP or a USB drive).
    * **Rename it** to `watermark.png`.
    * **Overwrite the theme logo:**
        ```bash
        cp /path/to/your/logo.png /usr/share/plymouth/themes/spinner/watermark.png
        ```
    *(If you skip this, it will just show the Debian swirl).*

### 6.2 Silence the GRUB Menu
We need to tell the bootloader to shut up and load faster.

1.  **Edit GRUB Config:**
    ```bash
    nano /etc/default/grub
    ```

2.  **Modify these specific lines:**
    * Change `GRUB_TIMEOUT=5` to `0`.
    * Change `GRUB_CMDLINE_LINUX_DEFAULT` to include the quiet flags.

    **Your file should look like this:**
    ```ini
    GRUB_DEFAULT=0
    GRUB_TIMEOUT=0
    GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
    # The 'quiet splash' is essential. 'loglevel=3' suppresses non-critical kernel warnings.
    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash loglevel=3 rd.systemd.show_status=false rd.udev.log_level=3"
    GRUB_CMDLINE_LINUX=""
    ```

3.  **Apply Changes:**
    We must update both GRUB and the Initramfs (the initial RAM disk) for this to take effect.

    ```bash
    update-grub
    update-initramfs -u
    ```

### 6.3 Verification
1.  **Reboot:**
    ```bash
    reboot
    ```

2.  **Observe:**
    * BIOS Logo (ASUS).
    * **No text scrolling.**
    * Graphical Spinner (or your Logo).
    * Transition directly to the Proxmox Dashboard (Chromium).
